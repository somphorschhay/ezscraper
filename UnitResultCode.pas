unit UnitResultCode;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  hrdutils, Strutils, Types, Filemanip, TypeConfigurer;

type
  TFormResultCode = class(TForm)
    PanelAddResult: TPanel;
    lblname: TLabel;
    EditName: TEdit;
    lblcode: TLabel;
    EditCode: TEdit;
    lbl1: TLabel;
    ComboBoxType: TComboBox;
    ButtonAdd: TButton;
    ButtonEdit: TButton;
    ButtonSave: TButton;
    ListViewCodeType: TListView;
    ButtonDelete: TButton;
    procedure ButtonAddClick(Sender: TObject);
    procedure ListViewCodeTypeChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure ClearControl;
    procedure EnableControl(status:boolean);
    procedure ResetControl;
    procedure ButtonEditClick(Sender: TObject);
    procedure ButtonSaveClick(Sender: TObject);
    procedure ButtonDeleteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormResultCode: TFormResultCode;

implementation

{$R *.dfm}

procedure TFormResultCode.ButtonAddClick(Sender: TObject);
begin

  if ButtonAdd.Caption = 'Add' then
  begin
    ClearControl;
    EnableControl(true);
    ButtonAdd.Caption := 'Cancel';
    ButtonDelete.Enabled := false;
    ButtonSave.Enabled := true;
    ButtonSave.Caption := 'Save';
    ButtonEdit.Enabled := false;
  end
  else
  begin
    ResetControl;
  end;

end;

procedure TFormResultCode.FormShow(Sender: TObject);
var
  AllText: string;
  urlSplit: TStringDynArray;
  i : integer;
  listviewItem : TListItem;
begin
  ListViewCodeType.Clear;
  ResetControl;

  urlSplit := getResultCode;

  for i := low(urlsplit) to high(urlsplit) do
  begin
    listviewItem := ListViewCodeType.Items.Add;
    listviewItem.Caption := inttostr(i+1);
    listviewItem.SubItems.Add(trim(splitstring(urlsplit[i], ':')[0]));
    listviewItem.SubItems.Add(trim(StrGrab(urlsplit[i],'(',');')));
    listviewItem.SubItems.Add(trim(splitstring(urlsplit[i], '_')[0]));

  end;
end;

procedure TFormResultCode.ListViewCodeTypeChange(Sender: TObject;
  Item: TListItem; Change: TItemChange);
var
  I: Integer;
  codetype : string;
begin
  if Assigned(ListViewCodeType.Selected) then
  begin
    EditName.Text := rightstr(ListViewCodeType.Selected.SubItems[0], Length(ListViewCodeType.Selected.SubItems[0])-2);
    EditCode.Text := ListViewCodeType.Selected.SubItems[1];
    codetype := ListViewCodeType.Selected.SubItems[2];
    if codetype = 'I' then
    begin
      ComboBoxType.ItemIndex := ComboBoxType.Items.IndexOf('INFORMATION')
    end
    else if codetype = 'S' then
      ComboBoxType.ItemIndex := ComboBoxType.Items.IndexOf('SUCCESS')
    else
      ComboBoxType.ItemIndex := ComboBoxType.Items.IndexOf('ERROR');

    ButtonEdit.Enabled := true;
    ButtonDelete.Enabled := true;
    //EnableControl(true);
  end
  else
  begin
    ButtonEdit.Enabled := false;
    ButtonDelete.Enabled := false;
    //ResetControl;
  end;

end;
procedure TFormResultCode.ButtonDeleteClick(Sender: TObject);
var
  typearray : TStringDynArray;
  I: Integer;
begin
  SetLength(typearray, length(typearray)+1);
  typearray[high(typearray)] := ListViewCodeType.Selected.SubItems[0];
  if deleteType(typearray) then
  begin
    showmessage('success');
    FormShow(Self);
  end
  else
    showmessage('failed');

end;

procedure TFormResultCode.ButtonEditClick(Sender: TObject);
begin
  if ButtonEdit.Caption = 'Edit' then
  begin
    EnableControl(true);
    ButtonEdit.Caption := 'Cancel';
    ButtonSave.Caption := 'Update';
    ButtonSave.Enabled := true;
    exit;
  end;
  ButtonEdit.Caption := 'Edit';
  ResetControl;
end;

procedure TFormResultCode.ButtonSaveClick(Sender: TObject);
var
  oldone, newone : string;
begin
  if (trim(EditName.Text) = '') or (trim(EditName.Text) = '') or (ComboBoxType.ItemIndex = -1) then
  begin
    showmessage('Please input data!!');
    exit;
  end;
  if ButtonSave.Caption = 'Update' then
  begin
    oldone := ListViewCodeType.Selected.SubItems[0] + '|' + ListViewCodeType.Selected.SubItems[1];
    newone := trim(EditName.Text) + '|' + trim(EditCode.Text) + '|' + inttostr(ComboBoxType.ItemIndex + 1);
    if not updateResultCode(oldone, newone) then
    begin
      showmessage('Failed to update. You might input duplicate code.');
      exit;
    end;
    showmessage('Successfully updated!!!');
    FormShow(Self);
    exit;
  end;
  if not saveResultCode(trim(EditName.Text), trim(EditCode.Text), ComboBoxType.ItemIndex+1) then
  begin
    showmessage('Failed to save. You might input duplicate code');
    exit;
  end;
  showmessage('Successfully saved!!!');
  FormShow(Self);
end;

procedure TFormResultCode.ClearControl;
begin
  EditName.Clear;
  EditCode.Clear;
  ComboBoxType.ItemIndex := -1;
end;

procedure TFormResultCode.EnableControl(status: Boolean);
begin
  EditName.Enabled := status;
  EditCode.Enabled := status;
  ComboBoxType.Enabled := status;
  ButtonEdit.Enabled := status;
end;
procedure TFormResultCode.ResetControl;
begin
  ClearControl;
  EnableControl(false);
  ButtonEdit.Enabled := false;
  ButtonDelete.Enabled := false;
  ButtonEdit.Caption := 'Edit';
  ButtonAdd.Caption := 'Add';
  ButtonSave.Enabled := false;
end;
end.
