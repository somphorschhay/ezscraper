unit UnitFlash;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.IniFiles,
  UnitSelectWorkspace, UnitCodeGenerator;

type
  TFormFlash = class(TForm)
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormFlash: TFormFlash;
  ProjectSetting : TIniFile;
implementation
{$R *.dfm}


procedure TFormFlash.FormCreate(Sender: TObject);
begin
  //Application.ShowMainForm := False;
  //FormFlash.Visible := False;

  ProjectSetting := TIniFile.Create( ChangeFileExt( Application.ExeName, '.INI' ) );
  if ProjectSetting.ReadString('Workspace', 'WorkspacePath', '') = '' then
  begin
      
      //hide main form
      //Application.ShowMainForm := False;
      //EZCodeGenerator.Visible := False;
  end
  else
  //EZCodeGenerator.Show;
end;

end.
