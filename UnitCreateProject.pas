unit UnitCreateProject;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFormCreateProject = class(TForm)
    EditProjectName: TEdit;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    ButtonFinish: TButton;
    ButtonCancel: TButton;
    Label4: TLabel;
    Label3: TLabel;
    procedure ButtonCancelClick(Sender: TObject);
    procedure EditProjectNameChange(Sender: TObject);
    procedure ButtonFinishClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCreateProject: TFormCreateProject;

implementation

uses
  UnitCodeGenerator, UnitCreateModule, System.UITypes;

{$R *.dfm}

procedure TFormCreateProject.ButtonCancelClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFormCreateProject.ButtonFinishClick(Sender: TObject);
begin
  if Not DirectoryExists(Edit1.Text) then
  begin
    if CreateDir(Edit1.Text) then
    begin
      EZCodeGenerator.TreeViewProjectExplorer.SelectedFolder := Edit1.Text;
      Self.Close;
      FormCreateModule.ShowModal;
    end
    else
      MessageDlg('Project create failed!', mtError, [mbOK], 0);
  end
  else
    MessageDlg('This project already exited!', mtError, [mbOK], 0);


end;

procedure TFormCreateProject.EditProjectNameChange(Sender: TObject);
begin
  Edit1.Text := EZCodeGenerator.TreeViewProjectExplorer.RootedAtFileSystemFolder + '\' + EditProjectName.Text;
end;

end.
