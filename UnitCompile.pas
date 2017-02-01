unit UnitCompile;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, ShellApi,
  Vcl.ComCtrls, System.StrUtils, HrdUtils;

type
  TFormCompile = class(TForm)
    Panel1: TPanel;
    EditProjectPath: TEdit;
    EditLinkingPath: TEdit;
    EditTotalLines: TEdit;
    ButtonCancel: TButton;
    EditStatus: TEdit;
    EditWarning: TEdit;
    EditError: TEdit;
    procedure FormShow(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    function GetDosOutput(CommandLine: string; Work: string = 'C:\'): string;
  end;
  TMyThead = class(TThread)
  protected
    procedure Execute; override;
  end;
var
  FormCompile: TFormCompile;

implementation

{$R *.dfm}

uses UnitCodeGenerator;

procedure TMyThead.Execute;
begin

  FormCompile.GetDosOutput('msbuild ' + '"' + EZCodeGenerator.projectfiletocompile.Caption + '"', 'C:\Program Files (x86)\Embarcadero\Studio\16.0\bin');
end;

procedure TFormCompile.ButtonCancelClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFormCompile.FormShow(Sender: TObject);
begin
  //save all code in editor
  EZCodeGenerator.ToolButtonSaveClick(Self);

  //compiling
  with TMyThead.Create do
    FreeOnTerminate := true;

  //clear and add new compile message
  EZCodeGenerator.ListBoxMessage.Clear;
  EZCodeGenerator.ListBoxMessage.Items.Add('Compiling project...');

  //compile info
  EditProjectPath.Text := EZCodeGenerator.projectfiletocompile.Caption;
  EditLinkingPath.Text := ChangeFileExt(EditProjectPath.Text, '.exe');
  EditTotalLines.Text := 'Total Lines: ' + IntToStr(EZCodeGenerator.BCEditorProjCode.Lines.Count);


end;

function TFormCompile.GetDosOutput(CommandLine: string; Work: string = 'C:\'): string;
var
  SA: TSecurityAttributes;
  SI: TStartupInfo;
  PI: TProcessInformation;
  StdOutPipeRead, StdOutPipeWrite: THandle;
  WasOK: Boolean;
  Buffer: array[0..255] of AnsiChar;
  BytesRead: Cardinal;
  WorkDir: string;
  Handles: Boolean;
  last3Line : String;
begin
  Result := '';
  with SA do begin
    nLength := SizeOf(SA);
    bInheritHandle := True;
    lpSecurityDescriptor := nil;
  end;
  CreatePipe(StdOutPipeRead, StdOutPipeWrite, @SA, 0);
  try
    with SI do
    begin
      FillChar(SI, SizeOf(SI), 0);
      cb := SizeOf(SI);
      dwFlags := STARTF_USESHOWWINDOW or STARTF_USESTDHANDLES;
      wShowWindow := SW_HIDE;
      hStdInput := GetStdHandle(STD_INPUT_HANDLE);
      hStdOutput := StdOutPipeWrite;
      hStdError := StdOutPipeWrite;
    end;
    WorkDir := Work;

    Handles := CreateProcess(nil, PChar(WideString('cmd.exe /C rsvars.bat&&' + CommandLine)),
                            nil, nil, True, 0, nil,
                            PChar(WideString(WorkDir)), SI, PI);

    CloseHandle(StdOutPipeWrite);
    if Handles then
      try
        repeat
          WasOK := ReadFile(StdOutPipeRead, Buffer, 255, BytesRead, nil);
          if BytesRead > 0 then
          begin
            Buffer[BytesRead] := #0;
           // Result := Result + Buffer;
           EZCodeGenerator.ListBoxMessage.Items.Add(Buffer);
          end;
        until not WasOK or (BytesRead = 0);
        WaitForSingleObject(PI.hProcess, INFINITE);
      finally
        CloseHandle(PI.hThread);
        CloseHandle(PI.hProcess);
      end;
  finally
    CloseHandle(StdOutPipeRead);
    EditStatus.Text := 'Status: Done';

    //compile info
    last3Line := EZCodeGenerator.ListBoxMessage.Items[EZCodeGenerator.ListBoxMessage.Count-1] +
                 EZCodeGenerator.ListBoxMessage.Items[EZCodeGenerator.ListBoxMessage.Count-2] +
                 EZCodeGenerator.ListBoxMessage.Items[EZCodeGenerator.ListBoxMessage.Count-3];

    if Pos('Warning(s)', last3Line)> 0 then
    begin
      EditWarning.Text := 'Warning: ' + Trim(MidStr(last3Line, Pos('Warning(s)', last3Line)-2, 2));
      EditError.Text := 'Error: ' + Trim(MidStr(last3Line, Pos('Error(s)', last3Line)-2, 2));
    end;

    //running
    if (EZCodeGenerator.runorcompile.Caption = 'Running') and ((EditError.Text = 'Error: 0') or (EditError.Text = 'Error:')) then
    ShellExecute(Handle, 'open', Pchar(EditLinkingPath.Text), '', '', SW_SHOWNORMAL);

    //close form compile
    if EditError.Text = 'Error: 0' then
    self.Close;

  end;
end;


end.
