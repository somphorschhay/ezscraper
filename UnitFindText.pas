unit UnitFindText;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, hrdTypes, BCEditor.Editor;

type
  TFormFind = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    EditFind: TEdit;
    EditReplace: TEdit;
    RadioGroupDirection: TRadioGroup;
    ButtonFind: TButton;
    ButtonReplaceFind: TButton;
    ButtonClose: TButton;
    ButtonReplaceAll: TButton;
    procedure ButtonFindClick(Sender: TObject);
    procedure ButtonReplaceFindClick(Sender: TObject);
    procedure ButtonReplaceAllClick(Sender: TObject);
    procedure ButtonCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EditReplaceEnter(Sender: TObject);
    procedure EditFindChange(Sender: TObject);
    procedure RadioGroupDirectionClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormFind: TFormFind;

  i : Integer;
  currentLine : integer;
implementation

{$R *.dfm}

uses UnitCodeGenerator;

procedure TFormFind.ButtonCloseClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFormFind.ButtonFindClick(Sender: TObject);
begin
  if i < 1 then
   begin
     Inc(i);
     with EZCodeGenerator.BCEditorCodePreview do
     begin
     Search.Enabled := True;
     Search.SearchText := EditFind.Text;

     Exit;
     end;
   end;
   if RadioGroupDirection.ItemIndex = 0 then
   begin
     EZCodeGenerator.BCEditorCodePreview.FindNext(true);
     currentLine := EZCodeGenerator.GetLineOfText(EZCodeGenerator.BCEditorCodePreview, EditFind.Text, currentLine+1);
   end
   else
     EZCodeGenerator.BCEditorCodePreview.FindPrevious(true);

end;

procedure TFormFind.ButtonReplaceAllClick(Sender: TObject);
begin
     EZCodeGenerator.BCEditorCodePreview.ReplaceText(EditFind.Text, EditReplace.Text);
end;

procedure TFormFind.ButtonReplaceFindClick(Sender: TObject);
begin
  try
    currentLine := EZCodeGenerator.GetLineOfText(EZCodeGenerator.BCEditorCodePreview, EditFind.Text, currentLine + 1);
    EZCodeGenerator.BCEditorCodePreview.GotoLineAndCenter(currentLine+1);
    EZCodeGenerator.BCEditorCodePreview.ReplaceLine(currentLine + 1, EZCodeGenerator.BCEditorCodePreview.Lines.GetLineText(currentLine).Replace(EditFind.Text, EditReplace.Text));
   except on E: Exception do
  end;
end;

procedure TFormFind.EditFindChange(Sender: TObject);
begin
  i := 0;
  currentLine := 0;
end;

procedure TFormFind.EditReplaceEnter(Sender: TObject);
begin
  ButtonReplaceFind.Enabled := True;
  ButtonReplaceAll.Enabled := True;
end;

procedure TFormFind.FormCreate(Sender: TObject);
begin
  ButtonReplaceFind.Enabled := False;
  ButtonReplaceAll.Enabled := false;
end;

procedure TFormFind.RadioGroupDirectionClick(Sender: TObject);
begin
  if RadioGroupDirection.ItemIndex = 1 then
  ButtonReplaceFind.Enabled := False
  else
  ButtonReplaceFind.Enabled := True;
end;

end.
