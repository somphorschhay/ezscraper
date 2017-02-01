unit UnitWorkSpace;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, stdActns,BCEditor.Editor.Base, System.IniFiles, System.IOUtils, System.StrUtils;

type
  TFormWorkspace = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    ComboBoxWorkspace: TComboBox;
    Browse: TButton;
    ButtonOK: TButton;
    ButtonCancel: TButton;
    Label3: TLabel;
    procedure ButtonCancelClick(Sender: TObject);
    procedure BrowseClick(Sender: TObject);
    procedure ButtonOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormWorkspace: TFormWorkspace;
  dir :string;
  myFile : TextFile;

implementation

uses
  UnitCodeGenerator;

{$R *.dfm}

procedure TFormWorkspace.BrowseClick(Sender: TObject);
begin
  with TBrowseForFolder.Create(nil) do
  try
    RootDir := 'This PC';
    if Execute then
    begin
      dir := Folder;
      ComboBoxWorkspace.Text := dir;
    end;
  finally
    Free;
  end;
end;

procedure TFormWorkspace.ButtonCancelClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFormWorkspace.ButtonOKClick(Sender: TObject);
var
  text : string;
  IsDup : Boolean;
begin
  //check duplicate before save to file
  AssignFile(myFile, 'workspace.rany');
  ReSet(myFile);

  IsDup := False;
  while not eof(myFile) do
  begin
   ReadLn(myFile, text);
   if text = ComboBoxWorkspace.Text then
   begin
     IsDup := True;
     break;
   end;
  end;

  if  IsDup <> true then
  begin
    Append(myFile);
    Writeln(myFile, ComboBoxWorkspace.Text);
  end;

  //write the last selected workspace
  ProjectSetting.WriteString('Workspace', 'WorkspacePath', ComboBoxWorkspace.Text);
  EZCodeGenerator.TreeViewProjectExplorer.RootedAtFileSystemFolder := ProjectSetting.ReadString('Workspace', 'WorkspacePath', '');
  CloseFile(myFile);

  //clear BCeditor and hide tab
  EZCodeGenerator.BCEditorCodePreview.Clear;
  EZCodeGenerator.BCEditorProjCode.Clear;
  EZCodeGenerator.RzPageControlMain.Visible := False;

  TDirectory.Copy(GetCurrentDir + '\Template\common', ComboBoxWorkspace.Text + '\common');
  TDirectory.SetAttributes(ComboBoxWorkspace.Text + '\common',[TFileAttribute.faHidden, TFileAttribute.faReadOnly]);
  Self.Close;
end;

procedure TFormWorkspace.FormCreate(Sender: TObject);
var
  text : string;
begin
  //read workspace history from file
  AssignFile(myFile, 'workspace.rany');
  ReSet(myFile);

  while not eof(myFile) do
   begin
     ReadLn(myFile, text);
     if TDirectory.Exists(text) then
     ComboBoxWorkspace.Items.Insert(0, text);
   end;
   ComboBoxWorkspace.ItemIndex := 0;
   CloseFile(myFile);
end;

end.
