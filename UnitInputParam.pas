unit UnitInputParam;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,
  hrdutils, Strutils, Types, Filemanip, TypeConfigurer;

type
  TFormInputParam = class(TForm)
    Label1: TLabel;
    EditParam01: TEdit;
    Label2: TLabel;
    EditParam02: TEdit;
    Label3: TLabel;
    EditParam03: TEdit;
    Label4: TLabel;
    EditParam04: TEdit;
    Label5: TLabel;
    EditParam05: TEdit;
    Label6: TLabel;
    EditParam06: TEdit;
    Label7: TLabel;
    EditParam07: TEdit;
    Label8: TLabel;
    EditParam08: TEdit;
    Label9: TLabel;
    EditParam09: TEdit;
    Label10: TLabel;
    EditParam10: TEdit;
    ButtonAdd: TButton;
    ButtonEdit: TButton;
    ButtonDelete: TButton;
    ButtonSave: TButton;
    ListViewParam: TListView;
    procedure ListViewParamChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure ButtonSaveClick(Sender: TObject);
    procedure ClearControl();
    procedure EnableControl(status : boolean);
    procedure ButtonEditClick(Sender: TObject);
    procedure ButtonAddClick(Sender: TObject);
    procedure ButtonDeleteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormInputParam: TFormInputParam;
  test : array of string;
const
  NameEditPrefix = 'EditParam';

implementation

{$R *.dfm}

// Button save
procedure TFormInputParam.ButtonAddClick(Sender: TObject);    // add button

begin
  //params := nil;
  if ButtonAdd.Caption = 'Add' then
  begin
    ClearControl;
    EnableControl(true);
    ButtonAdd.Caption := 'Cancel';
    ButtonDelete.Enabled := false;
  end
  else
  begin
    ClearControl;
    ButtonAdd.Caption := 'Add';
    EnableControl(false);
  end;

end;

procedure TFormInputParam.ButtonDeleteClick(Sender: TObject);
var
  typearray : TStringDynArray;
  i : integer;
begin
  for I := Low(ListViewParam.Selected.SubItems.ToStringArray) to High(ListViewParam.Selected.SubItems.ToStringArray) do
  begin
      SetLength(typearray, length(typearray)+1);
      typearray[high(typearray)] := ListViewParam.Selected.SubItems[i];
  end;
  if not deleteType(typearray) then
  begin
    showmessage('Failed to delete');
    exit;
  end;
  showmessage('Successfully deleted!!!');
  FormShow(self);
end;

procedure TFormInputParam.ButtonEditClick(Sender: TObject);         //edit button
begin
  if ButtonEdit.Caption = 'Edit' then
  begin
    EnableControl(true);
    ButtonSave.Caption := 'Update';
    ButtonDelete.Enabled := false;
    ButtonAdd.Enabled := false;
    ButtonEdit.Caption := 'Cancel';
  end
  else
  begin
    EnableControl(false);
    ButtonSave.Caption := 'Save';
    ButtonAdd.Enabled := true;
    ButtonEdit.Caption := 'Edit';
  end;

end;

procedure TFormInputParam.ButtonSaveClick(Sender: TObject);       //save button
var
  oldone, newone : TStringDynArray;
  i : integer;
begin
  if ButtonSave.Caption = 'Save' then
  begin
    for I := 1 to 10 do
    begin
      with TEdit(FindComponent(NameEditPrefix + FormatFloat('00', i))) do
      begin
        //showmessage(BooltoStr(isValidType(trim(text)),true));
        SetLength(newone, Length(newone)+1);
        newone[High(newone)] := trim(Text);
      end;
    end;
    if saveInputParam(newone) then
    begin
      showmessage('Parameters saved successfully');
    end
    else 
    begin
      showmessage('Failed to save parameters, you might input space or special character');
      exit;
    end;
  end
  else 
  begin
    for I := 1 to 10 do
    begin
      with TEdit(FindComponent(NameEditPrefix + FormatFloat('00', i))) do
      begin
        SetLength(newone, Length(newone)+1);
        newone[High(newone)] := trim(Text);
        SetLength(oldone, Length(oldone)+1);
        oldone[high(oldone)] := ListViewParam.Selected.SubItems[i-1];
      end;
    end;
    updateInputParam(oldone, newone);
    showmessage('Parameters has been updated');
  end;
  
  FormShow(self);
  //ListViewParam.Selected := ListViewParam.Items[1];
  ListViewParam.Selected := nil;
end;


procedure TFormInputParam.FormShow(Sender: TObject);
var
  AllText: string;
  urlSplit: TStringDynArray;
  i, row, column : integer;
  listviewItem : TListItem;
begin
  ListViewParam.Items.Clear;
  ButtonEdit.Enabled := false;
  ClearControl;
  EnableControl(false);
  ButtonDelete.Enabled := false;
  ButtonEdit.Caption := 'Edit';
  urlSplit := getInputParam();
  row := 1;
  column := 1;
  for i := low(urlsplit) to high(urlsplit) do
  begin
    //ListViewParam.Items.AddItem('hello');
    if trim(urlsplit[i]) = '' then
    begin
      Continue;
    end;
    if column = 1 then
    begin
      listviewItem := ListViewParam.Items.Add;
      listviewItem.Caption := IntToStr(row);
      listviewItem.SubItems.Add(trim(Splitstring(urlsplit[i], '=')[0]));
      column := column + 1;
    end
    else
    begin
      listviewItem.SubItems.Add(trim(Splitstring(urlsplit[i], '=')[0]));
      if  column = 10 then
      begin
        column := 1;
        row := row + 1;
      end
      else column := column + 1;
    end;

  end;
end;

// ListViewParamChange
procedure TFormInputParam.ListViewParamChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
var
  I: Integer;
begin
  if Assigned(ListViewParam.Selected) then
  begin
    for I := 0 to 9 do
    begin
      with TEdit(FindComponent(NameEditPrefix + FormatFloat('00', i+1))) do
      begin
        if ContainsStr(Item.SubItems[i], '//') then
          Text := ''
        else
          Text := Item.SubItems[i];
      end;
    end;
    
    ButtonEdit.Enabled := true;
    ButtonDelete.Enabled := true;
  end
  else
  begin
    ButtonEdit.Enabled := false;
    ButtonDelete.Enabled := false;
    ClearControl;
    EnableControl(false);
  end;

end;
procedure TFormInputParam.ClearControl();
begin
    EditParam01.Clear;
    EditParam02.Clear;
    EditParam03.Clear;
    EditParam04.Clear;
    EditParam05.Clear;
    EditParam06.Clear;
    EditParam07.Clear;
    EditParam08.Clear;
    EditParam09.Clear;
    EditParam10.Clear;
end;
procedure TFormInputParam.EnableControl(status : boolean);
begin
  EditParam01.Enabled := status;
  EditParam02.Enabled := status;
  EditParam03.Enabled := status;
  EditParam04.Enabled := status;
  EditParam05.Enabled := status;
  EditParam06.Enabled := status;
  EditParam07.Enabled := status;
  EditParam08.Enabled := status;
  EditParam09.Enabled := status;
  EditParam10.Enabled := status;
  ButtonSave.Enabled := status;
end;

end.
