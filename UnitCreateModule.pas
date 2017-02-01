unit UnitCreateModule;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Winapi.ShellAPI, System.UITypes;

type
  TFormCreateModule = class(TForm)
    Label3: TLabel;
    EditModuleName: TEdit;
    Label2: TLabel;
    Label4: TLabel;
    ButtonFinish: TButton;
    ButtonCancel: TButton;
    LabelMessage: TLabel;
    procedure ButtonFinishClick(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCreateModule: TFormCreateModule;

implementation

uses
  UnitCodeGenerator;

{$R *.dfm}

procedure TFormCreateModule.ButtonCancelClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFormCreateModule.ButtonFinishClick(Sender: TObject);
var
  destPath, srcPath : string;
  execResult : Integer;
  dprStringList, dprojStringList : TStringList;
begin
  ButtonFinish.Enabled := False;
  if EZCodeGenerator.TreeViewProjectExplorer.Selected.FullPath = EZCodeGenerator.TreeViewProjectExplorer.RootedAtFileSystemFolder then
  begin
    MessageDlg('Could not create module on Workspace folder!' + #13#10 +
               'Please select a project folder.', mtError, [mbOK], 0);
    Self.Close;
  end
  else if EZCodeGenerator.TreeViewProjectExplorer.Selected.Parent <> EZCodeGenerator.TreeViewProjectExplorer.RootNode then
    MessageDlg('Could not create module inside a module!' + #13#10 +
               'Please select a project folder.', mtError, [mbOK], 0)
  else
  begin
    destPath := EZCodeGenerator.TreeViewProjectExplorer.Selected.FullPath + '\' + EditModuleName.Text;
    if Not DirectoryExists(destPath) then
    begin
       srcPath  := ExtractFileDir(ParamStr(0)) + '\Template\project\PROJ0010001';
       if DirectoryExists(srcPath) then
       begin
         //copy temp file to destPath
         CreateDir(destPath);
         execResult := ShellExecute(0, nil, 'xcopy', PWideChar('"' + srcPath + '"  "' + destPath +'" ' + '/E /H'), '', SW_HIDE);
         if execResult <= 32 then
         begin
           RemoveDir(destPath);
           MessageDlg('Internal error!' + #13#10 + 'Could not create prject', mtError, [mbOK], 0);
         end;
         Sleep(2000);
         //ShowMessage(destPath+'\PROJ0010001.dpr');
         //ShowMessage(destPath+'\'+EditModuleName.Text+'.dpr');
         RenameFile(destPath+'\PROJ0010001.dpr', destPath+'\'+EditModuleName.Text+'.dpr');
         RenameFile(destPath+'\PROJ0010001.dproj', destPath+'\'+EditModuleName.Text+'.dproj');

         //fix project name inside both files
         dprStringList := TStringList.Create;
         try
           dprStringList.LoadFromFile(destPath+'\'+EditModuleName.Text+'.dpr');
           dprStringList.Text := StringReplace(dprStringList.Text, 'PROJ0010001', EditModuleName.Text, [rfReplaceAll]);
           dprStringList.SaveToFile(destPath+'\'+EditModuleName.Text+'.dpr');
         finally
           dprStringList.Free;
         end;
         dprojStringList := TStringList.Create;
         try
           dprojStringList.LoadFromFile(destPath+'\'+EditModuleName.Text+'.dproj');
           dprojStringList.Text := StringReplace(dprojStringList.Text, 'PROJ0010001', EditModuleName.Text, [rfReplaceAll]);
           dprojStringList.SaveToFile(destPath+'\'+EditModuleName.Text+'.dproj');
         finally
           dprojStringList.Free;
         end;


         Self.Close;
         EZCodeGenerator.TreeViewProjectExplorer.SelectedFolder := destPath;
         EZCodeGenerator.TreeViewProjectExplorer.Selected.Expand(false);
       end
       else
         MessageDlg('Fatal error!' + #13#10 +
                    'System file missnig, please reinstall application!!', mtError, [mbOK], 0);
    end
    else
    MessageDlg('The module name already existed!', mtError, [mbOK], 0);
  end;



end;

procedure TFormCreateModule.FormShow(Sender: TObject);
begin
ButtonFinish.Enabled := True;
end;

end.
