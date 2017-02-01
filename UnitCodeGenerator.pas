{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N-,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN SYMBOL_EXPERIMENTAL ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN UNIT_EXPERIMENTAL ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}
{$WARN OPTION_TRUNCATED ON}
{$WARN WIDECHAR_REDUCED ON}
{$WARN DUPLICATES_IGNORED ON}
{$WARN UNIT_INIT_SEQ ON}
{$WARN LOCAL_PINVOKE ON}
{$WARN MESSAGE_DIRECTIVE ON}
{$WARN TYPEINFO_IMPLICITLY_ADDED ON}
{$WARN RLINK_WARNING ON}
{$WARN IMPLICIT_STRING_CAST ON}
{$WARN IMPLICIT_STRING_CAST_LOSS ON}
{$WARN EXPLICIT_STRING_CAST OFF}
{$WARN EXPLICIT_STRING_CAST_LOSS OFF}
{$WARN CVT_WCHAR_TO_ACHAR ON}
{$WARN CVT_NARROWING_STRING_LOST ON}
{$WARN CVT_ACHAR_TO_WCHAR ON}
{$WARN CVT_WIDENING_STRING_LOST ON}
{$WARN NON_PORTABLE_TYPECAST ON}
{$WARN XML_WHITESPACE_NOT_ALLOWED ON}
{$WARN XML_UNKNOWN_ENTITY ON}
{$WARN XML_INVALID_NAME_START ON}
{$WARN XML_INVALID_NAME ON}
{$WARN XML_EXPECTED_CHARACTER ON}
{$WARN XML_CREF_NO_RESOLVE ON}
{$WARN XML_NO_PARM ON}
{$WARN XML_NO_MATCHING_PARM ON}
{$WARN IMMUTABLE_STRINGS OFF}
unit UnitCodeGenerator;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls, System.IOUtils,
  System.ImageList, Vcl.ImgList, System.IniFiles, Vcl.ExtCtrls, Vcl.CheckLst,
  UnitInputParam, UnitResultCode, UnitResultOutput,
  UnitAdvanceOnLogin, UnitCreateProject, UnitCreateModule, UnitWorkspace, UnitABOUT,
  ShellControls, RzSplit, BCEditor.Editor.Base, BCEditor.Editor, BCEditor.Highlighter, Vcl.Mask,
  RzEdit, RzSpnEdt, RzPanel, RzTabs, Vcl.Buttons, RzButton, Vcl.ToolWin,
  Vcl.ActnMan, Vcl.ActnCtrls, RzDBNav, Winapi.ShellAPI,
  HrdUtils, System.StrUtils, TypeConfigurer, types;

type
  TEZCodeGenerator = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Edit1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    Exit1: TMenuItem;
    NewProject: TMenuItem;
    PageControlSteps: TPageControl;
    TabSheetOnInit: TTabSheet;
    TabSheetOnParam: TTabSheet;
    LabelPreview: TLabel;
    ImageList1: TImageList;
    FileOpenDialog1: TFileOpenDialog;
    TabSheetOnLogin: TTabSheet;
    TabSheetOnEnter: TTabSheet;
    TabSheetOnExecute: TTabSheet;
    TabSheetOnResult: TTabSheet;
    TabSheetOnFinal: TTabSheet;
    EditHost: TEdit;
    LabelHost: TLabel;
    GroupBoxChooseObjects: TGroupBox;
    CheckBoxIndyAgent: TCheckBox;
    CheckBoxBrowser: TCheckBox;
    ButtonNextOnInit: TButton;
    ButtonBackOnResult: TButton;
    ButtonNextOnResult: TButton;
    GroupBoxChooseOuputParam: TGroupBox;
    LabelAvailableResultOutput: TLabel;
    LabelSelectedResultOuput: TLabel;
    ListBoxAvailableResultOutput: TListBox;
    ListBoxSelectedResutlOutput: TListBox;
    ButtonAddOutputParameters: TButton;
    ButtonChooseParamOnResult: TButton;
    ButtonChooseAllParamOnResult: TButton;
    ButtonDeclineParamsOnResult: TButton;
    ButtonDeclineAllParamsOnResult: TButton;
    GroupBoxOptionOnlogin: TGroupBox;
    LabelPathOnLogin: TLabel;
    LabelQueryOnLogin: TLabel;
    LabelCommentOnLogin: TLabel;
    EditCommentOnLogin: TEdit;
    EditQueryOnLogin: TEdit;
    EditPathOnLogin: TEdit;
    GroupBoxErrorCheckOnLogin: TGroupBox;
    EditIfContainOnLogin: TEdit;
    GroupBoxOnFinal: TGroupBox;
    LabelPathOnFinal: TLabel;
    LabelQueryOnFinal: TLabel;
    LabelCommentOnFinal: TLabel;
    EditCommentOnFinal: TEdit;
    EditQueryOnFinal: TEdit;
    EditPathOnFinal: TEdit;
    ButtonBackOnLogin: TButton;
    ButtonNextOnLogin: TButton;
    ButtonBackOnFinal: TButton;
    ButtonDoneOnFinal: TButton;
    ButtonBackOnExecute: TButton;
    ButtonNextOnExecute: TButton;
    ButtonBackOnEnter: TButton;
    ButtonNextOnEnter: TButton;
    ResultCode1: TMenuItem;
    InputParameters1: TMenuItem;
    ResultOutput1: TMenuItem;
    BCEditorCodePreview: TBCEditor;
    Openproject1: TMenuItem;
    SwitchWorkspace1: TMenuItem;
    NewModule1: TMenuItem;
    CloseProject1: TMenuItem;
    ToolBar1: TToolBar;
    PopupMenuProject: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    NewModule2: TMenuItem;
    N4: TMenuItem;
    Delele1: TMenuItem;
    ImageListToolbar: TImageList;
    ToolButtonNewModule: TToolButton;
    ToolButtonNewProject: TToolButton;
    ToolButtonOpenProject: TToolButton;
    GroupBoxChooseParam: TGroupBox;
    LabelAvailableParam: TLabel;
    LabelSelectedParam: TLabel;
    ListBoxAvailableParam: TListBox;
    ListBoxSelectedParam: TListBox;
    ButtonAddParams: TButton;
    ButtonChooseParam: TButton;
    ButtonChooseAllParamsOnParam: TButton;
    ButtonDeclineParamOnParam: TButton;
    ButtonDeclineAllParamsOnParam: TButton;
    GroupBoxErrorCheckOnParam: TGroupBox;
    LabelProjectExplorer: TLabel;
    ButtonNextOnParam: TButton;
    ButtonBackOnParam: TButton;
    RzPageControlMain: TRzPageControl;
    TabSheetMain: TRzTabSheet;
    TabSheetProj: TRzTabSheet;
    BCEditorProjCode: TBCEditor;
    ToolButtonSave: TToolButton;
    ToolButtonFindAndReplace: TToolButton;
    RzToolbarButtonRun: TRzToolbarButton;
    RzToolbarButton2: TRzToolbarButton;
    RzToolbarButton3: TRzToolbarButton;
    RzSizePanelProjectExplorer: TRzSizePanel;
    RzSplitter1: TRzSplitter;
    ListViewOnLogin: TListView;
    Label1: TLabel;
    LabelStatusOnLogin: TLabel;
    ListViewErrorCheckOnLogin: TListView;
    ComboBoxChooseErrorTypeOnLogin: TComboBox;
    LabelIfContainOnLogin: TLabel;
    ButtonDeleteErrorCheckOnLogin: TButton;
    ButtonSaveErrorCheckOnLogin: TButton;
    ButtonEditErrorCheckOnLogin: TButton;
    ButtonAddErrorCheckOnLogin: TButton;
    ImageListOperateButtons: TImageList;
    ButtonCancelSaveErrorCheckOnLogin: TButton;
    ButtonCacelSaveOnLogin: TButton;
    ButtonSaveOnLogin: TButton;
    ButtonDeleteOnLogin: TButton;
    ButtonEditOnLogin: TButton;
    ButtonAddOnLogin: TButton;
    LabelPercentOnLogin: TLabel;
    RzSpinEditStatusOnLogin: TRzSpinEdit;
    ButtonDeleteOnEnter: TButton;
    ButtonSaveOnEnter: TButton;
    ButtonAddOnEnter: TButton;
    ButtonEditOnEnter: TButton;
    ButtonCacelSaveOnEnter: TButton;
    ListViewOnEnter: TListView;
    GroupBoxOptionOnEnter: TGroupBox;
    LabelPathOnEnter: TLabel;
    LabelQueryOnEnter: TLabel;
    LabelCommentOnEnter: TLabel;
    LabelStatusOnEnter: TLabel;
    LabelPercentOnEnter: TLabel;
    EditCommentOnEnter: TEdit;
    EditQueryOnEnter: TEdit;
    EditPathOnEnter: TEdit;
    GroupBoxErrorCheckOnEnter: TGroupBox;
    LabelIfContainOnEnter: TLabel;
    EditIfContainOnEnter: TEdit;
    ListViewErrorCheckOnEnter: TListView;
    ButtonDeleteErrorCheckOnEnter: TButton;
    ButtonSaveErrorCheckOnEnter: TButton;
    ButtonEditErrorCheckOnEnter: TButton;
    ButtonAddErrorCheckOnEnter: TButton;
    ButtonCancelSaveErrorCheckOnEnter: TButton;
    ComboBoxChooseErrorTypeOnEnter: TComboBox;
    RzSpinEditStatusOnEnter: TRzSpinEdit;
    ButtonCancelSaveOnExecute: TButton;
    ButtonDeleteOnExecute: TButton;
    ButtonSaveOnExecute: TButton;
    ButtonAddOnExecute: TButton;
    ButtonEditOnExecute: TButton;
    GroupBoxOptionOnExecute: TGroupBox;
    LabelPathOnExecute: TLabel;
    LabelQueryOnExecute: TLabel;
    LabelCommentOnExecute: TLabel;
    LabelStatusOnExecute: TLabel;
    LabelPercentOnExecute: TLabel;
    EditCommentOnExecute: TEdit;
    EditQueryOnExecute: TEdit;
    EditPathOnExecute: TEdit;
    GroupBoxErrorCheckOnExecute: TGroupBox;
    LabelIfContainOnExecute: TLabel;
    EditIfContainOnExecute: TEdit;
    ListViewErrorCheckOnExecute: TListView;
    ButtonDeleteErrorCheckOnExecute: TButton;
    ButtonSaveErrorCheckOnExecute: TButton;
    ButtonEditErrorCheckOnExecute: TButton;
    ButtonAddErrorCheckOnExecute: TButton;
    ButtonCancelSaveErrorCheckOnExecute: TButton;
    ComboBoxChooseErrorTypeOnExecute: TComboBox;
    RzSpinEditStatusOnExecute: TRzSpinEdit;
    ListViewOnExecute: TListView;
    TreeViewProjectExplorer: TJamShellTree;
    SearchReplace1: TMenuItem;
    NewProject1: TMenuItem;
    Edit2: TMenuItem;
    RzSizePanelMessages: TRzSizePanel;
    ListBoxMessage: TListBox;
    LabelMessages: TLabel;
    projectfiletocompile: TLabel;
    runorcompile: TLabel;
    PopupMenuQuery: TPopupMenu;
    ListViewErrorCheck: TListView;
    ButtonRefreshChooseParam: TButton;
    procedure ResultCode1Click(Sender: TObject);
    procedure InputParameters1Click(Sender: TObject);
    procedure ResultOutput1Click(Sender: TObject);
    procedure ButtonAdvanceOnLoginClick(Sender: TObject);
    procedure ButtonAddParamsClick(Sender: TObject);
    procedure ButtonAddOutputParametersClick(Sender: TObject);
    procedure ButtonOpenProjectClick(Sender: TObject);
    procedure CheckBoxIndyAgentClick(Sender: TObject);
    procedure CheckBoxBrowserClick(Sender: TObject);
    procedure ButtonChooseParamClick(Sender: TObject);
    procedure NewProjectClick(Sender: TObject);
    procedure NewModule1Click(Sender: TObject);
    procedure SwitchWorkspace1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SearchReplace1Click(Sender: TObject);
    procedure NewProject1Click(Sender: TObject);
    procedure NewModule2Click(Sender: TObject);
    procedure Delele1Click(Sender: TObject);
    procedure RzToolbarButton3Click(Sender: TObject);
    procedure TreeViewProjectExplorerDblClick(Sender: TObject);
    procedure ButtonNextOnInitClick(Sender: TObject);
    procedure ListBoxAvailableParamClick(Sender: TObject);
    procedure ListBoxSelectedParamClick(Sender: TObject);
    procedure ButtonDeclineParamOnParamClick(Sender: TObject);
    procedure ButtonChooseAllParamsOnParamClick(Sender: TObject);
    procedure ButtonDeclineAllParamsOnParamClick(Sender: TObject);
    procedure TreeViewProjectExplorerKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ButtonBackOnLoginClick(Sender: TObject);
    procedure ButtonNextOnLoginClick(Sender: TObject);
    procedure TabSheetOnLoginShow(Sender: TObject);
    procedure RzToolbarButtonRunClick(Sender: TObject);
    procedure ToolButtonSaveClick(Sender: TObject);
    procedure BCEditorCodePreviewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BCEditorProjCodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ListBoxMessageDblClick(Sender: TObject);
    procedure BCEditorCodePreviewChange(Sender: TObject);
    procedure BCEditorProjCodeChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sfsdfsdf1Click(Sender: TObject);
    procedure ButtonNextOnParamClick(Sender: TObject);
    procedure PopupMenuQueryItemsClick(Sender: TObject);
    procedure ButtonNextOnExecuteClick(Sender: TObject);
    procedure ButtonChooseParamOnResultClick(Sender: TObject);
    procedure ListBoxAvailableResultOutputClick(Sender: TObject);
    procedure ButtonChooseAllParamOnResultClick(Sender: TObject);
    procedure ButtonDeclineAllParamsOnResultClick(Sender: TObject);
    procedure ListBoxSelectedResutlOutputClick(Sender: TObject);
    procedure ButtonNextOnEnterClick(Sender: TObject);
    procedure ButtonNextOnResultClick(Sender: TObject);
    procedure ButtonBackOnResultClick(Sender: TObject);
    procedure ButtonBackOnFinalClick(Sender: TObject);
    procedure ButtonDoneOnFinalClick(Sender: TObject);
    procedure ButtonBackOnExecuteClick(Sender: TObject);
    procedure ButtonBackOnEnterClick(Sender: TObject);
    procedure ButtonBackOnParamClick(Sender: TObject);
    procedure TabSheetOnResultShow(Sender: TObject);

    procedure ButtonEditOnLoginClick(Sender: TObject);
    procedure ButtonEditErrorCheckOnLoginClick(Sender: TObject);
    procedure ListViewOnLoginChange(Sender: TObject; Item: TListItem;
    Change: TItemChange);
    procedure ListViewErrorCheckOnLoginChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure EditPathOnLoginEnter(Sender: TObject);
    procedure EditQueryOnLoginEnter(Sender: TObject);
    procedure EditCommentOnLoginEnter(Sender: TObject);
    procedure RzSpinEditStatusOnLoginEnter(Sender: TObject);
    procedure ButtonSaveOnLoginClick(Sender: TObject);
    procedure ButtonCacelSaveOnLoginClick(Sender: TObject);
    procedure ButtonSaveErrorCheckOnLoginClick(Sender: TObject);
    procedure ListViewErrorCheckOnLoginEnter(Sender: TObject);
    procedure ButtonCancelSaveErrorCheckOnLoginClick(Sender: TObject);
    procedure ButtonAddOnLoginClick(Sender: TObject);
    procedure ButtonDeclineParamsOnResultClick(Sender: TObject);
    procedure ButtonDeleteOnLoginClick(Sender: TObject);
    procedure ButtonAddErrorCheckOnLoginClick(Sender: TObject);
    procedure ButtonDeleteErrorCheckOnLoginClick(Sender: TObject);
    procedure ComboBoxChooseErrorTypeOnLoginEnter(Sender: TObject);
    procedure ListViewErrorCheckOnLoginKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ListViewOnLoginKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Help1Click(Sender: TObject);
    procedure RzSpinEditStatusOnExecuteEnter(Sender: TObject);
    procedure RzSpinEditStatusOnEnterEnter(Sender: TObject);
    procedure TabSheetOnEnterShow(Sender: TObject);
    procedure ButtonAddErrorCheckOnEnterClick(Sender: TObject);
    procedure ButtonAddOnEnterClick(Sender: TObject);
    procedure ButtonCacelSaveOnEnterClick(Sender: TObject);
    procedure ButtonCancelSaveErrorCheckOnEnterClick(Sender: TObject);
    procedure ButtonDeleteErrorCheckOnEnterClick(Sender: TObject);
    procedure ButtonDeleteOnEnterClick(Sender: TObject);
    procedure ButtonEditErrorCheckOnEnterClick(Sender: TObject);
    procedure ButtonEditOnEnterClick(Sender: TObject);
    procedure ButtonSaveErrorCheckOnEnterClick(Sender: TObject);
    procedure ButtonSaveOnEnterClick(Sender: TObject);
    procedure EditCommentOnEnterEnter(Sender: TObject);
    procedure EditPathOnEnterEnter(Sender: TObject);
    procedure EditQueryOnEnterEnter(Sender: TObject);
    procedure ListViewErrorCheckOnEnterChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure ListViewErrorCheckOnEnterEnter(Sender: TObject);
    procedure ListViewErrorCheckOnEnterKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ListViewOnEnterChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure ListViewOnEnterKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBoxChooseErrorTypeOnEnterEnter(Sender: TObject);
    procedure TabSheetOnExecuteShow(Sender: TObject);
    procedure ButtonAddErrorCheckOnExecuteClick(Sender: TObject);
    procedure ButtonAddOnExecuteClick(Sender: TObject);
    procedure ButtonCancelSaveOnExecuteClick(Sender: TObject);
    procedure ButtonCancelSaveErrorCheckOnExecuteClick(Sender: TObject);
    procedure ButtonDeleteErrorCheckOnExecuteClick(Sender: TObject);
    procedure ButtonDeleteOnExecuteClick(Sender: TObject);
    procedure ButtonEditErrorCheckOnExecuteClick(Sender: TObject);
    procedure ButtonEditOnExecuteClick(Sender: TObject);
    procedure ButtonSaveErrorCheckOnExecuteClick(Sender: TObject);
    procedure ButtonSaveOnExecuteClick(Sender: TObject);
    procedure EditCommentOnExecuteEnter(Sender: TObject);
    procedure EditPathOnExecuteEnter(Sender: TObject);
    procedure EditQueryOnExecuteEnter(Sender: TObject);
    procedure ListViewErrorCheckOnExecuteChange(Sender: TObject;
      Item: TListItem; Change: TItemChange);
    procedure ListViewErrorCheckOnExecuteEnter(Sender: TObject);
    procedure ListViewErrorCheckOnExecuteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ListViewOnExecuteChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure ListViewOnExecuteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBoxChooseErrorTypeOnExecuteEnter(Sender: TObject);
    procedure EditPathOnFinalEnter(Sender: TObject);
    procedure TabSheetOnFinalShow(Sender: TObject);
    procedure EditQueryOnFinalEnter(Sender: TObject);
    procedure TabSheetOnParamShow(Sender: TObject);
    procedure ComboBoxOnClick(Sender: TObject);
    procedure ButtonRefreshChooseParamClick(Sender: TObject);
    procedure EditHostChange(Sender: TObject);
    procedure PageControlStepsChange(Sender: TObject);

  private
    procedure CodeHighligher(ABcEditor: TBCEditor; AFilePath: String);
    procedure ListOutputParams;
    function checkErrorType(AError : string) : Integer;
    function returnErrorType(AError : string) : String;
    procedure goToErrorCheck(AListView : TListView);
    procedure goToFunctionByComment(AComment: String; AListView: TListView);
    procedure getPopupQueryData();
    procedure saveOnInit();
  public
    { Public declarations }
    procedure SetValueToCombobox(index : integer; errorName : string);
    function GetConditionCheckString(index : integer; param : string) : string;
    procedure ClearValueOfListbox();
    function GetLineOfText(ABcEditor: TBCEditor; AString: String; AStartLineNumber: Integer=0): Integer;
    //function CheckDuplicateError(ParamInput, ErrorType : string) : Boolean;
    function DeleteCheckError(i : integer) : Boolean;
  end;
Const
  MUST_BE_NOT_BLANK = '<>';
  MUST_BE_A_NUMBER = 'tryStrToFloat';
  AT_LEAST_8_CHARACTER = 'length';
  MUST_BE_DATETIME_FORMAT = 'TryStrToDateTime';
  MUST_BE_EMAIL_FORMAT = 'TRegex';
var

  EZCodeGenerator: TEZCodeGenerator;
  ProjectName, FolderName, MainDotPasFile, OpenningModuleFolderPath, OpenningProjectFilePath, OpenningMainFilePath, OpenningProjectName  : String;
  ConfigFile, ProjectSetting, WorkspaceSetting, OnInitIni, OnParamIni, OnResultIni : TIniFile;
   errorText, checkErrorText, sectionText, selectedParam, chooseParam, selectedError, errorCheackText : String;
  itemNotBlank, itemMustNumber, item8character, itemFormatDate, itemFormatEmail : TListItem;
  cbNOtBlank, cbMustNumber, cb8character, cbFormatDate, cbFormatEmail: TComboBox;
  sectionSelectedParam : TStringList;
  index : integer;
  chooseText : array[0..4] of string ;

implementation

{$R *.dfm}

uses UnitFindText, UnitCompile, unitHelp, System.UITypes;

procedure TEZCodeGenerator.ResultCode1Click(Sender: TObject);
begin
  FormResultCode.Show;
end;

procedure TEZCodeGenerator.ResultOutput1Click(Sender: TObject);
begin
  FormResultOutput.Show;
end;

procedure TEZCodeGenerator.RzSpinEditStatusOnEnterEnter(Sender: TObject);
var
  onEnterBlock : Integer;
  comment      : Integer;
begin
  if RzSpinEditStatusOnEnter.Value <> 0 then
  begin
    onEnterBlock := GetLineOfText(BCEditorCodePreview, 'function onEnter: HRESULT;', 16);
    if Assigned(ListViewOnEnter.Selected) then
    begin
      comment := GetLineOfText(BCEditorCodePreview, ListViewOnEnter.Selected.SubItems[2], onEnterBlock);
      BCEditorCodePreview.GotoLineAndCenter(GetLineOfText(BCEditorCodePreview, 'hrdSetStatus(', comment));
    end;
  end;
end;

procedure TEZCodeGenerator.RzSpinEditStatusOnExecuteEnter(Sender: TObject);
var
  onExecuteBlock : Integer;
  comment      : Integer;
begin
  if RzSpinEditStatusOnExecute.Value <> 0 then
  begin
    onExecuteBlock := GetLineOfText(BCEditorCodePreview, 'function OnExecute: HRESULT;', 16);
    if Assigned(ListViewOnExecute.Selected) then
    begin
      comment := GetLineOfText(BCEditorCodePreview, ListViewOnExecute.Selected.SubItems[2], onExecuteBlock);
      BCEditorCodePreview.GotoLineAndCenter(GetLineOfText(BCEditorCodePreview, 'hrdSetStatus(', comment));
    end;
  end;
end;

procedure TEZCodeGenerator.RzSpinEditStatusOnLoginEnter(Sender: TObject);
var
  onLoginBlock : Integer;
  comment      : Integer;
begin
  if RzSpinEditStatusOnLogin.Value <> 0 then
  begin
    onLoginBlock := GetLineOfText(BCEditorCodePreview, 'function OnLogin: HRESULT;', 16);
    if Assigned(ListViewOnLogin.Selected) then
    begin
      comment := GetLineOfText(BCEditorCodePreview, ListViewOnLogin.Selected.SubItems[2], onLoginBlock);
      BCEditorCodePreview.GotoLineAndCenter(GetLineOfText(BCEditorCodePreview, 'hrdSetStatus(', comment));
    end;
  end;
end;

procedure TEZCodeGenerator.RzToolbarButton3Click(Sender: TObject);
begin
 if (BCEditorCodePreview.Lines.Count > 1) and (BCEditorProjCode.Lines.Count > 1) then
 begin
   runorcompile.Caption := 'Compiling';
   FormCompile.Show;
 end;
end;

procedure TEZCodeGenerator.ClearValueOfListbox();
var
  j : integer;
begin
  for j := 0 to 4 do
  begin
    ListViewErrorCheck.Items[j].Checked := false;
    SetValueToCombobox(j,'');
  end;

end;

procedure TEZCodeGenerator.RzToolbarButtonRunClick(Sender: TObject);
begin
  if (BCEditorCodePreview.Lines.Count > 1) and (BCEditorProjCode.Lines.Count > 1) then
  begin
    runorcompile.Caption := 'Running';
    FormCompile.Show;
  end;
end;

procedure TEZCodeGenerator.SearchReplace1Click(Sender: TObject);
begin
  FormFind.show;
end;

procedure TEZCodeGenerator.sfsdfsdf1Click(Sender: TObject);
begin
ShowMessage(PopupMenuQuery.Items[0].Caption);
end;

procedure TEZCodeGenerator.SwitchWorkspace1Click(Sender: TObject);
begin
  FormWorkspace.Show;
end;

procedure TEZCodeGenerator.TreeViewProjectExplorerDblClick(Sender: TObject);
var
  SelectedFilePath : String;
begin
try
  //ShowMessage('db clicked');
  if TreeViewProjectExplorer.Selected.IsFolder = False then
  begin
    SelectedFilePath := TreeViewProjectExplorer.Selected.FullPath;
    OpenningModuleFolderPath := TreeViewProjectExplorer.Selected.Parent.FullPath;
    RzPageControlMain.Visible := True;
    if Pos('main.pas', SelectedFilePath) > 0 then
    begin
      CodeHighligher(BCEditorCodePreview, SelectedFilePath);

      //auto open project.dpr
      CodeHighligher(BCEditorProjCode, TreeViewProjectExplorer.Selected.getNextSibling.FullPath);
      OpenningProjectFilePath := TreeViewProjectExplorer.Selected.getNextSibling.FullPath;
      OpenningProjectName := TreeViewProjectExplorer.Selected.getNextSibling.Text;
      TabSheetProj.Caption := OpenningProjectName;

      //active on Main tab and inside main tab: active on OnInit tab
      RzPageControlMain.ActivePage := TabSheetMain;
      PageControlSteps.ActivePage := TabSheetOnInit;

      //file name for compile
      projectfiletocompile.Caption := StringReplace(TreeViewProjectExplorer.Selected.getNextSibling.FullPath, '.dpr', '.dproj', [rfReplaceAll]);
      OpenningMainFilePath := SelectedFilePath;

    end
    else if Pos('.dpr', SelectedFilePath) > 0 then
    begin
      CodeHighligher(BCEditorProjCode, SelectedFilePath);
      OpenningProjectName := TreeViewProjectExplorer.Selected.Text;
      TabSheetProj.Caption := OpenningProjectName;


      //auto open main.pas
      CodeHighligher(BCEditorCodePreview, TreeViewProjectExplorer.Selected.getPrevSibling.FullPath);
      OpenningMainFilePath := TreeViewProjectExplorer.Selected.getPrevSibling.FullPath;

      RzPageControlMain.ActivePage := TabSheetProj;

      //file name for compile
      projectfiletocompile.Caption := StringReplace(SelectedFilePath, '.dpr', '.dproj', [rfReplaceAll]);

      OpenningProjectFilePath := SelectedFilePath;


    end;

    // save recent project to a file in current workspace
    WorkspaceSetting := TIniFile.Create( TreeViewProjectExplorer.Selected.Parent.Parent.Parent.FullPath + '\' + TreeViewProjectExplorer.Selected.Parent.Parent.Parent.Text + '.INI' );
    FileSetAttr(WorkspaceSetting.FileName, faHidden);

    WorkspaceSetting.WriteString('RecentProject', 'RecentModuleFolderPath', TreeViewProjectExplorer.Selected.Parent.FullPath);
    WorkspaceSetting.WriteString('RecentProject', 'RecentModuleFolder', TreeViewProjectExplorer.Selected.Parent.Text);
    WorkspaceSetting.WriteString('RecentProject', 'RecentProjectIndex', IntToStr(TreeViewProjectExplorer.Selected.Parent.Parent.Index));
    WorkspaceSetting.WriteString('RecentProject', 'RecentModuleIndex', IntToStr(TreeViewProjectExplorer.Selected.Parent.Index));
    WorkspaceSetting.WriteString('RecentProject', 'RecentMainDotPasPath', OpenningMainFilePath);
    WorkspaceSetting.WriteString('RecentProject', 'RecentProjectFilePath', OpenningProjectFilePath);
  end;

except on E: Exception do
end;
end;

procedure TEZCodeGenerator.TabSheetOnEnterShow(Sender: TObject);
var
  onEnterBlock : string;
  onEnterPage  : string;
  i, j         : Integer;
  Path, Query, Comment, Status : string;
  listviewitem : TListItem;
  errorCheck   : array of String;
begin
  //clear input before reading content
  ListViewOnEnter.Clear;
  EditPathOnEnter.Clear;
  EditQueryOnEnter.Clear;
  EditCommentOnEnter.Clear;
  RzSpinEditStatusOnEnter.Value := 0;
  ComboBoxChooseErrorTypeOnEnter.ItemIndex := -1;
  EditIfContainOnEnter.Clear;
  ListViewErrorCheckOnEnter.Clear;
  ButtonCacelSaveOnEnter.Click;

  BCEditorCodePreview.GotoLineAndCenter(GetLineOfText(BCEditorCodePreview, 'function onEnter: HRESULT;', 16));
  MainDotPasFile := BCEditorCodePreview.Text;
  onEnterBlock   := StrGrab(MainDotPasFile, 'function onEnter: HRESULT;', 'function OnExecute: HRESULT;', 2, False);
  i := 1;
  while True do
  begin
    if Pos('if hrdOccurError then begin Result := FLastError; Exit; end;', onEnterBlock)>0 then
    begin
      if i > 1 then
        onEnterPage := StrGrab(onEnterBlock, 'if hrdOccurError then begin Result := FLastError; Exit; end;', 'if hrdOccurError then begin Result := FLastError; Exit; end;', i-1, False)
      else
        onEnterPage := StrGrab(onEnterBlock, 'hrdSetStatus(', 'if hrdOccurError then begin Result := FLastError; Exit; end;', i, False);
    end
    else
    begin
      if i > 1 then
        onEnterPage := Trim(StrGrab(onEnterBlock, 'SaveToLog(ResultStr, ''Enter'+Inttostr(i-1)+''');', 'Result := S_HRD_OK;', 1, False))
      else
        onEnterPage := Trim(StrGrab(onEnterBlock, 'hrdSetStatus(HRD_STATE_ENTER, 30);', 'Result := S_HRD_OK;', i, False));
    end;
    if onEnterPage = '' then break;

    Path    := Trim(StrGrab(onEnterPage, 'Path := ''', ''';'));
    Query   := Trim(StrGrab(onEnterPage, 'Query := ''', ''';'));
    Comment := Trim(StrGrab(onEnterPage, '//', 'hrdSetStatus'));
    Status  := Trim(StrGrab(StrGrab(onEnterPage, 'hrdSetStatus(', ');'), ',', ''));

    j := 1;
    SetLength(errorCheck, 0);
    while True do
    begin
      SetLength(errorCheck, Length(errorCheck)+1);
      errorCheck[j-1] := StrGrab(onEnterPage, 'hrdCheckError(', ']);', j);
      if errorCheck[j-1] = '' then
      begin
        SetLength(errorCheck, Length(errorCheck)-1);
        break;
      end;
      Inc(j);
    end;

    listviewitem := ListViewOnEnter.Items.Add;
    listviewitem.Caption := IntToStr(i);
    listviewitem.SubItems.Add(Path);
    listviewitem.SubItems.Add(Query);
    listviewitem.SubItems.Add(Comment);
    listviewitem.SubItems.Add(Status);
    for j := 0 to High(errorCheck) do
    begin
      listviewitem.SubItems.Add(errorCheck[j]);
    end;
    Inc(i);
  end;
   ListViewOnEnter.Selected :=  ListViewOnEnter.Items[0];
end;

procedure TEZCodeGenerator.TabSheetOnExecuteShow(Sender: TObject);
var
  onExecuteBlock : string;
  onExecutePage  : string;
  i, j         : Integer;
  Path, Query, Comment, Status : string;
  listviewitem : TListItem;
  errorCheck   : array of String;
begin
  //clear input before reading content
  ListViewOnExecute.Clear;
  EditPathOnExecute.Clear;
  EditQueryOnExecute.Clear;
  EditCommentOnExecute.Clear;
  RzSpinEditStatusOnExecute.Value := 0;
  ComboBoxChooseErrorTypeOnExecute.ItemIndex := -1;
  EditIfContainOnExecute.Clear;
  ListViewErrorCheckOnExecute.Clear;
  ButtonCancelSaveOnExecute.Click;

  BCEditorCodePreview.GotoLineAndCenter(GetLineOfText(BCEditorCodePreview, 'function OnExecute: HRESULT;', 16));
  MainDotPasFile := BCEditorCodePreview.Text;
  onExecuteBlock   := StrGrab(MainDotPasFile, 'function OnExecute: HRESULT;', 'function OnResult: HRESULT;', 2, False);
  i := 1;
  while True do
  begin
    if Pos('if hrdOccurError then begin Result := FLastError; Exit; end;', onExecuteBlock)>0 then
    begin
      if i > 1 then
        onExecutePage := StrGrab(onExecuteBlock, 'if hrdOccurError then begin Result := FLastError; Exit; end;', 'if hrdOccurError then begin Result := FLastError; Exit; end;', i-1, False)
      else
        onExecutePage := StrGrab(onExecuteBlock, 'hrdSetStatus(', 'if hrdOccurError then begin Result := FLastError; Exit; end;', i, False);
    end
    else
    begin
      if i > 1 then
        onExecutePage := Trim(StrGrab(onExecuteBlock, 'SaveToLog(ResultStr, ''Execute'+Inttostr(i-1)+''');', 'Result := S_HRD_OK;', 1, False))
      else
        onExecutePage := Trim(StrGrab(onExecuteBlock, 'hrdSetStatus(HRD_STATE_EXECUTE, 40);', 'Result := S_HRD_OK;', i, False));
    end;
    if onExecutePage = '' then break;

    Path    := Trim(StrGrab(onExecutePage, 'Path := ''', ''';'));
    Query   := Trim(StrGrab(onExecutePage, 'Query := ''', ''';'));
    Comment := Trim(StrGrab(onExecutePage, '//', 'hrdSetStatus'));
    Status  := Trim(StrGrab(StrGrab(onExecutePage, 'hrdSetStatus(', ');'), ',', ''));

    j := 1;
    SetLength(errorCheck, 0);
    while True do
    begin
      SetLength(errorCheck, Length(errorCheck)+1);
      errorCheck[j-1] := StrGrab(onExecutePage, 'hrdCheckError(', ']);', j);
      if errorCheck[j-1] = '' then
      begin
        SetLength(errorCheck, Length(errorCheck)-1);
        break;
      end;
      Inc(j);
    end;

    listviewitem := ListViewOnExecute.Items.Add;
    listviewitem.Caption := IntToStr(i);
    listviewitem.SubItems.Add(Path);
    listviewitem.SubItems.Add(Query);
    listviewitem.SubItems.Add(Comment);
    listviewitem.SubItems.Add(Status);
    for j := 0 to High(errorCheck) do
    begin
      listviewitem.SubItems.Add(errorCheck[j]);
    end;
    Inc(i);
  end;
   ListViewOnExecute.Selected :=  ListViewOnExecute.Items[0];
end;

procedure TEZCodeGenerator.TabSheetOnFinalShow(Sender: TObject);
var
  onFinalBlock : string;
  Path, Query: string;
begin
  //clear input before reading content
  EditPathOnFinal.Clear;
  EditQueryOnFinal.Clear;
  //read value from code preview
  BCEditorCodePreview.GotoLineAndCenter(GetLineOfText(BCEditorCodePreview, 'function OnFinal: HRESULT;', 16));
  MainDotPasFile := BCEditorCodePreview.Text;
  onFinalBlock   := StrGrab(MainDotPasFile, 'function OnFinal: HRESULT;', 'end.', 2, False);
  Path    := Trim(StrGrab(onFinalBlock, 'Path := ''', ''';'));
  Query   := Trim(StrGrab(onFinalBlock, 'Query := ''', ''';'));
  EditPathOnFinal.Text    := Path;
  EditQueryOnFinal.Text   := Query;
end;

procedure TEZCodeGenerator.TabSheetOnLoginShow(Sender: TObject);
var
  onLoginBlock : string;
  onLoginPage  : string;
  i, j        : Integer;
  Path, Query, Comment, Status : string;
  listviewitem : TListItem;
  errorCheck   : array of String;
begin
  //get all selected parameter
  getPopupQueryData;

  //clear input before reading content
  ListViewOnLogin.Clear;
  EditPathOnLogin.Clear;
  EditQueryOnLogin.Clear;
  EditCommentOnLogin.Clear;
  RzSpinEditStatusOnLogin.Value := 0;
  ComboBoxChooseErrorTypeOnLogin.ItemIndex := -1;
  EditIfContainOnLogin.Clear;
  ListViewErrorCheckOnLogin.Clear;
  ButtonCacelSaveOnLogin.Click;


  BCEditorCodePreview.GotoLineAndCenter(GetLineOfText(BCEditorCodePreview, 'function OnLogin: HRESULT;', 16));
  MainDotPasFile := BCEditorCodePreview.Text;
  onLoginBlock   := StrGrab(MainDotPasFile, 'function OnLogin: HRESULT;', 'function onEnter: HRESULT;', 2, False);
  i := 1;
  while True do
  begin
    if Pos('if hrdOccurError then begin Result := FLastError; Exit; end;', onLoginBlock)>0 then
    begin
      if i > 1 then
        onLoginPage := StrGrab(onLoginBlock, 'if hrdOccurError then begin Result := FLastError; Exit; end;', 'if hrdOccurError then begin Result := FLastError; Exit; end;', i-1, False)
      else
        onLoginPage := StrGrab(onLoginBlock, 'hrdSetStatus(', 'if hrdOccurError then begin Result := FLastError; Exit; end;', i, False);
    end
    else
    begin
      if i > 1 then
        onLoginPage := Trim(StrGrab(onLoginBlock, 'SaveToLog(ResultStr, ''Login'+Inttostr(i-1)+''');', 'Result := S_HRD_OK;', 1, False))
      else
        onLoginPage := Trim(StrGrab(onLoginBlock, 'hrdSetStatus(HRD_STATE_LOGIN, 20);', 'Result := S_HRD_OK;', i, False));
    end;
    if onLoginPage = '' then break;

    Path    := Trim(StrGrab(onLoginPage, 'Path := ''', ''';'));
    Query   := Trim(StrGrab(onLoginPage, 'Query := ''', ''';'));
    Comment := Trim(StrGrab(onLoginPage, '//', 'hrdSetStatus'));
    Status  := Trim(StrGrab(StrGrab(onLoginPage, 'hrdSetStatus(', ');'), ',', ''));

    j := 1;
    SetLength(errorCheck, 0);
    while True do
    begin
      SetLength(errorCheck, Length(errorCheck)+1);
      errorCheck[j-1] := StrGrab(onLoginPage, 'hrdCheckError(', ']);', j);
      if errorCheck[j-1] = '' then
      begin
        SetLength(errorCheck, Length(errorCheck)-1);
        break;
      end;
      Inc(j);
    end;

    listviewitem := ListViewOnLogin.Items.Add;
    listviewitem.Caption := IntToStr(i);
    listviewitem.SubItems.Add(Path);
    listviewitem.SubItems.Add(Query);
    listviewitem.SubItems.Add(Comment);
    listviewitem.SubItems.Add(Status);
    for j := 0 to High(errorCheck) do
    begin
      listviewitem.SubItems.Add(errorCheck[j]);
    end;
    Inc(i);
  end;
   ListViewOnLogin.Selected :=  ListViewOnLogin.Items[0];
end;

procedure TEZCodeGenerator.TabSheetOnResultShow(Sender: TObject);
begin
  ListOutputParams;
end;

 procedure TEZCodeGenerator.SetValueToCombobox(index : integer; errorName : string);
 begin
   if index = 0 then
     cbNOtBlank.ItemIndex := cbNOtBlank.Items.IndexOf(errorName)
   else if index = 1 then
     cbMustNumber.ItemIndex := cbMustNumber.Items.IndexOf(errorName)
   else if index = 2 then
     cb8character.ItemIndex := cb8character.Items.IndexOf(errorName)
   else if index = 3 then
     cbFormatDate.ItemIndex := cbFormatDate.Items.IndexOf(errorName)
   else if index = 4 then
     cbFormatEmail.ItemIndex := cbFormatEmail.Items.IndexOf(errorName)
   else
     exit;
 end;
 function TEZCodeGenerator.GetConditionCheckString(index : integer; param : string) : String;
 begin
 //result := nil;
  if index = 0 then
  begin
    result := 'hrdParam.items['+param+'] <> ''''';
  end
   else if index = 1 then
   begin
    result := 'TryStrToFloat(hrdParam.items['+param + '],x)';
   end
   else if index = 2 then
   begin
    result := 'Length(hrdParam.items['+ param +']) >= 8';
   end
   else if index = 3 then
   begin
    result := 'TryStrToDateTime(hrdParam.items['+param+'], value)';
   end
   else if index = 4 then
   begin
    result := 'TRegEx.IsMatch(hrdParam.items['+param+'],''(\w.*?@\w{2,}.\w{2,}(.\w{2,}))'')';
   end
   else
     exit;
 end;
procedure TEZCodeGenerator.ComboBoxOnClick(Sender: TObject);
begin
  OnParamIni := TIniFile.Create(OpenningModuleFolderPath +'\OnParam.INI' );
  if cbNOtBlank.ItemIndex >= 0 then
    begin
    chooseText[0] := cbNOtBlank.Items[cbNOtBlank.ItemIndex];
    if chooseText[0] = 'None' then
      OnParamIni.DeleteKey(selectedParam,'chooseText[0]')
    else
      OnParamIni.WriteString(selectedParam,'chooseText[0]', chooseText[0]);
    end;
  if cbMustNumber.ItemIndex >= 0 then
    begin
    chooseText[1] := cbMustNumber.Items[cbMustNumber.ItemIndex];
    if chooseText[1] = 'None' then
      OnParamIni.DeleteKey(selectedParam,'chooseText[1]')
    else
      OnParamIni.WriteString(selectedParam,'chooseText[1]', chooseText[1]);
    end;
  if cb8character.ItemIndex >= 0 then
    begin
    chooseText[2] := cb8character.Items[cb8character.ItemIndex];
    if chooseText[2] = 'None' then
      OnParamIni.DeleteKey(selectedParam,'chooseText[2]')
    else
      OnParamIni.WriteString(selectedParam,'chooseText[2]', chooseText[2]);
    end;
  if cbFormatDate.ItemIndex >= 0 then
    begin
    chooseText[3] := cbFormatDate.Items[cbFormatDate.ItemIndex];
    if chooseText[3] = 'None' then
      OnParamIni.DeleteKey(selectedParam,'chooseText[3]')
    else
      OnParamIni.WriteString(selectedParam,'chooseText[3]', chooseText[3]);
    end;
  if cbFormatEmail.ItemIndex >= 0 then
    begin
    chooseText[4] := cbFormatEmail.Items[cbFormatEmail.ItemIndex];
    if chooseText[4] = 'None' then
      OnParamIni.DeleteKey(selectedParam,'chooseText[4]')
    else
      OnParamIni.WriteString(selectedParam,'chooseText[4]', chooseText[4]);
    end;
end;

procedure TEZCodeGenerator.TabSheetOnParamShow(Sender: TObject);
var
  inputparams : TStringDynArray;
  i, j : integer;
  r: TRect;
  ChoosedParam : TStringList;
  resultcode : TStringDynArray;
  tmp : string;
begin
  ChoosedParam := TStringList.Create;
  OnParamIni := TIniFile.Create(OpenningModuleFolderPath+'\OnParam.INI');
  ListBoxSelectedParam.Clear;
  ListBoxAvailableParam.Clear;


  ListViewErrorCheck.Clear;
  inputparams := getInputParam;
  OnParamIni.ReadSections(ListBoxSelectedParam.Items);

  for I := low(inputparams) to high(inputparams) do
  begin
    if not ContainsStr(inputparams[i], '//') then
    begin
      tmp :=  trim(splitstring(inputparams[i], '=')[0]);

      for j := ListBoxSelectedParam.Items.Count-1 downto 0 do
      begin
        if ListBoxSelectedParam.Items[j] = tmp then
        begin
         tmp := '';
         break;
        end;
      end;
      if tmp = '' then continue;
      ListBoxAvailableParam.Items.Add(tmp);
    end;

  end;


//  for j :=  ListBoxAvailableParam.Items.Count-1 downto 0 do
//  begin
//  OnParamIni.ReadSection(ListBoxAvailableParam.Items[j],ChoosedParam);
//  showmessage(ChoosedParam.Text);
//    if ChoosedParam.Text <> '' then
//    begin
//      ListBoxSelectedParam.Items.Add(ListBoxAvailableParam.Items[j]);
//      ListBoxAvailableParam.Items.Delete(j);
//    end;
//  end;

 itemNotBlank := ListViewErrorCheck.Items.Add;
            itemNotBlank.Caption := 'Must be not blank';
            itemNotBlank.SubItems.Add(' ');
  r := itemNotBlank.DisplayRect(drBounds);
  r.Left  := r.Left + ListViewErrorCheck.columns[0].Width;
  cbNOtBlank := TComboBox.Create(self);
  cbNOtBlank.Parent := ListViewErrorCheck;
  cbNOtBlank.BoundsRect := r;
  cbNOtBlank.Font.Size := 9;
  cbNOtBlank.Height := 22;
  cbNOtBlank.OnClick := ComboBoxOnClick;
  resultcode := getResultCode;

  cbNOtBlank.Items.Add('None');
   for i := low(resultcode) to high(resultcode) do
   begin
      if not ContainsStr(resultcode[i], '//') then
        cbNOtBlank.Items.Add(trim(splitstring(resultcode[i], ':')[0]));
   end;

  itemMustNumber := ListViewErrorCheck.Items.Add;
            itemMustNumber.Caption := 'Must be a number';
            itemMustNumber.SubItems.Add(' ');
  r := itemMustNumber.DisplayRect(drBounds);
  r.Left  := r.Left + ListViewErrorCheck.columns[0].Width;
  cbMustNumber := TComboBox.Create(self);
  cbMustNumber.Parent := ListViewErrorCheck;
  cbMustNumber.BoundsRect := r;
  cbMustNumber.Font.Size := 9;
  cbMustNumber.Height := 22;
  cbMustNumber.OnClick := ComboBoxOnClick;
  resultcode := getResultCode;

  cbMustNumber.Items.Add('None');
   for i := low(resultcode) to high(resultcode) do
   begin
      if not ContainsStr(resultcode[i], '//') then
        cbMustNumber.Items.Add(trim(splitstring(resultcode[i], ':')[0]));
   end;

  item8character := ListViewErrorCheck.Items.Add;
            item8character.Caption := 'At least 8 characters';
            item8character.SubItems.Add(' ');
  r := item8character.DisplayRect(drBounds);
  r.Left  := r.Left + ListViewErrorCheck.columns[0].Width;
  cb8character := TComboBox.Create(self);
  cb8character.Parent := ListViewErrorCheck;
  cb8character.BoundsRect := r;
  cb8character.Font.Size := 9;
  cb8character.Height := 22;
  cb8character.OnClick := ComboBoxOnClick;
  resultcode := getResultCode;

  cb8character.Items.Add('None');
   for i := low(resultcode) to high(resultcode) do
   begin
      if not ContainsStr(resultcode[i], '//') then
        cb8character.Items.Add(trim(splitstring(resultcode[i], ':')[0]));
   end;

   itemFormatDate := ListViewErrorCheck.Items.Add;
              itemFormatDate.Caption := 'Must be YYYY/MM/DD format';
            itemFormatDate.SubItems.Add(' ');
  r := itemFormatDate.DisplayRect(drBounds);
  r.Left  := r.Left + ListViewErrorCheck.columns[0].Width;
  cbFormatDate := TComboBox.Create(self);
  cbFormatDate.Parent := ListViewErrorCheck;
  cbFormatDate.BoundsRect := r;
  cbFormatDate.Font.Size := 9;
  cbFormatDate.Height := 22;
  cbFormatDate.OnClick := ComboBoxOnClick;
  resultcode := getResultCode;

  cbFormatDate.Items.Add('None');
   for i := low(resultcode) to high(resultcode) do
   begin
      if not ContainsStr(resultcode[i], '//') then
        cbFormatDate.Items.Add(trim(splitstring(resultcode[i], ':')[0]));
   end;

  itemFormatEmail := ListViewErrorCheck.Items.Add;
            itemFormatEmail.Caption := 'Must be someone@example.com format';
            itemFormatEmail.SubItems.Add(' ');
  r := itemFormatEmail.DisplayRect(drBounds);
  r.Left  := r.Left + ListViewErrorCheck.columns[0].Width;
  cbFormatEmail := TComboBox.Create(self);
  cbFormatEmail.Parent := ListViewErrorCheck;
  cbFormatEmail.BoundsRect := r;
  cbFormatEmail.Font.Size := 9;
  cbFormatEmail.Height := 22;
  cbFormatEmail.OnClick := ComboBoxOnClick;
  resultcode := getResultCode;

  cbFormatEmail.Items.Add('None');
   for i := low(resultcode) to high(resultcode) do
   begin
      if not ContainsStr(resultcode[i], '//') then
        cbFormatEmail.Items.Add(trim(splitstring(resultcode[i], ':')[0]));
   end;
end;

procedure TEZCodeGenerator.ToolButtonSaveClick(Sender: TObject);
var
  CodesFromMainEditor, CodesFromProjEditor : TStringList;
begin
  //save onInit
  saveOnInit;

  //save main.pas
  if RzPageControlMain.ActivePage = TabSheetMain then
  begin
    CodesFromMainEditor := TStringList.Create;
    try
      CodesFromMainEditor.Text :=  BCEditorCodePreview.Text;
      CodesFromMainEditor.SaveToFile(OpenningMainFilePath);
      TabSheetMain.Caption := 'main.pas';
    finally
      CodesFromMainEditor.Free;
    end;
  end
  //save proj
  else
  begin
    CodesFromProjEditor := TStringList.Create;
    try
      CodesFromProjEditor.Text :=  BCEditorProjCode.Text;
      CodesFromProjEditor.SaveToFile(OpenningProjectFilePath);
      TabSheetProj.Caption := StrReplace(TabSheetProj.Caption, '*', '');
    finally
      CodesFromProjEditor.Free;
    end;
  end;

  //ShowMessage('save');

end;

procedure TEZCodeGenerator.TreeViewProjectExplorerKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
    Delele1.Click;
end;

procedure TEZCodeGenerator.About1Click(Sender: TObject);
begin
  FormAboutBox.ShowModal;
end;

procedure TEZCodeGenerator.BCEditorCodePreviewChange(Sender: TObject);
begin
  TabSheetMain.Caption := 'main.pas*';
  FormCompile.Close;
end;

procedure TEZCodeGenerator.BCEditorCodePreviewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ([ssCtrl] = Shift*[ssCtrl, ssShift, ssAlt]) and (Key = ord('S')) then
  begin
    ToolButtonSaveClick(Self);
  end;
  if Key = VK_F9 then
    RzToolbarButtonRunClick(Self);

  if ([ssCtrl] = Shift*[ssCtrl, ssShift, ssAlt]) and (Key = ord('F')) then
    SearchReplace1Click(Self);

  if ([ssCtrl] = Shift*[ssCtrl, ssShift, ssAlt]) and (Key = ord('H')) then
    SearchReplace1Click(Self);
end;

procedure TEZCodeGenerator.BCEditorProjCodeChange(Sender: TObject);
begin
  TabSheetProj.Caption := OpenningProjectName + '*';
end;

procedure TEZCodeGenerator.BCEditorProjCodeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  BCEditorCodePreviewKeyDown(Sender, Key, Shift);
end;

procedure TEZCodeGenerator.ButtonNextOnParamClick(Sender: TObject);
var
  Index : Integer;
begin
  //go to next tab
  PageControlSteps.ActivePage := TabSheetOnLogin;
end;
procedure TEZCodeGenerator.ButtonNextOnResultClick(Sender: TObject);
begin
 //go to next tab
  PageControlSteps.ActivePage := TabSheetOnResult;
end;

procedure TEZCodeGenerator.ButtonAddErrorCheckOnEnterClick(Sender: TObject);
var
  listviewitem : TListItem;
begin
  goToErrorCheck(ListViewOnEnter);
  if Assigned(ListViewOnEnter.Selected) then
  begin
    ButtonSaveErrorCheckOnEnter.Enabled := True;
    ButtonCancelSaveErrorCheckOnEnter.Enabled := True;
    ButtonAddErrorCheckOnEnter.Enabled := False;
    ButtonEditErrorCheckOnEnter.Enabled := False;
    ButtonDeleteErrorCheckOnEnter.Enabled := False;

    if not Assigned(ListViewErrorCheckOnEnter.Selected) then
      ListViewErrorCheckOnEnter.Selected := ListViewErrorCheckOnEnter.Items[0];

    if ListViewErrorCheckOnEnter.Items.Count = 0 then
    begin
      listviewitem := ListViewErrorCheckOnEnter.Items.Add;
      listviewitem.Caption := IntToStr(ListViewErrorCheckOnEnter.Items.Count);
      listviewitem.SubItems.Add('');
      listviewitem.SubItems.Add('');
      ListViewErrorCheckOnEnter.Selected := ListViewErrorCheckOnEnter.Items[ListViewErrorCheckOnEnter.Items.Count-1];
      ComboBoxChooseErrorTypeOnEnter.Enabled := True;
      EditIfContainOnEnter.Enabled := True;
    end
      else if (ListViewErrorCheckOnEnter.Selected.SubItems[0] <> '') and
       (ListViewErrorCheckOnEnter.Selected.SubItems[1] <> '') then
    begin
      listviewitem := ListViewErrorCheckOnEnter.Items.Add;
      listviewitem.Caption := IntToStr(ListViewErrorCheckOnEnter.Items.Count);
      listviewitem.SubItems.Add('');
      listviewitem.SubItems.Add('');
      ListViewErrorCheckOnEnter.Selected := ListViewErrorCheckOnEnter.Items[ListViewErrorCheckOnEnter.Items.Count-1];
      ComboBoxChooseErrorTypeOnEnter.Enabled := True;
      EditIfContainOnEnter.Enabled := True;
    end
  end;
end;

procedure TEZCodeGenerator.ButtonAddErrorCheckOnExecuteClick(Sender: TObject);
var
  listviewitem : TListItem;
begin
  goToErrorCheck(ListViewOnExecute);
  if Assigned(ListViewOnExecute.Selected) then
  begin
    ButtonSaveErrorCheckOnExecute.Enabled := True;
    ButtonCancelSaveErrorCheckOnExecute.Enabled := True;
    ButtonAddErrorCheckOnExecute.Enabled := False;
    ButtonEditErrorCheckOnExecute.Enabled := False;
    ButtonDeleteErrorCheckOnExecute.Enabled := False;

    if not Assigned(ListViewErrorCheckOnExecute.Selected) then
      ListViewErrorCheckOnExecute.Selected := ListViewErrorCheckOnExecute.Items[0];

    if ListViewErrorCheckOnExecute.Items.Count = 0 then
    begin
      listviewitem := ListViewErrorCheckOnExecute.Items.Add;
      listviewitem.Caption := IntToStr(ListViewErrorCheckOnExecute.Items.Count);
      listviewitem.SubItems.Add('');
      listviewitem.SubItems.Add('');
      ListViewErrorCheckOnExecute.Selected := ListViewErrorCheckOnExecute.Items[ListViewErrorCheckOnExecute.Items.Count-1];
      ComboBoxChooseErrorTypeOnExecute.Enabled := True;
      EditIfContainOnExecute.Enabled := True;
    end
      else if (ListViewErrorCheckOnExecute.Selected.SubItems[0] <> '') and
       (ListViewErrorCheckOnExecute.Selected.SubItems[1] <> '') then
    begin
      listviewitem := ListViewErrorCheckOnExecute.Items.Add;
      listviewitem.Caption := IntToStr(ListViewErrorCheckOnExecute.Items.Count);
      listviewitem.SubItems.Add('');
      listviewitem.SubItems.Add('');
      ListViewErrorCheckOnExecute.Selected := ListViewErrorCheckOnExecute.Items[ListViewErrorCheckOnExecute.Items.Count-1];
      ComboBoxChooseErrorTypeOnExecute.Enabled := True;
      EditIfContainOnExecute.Enabled := True;
    end
  end;
end;

procedure TEZCodeGenerator.ButtonAddErrorCheckOnLoginClick(Sender: TObject);
var
  listviewitem : TListItem;
begin
  goToErrorCheck(ListViewOnLogin);
  if Assigned(ListViewOnLogin.Selected) then
  begin
    ButtonSaveErrorCheckOnLogin.Enabled := True;
    ButtonCancelSaveErrorCheckOnLogin.Enabled := True;
    ButtonAddErrorCheckOnLogin.Enabled := False;
    ButtonEditErrorCheckOnLogin.Enabled := False;
    ButtonDeleteErrorCheckOnLogin.Enabled := False;

    if not Assigned(ListViewErrorCheckOnLogin.Selected) then
      ListViewErrorCheckOnLogin.Selected := ListViewErrorCheckOnLogin.Items[0];

    if ListViewErrorCheckOnLogin.Items.Count = 0 then
    begin
      listviewitem := ListViewErrorCheckOnLogin.Items.Add;
      listviewitem.Caption := IntToStr(ListViewErrorCheckOnLogin.Items.Count);
      listviewitem.SubItems.Add('');
      listviewitem.SubItems.Add('');
      ListViewErrorCheckOnLogin.Selected := ListViewErrorCheckOnLogin.Items[ListViewErrorCheckOnLogin.Items.Count-1];
      ComboBoxChooseErrorTypeOnLogin.Enabled := True;
      EditIfContainOnLogin.Enabled := True;
    end
      else if (ListViewErrorCheckOnLogin.Selected.SubItems[0] <> '') and
       (ListViewErrorCheckOnLogin.Selected.SubItems[1] <> '') then
    begin
      listviewitem := ListViewErrorCheckOnLogin.Items.Add;
      listviewitem.Caption := IntToStr(ListViewErrorCheckOnLogin.Items.Count);
      listviewitem.SubItems.Add('');
      listviewitem.SubItems.Add('');
      ListViewErrorCheckOnLogin.Selected := ListViewErrorCheckOnLogin.Items[ListViewErrorCheckOnLogin.Items.Count-1];
      ComboBoxChooseErrorTypeOnLogin.Enabled := True;
      EditIfContainOnLogin.Enabled := True;
    end
  end;
end;

procedure TEZCodeGenerator.ButtonAddOnEnterClick(Sender: TObject);
var
  listviewitem : TListItem;
begin
  ButtonSaveOnEnter.Enabled := True;
  ButtonCacelSaveOnEnter.Enabled := True;
  ButtonEditOnEnter.Enabled := False;
  ButtonDeleteOnEnter.Enabled := False;
  ButtonAddOnEnter.Enabled := False;
  if ListViewOnEnter.Items.Count = 0 then
  begin
     listviewitem := ListViewOnEnter.Items.Add;
     listviewitem.Caption := IntToStr(ListViewOnEnter.Items.Count);
     listviewitem.SubItems.Add('');
     listviewitem.SubItems.Add('');
     listviewitem.SubItems.Add('');
     listviewitem.SubItems.Add('');
  end
  else if (ListViewOnEnter.Items[ListViewOnEnter.Items.Count-1].SubItems[0] <> '') and
     (ListViewOnEnter.Items[ListViewOnEnter.Items.Count-1].SubItems[1] <> '') and
     (ListViewOnEnter.Items[ListViewOnEnter.Items.Count-1].SubItems[2] <> '') then
  begin
     listviewitem := ListViewOnEnter.Items.Add;
     listviewitem.Caption := IntToStr(ListViewOnEnter.Items.Count);
     listviewitem.SubItems.Add('');
     listviewitem.SubItems.Add('');
     listviewitem.SubItems.Add('');
     listviewitem.SubItems.Add('');
  end;
  ListViewOnEnter.Selected := ListViewOnEnter.Items[ListViewOnEnter.Items.Count-1];
  EditPathOnEnter.Enabled := True;
  EditQueryOnEnter.Enabled := True;
  EditCommentOnEnter.Enabled := True;
  RzSpinEditStatusOnEnter.Enabled := True;
  ComboBoxChooseErrorTypeOnEnter.Enabled := True;
  EditIfContainOnEnter.Enabled := True;
  ComboBoxChooseErrorTypeOnEnter.ItemIndex := 0;
  EditIfContainOnEnter.Text := '';
  EditPathOnEnter.SetFocus;
end;

procedure TEZCodeGenerator.ButtonAddOnExecuteClick(Sender: TObject);
var
  listviewitem : TListItem;
begin
  ButtonSaveOnExecute.Enabled := True;
  ButtonCancelSaveOnExecute.Enabled := True;
  ButtonEditOnExecute.Enabled := False;
  ButtonDeleteOnExecute.Enabled := False;
  ButtonAddOnExecute.Enabled := False;

  if ListViewOnExecute.Items.Count = 0 then
  begin
     listviewitem := ListViewOnExecute.Items.Add;
     listviewitem.Caption := IntToStr(ListViewOnExecute.Items.Count);
     listviewitem.SubItems.Add('');
     listviewitem.SubItems.Add('');
     listviewitem.SubItems.Add('');
     listviewitem.SubItems.Add('');
  end
  else if (ListViewOnExecute.Items[ListViewOnExecute.Items.Count-1].SubItems[0] <> '') and
     (ListViewOnExecute.Items[ListViewOnExecute.Items.Count-1].SubItems[1] <> '') and
     (ListViewOnExecute.Items[ListViewOnExecute.Items.Count-1].SubItems[2] <> '') then
  begin
     listviewitem := ListViewOnExecute.Items.Add;
     listviewitem.Caption := IntToStr(ListViewOnExecute.Items.Count);
     listviewitem.SubItems.Add('');
     listviewitem.SubItems.Add('');
     listviewitem.SubItems.Add('');
     listviewitem.SubItems.Add('');
  end;

  ListViewOnExecute.Selected := ListViewOnExecute.Items[ListViewOnExecute.Items.Count-1];
  EditPathOnExecute.Enabled := True;
  EditQueryOnExecute.Enabled := True;
  EditCommentOnExecute.Enabled := True;
  RzSpinEditStatusOnExecute.Enabled := True;
  ComboBoxChooseErrorTypeOnExecute.Enabled := True;
  EditIfContainOnExecute.Enabled := True;
  ComboBoxChooseErrorTypeOnExecute.ItemIndex := 0;
  EditIfContainOnExecute.Text := '';
  EditPathOnExecute.SetFocus;
end;

procedure TEZCodeGenerator.ButtonAddOnLoginClick(Sender: TObject);
var
  listviewitem : TListItem;
begin
  ButtonSaveOnLogin.Enabled := True;
  ButtonCacelSaveOnLogin.Enabled := True;
  ButtonEditOnLogin.Enabled := False;

  ButtonDeleteOnLogin.Enabled := False;
  ButtonAddOnLogin.Enabled := False;

  if ListViewOnLogin.Items.Count = 0 then
  begin
     listviewitem := ListViewOnLogin.Items.Add;
     listviewitem.Caption := IntToStr(ListViewOnLogin.Items.Count);
     listviewitem.SubItems.Add('');
     listviewitem.SubItems.Add('');
     listviewitem.SubItems.Add('');
     listviewitem.SubItems.Add('');
  end
  else if (ListViewOnLogin.Items[ListViewOnLogin.Items.Count-1].SubItems[0] <> '') and
     (ListViewOnLogin.Items[ListViewOnLogin.Items.Count-1].SubItems[1] <> '') and
     (ListViewOnLogin.Items[ListViewOnLogin.Items.Count-1].SubItems[2] <> '') then
  begin
     listviewitem := ListViewOnLogin.Items.Add;
     listviewitem.Caption := IntToStr(ListViewOnLogin.Items.Count);
     listviewitem.SubItems.Add('');
     listviewitem.SubItems.Add('');
     listviewitem.SubItems.Add('');
     listviewitem.SubItems.Add('');
  end;

  ListViewOnLogin.Selected := ListViewOnLogin.Items[ListViewOnLogin.Items.Count-1];
  EditPathOnLogin.Enabled := True;
  EditQueryOnLogin.Enabled := True;
  EditCommentOnLogin.Enabled := True;
  RzSpinEditStatusOnLogin.Enabled := True;

  ComboBoxChooseErrorTypeOnLogin.Enabled := True;
  EditIfContainOnLogin.Enabled := True;

  //ComboBoxChooseErrorTypeOnLogin.Enabled := True;
  //EditIfContainOnLogin.Enabled := True;
  ComboBoxChooseErrorTypeOnLogin.ItemIndex := 0;
  EditIfContainOnLogin.Text := '';
  EditPathOnLogin.SetFocus;
end;

procedure TEZCodeGenerator.ButtonAddOutputParametersClick(Sender: TObject);
begin
  FormResultOutput.Show;
end;

procedure TEZCodeGenerator.ButtonAddParamsClick(Sender: TObject);
begin
  FormInputParam.Show;
end;

procedure TEZCodeGenerator.ButtonAdvanceOnLoginClick(Sender: TObject);
begin
  FormAdvancesOnLogin.Show;
end;

procedure TEZCodeGenerator.ButtonChooseAllParamOnResultClick(Sender: TObject);
var
  i, line : Int8;
begin
  try
  For i := ListBoxAvailableResultOutput.Items.Count - 1 downto 0 do
  begin

    OnResultIni := TIniFile.Create(OpenningModuleFolderPath + '\OnResult.INI');
    ListBoxSelectedResutlOutput.Items.Add(ListBoxAvailableResultOutput.Items[i]);
    OnResultIni.WriteString('SelectedResultOutput', ListBoxAvailableResultOutput.items[i], 'True');

     //add to bcEditor
    if line <= 0 then
    line := GetLineOfText(BCEditorCodePreview, 'hrdSetResults(False);');
    BCEditorCodePreview.InsertLine(line, #9#9 + 'hrdResult.items['
                       + ListBoxAvailableResultOutput.items[i]
                       + '] := ''<-- cut result code here-->'';');
    BCEditorCodePreview.GotoLineAndCenter(line-1);



    // Remove all left side to right side
    ListBoxAvailableResultOutput.Items.Delete(i);
  end;
  ButtonChooseParamOnResult.Enabled := False;
  ButtonChooseAllParamOnResult.Enabled := False;

  //save change confirm
  BCEditorCodePreview.OnChange(Self);

  except on E: Exception do
  end;
end;

procedure TEZCodeGenerator.ButtonCacelSaveOnEnterClick(Sender: TObject);
begin
  if Assigned(ListViewOnEnter.Selected) then
  begin
    //check if create new or edit
    if (ListViewOnEnter.Selected.SubItems[0]<>'') and
       (ListViewOnEnter.Selected.SubItems[1]<>'') and
       (ListViewOnEnter.Selected.SubItems[2]<>'') and
       (StrToInt(ListViewOnEnter.Selected.SubItems[3]) <> 0) then
    begin  //editing
      EditPathOnEnter.Text := ListViewOnEnter.Selected.SubItems[0];
      EditQueryOnEnter.Text := ListViewOnEnter.Selected.SubItems[1];
      EditCommentOnEnter.Text := ListViewOnEnter.Selected.SubItems[2];
      RzSpinEditStatusOnEnter.Value := StrToFloat(ListViewOnEnter.Selected.SubItems[3]);
      //Disable components
      EditPathOnEnter.Enabled := False;
      EditQueryOnEnter.Enabled := False;
      EditCommentOnEnter.Enabled := False;
      RzSpinEditStatusOnEnter.Enabled := False;
    end
    else  //new
    begin
      //Disable components
      EditPathOnEnter.Enabled := False;
      EditQueryOnEnter.Enabled := False;
      EditCommentOnEnter.Enabled := False;
      RzSpinEditStatusOnEnter.Enabled := False;
      ComboBoxChooseErrorTypeOnEnter.Enabled := False;
      EditIfContainOnEnter.Enabled := False;

      //delete and select first element
      ListViewOnEnter.Items.Delete(ListViewOnEnter.Items.Count-1);
      ListViewOnEnter.Selected := ListViewOnEnter.Items[0];
    end;
  end;
  ButtonCacelSaveOnEnter.Enabled := False;
  ButtonSaveOnEnter.Enabled := False;
  ButtonEditOnEnter.Enabled := True;
  ButtonAddOnEnter.Enabled  := True;
  ButtonDeleteOnEnter.Enabled := True;
end;

procedure TEZCodeGenerator.ButtonCacelSaveOnLoginClick(Sender: TObject);
begin
  if Assigned(ListViewOnLogin.Selected) then
  begin
    //check if create new or edit
    if (ListViewOnLogin.Selected.SubItems[0]<>'') and
       (ListViewOnLogin.Selected.SubItems[1]<>'') and
       (ListViewOnLogin.Selected.SubItems[2]<>'') and
       (StrToInt(ListViewOnLogin.Selected.SubItems[3]) <> 0) then
    begin  //editing
      EditPathOnLogin.Text := ListViewOnLogin.Selected.SubItems[0];
      EditQueryOnLogin.Text := ListViewOnLogin.Selected.SubItems[1];
      EditCommentOnLogin.Text := ListViewOnLogin.Selected.SubItems[2];
      RzSpinEditStatusOnLogin.Value := StrToFloat(ListViewOnLogin.Selected.SubItems[3]);
      //Disable components
      EditPathOnLogin.Enabled := False;
      EditQueryOnLogin.Enabled := False;
      EditCommentOnLogin.Enabled := False;
      RzSpinEditStatusOnLogin.Enabled := False;
    end
    else  //new
    begin
      //Disable components
      EditPathOnLogin.Enabled := False;
      EditQueryOnLogin.Enabled := False;
      EditCommentOnLogin.Enabled := False;
      RzSpinEditStatusOnLogin.Enabled := False;
      ComboBoxChooseErrorTypeOnLogin.Enabled := False;
      EditIfContainOnLogin.Enabled := False;

      //delete and select first element
      ListViewOnLogin.Items.Delete(ListViewOnLogin.Items.Count-1);
      ListViewOnLogin.Selected := ListViewOnLogin.Items[0];
    end;
  end;
  ButtonCacelSaveOnLogin.Enabled := False;
  ButtonSaveOnLogin.Enabled := False;
  ButtonEditOnLogin.Enabled := True;
  ButtonAddOnLogin.Enabled  := True;
  ButtonDeleteOnLogin.Enabled := True;
end;

procedure TEZCodeGenerator.ButtonCancelSaveErrorCheckOnEnterClick(
  Sender: TObject);
begin
  if Assigned(ListViewErrorCheckOnEnter.Selected) then
  begin
    ComboBoxChooseErrorTypeOnEnter.ItemIndex := checkErrorType(ListViewErrorCheckOnEnter.Selected.SubItems[0]);
    EditIfContainOnEnter.Text := ListViewErrorCheckOnEnter.Selected.SubItems[1];
    //Disable components
    ComboBoxChooseErrorTypeOnEnter.Enabled := False;
    EditIfContainOnEnter.Enabled := False;
    if ListViewErrorCheckOnEnter.Selected.SubItems[0] = '' then
      ListViewErrorCheckOnEnter.DeleteSelected;
  end;
  ButtonCancelSaveErrorCheckOnEnter.Enabled := False;
  ButtonSaveErrorCheckOnEnter.Enabled := False;
  ButtonEditErrorCheckOnEnter.Enabled := True;
  ButtonDeleteErrorCheckOnEnter.Enabled := True;
  ButtonAddErrorCheckOnEnter.Enabled := True;
end;

procedure TEZCodeGenerator.ButtonCancelSaveErrorCheckOnExecuteClick(
  Sender: TObject);
begin
  if Assigned(ListViewErrorCheckOnExecute.Selected) then
  begin
    ComboBoxChooseErrorTypeOnExecute.ItemIndex := checkErrorType(ListViewErrorCheckOnExecute.Selected.SubItems[0]);
    EditIfContainOnExecute.Text := ListViewErrorCheckOnExecute.Selected.SubItems[1];
    //Disable components
    ComboBoxChooseErrorTypeOnExecute.Enabled := False;
    EditIfContainOnExecute.Enabled := False;
    if ListViewErrorCheckOnExecute.Selected.SubItems[0] = '' then
      ListViewErrorCheckOnExecute.DeleteSelected;
  end;
  ButtonCancelSaveErrorCheckOnExecute.Enabled := False;
  ButtonSaveErrorCheckOnExecute.Enabled := False;
  ButtonEditErrorCheckOnExecute.Enabled := True;
  ButtonDeleteErrorCheckOnExecute.Enabled := True;
  ButtonAddErrorCheckOnExecute.Enabled := True;
end;

procedure TEZCodeGenerator.ButtonCancelSaveErrorCheckOnLoginClick(
  Sender: TObject);
begin
  if Assigned(ListViewErrorCheckOnLogin.Selected) then
  begin
    ComboBoxChooseErrorTypeOnLogin.ItemIndex := checkErrorType(ListViewErrorCheckOnLogin.Selected.SubItems[0]);
    EditIfContainOnLogin.Text := ListViewErrorCheckOnLogin.Selected.SubItems[1];
    //Disable components
    ComboBoxChooseErrorTypeOnLogin.Enabled := False;
    EditIfContainOnLogin.Enabled := False;
    if ListViewErrorCheckOnLogin.Selected.SubItems[0] = '' then
      ListViewErrorCheckOnLogin.DeleteSelected;
  end;
  ButtonCancelSaveErrorCheckOnLogin.Enabled := False;
  ButtonSaveErrorCheckOnLogin.Enabled := False;
  ButtonEditErrorCheckOnLogin.Enabled := True;
  ButtonDeleteErrorCheckOnLogin.Enabled := True;
  ButtonAddErrorCheckOnLogin.Enabled := True;
end;

procedure TEZCodeGenerator.ButtonCancelSaveOnExecuteClick(Sender: TObject);
begin
  if Assigned(ListViewOnExecute.Selected) then
  begin
    //check if create new or edit
    if (ListViewOnExecute.Selected.SubItems[0]<>'') and
       (ListViewOnExecute.Selected.SubItems[1]<>'') and
       (ListViewOnExecute.Selected.SubItems[2]<>'') and
       (StrToInt(ListViewOnExecute.Selected.SubItems[3]) <> 0) then
    begin  //editing
      EditPathOnExecute.Text := ListViewOnExecute.Selected.SubItems[0];
      EditQueryOnExecute.Text := ListViewOnExecute.Selected.SubItems[1];
      EditCommentOnExecute.Text := ListViewOnExecute.Selected.SubItems[2];
      RzSpinEditStatusOnExecute.Value := StrToFloat(ListViewOnExecute.Selected.SubItems[3]);
      //Disable components
      EditPathOnExecute.Enabled := False;
      EditQueryOnExecute.Enabled := False;
      EditCommentOnExecute.Enabled := False;
      RzSpinEditStatusOnExecute.Enabled := False;
    end
    else  //new
    begin
      //Disable components
      EditPathOnExecute.Enabled := False;
      EditQueryOnExecute.Enabled := False;
      EditCommentOnExecute.Enabled := False;
      RzSpinEditStatusOnExecute.Enabled := False;
      ComboBoxChooseErrorTypeOnExecute.Enabled := False;
      EditIfContainOnExecute.Enabled := False;

      //delete and select first element
      ListViewOnExecute.Items.Delete(ListViewOnExecute.Items.Count-1);
      ListViewOnExecute.Selected := ListViewOnExecute.Items[0];
    end;
  end;
  ButtonCancelSaveOnExecute.Enabled := False;
  ButtonSaveOnExecute.Enabled := False;
  ButtonEditOnExecute.Enabled := True;
  ButtonAddOnExecute.Enabled  := True;
  ButtonDeleteOnExecute.Enabled := True;
end;

procedure TEZCodeGenerator.ButtonChooseAllParamsOnParamClick(Sender: TObject);
var
  i : integer;
begin
  OnParamIni := TIniFile.Create(OpenningModuleFolderPath+'\OnParam.INI');
  FileSetAttr(OnParamIni.FileName, faHidden);

  For i := ListBoxAvailableParam.Items.Count - 1 downto 0 do
  begin
    // add all param to IniFile include check error for each param
    ListBoxSelectedParam.Items.Add(ListBoxAvailableParam.Items[i]);

    // write to ini
    OnParamIni.WriteString(chooseParam,'chooseText[5]', 'None');

    // Remove all param from ListBoxAvailableParam to  CheckListBoxSelectChosenParam
    ListBoxAvailableParam.Items.Delete(i);
    ButtonChooseParam.Enabled := False;
    ButtonChooseAllParamsOnParam.Enabled := False;
  end;
end;

procedure TEZCodeGenerator.ButtonBackOnEnterClick(Sender: TObject);
begin
  //go to pre tab
  PageControlSteps.ActivePage := TabSheetOnLogin;
end;

procedure TEZCodeGenerator.ButtonBackOnExecuteClick(Sender: TObject);
begin
  //go to pre tab
  PageControlSteps.ActivePage := TabSheetOnEnter;
end;

procedure TEZCodeGenerator.ButtonBackOnFinalClick(Sender: TObject);
begin
  //go to pre tab
  PageControlSteps.ActivePage := TabSheetOnResult;
end;

procedure TEZCodeGenerator.ButtonBackOnLoginClick(Sender: TObject);
begin
  //go to pre tab
  PageControlSteps.ActivePage := TabSheetOnParam;
end;

procedure TEZCodeGenerator.ButtonBackOnParamClick(Sender: TObject);
begin
  //go to pre tab
  PageControlSteps.ActivePage := TabSheetOnInit;
end;

procedure TEZCodeGenerator.ButtonBackOnResultClick(Sender: TObject);
begin
  //go to pre tab
  PageControlSteps.ActivePage := TabSheetOnExecute;
end;

procedure TEZCodeGenerator.ButtonChooseParamClick(Sender: TObject);
var
  i : integer;
begin
  // add input param to choose list
  chooseParam := ListBoxAvailableParam.Items[ListBoxAvailableParam.ItemIndex];
  ListBoxSelectedParam.Items.Add(chooseParam);

  //write to ini
  OnParamIni := TIniFile.Create(OpenningModuleFolderPath+'\OnParam.INI');
  FileSetAttr(OnParamIni.FileName, faHidden);
  OnParamIni.WriteString(chooseParam,'chooseText[5]', 'None');


  //remove from available param
  For i := ListBoxAvailableParam.Items.Count - 1 downto 0 do
    if ListBoxAvailableParam.Selected [i] then
    ListBoxAvailableParam.Items.Delete (i);
    ButtonChooseParam.Enabled := false;
    ButtonChooseAllParamsOnParam.Enabled := false;
end;

procedure TEZCodeGenerator.ButtonChooseParamOnResultClick(Sender: TObject);
var
  i, line : Int8;
begin
  try
  //save to ini
  OnResultIni := TIniFile.Create(OpenningModuleFolderPath + '\OnResult.INI');
  OnResultIni.WriteString('SelectedResultOutput', ListBoxAvailableResultOutput.items[ListBoxAvailableResultOutput.ItemIndex], 'true');

  //add to right side
  ListBoxSelectedResutlOutput.Items.Add(ListBoxAvailableResultOutput.items[ListBoxAvailableResultOutput.ItemIndex]);

  //add to bcEditor
  line := 0;
  if line <= 0 then
  line := GetLineOfText(BCEditorCodePreview, 'hrdSetResults(False);');
  BCEditorCodePreview.InsertLine(line, #9#9 + 'hrdResult.items['
                     + ListBoxAvailableResultOutput.items[ListBoxAvailableResultOutput.ItemIndex]
                     + '] := ''<-- cut result code here-->'';');
  BCEditorCodePreview.GotoLineAndCenter(line-1);

  //remove from left side
  For i := ListBoxAvailableResultOutput.Items.Count - 1 downto 0 do
  if (ListBoxAvailableResultOutput.Selected [i]) then
  begin
    OnResultIni.DeleteKey('AvailableResultOutput', ListBoxAvailableResultOutput.items[i]);
    ListBoxAvailableResultOutput.Items.Delete (i);
  end;
  ButtonChooseParamOnResult.Enabled := false;
  ButtonChooseAllParamOnResult.Enabled := false;

  //save change confirm
  BCEditorCodePreview.OnChange(Self);
  except on E: Exception do
  end;
end;

procedure TEZCodeGenerator.ButtonDeclineAllParamsOnParamClick(Sender: TObject);
var
  i : integer;
begin
  ClearValueOfListbox;
  // remove all choosen param to ListBoxAvailableParam
  For i := ListBoxSelectedParam.Items.Count - 1 downto 0 do
  begin
    ListBoxAvailableParam.Items.Add(ListBoxSelectedParam.Items[i]);
    ListBoxSelectedParam.Items.Delete(i);
    //CheckListBoxSelectedParam.Items.delete(i);
    OnParamIni.EraseSection(ListBoxSelectedParam.items[ListBoxSelectedParam.ItemIndex]);

    ButtonDeclineParamOnParam.Enabled := False;
    ButtonDeclineAllParamsOnParam.Enabled := False;
  end;
end;

procedure TEZCodeGenerator.ButtonDeclineAllParamsOnResultClick(Sender: TObject);
var
  i, Line : Int8;
begin
  try
  OnResultIni := TIniFile.Create(OpenningModuleFolderPath + '\OnResult.INI');
  For i := ListBoxSelectedResutlOutput.Items.Count - 1 downto 0 do
  begin
    //remove form BCEditor
    Line := GetLineOfText(BCEditorCodePreview, ListBoxSelectedResutlOutput.items[i]);
    if Line > 0 then
    BCEditorCodePreview.DeleteLines(Line+1, 1);

    //remove from ini
    OnResultIni.DeleteKey('SelectedResultOutput', ListBoxSelectedResutlOutput.Items[i]);
    ListBoxAvailableResultOutput.Items.Add(ListBoxSelectedResutlOutput.Items[i]);
    ListBoxSelectedResutlOutput.Items.Delete(i);
  end;
  ButtonDeclineParamsOnResult.Enabled := False;
  ButtonDeclineAllParamsOnResult.Enabled := False;
  //save change confirm
  BCEditorCodePreview.OnChange(Self);

  except on E: Exception do
  end;
end;

procedure TEZCodeGenerator.ButtonDeclineParamOnParamClick(Sender: TObject);
var
  i : integer;
begin
  // remove choosen param to ListBoxAvailableParam
  ClearValueOfListbox;

  ListBoxAvailableParam.Items.Add(ListBoxSelectedParam.items[ListBoxSelectedParam.ItemIndex]);

  For i := ListBoxSelectedParam.Items.Count - 1 downto 0 do
    if ListBoxSelectedParam.Selected [i] then
    begin
      OnParamIni.EraseSection(ListBoxSelectedParam.items[ListBoxSelectedParam.ItemIndex]);
      ListBoxSelectedParam.Items.Delete (i);
    end;
    ButtonDeclineParamOnParam.Enabled := false;
    ButtonDeclineAllParamsOnParam.Enabled := false;
end;

procedure TEZCodeGenerator.ButtonDeclineParamsOnResultClick(Sender: TObject);
var
  i, Line : integer;
begin
  try
  OnResultIni := TIniFile.Create(OpenningModuleFolderPath + '\OnResult.INI');
  //move to left side
  ListBoxAvailableResultOutput.Items.Add(ListBoxSelectedResutlOutput.items[ListBoxSelectedResutlOutput.ItemIndex]);

  //remove form BCEditor
  Line := GetLineOfText(BCEditorCodePreview, ListBoxSelectedResutlOutput.items[ListBoxSelectedResutlOutput.ItemIndex]);
  if Line <> 5668988 then
  BCEditorCodePreview.DeleteLines(Line+1, 1);

  //remove from right side
  For i := ListBoxSelectedResutlOutput.Items.Count - 1 downto 0 do
    if ListBoxSelectedResutlOutput.Selected [i] then
    begin
      OnResultIni.DeleteKey('SelectedResultOutput', ListBoxSelectedResutlOutput.items[i]);
      ListBoxSelectedResutlOutput.Items.Delete(i);
    end;
    ButtonDeclineParamsOnResult.Enabled := false;
    ButtonDeclineAllParamsOnResult.Enabled := false;

  //save change confirm
  BCEditorCodePreview.OnChange(Self);

  except on E: Exception do
  end;
end;

procedure TEZCodeGenerator.ButtonDeleteErrorCheckOnEnterClick(Sender: TObject);
var
  cfmDelete : Integer;
  onEnterLine, currentEnterFunction, startDel, endDel : Integer;
begin
  if Assigned(ListViewErrorCheckOnEnter.Selected) then
  begin
    cfmDelete := MessageDlg('Are you sure to remove selected item?', mtWarning, [mbYes, mbCancel], 0, mbCancel);
    if cfmDelete = 6 then
    begin
      onEnterLine := GetLineOfText(BCEditorCodePreview, 'function onEnter: HRESULT;', 16);
      currentEnterFunction := GetLineOfText(BCEditorCodePreview, EditCommentOnEnter.Text, onEnterLine);
      startDel := GetLineOfText(BCEditorCodePreview, returnErrorType(ComboBoxChooseErrorTypeOnEnter.Text), currentEnterFunction)+1;
      endDel   := GetLineOfText(BCEditorCodePreview, ']);', startDel)+1;
      if ListViewErrorCheckOnEnter.Items.Count<2 then
        BCEditorCodePreview.DeleteLines(startDel-3, endDel-startDel+6)
      else
        BCEditorCodePreview.DeleteLines(startDel, endDel-startDel+2);
      ListViewOnEnter.Selected.SubItems.Delete(StrToInt(ListViewErrorCheckOnEnter.Selected.Caption)+3);
      if ListViewOnEnter.Selected.index<1 then
        ListViewOnEnter.Selected := ListViewOnEnter.Selected
      else
      begin

        ListViewOnEnter.Selected := ListViewOnEnter.Items[ListViewOnEnter.Selected.Index-1];
        ListViewOnEnter.Selected := ListViewOnEnter.Items[ListViewOnEnter.Selected.Index+1];
      // CheckListBoxSelectedParam.Items.delete(i);
        DeleteCheckError(i);
        ListBoxSelectedParam.Items.Delete (i);

      end;
    end;
  end;
end;

procedure TEZCodeGenerator.ButtonDeleteErrorCheckOnExecuteClick(
  Sender: TObject);
var
  cfmDelete : Integer;
  onExecuteLine, currentExecuteFunction, startDel, endDel : Integer;
begin
  if Assigned(ListViewErrorCheckOnExecute.Selected) then
  begin
    cfmDelete := MessageDlg('Are you sure to remove selected item?', mtWarning, [mbYes, mbCancel], 0, mbCancel);
    if cfmDelete = 6 then
    begin
      onExecuteLine := GetLineOfText(BCEditorCodePreview, 'function OnExecute: HRESULT;', 16);
      currentExecuteFunction := GetLineOfText(BCEditorCodePreview, EditCommentOnExecute.Text, onExecuteLine);
      startDel := GetLineOfText(BCEditorCodePreview, returnErrorType(ComboBoxChooseErrorTypeOnExecute.Text), currentExecuteFunction)+1;
      endDel   := GetLineOfText(BCEditorCodePreview, ']);', startDel)+1;
      if ListViewErrorCheckOnExecute.Items.Count<2 then
        BCEditorCodePreview.DeleteLines(startDel-3, endDel-startDel+6)
      else
        BCEditorCodePreview.DeleteLines(startDel, endDel-startDel+2);
      ListViewOnExecute.Selected.SubItems.Delete(StrToInt(ListViewErrorCheckOnExecute.Selected.Caption)+3);
      if ListViewOnExecute.Selected.index<1 then
        ListViewOnExecute.Selected := ListViewOnExecute.Selected
      else
      begin
        ListViewOnExecute.Selected := ListViewOnExecute.Items[ListViewOnExecute.Selected.Index-1];
        ListViewOnExecute.Selected := ListViewOnExecute.Items[ListViewOnExecute.Selected.Index+1];
      end;
    end;
  end;
end;

procedure TEZCodeGenerator.ButtonDeleteErrorCheckOnLoginClick(Sender: TObject);
var
  cfmDelete : Integer;
  onLoginLine, currentLoginFunction, startDel, endDel : Integer;
begin
  if Assigned(ListViewErrorCheckOnLogin.Selected) then
  begin
    cfmDelete := MessageDlg('Are you sure to remove selected item?', mtWarning, [mbYes, mbCancel], 0, mbCancel);
    if cfmDelete = 6 then
    begin
      onLoginLine := GetLineOfText(BCEditorCodePreview, 'function OnLogin: HRESULT;', 16);
      currentLoginFunction := GetLineOfText(BCEditorCodePreview, EditCommentOnLogin.Text, onLoginLine);
      startDel := GetLineOfText(BCEditorCodePreview, returnErrorType(ComboBoxChooseErrorTypeOnLogin.Text), currentLoginFunction)+1;
      endDel   := GetLineOfText(BCEditorCodePreview, ']);', startDel)+1;
      if ListViewErrorCheckOnLogin.Items.Count<2 then
        BCEditorCodePreview.DeleteLines(startDel-3, endDel-startDel+6)
      else
        BCEditorCodePreview.DeleteLines(startDel, endDel-startDel+2);
      ListViewOnLogin.Selected.SubItems.Delete(StrToInt(ListViewErrorCheckOnLogin.Selected.Caption)+3);
      if ListViewOnLogin.Selected.index<1 then
        ListViewOnLogin.Selected := ListViewOnLogin.Selected
      else
      begin
        ListViewOnLogin.Selected := ListViewOnLogin.Items[ListViewOnLogin.Selected.Index-1];
        ListViewOnLogin.Selected := ListViewOnLogin.Items[ListViewOnLogin.Selected.Index+1];
      end;
    end;
  end;
end;

procedure TEZCodeGenerator.ButtonDeleteOnEnterClick(Sender: TObject);
var
  onEnterLine, startDel, endDel : Integer;
  selectedIndex : Integer;
  cfmDelete : Integer;
begin
  cfmDelete := MessageDlg('Are you sure to remove selected item?', mtWarning, [mbYes, mbCancel], 0, mbCancel);
  if Assigned(ListViewOnEnter.Selected) then
  begin
    if cfmDelete = 6 then
    begin
      onEnterLine := GetLineOfText(BCEditorCodePreview, 'function onEnter: HRESULT;', 16);
      startDel := GetLineOfText(BCEditorCodePreview, '//'+ListViewOnEnter.Selected.SubItems[2], onEnterLine)+1;

      if ListViewOnEnter.Selected.SubItems.Count > 4 then  //if the selected login have checkerror
      begin
        endDel := GetLineOfText(BCEditorCodePreview, 'if hrdOccurError then begin Result := FLastError; Exit; end;', startDel)+1;
        BCEditorCodePreview.DeleteLines(startDel, endDel-startDel+2);
      end
      else //if the selected login have no checkerror
      begin
        endDel := GetLineOfText(BCEditorCodePreview, 'Result := S_HRD_OK;', startDel);
        BCEditorCodePreview.DeleteLines(startDel, endDel-startDel+1);
      end;
      selectedIndex := ListViewOnEnter.Selected.Index;
      ListViewOnEnter.DeleteSelected;
      ListViewOnEnter.Selected := ListViewOnEnter.Items[selectedIndex];
    end
  end;
end;

procedure TEZCodeGenerator.ButtonDeleteOnExecuteClick(Sender: TObject);
var
  onExecuteLine, startDel, endDel : Integer;
  selectedIndex : Integer;
  cfmDelete : Integer;
begin
  cfmDelete := MessageDlg('Are you sure to remove selected item?', mtWarning, [mbYes, mbCancel], 0, mbCancel);
  if Assigned(ListViewOnExecute.Selected) then
  begin
    if cfmDelete = 6 then
    begin
      onExecuteLine := GetLineOfText(BCEditorCodePreview, 'function OnExecute: HRESULT;', 16);
      startDel := GetLineOfText(BCEditorCodePreview, '//'+ListViewOnExecute.Selected.SubItems[2], onExecuteLine)+1;

      if ListViewOnExecute.Selected.SubItems.Count > 4 then  //if the selected login have checkerror
      begin
        endDel := GetLineOfText(BCEditorCodePreview, 'if hrdOccurError then begin Result := FLastError; Exit; end;', startDel)+1;
        BCEditorCodePreview.DeleteLines(startDel, endDel-startDel+2);
      end
      else //if the selected login have no checkerror
      begin
        endDel := GetLineOfText(BCEditorCodePreview, 'Result := S_HRD_OK;', startDel);
        BCEditorCodePreview.DeleteLines(startDel, endDel-startDel+1);
      end;

      selectedIndex := ListViewOnExecute.Selected.Index;
      ListViewOnExecute.DeleteSelected;
      ListViewOnExecute.Selected := ListViewOnExecute.Items[selectedIndex];
    end
  end;
end;

procedure TEZCodeGenerator.ButtonDeleteOnLoginClick(Sender: TObject);
var
  onLoginLine, startDel, endDel : Integer;
  selectedIndex : Integer;
  cfmDelete : Integer;
begin
  cfmDelete := MessageDlg('Are you sure to remove selected item?', mtWarning, [mbYes, mbCancel], 0, mbCancel);
  if Assigned(ListViewOnLogin.Selected) then
  begin
    if cfmDelete = 6 then
    begin
      onLoginLine := GetLineOfText(BCEditorCodePreview, 'function OnLogin: HRESULT;', 16);
      startDel := GetLineOfText(BCEditorCodePreview, '//'+ListViewOnLogin.Selected.SubItems[2], onLoginLine)+1;

      if ListViewOnLogin.Selected.SubItems.Count > 4 then  //if the selected login have checkerror
      begin
        endDel := GetLineOfText(BCEditorCodePreview, 'if hrdOccurError then begin Result := FLastError; Exit; end;', startDel)+1;
        BCEditorCodePreview.DeleteLines(startDel, endDel-startDel+2);
      end
      else //if the selected login have no checkerror
      begin
        endDel := GetLineOfText(BCEditorCodePreview, 'Result := S_HRD_OK;', startDel);
        BCEditorCodePreview.DeleteLines(startDel, endDel-startDel+1);
      end;

      selectedIndex := ListViewOnLogin.Selected.Index;
      ListViewOnLogin.DeleteSelected;
      ListViewOnLogin.Selected := ListViewOnLogin.Items[selectedIndex];
    end
  end;
end;

procedure TEZCodeGenerator.ButtonEditErrorCheckOnEnterClick(Sender: TObject);
begin
  ButtonSaveErrorCheckOnEnter.Enabled := True;
  ButtonCancelSaveErrorCheckOnEnter.Enabled := True;
  ButtonAddErrorCheckOnEnter.Enabled := False;
  ButtonDeleteErrorCheckOnEnter.Enabled := False;
  ButtonEditErrorCheckOnEnter.Enabled := False;
  ComboBoxChooseErrorTypeOnEnter.Enabled := True;
  EditIfContainOnEnter.Enabled           := True;
end;

procedure TEZCodeGenerator.ButtonEditErrorCheckOnExecuteClick(Sender: TObject);
begin
  ButtonSaveErrorCheckOnExecute.Enabled := True;
  ButtonCancelSaveErrorCheckOnExecute.Enabled := True;
  ButtonAddErrorCheckOnExecute.Enabled := False;
  ButtonDeleteErrorCheckOnExecute.Enabled := False;
  ButtonEditErrorCheckOnExecute.Enabled := False;
  ComboBoxChooseErrorTypeOnExecute.Enabled := True;
  EditIfContainOnExecute.Enabled           := True;
end;

procedure TEZCodeGenerator.ButtonEditErrorCheckOnLoginClick(Sender: TObject);
begin
  ButtonSaveErrorCheckOnLogin.Enabled       := True;
  ButtonCancelSaveErrorCheckOnLogin.Enabled := True;
  ButtonAddErrorCheckOnLogin.Enabled        := False;
  ButtonDeleteErrorCheckOnLogin.Enabled     := False;
  ButtonEditErrorCheckOnLogin.Enabled       := False;
  ComboBoxChooseErrorTypeOnLogin.Enabled    := True;
  EditIfContainOnLogin.Enabled              := True;
end;

procedure TEZCodeGenerator.ButtonEditOnEnterClick(Sender: TObject);
begin
  ButtonSaveOnEnter.Enabled       := True;
  ButtonCacelSaveOnEnter.Enabled  := True;
  ButtonAddOnEnter.Enabled        := False;
  ButtonDeleteOnEnter.Enabled     := False;
  ButtonEditOnEnter.Enabled       := False;
  EditPathOnEnter.Enabled         := True;
  EditQueryOnEnter.Enabled        := True;
  EditCommentOnEnter.Enabled      := True;
  RzSpinEditStatusOnEnter.Enabled := True;
end;

procedure TEZCodeGenerator.ButtonEditOnExecuteClick(Sender: TObject);
begin
  ButtonSaveOnExecute.Enabled := True;
  ButtonCancelSaveOnExecute.Enabled := True;
  ButtonAddOnExecute.Enabled := False;
  ButtonDeleteOnExecute.Enabled := False;
  ButtonEditOnExecute.Enabled := False;
  EditPathOnExecute.Enabled         := True;
  EditQueryOnExecute.Enabled        := True;
  EditCommentOnExecute.Enabled      := True;
  RzSpinEditStatusOnExecute.Enabled := True;
end;

procedure TEZCodeGenerator.ButtonEditOnLoginClick(Sender: TObject);
begin
  ButtonSaveOnLogin.Enabled := True;
  ButtonCacelSaveOnLogin.Enabled := True;
  ButtonAddOnLogin.Enabled := False;
  ButtonDeleteOnLogin.Enabled := False;
  ButtonEditOnLogin.Enabled := False;
  EditPathOnLogin.Enabled         := True;
  EditQueryOnLogin.Enabled        := True;
  EditCommentOnLogin.Enabled      := True;
  RzSpinEditStatusOnLogin.Enabled := True;
end;

procedure TEZCodeGenerator.ButtonDoneOnFinalClick(Sender: TObject);
var
  onFinalBlock : Integer;
  currentLine  : Integer;
  Path, Query  : string;
begin
  Path  := EditPathOnFinal.Text;
  Query := EditQueryOnFinal.Text;
  if Path = '' then
  begin
    MessageDlg('Path must be provided!', mtError, [mbOK], 1);
    Exit;
  end;
  onFinalBlock := GetLineOfText(BCEditorCodePreview, 'function OnFinal: HRESULT;', 16);
  currentLine  := GetLineOfText(BCEditorCodePreview, 'Path :=', onFinalBlock);
  BCEditorCodePreview.ReplaceLine(currentLine+1,'  Path := '''+ Path+''';');
  BCEditorCodePreview.ReplaceLine(currentLine+2,'  Query := '''+ Query+''';');
  if Query = '' then
    BCEditorCodePreview.ReplaceLine(currentLine+3,'  Agent.connect(Host + Path);')
  else
    BCEditorCodePreview.ReplaceLine(currentLine+3,'  Agent.connect(Host + Path, Query);');
  BCEditorCodePreview.ReplaceLine(currentLine+4,'  ResultStr := Agent.ResultStr;');
  BCEditorCodePreview.ReplaceLine(currentLine+5,'  SaveToLog(ResultStr, ''Logout'');');
  RzToolbarButtonRunClick(Self);
end;

procedure TEZCodeGenerator.ButtonNextOnEnterClick(Sender: TObject);
begin
  //go to next tab
  PageControlSteps.ActivePage := TabSheetOnExecute;
end;

procedure TEZCodeGenerator.ButtonNextOnExecuteClick(Sender: TObject);
var
  i, Line : integer;
begin
  //go to next tab
  PageControlSteps.ActivePage := TabSheetOnResult;

  OnResultIni := TIniFile.Create(OpenningModuleFolderPath + '\OnResult.INI');

  //move to left side
  ListBoxAvailableResultOutput.Items.Add(ListBoxSelectedResutlOutput.items[ListBoxSelectedResutlOutput.ItemIndex]);

  //remove form BCEditor
  Line := GetLineOfText(BCEditorCodePreview, ListBoxSelectedResutlOutput.items[ListBoxSelectedResutlOutput.ItemIndex]);
  if Line > 0 then
  BCEditorCodePreview.DeleteLines(Line+1, 1);


  //remove from right side
  For i := ListBoxSelectedResutlOutput.Items.Count - 1 downto 0 do
    if ListBoxSelectedResutlOutput.Selected [i] then
    begin
      OnResultIni.DeleteKey('SelecteResultOutput', ListBoxSelectedResutlOutput.items[ListBoxSelectedResutlOutput.ItemIndex]);
      ListBoxSelectedResutlOutput.Items.Delete(i);
    end;
    ButtonDeclineParamsOnResult.Enabled := false;
    ButtonDeclineAllParamsOnResult.Enabled := false;
end;

procedure TEZCodeGenerator.ButtonNextOnInitClick(Sender: TObject);

begin
  //go to next tab
  PageControlSteps.ActivePage := TabSheetOnParam;

  //Save all services and host name to ini
  OnInitIni := TIniFile.Create(OpenningModuleFolderPath + '\OnInit.INI');
  FileSetAttr(OnInitIni.FileName, faHidden);

  saveOnInit;
end;

procedure TEZCodeGenerator.ButtonNextOnLoginClick(Sender: TObject);
begin
  //go to next tab
  PageControlSteps.TabIndex := 3;
end;

procedure TEZCodeGenerator.ButtonOpenProjectClick(Sender: TObject);
var
  currentLine, i : Integer;
  SelectedParamList : TStringList;

begin
  currentLine := GetLineOfText(BCEditorCodePreview, 'Host: string');
  EditHost.Text := BCEditorCodePreview.Lines.GetLineText(currentLine);


  ProjectSetting := TIniFile.Create( ChangeFileExt( Application.ExeName, '.INI' ));

  CheckBoxIndyAgent.Checked := StrToBool(ProjectSetting.ReadString('OnInit', 'CheckBoxIndyAgent', ''));
  CheckBoxBrowser.Checked := StrToBool(ProjectSetting.ReadString('OnInit', 'CheckBoxBrowser', ''));

  SelectedParamList := TStringList.Create;
 // SelectedParamList.Add(ProjectSetting.ReadString('OnParam', 'ListBoxSelectedParam', ''));
  // ShowMessage(SelectedParamList.Text);

  SelectedParamList.Delimiter := ',';
  SelectedParamList.DelimitedText := ProjectSetting.ReadString('OnParam', 'ListBoxSelectedParam', '');
  SelectedParamList.StrictDelimiter := True;
  for i := 0 to SelectedParamList.Count - 1 do
  ListBoxSelectedParam.Items.Add(SelectedParamList[i]);


end;

procedure TEZCodeGenerator.ButtonSaveErrorCheckOnEnterClick(Sender: TObject);
var
  ErrorType, ErrorText : string;
  onEnterLine, currentEnterFunction, currentLine, endFunctionLine : Integer;
  I : Integer;
begin
  if (ComboBoxChooseErrorTypeOnEnter.Enabled = True) and
     (EditIfContainOnEnter.Enabled = True) then
  begin
    ErrorText   := EditIfContainOnEnter.Text;
    ErrorType   := returnErrorType(ComboBoxChooseErrorTypeOnEnter.Text);

    //Check for duplicate errorType
    for I := 0 to ListViewErrorCheckOnEnter.Items.Count-1 do
    begin
      if ErrorType = ListViewErrorCheckOnEnter.Selected.SubItems[0] then break;
      if (ErrorType = ListViewErrorCheckOnEnter.Items[I].SubItems[0]) and (ErrorType <> 'E_HRD_UNKNOWN') then
      begin
        ShowMessage('This error type check already exist!');
        Exit;
      end;
    end;
    onEnterLine := GetLineOfText(BCEditorCodePreview, 'function onEnter: HRESULT;', 16);
    if Assigned(ListViewErrorCheckOnEnter.Selected) then
    begin
      currentEnterFunction := GetLineOfText(BCEditorCodePreview, EditCommentOnEnter.Text, onEnterLine);

      //check if create new or edit
      if (ListViewErrorCheckOnEnter.Selected.SubItems[0]<>'') and
         (ListViewErrorCheckOnEnter.Selected.SubItems[1] <> '') then
      begin  //editing
        currentLine := GetLineOfText(BCEditorCodePreview, returnErrorType(ListViewErrorCheckOnEnter.Selected.SubItems[0]), currentEnterFunction);
        BCEditorCodePreview.ReplaceLine(currentLine+1,'  hrdCheckError('+ ErrorType+', [');
        currentLine := GetLineOfText(BCEditorCodePreview, 'PosEx(''', currentLine);
        BCEditorCodePreview.ReplaceLine(currentLine+1,'    PosEx('''+ ErrorText+''', ResultStr) > 0');
        ListViewOnEnter.Selected.SubItems[StrToInt(ListViewErrorCheckOnEnter.Selected.Caption)+3] := returnErrorType(errorType)+ ',' + 'PosEx('''+ErrorText+''', ResultStr) > 0';
      end
      else //create new
      begin
        if ListViewErrorCheckOnEnter.Items.Count<=1 then
        begin
          if (ListViewOnEnter.Selected.Index = 0) or (ListViewOnEnter.Selected.Index = (ListViewOnEnter.Items.Count-1)) then
            endFunctionLine := GetLineOfText(BCEditorCodePreview, 'Result := S_HRD_OK;', currentEnterFunction)-1
          else
            endFunctionLine := GetLineOfText(BCEditorCodePreview, ListViewOnEnter.Items[(ListViewOnEnter.Selected.Index)+1].SubItems[2], currentEnterFunction);
          BCEditorCodePreview.Lines.InsertText(endFunctionLine-1, '  //Error Check');
        end
        else
          endFunctionLine := GetLineOfText(BCEditorCodePreview, 'if hrdOccurError then begin Result := FLastError; Exit; end;', currentEnterFunction);
        BCEditorCodePreview.Lines.InsertText(endFunctionLine, '  ');
        BCEditorCodePreview.Lines.InsertText(endFunctionLine+1, '  hrdCheckError('+ErrorType+', [');
        BCEditorCodePreview.Lines.InsertText(endFunctionLine+2, '    PosEx('''+ErrorText+''', ResultStr) > 0');
        BCEditorCodePreview.Lines.InsertText(endFunctionLine+3, '  ]);');
        if ListViewErrorCheckOnEnter.Items.Count <= 1 then
        begin
          BCEditorCodePreview.Lines.InsertText(endFunctionLine+4, '  if hrdOccurError then begin Result := FLastError; Exit; end;');
          BCEditorCodePreview.Lines.InsertText(endFunctionLine-1, '  ');
        end
        else
          BCEditorCodePreview.Lines.InsertText(endFunctionLine+4, '  ');
        ListViewOnEnter.Selected.SubItems.Add(errorType+ ',' + 'PosEx('''+ErrorText+''', ResultStr) > 0');
        ListViewOnEnter.Selected := ListViewOnEnter.Selected;
      end;

      //Disable components
      ComboBoxChooseErrorTypeOnEnter.Enabled := False;
      EditIfContainOnEnter.Enabled := False;
      if ListViewOnEnter.Selected.Index <1 then
      begin
        if ListViewOnEnter.Items.Count > 1 then
        begin
          ListViewOnEnter.Selected := ListViewOnEnter.Items[ListViewOnEnter.Selected.Index+1];
          ListViewOnEnter.Selected := ListViewOnEnter.Items[ListViewOnEnter.Selected.Index-1];
        end
        else
          ListViewOnEnter.Selected := nil;
          ListViewOnEnter.Selected := ListViewOnEnter.Items[0];
      end
      else
      begin
        ListViewOnEnter.Selected := ListViewOnEnter.Items[ListViewOnEnter.Selected.Index-1];
        ListViewOnEnter.Selected := ListViewOnEnter.Items[ListViewOnEnter.Selected.Index+1];
      end;
    end;
  end;
  ButtonSaveErrorCheckOnEnter.Enabled := False;
  ButtonCancelSaveErrorCheckOnEnter.Enabled := False;
  ButtonEditErrorCheckOnEnter.Enabled := True;
  ButtonDeleteErrorCheckOnEnter.Enabled := True;
  ButtonAddErrorCheckOnEnter.Enabled := True;
end;

procedure TEZCodeGenerator.ButtonSaveErrorCheckOnExecuteClick(Sender: TObject);
var
  ErrorType, ErrorText : string;
  onExecuteLine, currentExecuteFunction, currentLine, endFunctionLine : Integer;
  I : Integer;
begin
  if (ComboBoxChooseErrorTypeOnExecute.Enabled = True) and
     (EditIfContainOnExecute.Enabled = True) then
  begin
    ErrorText   := EditIfContainOnExecute.Text;
    ErrorType   := returnErrorType(ComboBoxChooseErrorTypeOnExecute.Text);

    //Check for duplicate errorType
    for I := 0 to ListViewErrorCheckOnExecute.Items.Count-1 do
    begin
      if ErrorType = ListViewErrorCheckOnExecute.Selected.SubItems[0] then break;
      if (ErrorType = ListViewErrorCheckOnExecute.Items[I].SubItems[0]) and (ErrorType <> 'E_HRD_UNKNOWN') then
      begin
        ShowMessage('This error type check already exist!');
        Exit;
      end;
    end;

    onExecuteLine := GetLineOfText(BCEditorCodePreview, 'function OnExecute: HRESULT;', 16);
    if Assigned(ListViewErrorCheckOnExecute.Selected) then
    begin
      currentExecuteFunction := GetLineOfText(BCEditorCodePreview, EditCommentOnExecute.Text, onExecuteLine);

      //check if create new or edit
      if (ListViewErrorCheckOnExecute.Selected.SubItems[0]<>'') and
         (ListViewErrorCheckOnExecute.Selected.SubItems[1] <> '') then
      begin  //editing
        currentLine := GetLineOfText(BCEditorCodePreview, returnErrorType(ListViewErrorCheckOnExecute.Selected.SubItems[0]), currentExecuteFunction);
        BCEditorCodePreview.ReplaceLine(currentLine+1,'  hrdCheckError('+ ErrorType+', [');
        currentLine := GetLineOfText(BCEditorCodePreview, 'PosEx(''', currentLine);
        BCEditorCodePreview.ReplaceLine(currentLine+1,'    PosEx('''+ ErrorText+''', ResultStr) > 0');
        ListViewOnExecute.Selected.SubItems[StrToInt(ListViewErrorCheckOnExecute.Selected.Caption)+3] := returnErrorType(errorType)+ ',' + 'PosEx('''+ErrorText+''', ResultStr) > 0';
      end
      else //create new
      begin
        if ListViewErrorCheckOnExecute.Items.Count<=1 then
        begin
          if (ListViewOnExecute.Selected.Index = 0) or (ListViewOnExecute.Selected.Index = (ListViewOnExecute.Items.Count-1)) then
            endFunctionLine := GetLineOfText(BCEditorCodePreview, 'Result := S_HRD_OK;', currentExecuteFunction)-1
          else
            endFunctionLine := GetLineOfText(BCEditorCodePreview, ListViewOnExecute.Items[(ListViewOnExecute.Selected.Index)+1].SubItems[2], currentExecuteFunction);
          BCEditorCodePreview.Lines.InsertText(endFunctionLine-1, '  //Error Check');
        end
        else
          endFunctionLine := GetLineOfText(BCEditorCodePreview, 'if hrdOccurError then begin Result := FLastError; Exit; end;', currentExecuteFunction);
        BCEditorCodePreview.Lines.InsertText(endFunctionLine, '  ');
        BCEditorCodePreview.Lines.InsertText(endFunctionLine+1, '  hrdCheckError('+ErrorType+', [');
        BCEditorCodePreview.Lines.InsertText(endFunctionLine+2, '    PosEx('''+ErrorText+''', ResultStr) > 0');
        BCEditorCodePreview.Lines.InsertText(endFunctionLine+3, '  ]);');
        if ListViewErrorCheckOnExecute.Items.Count <= 1 then
        begin
          BCEditorCodePreview.Lines.InsertText(endFunctionLine+4, '  if hrdOccurError then begin Result := FLastError; Exit; end;');
          BCEditorCodePreview.Lines.InsertText(endFunctionLine-1, '  ');
        end
        else
          BCEditorCodePreview.Lines.InsertText(endFunctionLine+4, '  ');
        ListViewOnExecute.Selected.SubItems.Add(errorType+ ',' + 'PosEx('''+ErrorText+''', ResultStr) > 0');
        ListViewOnExecute.Selected := ListViewOnExecute.Selected;
      end;

      //Disable components
      ComboBoxChooseErrorTypeOnExecute.Enabled := False;
      EditIfContainOnExecute.Enabled := False;
      if ListViewOnExecute.Selected.Index <1 then
      begin
        if ListViewOnExecute.Items.Count > 1 then
        begin
          ListViewOnExecute.Selected := ListViewOnExecute.Items[ListViewOnExecute.Selected.Index+1];
          ListViewOnExecute.Selected := ListViewOnExecute.Items[ListViewOnExecute.Selected.Index-1];
        end
        else
          ListViewOnExecute.Selected := nil;
          ListViewOnExecute.Selected := ListViewOnExecute.Items[0];
      end
      else
      begin
        ListViewOnExecute.Selected := ListViewOnExecute.Items[ListViewOnExecute.Selected.Index-1];
        ListViewOnExecute.Selected := ListViewOnExecute.Items[ListViewOnExecute.Selected.Index+1];
      end;
    end;
  end;
  ButtonSaveErrorCheckOnExecute.Enabled := False;
  ButtonCancelSaveErrorCheckOnExecute.Enabled := False;
  ButtonEditErrorCheckOnExecute.Enabled := True;
  ButtonDeleteErrorCheckOnExecute.Enabled := True;
  ButtonAddErrorCheckOnExecute.Enabled := True;
end;

procedure TEZCodeGenerator.ButtonSaveErrorCheckOnLoginClick(Sender: TObject);
var
  ErrorType, ErrorText : string;
  onLoginLine, currentLoginFunction, currentLine, endFunctionLine : Integer;
  I : Integer;
begin
  if (ComboBoxChooseErrorTypeOnLogin.Enabled = True) and
     (EditIfContainOnLogin.Enabled = True) then
  begin
    ErrorText   := EditIfContainOnLogin.Text;
    ErrorType   := returnErrorType(ComboBoxChooseErrorTypeOnLogin.Text);

    //Check for duplicate errorType
    for I := 0 to ListViewErrorCheckOnLogin.Items.Count-1 do
    begin
      if ErrorType = ListViewErrorCheckOnLogin.Selected.SubItems[0] then break;
      if (ErrorType = ListViewErrorCheckOnLogin.Items[I].SubItems[0]) and (ErrorType <> 'E_HRD_UNKNOWN') then
      begin  
        ShowMessage('This error type check already exist!');
        Exit;
      end;      
    end;

    onLoginLine := GetLineOfText(BCEditorCodePreview, 'function OnLogin: HRESULT;', 16);
    if Assigned(ListViewErrorCheckOnLogin.Selected) then
    begin
      currentLoginFunction := GetLineOfText(BCEditorCodePreview, EditCommentOnLogin.Text, onLoginLine);

      //check if create new or edit
      if (ListViewErrorCheckOnLogin.Selected.SubItems[0]<>'') and
         (ListViewErrorCheckOnLogin.Selected.SubItems[1] <> '') then
      begin  //editing
        //ErrorType
        currentLine := GetLineOfText(BCEditorCodePreview, returnErrorType(ListViewErrorCheckOnLogin.Selected.SubItems[0]), currentLoginFunction);
        BCEditorCodePreview.ReplaceLine(currentLine+1,'  hrdCheckError('+ ErrorType+', [');
//        ListViewErrorCheckOnLogin.Selected.SubItems[0] := ErrorType;
        //ErrorText
        currentLine := GetLineOfText(BCEditorCodePreview, 'PosEx(''', currentLine);
        BCEditorCodePreview.ReplaceLine(currentLine+1,'    PosEx('''+ ErrorText+''', ResultStr) > 0');
        ListViewOnLogin.Selected.SubItems[StrToInt(ListViewErrorCheckOnLogin.Selected.Caption)+3] := returnErrorType(errorType)+ ',' + 'PosEx('''+ErrorText+''', ResultStr) > 0';
      end
      else //create new
      begin
        if ListViewErrorCheckOnLogin.Items.Count<=1 then
        begin
          if (ListViewOnLogin.Selected.Index = 0) or (ListViewOnLogin.Selected.Index = (ListViewOnLogin.Items.Count-1)) then
            endFunctionLine := GetLineOfText(BCEditorCodePreview, 'Result := S_HRD_OK;', currentLoginFunction)-1
          else
            endFunctionLine := GetLineOfText(BCEditorCodePreview, ListViewOnLogin.Items[(ListViewOnLogin.Selected.Index)+1].SubItems[2], currentLoginFunction);
          BCEditorCodePreview.Lines.InsertText(endFunctionLine-1, '  //Error Check');
        end
        else
          endFunctionLine := GetLineOfText(BCEditorCodePreview, 'if hrdOccurError then begin Result := FLastError; Exit; end;', currentLoginFunction);
        BCEditorCodePreview.Lines.InsertText(endFunctionLine, '  ');
        BCEditorCodePreview.Lines.InsertText(endFunctionLine+1, '  hrdCheckError('+ErrorType+', [');
        BCEditorCodePreview.Lines.InsertText(endFunctionLine+2, '    PosEx('''+ErrorText+''', ResultStr) > 0');
        BCEditorCodePreview.Lines.InsertText(endFunctionLine+3, '  ]);');
        if ListViewErrorCheckOnLogin.Items.Count <= 1 then
        begin
          BCEditorCodePreview.Lines.InsertText(endFunctionLine+4, '  if hrdOccurError then begin Result := FLastError; Exit; end;');
          BCEditorCodePreview.Lines.InsertText(endFunctionLine-1, '  ');
        end
        else
          BCEditorCodePreview.Lines.InsertText(endFunctionLine+4, '  ');
        ListViewOnLogin.Selected.SubItems.Add(errorType+ ',' + 'PosEx('''+ErrorText+''', ResultStr) > 0');
        ListViewOnLogin.Selected := ListViewOnLogin.Selected;
      end;

      //Disable components
      ComboBoxChooseErrorTypeOnLogin.Enabled := False;
      EditIfContainOnLogin.Enabled := False;
      if ListViewOnLogin.Selected.Index <1 then
      begin
        if ListViewOnLogin.Items.Count > 1 then
        begin
          ListViewOnLogin.Selected := ListViewOnLogin.Items[ListViewOnLogin.Selected.Index+1];
          ListViewOnLogin.Selected := ListViewOnLogin.Items[ListViewOnLogin.Selected.Index-1];
        end
        else
          ListViewOnLogin.Selected := nil;
          ListViewOnLogin.Selected := ListViewOnLogin.Items[0];
      end
      else
      begin
        ListViewOnLogin.Selected := ListViewOnLogin.Items[ListViewOnLogin.Selected.Index-1];
        ListViewOnLogin.Selected := ListViewOnLogin.Items[ListViewOnLogin.Selected.Index+1];
      end;
    end;
  end;
  ButtonSaveErrorCheckOnLogin.Enabled := False;
  ButtonCancelSaveErrorCheckOnLogin.Enabled := False;
  ButtonEditErrorCheckOnLogin.Enabled := True;
  ButtonDeleteErrorCheckOnLogin.Enabled := True;
  ButtonAddErrorCheckOnLogin.Enabled := True;
end;

procedure TEZCodeGenerator.ButtonSaveOnEnterClick(Sender: TObject);
var
  Path, Query, Comment, errorCheck, errorType : string;
  Status : Extended;
  listview : TListItem;
  onEnterLine, commentLine, currentLine, lastLine : Integer;
  I : Integer;
begin
  if (EditPathOnEnter.Enabled = True) and
     (EditQueryOnEnter.Enabled = True) and
     (EditCommentOnEnter.Enabled = True) and
     (RzSpinEditStatusOnEnter.Enabled = true) then
  begin
    Path    := EditPathOnEnter.Text;
    Query   := EditQueryOnEnter.Text;
    Comment := EditCommentOnEnter.Text + ' ';
    Status  := RzSpinEditStatusOnEnter.Value;

    //Check for duplicate comment
    for I := 0 to ListViewOnEnter.Items.Count-1 do
    begin
      if (Comment <> ListViewOnEnter.Selected.SubItems[2]) and (Comment = ListViewOnEnter.Items[I].SubItems[2]) then
      begin
        ShowMessage('Comment must be unique!');
        ButtonCacelSaveOnEnter.Click;
        Exit;
      end;
    end;
    //Check for status size:
    if Status < 30 then
    begin
      ShowMessage('Status number must be higher than previous steps!');
      Exit;
    end;
    for i := 0 to ListViewOnEnter.Selected.Index-1 do
    begin
      if (Status < StrToFloat(ListViewOnEnter.Items[i].SubItems[3]))then
      begin
        ShowMessage('Status number must be higher than previous steps!');
        Exit;
      end;
    end;

    onEnterLine := GetLineOfText(BCEditorCodePreview, 'function onEnter: HRESULT;', 16);
    if Assigned(ListViewOnEnter.Selected) then
    begin
      //check if create new or edit
      if (ListViewOnEnter.Selected.SubItems[0]<>'') and
         (ListViewOnEnter.Selected.SubItems[1]<>'') and
         (ListViewOnEnter.Selected.SubItems[2]<>'') and
         (StrToInt(ListViewOnEnter.Selected.SubItems[3]) <> 0) then
      begin  //editing
        //Check for duplicate status
        for I := 0 to ListViewOnEnter.Items.Count-1 do
        begin
          if (Status <> StrToFloat(ListViewOnEnter.Selected.SubItems[3])) and (Status = StrToFloat(ListViewOnEnter.Items[I].SubItems[3])) then
          begin
            ShowMessage('This status number already input!');
            ButtonCacelSaveOnEnter.Click;
            Exit;
          end;
        end;
        commentLine := GetLineOfText(BCEditorCodePreview, ListViewOnEnter.Selected.SubItems[2], onEnterLine);
        //Path
        currentLine := GetLineOfText(BCEditorCodePreview, 'Path :=', commentLine);
        BCEditorCodePreview.ReplaceLine(currentLine+1,'  Path := '''+ Path+''';');
        ListViewOnEnter.Selected.SubItems[0] := Path;
        //Query
        currentLine := GetLineOfText(BCEditorCodePreview, 'Query :=', commentLine);
        BCEditorCodePreview.ReplaceLine(currentLine+1,'  Query := '''+ Query+''';');
        ListViewOnEnter.Selected.SubItems[1] := Query;
        //Comment
        currentLine := commentLine;
        BCEditorCodePreview.ReplaceLine(currentLine+1,'  //'+ Comment+';');
        ListViewOnEnter.Selected.SubItems[2] := Comment;
        //Status
        currentLine := GetLineOfText(BCEditorCodePreview, 'hrdSetStatus(HRD_STATE_ENTER,', commentLine);
        BCEditorCodePreview.ReplaceLine(currentLine+1,'  hrdSetStatus(HRD_STATE_ENTER, '+ FloatToStr(Status)+');');
        ListViewOnEnter.Selected.SubItems[3] := FloatToStr(Status);
      end
      else
      begin //creating new
        //check for blank input:
        if EditPathOnEnter.Text = '' then
        begin
          ShowMessage('Path cannot be empty!');
          Exit;
        end;
        if EditCommentOnEnter.Text = '' then
        begin
          ShowMessage('Comment cannot be empty!');
          Exit;
        end;
        if RzSpinEditStatusOnEnter.Value = 0 then
        begin
          ShowMessage('Please input status number!');
          Exit;
        end;

        //Check for duplicate status
        for I := 0 to ListViewOnEnter.Items.Count-2 do
        begin
          if Status = StrToFloat(ListViewOnEnter.Items[I].SubItems[3]) then
          begin
            ShowMessage('This status number already input!');
            Exit;
          end;
        end;

        errorType  := returnErrorType(ComboBoxChooseErrorTypeOnEnter.Text);
        errorCheck := EditIfContainOnEnter.Text;
        lastLine := GetLineOfText(BCEditorCodePreview, 'Result := S_HRD_OK;', onEnterLine);
        BCEditorCodePreview.GotoLineAndCenter(lastLine);
        BCEditorCodePreview.Lines.InsertText(lastLine, '  //' + Comment);
        BCEditorCodePreview.Lines.InsertText(lastLine+1, '  hrdSetStatus(HRD_STATE_ENTER, '+FloatToStr(Status)+');');
        BCEditorCodePreview.Lines.InsertText(lastLine+2, '  Path := '''+Path+''';');
        BCEditorCodePreview.Lines.InsertText(lastLine+3, '  Query := '''+Query+''';');
        BCEditorCodePreview.Lines.InsertText(lastLine+4, '  ');
        if Query <> '' then
          BCEditorCodePreview.Lines.InsertText(lastLine+5, '  Agent.connect(Host + Path, Query);')
        else
          BCEditorCodePreview.Lines.InsertText(lastLine+5, '  Agent.connect(Host + Path);');
        BCEditorCodePreview.Lines.InsertText(lastLine+6, '  ResultStr := Agent.ResultStr;');
        BCEditorCodePreview.Lines.InsertText(lastLine+7, '  SaveToLog(ResultStr, ''Enter'+ListViewOnEnter.Selected.Caption+''');');
        BCEditorCodePreview.Lines.InsertText(lastLine+8, '  ');
        BCEditorCodePreview.Lines.InsertText(lastLine+9, '  ');

        ListViewOnEnter.Selected.SubItems[0] := Path;
        ListViewOnEnter.Selected.SubItems[1] := Query;
        ListViewOnEnter.Selected.SubItems[2] := Comment;
        ListViewOnEnter.Selected.SubItems[3] := FloatToStr(Status);
        ListViewOnEnter.Selected := ListViewOnEnter.Items[ListViewOnEnter.Items.Count-1];
      end;
      //Disable components
      EditPathOnEnter.Enabled := False;
      EditQueryOnEnter.Enabled := False;
      EditCommentOnEnter.Enabled := False;
      RzSpinEditStatusOnEnter.Enabled := False;
      ComboBoxChooseErrorTypeOnEnter.Enabled := False;
      EditIfContainOnEnter.Enabled := False;
    end;
  end;
  ButtonSaveOnEnter.Enabled := False;
  ButtonCacelSaveOnEnter.Enabled := False;
  ButtonEditOnEnter.Enabled := True;
  ButtonDeleteOnEnter.Enabled := True;
  ButtonAddOnEnter.Enabled := True;
end;

procedure TEZCodeGenerator.ButtonSaveOnExecuteClick(Sender: TObject);
var
  Path, Query, Comment, errorCheck, errorType : string;
  Status : Extended;
  listview : TListItem;
  onExecuteLine, commentLine, currentLine, lastLine : Integer;
  I : Integer;
begin
  if (EditPathOnExecute.Enabled = True) and
     (EditQueryOnExecute.Enabled = True) and
     (EditCommentOnExecute.Enabled = True) and
     (RzSpinEditStatusOnExecute.Enabled = true) then
  begin
    Path    := EditPathOnExecute.Text;
    Query   := EditQueryOnExecute.Text;
    Comment := EditCommentOnExecute.Text + ' ';
    Status  := RzSpinEditStatusOnExecute.Value;

    //Check for duplicate comment
    for I := 0 to ListViewOnExecute.Items.Count-1 do
    begin
      if (Comment <> ListViewOnExecute.Selected.SubItems[2]) and (Comment = ListViewOnExecute.Items[I].SubItems[2]) then
      begin
        ShowMessage('Comment must be unique!');
        ButtonCancelSaveOnExecute.Click;
        Exit;
      end;
    end;
    //Check for status size:
    if Status < 40 then
    begin
      ShowMessage('Status number must be higher than previous steps!');
      Exit;
    end;
    for i := 0 to ListViewOnExecute.Selected.Index-1 do
    begin
      if (Status < StrToFloat(ListViewOnExecute.Items[i].SubItems[3]))then
      begin
        ShowMessage('Status number must be higher than previous steps!');
        Exit;
      end;
    end;

    onExecuteLine := GetLineOfText(BCEditorCodePreview, 'function OnExecute: HRESULT;', 16);
    if Assigned(ListViewOnExecute.Selected) then
    begin
      //check if create new or edit
      if (ListViewOnExecute.Selected.SubItems[0]<>'') and
         (ListViewOnExecute.Selected.SubItems[1]<>'') and
         (ListViewOnExecute.Selected.SubItems[2]<>'') and
         (StrToInt(ListViewOnExecute.Selected.SubItems[3]) <> 0) then
      begin  //editing
        //Check for duplicate status
        for I := 0 to ListViewOnExecute.Items.Count-1 do
        begin
          if (Status <> StrToFloat(ListViewOnExecute.Selected.SubItems[3])) and (Status = StrToFloat(ListViewOnExecute.Items[I].SubItems[3])) then
          begin
            ShowMessage('This status number already input!');
            ButtonCancelSaveOnExecute.Click;
            Exit;
          end;
        end;
        commentLine := GetLineOfText(BCEditorCodePreview, ListViewOnExecute.Selected.SubItems[2], onExecuteLine);
        //Path
        currentLine := GetLineOfText(BCEditorCodePreview, 'Path :=', commentLine);
        BCEditorCodePreview.ReplaceLine(currentLine+1,'  Path := '''+ Path+''';');
        ListViewOnExecute.Selected.SubItems[0] := Path;
        //Query
        currentLine := GetLineOfText(BCEditorCodePreview, 'Query :=', commentLine);
        BCEditorCodePreview.ReplaceLine(currentLine+1,'  Query := '''+ Query+''';');
        ListViewOnExecute.Selected.SubItems[1] := Query;
        //Comment
        currentLine := commentLine;
        BCEditorCodePreview.ReplaceLine(currentLine+1,'  //'+ Comment+';');
        ListViewOnExecute.Selected.SubItems[2] := Comment;
        //Status
        currentLine := GetLineOfText(BCEditorCodePreview, 'hrdSetStatus(HRD_STATE_EXECUTE,', commentLine);
        BCEditorCodePreview.ReplaceLine(currentLine+1,'  hrdSetStatus(HRD_STATE_EXECUTE, '+ FloatToStr(Status)+');');
        ListViewOnExecute.Selected.SubItems[3] := FloatToStr(Status);
      end
      else
      begin //creating new
        //check for blank input:
        if EditPathOnExecute.Text = '' then
        begin
          ShowMessage('Path cannot be empty!');
          Exit;
        end;
        if EditCommentOnExecute.Text = '' then
        begin
          ShowMessage('Comment cannot be empty!');
          Exit;
        end;
        if RzSpinEditStatusOnExecute.Value = 0 then
        begin
          ShowMessage('Please input status number!');
          Exit;
        end;

        //Check for duplicate status
        for I := 0 to ListViewOnExecute.Items.Count-2 do
        begin
          if Status = StrToFloat(ListViewOnExecute.Items[I].SubItems[3]) then
          begin
            ShowMessage('This status number already input!');
            Exit;
          end;
        end;

        errorType  := returnErrorType(ComboBoxChooseErrorTypeOnExecute.Text);
        errorCheck := EditIfContainOnExecute.Text;
        lastLine := GetLineOfText(BCEditorCodePreview, 'Result := S_HRD_OK;', onExecuteLine);
        BCEditorCodePreview.GotoLineAndCenter(lastLine);
        BCEditorCodePreview.Lines.InsertText(lastLine, '  //' + Comment);
        BCEditorCodePreview.Lines.InsertText(lastLine+1, '  hrdSetStatus(HRD_STATE_EXECUTE, '+FloatToStr(Status)+');');
        BCEditorCodePreview.Lines.InsertText(lastLine+2, '  Path := '''+Path+''';');
        BCEditorCodePreview.Lines.InsertText(lastLine+3, '  Query := '''+Query+''';');
        BCEditorCodePreview.Lines.InsertText(lastLine+4, '  ');
        if Query <> '' then
          BCEditorCodePreview.Lines.InsertText(lastLine+5, '  Agent.connect(Host + Path, Query);')
        else
          BCEditorCodePreview.Lines.InsertText(lastLine+5, '  Agent.connect(Host + Path);');
        BCEditorCodePreview.Lines.InsertText(lastLine+6, '  ResultStr := Agent.ResultStr;');
        BCEditorCodePreview.Lines.InsertText(lastLine+7, '  SaveToLog(ResultStr, ''Execute'+ListViewOnExecute.Selected.Caption+''');');
        BCEditorCodePreview.Lines.InsertText(lastLine+8, '  ');
        BCEditorCodePreview.Lines.InsertText(lastLine+9, '  ');
        ListViewOnExecute.Selected.SubItems[0] := Path;
        ListViewOnExecute.Selected.SubItems[1] := Query;
        ListViewOnExecute.Selected.SubItems[2] := Comment;
        ListViewOnExecute.Selected.SubItems[3] := FloatToStr(Status);
        ListViewOnExecute.Selected := ListViewOnExecute.Items[ListViewOnExecute.Items.Count-1];
      end;
      //Disable components
      EditPathOnExecute.Enabled := False;
      EditQueryOnExecute.Enabled := False;
      EditCommentOnExecute.Enabled := False;
      RzSpinEditStatusOnExecute.Enabled := False;
      ComboBoxChooseErrorTypeOnExecute.Enabled := False;
      EditIfContainOnExecute.Enabled := False;
    end;
  end;
  ButtonSaveOnExecute.Enabled := False;
  ButtonCancelSaveOnExecute.Enabled := False;
  ButtonEditOnExecute.Enabled := True;
  ButtonDeleteOnExecute.Enabled := True;
  ButtonAddOnExecute.Enabled := True;
end;

procedure TEZCodeGenerator.ButtonSaveOnLoginClick(Sender: TObject);
var
  Path, Query, Comment, errorCheck, errorType : string;
  Status : Extended;
  listview : TListItem;
  onLoginLine, commentLine, currentLine, lastLine : Integer;
  I : Integer;
begin
  if (EditPathOnLogin.Enabled = True) and
     (EditQueryOnLogin.Enabled = True) and
     (EditCommentOnLogin.Enabled = True) and
     (RzSpinEditStatusOnLogin.Enabled = true) then
  begin
    Path    := EditPathOnLogin.Text;
    Query   := EditQueryOnLogin.Text;
    Comment := EditCommentOnLogin.Text + ' ';
    Status  := RzSpinEditStatusOnLogin.Value;

    //Check for duplicate comment
    for I := 0 to ListViewOnLogin.Items.Count-1 do
    begin
      if (Comment <> ListViewOnLogin.Selected.SubItems[2]) and (Comment = ListViewOnLogin.Items[I].SubItems[2]) then
      begin
        ShowMessage('Comment must be unique!');
        ButtonCacelSaveOnLogin.Click;
        Exit;
      end;
    end;
    //Check for status size:
    if Status < 20 then
    begin
      ShowMessage('Status number must be higher than previous steps!');
      Exit;
    end;
    for i := 0 to ListViewOnLogin.Selected.Index-1 do
    begin
      if (Status < StrToFloat(ListViewOnLogin.Items[i].SubItems[3]))then
      begin
        ShowMessage('Status number must be higher than previous steps!');
        Exit;
      end;
    end;

    onLoginLine := GetLineOfText(BCEditorCodePreview, 'function OnLogin: HRESULT;', 16);
    if Assigned(ListViewOnLogin.Selected) then
    begin
      //check if create new or edit
      if (ListViewOnLogin.Selected.SubItems[0]<>'') and
         (ListViewOnLogin.Selected.SubItems[1]<>'') and
         (ListViewOnLogin.Selected.SubItems[2]<>'') and
         (StrToInt(ListViewOnLogin.Selected.SubItems[3]) <> 0) then
      begin  //editing
        //Check for duplicate status
        for I := 0 to ListViewOnLogin.Items.Count-1 do
        begin
          if (Status <> StrToFloat(ListViewOnLogin.Selected.SubItems[3])) and (Status = StrToFloat(ListViewOnLogin.Items[I].SubItems[3])) then
          begin
            ShowMessage('This status number already input!');
            ButtonCacelSaveOnLogin.Click;
            Exit;
          end;
        end;
        commentLine := GetLineOfText(BCEditorCodePreview, ListViewOnLogin.Selected.SubItems[2], onLoginLine);
        //Path
        currentLine := GetLineOfText(BCEditorCodePreview, 'Path :=', commentLine);
        BCEditorCodePreview.ReplaceLine(currentLine+1,'  Path := '''+ Path+''';');
        ListViewOnLogin.Selected.SubItems[0] := Path;
        //Query
        currentLine := GetLineOfText(BCEditorCodePreview, 'Query :=', commentLine);
        BCEditorCodePreview.ReplaceLine(currentLine+1,'  Query := '''+ Query+''';');
        ListViewOnLogin.Selected.SubItems[1] := Query;
        //Comment
        currentLine := commentLine;
        BCEditorCodePreview.ReplaceLine(currentLine+1,'  //'+ Comment+';');
        ListViewOnLogin.Selected.SubItems[2] := Comment;
        //Status
        currentLine := GetLineOfText(BCEditorCodePreview, 'hrdSetStatus(HRD_STATE_LOGIN,', commentLine);
        BCEditorCodePreview.ReplaceLine(currentLine+1,'  hrdSetStatus(HRD_STATE_LOGIN, '+ FloatToStr(Status)+');');
        ListViewOnLogin.Selected.SubItems[3] := FloatToStr(Status);
      end
      else
      begin //creating new
        //check for blank input:
        if EditPathOnLogin.Text = '' then
        begin
          ShowMessage('Path cannot be empty!');
          Exit;
        end;
        if EditCommentOnLogin.Text = '' then
        begin
          ShowMessage('Comment cannot be empty!');
          Exit;
        end;
        if RzSpinEditStatusOnLogin.Value = 0 then
        begin
          ShowMessage('Please input status number!');
          Exit;
        end;
//        if EditIfContainOnLogin.Text = '' then
//        begin
//          ShowMessage('Please input error check contained text!');
//          Exit;
//        end;
//        if ComboBoxChooseErrorTypeOnLogin.Text = 'Choose Error Type...' then
//        begin
//          ShowMessage('Please choose an Error Type!');
//          Exit;
//        end;

        //Check for duplicate status
        for I := 0 to ListViewOnLogin.Items.Count-2 do
        begin
          if Status = StrToFloat(ListViewOnLogin.Items[I].SubItems[3]) then
          begin
            ShowMessage('This status number already input!');
            Exit;
          end;
        end;

        errorType  := returnErrorType(ComboBoxChooseErrorTypeOnLogin.Text);
        errorCheck := EditIfContainOnLogin.Text;
        lastLine := GetLineOfText(BCEditorCodePreview, 'Result := S_HRD_OK;', onLoginLine);
        BCEditorCodePreview.GotoLineAndCenter(lastLine);
        BCEditorCodePreview.Lines.InsertText(lastLine, '  //' + Comment);
        BCEditorCodePreview.Lines.InsertText(lastLine+1, '  hrdSetStatus(HRD_STATE_LOGIN, '+FloatToStr(Status)+');');
        BCEditorCodePreview.Lines.InsertText(lastLine+2, '  Path := '''+Path+''';');
        BCEditorCodePreview.Lines.InsertText(lastLine+3, '  Query := '''+Query+''';');
        BCEditorCodePreview.Lines.InsertText(lastLine+4, '  ');
        if Query <> '' then
          BCEditorCodePreview.Lines.InsertText(lastLine+5, '  Agent.connect(Host + Path, Query);')
        else
          BCEditorCodePreview.Lines.InsertText(lastLine+5, '  Agent.connect(Host + Path);');
        BCEditorCodePreview.Lines.InsertText(lastLine+6, '  ResultStr := Agent.ResultStr;');
        BCEditorCodePreview.Lines.InsertText(lastLine+7, '  SaveToLog(ResultStr, ''Login'+ListViewOnLogin.Selected.Caption+''');');
        BCEditorCodePreview.Lines.InsertText(lastLine+8, '  ');
//        BCEditorCodePreview.Lines.InsertText(lastLine+9, '  //Error Check');
//        BCEditorCodePreview.Lines.InsertText(lastLine+10, '  hrdCheckError(' + errorType + ', [');
//        BCEditorCodePreview.Lines.InsertText(lastLine+11, '    PosEx(''' + errorCheck + ''', ResultStr) > 0');
//        BCEditorCodePreview.Lines.InsertText(lastLine+12, '  ]);');
//        BCEditorCodePreview.Lines.InsertText(lastLine+10, '  if hrdOccurError then begin Result := FLastError; Exit; end;');
        BCEditorCodePreview.Lines.InsertText(lastLine+9, '  ');

        ListViewOnLogin.Selected.SubItems[0] := Path;
        ListViewOnLogin.Selected.SubItems[1] := Query;
        ListViewOnLogin.Selected.SubItems[2] := Comment;
        ListViewOnLogin.Selected.SubItems[3] := FloatToStr(Status);
//        listview := ListViewOnLogin.Selected;
//        listview.SubItems.Add(errorType+ ',' + BCEditorCodePreview.Lines[lastLine+11].QuotedString);
        ListViewOnLogin.Selected := ListViewOnLogin.Items[ListViewOnLogin.Items.Count-1];
      end;
      //Disable components
      EditPathOnLogin.Enabled := False;
      EditQueryOnLogin.Enabled := False;
      EditCommentOnLogin.Enabled := False;
      RzSpinEditStatusOnLogin.Enabled := False;
      ComboBoxChooseErrorTypeOnLogin.Enabled := False;
      EditIfContainOnLogin.Enabled := False;

    end;
  end;
  ButtonSaveOnLogin.Enabled := False;
  ButtonCacelSaveOnLogin.Enabled := False;
  ButtonEditOnLogin.Enabled := True;
  ButtonDeleteOnLogin.Enabled := True;
  ButtonAddOnLogin.Enabled := True;
end;

{function TEZCodeGenerator.CheckDuplicateError(ParamInput, ErrorType : string) : Boolean;
var
  i : integer;
  Tmp, checkInput, checkError : string;
begin
result := false;
   i := 1;
  while True do
  begin
    tmp := StrGrab(BCEditorCodePreview.Text,'hrdCheckError',']);',i);
    if tmp = '' then
    break;
    //checkError := trim(strgrab(tmp, '(', ','));
    //checkInput := trim(strgrab(tmp, '[', ']', 1));
    //showmessage(checkError + ':' + checkInput);
    if (Pos(ParamInput,tmp)>0) and (pos(ErrorType, tmp)>0) then
    begin
      result := true;
      exit;
    end;
    inc(i);
  end;
end;
}
function TEZCodeGenerator.DeleteCheckError(i : integer) : Boolean;
var
  j : integer;
  Str : string;
  deleteLine, limitLine : integer;
begin
  j := 1;

  limitLine := GetLineOfText(BCEditorCodePreview, 'hrdOccurError');
  while True do
  begin
     deleteLine := GetLineOfText(BCEditorCodePreview, 'hrdParam.items['+selectedParam+']',j);
     if deleteline = 6545404 then break;

     j := deleteLine - 2;
     if j > limitLine then
     break;
     BCEditorCodePreview.Lines.DeleteLines(deleteLine-1,3);
  end;
end;

procedure TEZCodeGenerator.ButtonRefreshChooseParamClick(Sender: TObject);
  var
  i, j, currentLine : integer;
  allSection : TStringList;
  allValue : String;
begin
  allSection := TStringList.Create;

  //read the section text of each param
  for i := ListBoxSelectedParam.Items.Count-1 downto 0 do
  begin
  selectedParam := ListBoxSelectedParam.Items[i];
  DeleteCheckError(i);
  OnParamIni.ReadSection(selectedParam,allSection);
    if allSection.Text <> '' then
    for j := allSection.Count-1 downto 0 do
    begin
      index := strtoint(StrGrab(allSection[j],'chooseText[',']'));
      // get value of each section
      allValue := OnParamIni.ReadString(selectedParam,allSection[j],'');

      //if CheckDuplicateError(selectedParam,allValue) then continue;
      if allvalue = 'None' then continue;
      currentLine := GetLineOfText(BCEditorCodePreview,'hrdSetStatus(HRD_STATE_PARAM');
      BCEditorCodePreview.Lines.InsertText(currentLine+2,#9+'hrdCheckError('+allValue+', [');
      BCEditorCodePreview.Lines.InsertText(currentLine+3,#9+']);');

      currentLine := GetLineOfText(BCEditorCodePreview,'hrdCheckError('+allValue+', [');
      BCEditorCodePreview.Lines.InsertText(currentLine+1,#9+#9+GetConditionCheckString(index,selectedParam)+'');
    end;
  end;
  //ClearValueOfListbox;
end;

procedure TEZCodeGenerator.CheckBoxBrowserClick(Sender: TObject);
var
  currentLine, currentObjLine, currentInit : Integer;
begin

  // check weather checkbox have bean checked or not
  // Import library , create object when Broswer had checked

  if CheckBoxBrowser.Checked = true then
  begin
  currentLine := GetLineOfText(BCEditorCodePreview, 'SysUtils');
  currentObjLine := GetLineOfText(BCEditorCodePreview,'hrdSetStatus(HRD_STATE_INIT, 5);');
  currentInit := GetLineOfText(BCEditorCodePreview, 'ResultStr, Query, Path: string;');
  BCEditorCodePreview.Lines.InsertText(currentLine+1, #9 + 'HRDBrowser,');
  BCEditorCodePreview.Lines.InsertText(currentObjLine+2, #13#10 +#9 +'Browser := THrdBrowser.create;'+#13#10);
  BCEditorCodePreview.Lines.InsertText(currentInit+1, #9 + 'Browser : THrdBrowser;');
  end
  else
  begin
    currentLine := GetLineOfText(BCEditorCodePreview, 'HRDBrowser,');
    currentObjLine := GetLineOfText(BCEditorCodePreview,  'Browser := THrdBrowser.create;');
    currentInit := GetLineOfText(BCEditorCodePreview, 'Browser : THrdBrowser;');
    BCEditorCodePreview.DeleteLines(currentLine+1, 1);
    BCEditorCodePreview.DeleteLines(currentObjLine,2);
    BCEditorCodePreview.DeleteLines(currentInit,1);
  end;
  //confirm to save
end;

procedure TEZCodeGenerator.CheckBoxIndyAgentClick(Sender: TObject);
var
  currentLine, currentObjLine, currentInit : Integer;
begin
  // check weather checkbox have bean checked or not
  // Import library , create object when Indy Agent had checked

  if CheckBoxIndyAgent.Checked = true then
  begin
    currentLine := GetLineOfText(BCEditorCodePreview, 'SysUtils');
    currentObjLine := GetLineOfText(BCEditorCodePreview,'hrdSetStatus(HRD_STATE_INIT, 5);');
    currentInit := GetLineOfText(BCEditorCodePreview, 'ResultStr, Query, Path: string;');
    BCEditorCodePreview.Lines.InsertText(currentLine+1, #9 + 'HRDIndyAgent,');
    BCEditorCodePreview.Lines.InsertText(currentObjLine+2, #13#10 +#9 +'Agent := THrdAgent.create;'+#13#10);
    BCEditorCodePreview.Lines.InsertText(currentInit+1, #9 + 'Agent : THrdAgent;');
  end
  else
  begin
    currentLine := GetLineOfText(BCEditorCodePreview, 'HRDIndyAgent,');
    currentObjLine := GetLineOfText(BCEditorCodePreview, 'Agent := THrdAgent.create;');
    currentInit := GetLineOfText(BCEditorCodePreview, 'Agent : THrdAgent;');
    BCEditorCodePreview.DeleteLines(currentLine+1, 1);
    BCEditorCodePreview.DeleteLines(currentObjLine,2);
    BCEditorCodePreview.DeleteLines(currentInit,1);
  end;
  //confirm to save
  BCEditorCodePreview.OnChange(Self);
end;


procedure TEZCodeGenerator.Delele1Click(Sender: TObject);
var
  result : Integer;
  selectedItem : string;
  ShOp   : TSHFileOpStruct;
begin
  selectedItem :=  TreeViewProjectExplorer.Selected.FullPath;
  result := MessageDlg('Are you sure to delete?', mtConfirmation, mbYesNo, 0, mbNo);
  if result = 6 then
  begin
    if TreeViewProjectExplorer.Selected.IsFolder then
    begin
      ShOp.Wnd := Self.Handle;
      ShOp.wFunc := FO_DELETE;
      ShOp.pFrom := PChar(selectedItem);
      ShOp.pTo := nil;
      ShOp.fFlags := FOF_NO_UI;
      SHFileOperation(ShOp);
    end
    else
      DeleteFile(selectedItem);
  end
end;

procedure TEZCodeGenerator.EditCommentOnEnterEnter(Sender: TObject);
var
  onEnterBlock : Integer;
begin
  if EditCommentOnEnter.Text <> '' then
  begin
    onEnterBlock := GetLineOfText(BCEditorCodePreview, 'function onEnter: HRESULT;', 16);
    if Assigned(ListViewOnEnter.Selected) then
    begin
      BCEditorCodePreview.GotoLineAndCenter(GetLineOfText(BCEditorCodePreview, ListViewOnEnter.Selected.SubItems[2], onEnterBlock));
    end;
  end;
end;

procedure TEZCodeGenerator.EditCommentOnExecuteEnter(Sender: TObject);
var
  onExecuteBlock : Integer;
begin
  if EditCommentOnExecute.Text <> '' then
  begin
    onExecuteBlock := GetLineOfText(BCEditorCodePreview, 'function OnExecute: HRESULT;', 16);
    if Assigned(ListViewOnExecute.Selected) then
    begin
      BCEditorCodePreview.GotoLineAndCenter(GetLineOfText(BCEditorCodePreview, ListViewOnExecute.Selected.SubItems[2], onExecuteBlock));
    end;
  end;
end;

procedure TEZCodeGenerator.EditCommentOnLoginEnter(Sender: TObject);
var
  onLoginBlock : Integer;
begin
  if EditCommentOnLogin.Text <> '' then
  begin
    onLoginBlock := GetLineOfText(BCEditorCodePreview, 'function OnLogin: HRESULT;', 16);
    if Assigned(ListViewOnLogin.Selected) then
    begin
      BCEditorCodePreview.GotoLineAndCenter(GetLineOfText(BCEditorCodePreview, ListViewOnLogin.Selected.SubItems[2], onLoginBlock));
    end;
  end;
end;

procedure TEZCodeGenerator.FormClose(Sender: TObject; var Action: TCloseAction);
var
  buttonSelected : Integer;
begin
  //confirm save before close
  if (Pos('*', TabSheetMain.Caption) > 0) or (Pos('*', TabSheetProj.Caption) > 0) then
  begin
    // Show a custom dialog
    buttonSelected := messagedlg('Do you want to save change?' ,mtCustom,
                                [mbYes,mbNo,mbCancel], 0);
    // button selected
    if buttonSelected = mrYes    then ToolButtonSaveClick(Self);
    if buttonSelected = mrNo    then Action := caFree;
    if buttonSelected = mrCancel then Action := caNone;
  end;
end;

procedure TEZCodeGenerator.EditPathOnEnterEnter(Sender: TObject);
var
  onEnterBlock : Integer;
  comment      : Integer;
begin
  if EditPathOnEnter.Text <> '' then
  begin
    onEnterBlock := GetLineOfText(BCEditorCodePreview, 'function onEnter: HRESULT;', 16);
    if Assigned(ListViewOnEnter.Selected) then
    begin
      comment := GetLineOfText(BCEditorCodePreview, ListViewOnEnter.Selected.SubItems[2], onEnterBlock);
      BCEditorCodePreview.GotoLineAndCenter(GetLineOfText(BCEditorCodePreview, 'Path :=', comment));
    end;
  end;
end;

procedure TEZCodeGenerator.EditPathOnExecuteEnter(Sender: TObject);
var
  onExecuteBlock : Integer;
  comment      : Integer;
begin
  if EditPathOnExecute.Text <> '' then
  begin
    onExecuteBlock := GetLineOfText(BCEditorCodePreview, 'function OnExecute: HRESULT;', 16);
    if Assigned(ListViewOnExecute.Selected) then
    begin
      comment := GetLineOfText(BCEditorCodePreview, ListViewOnExecute.Selected.SubItems[2], onExecuteBlock);
      BCEditorCodePreview.GotoLineAndCenter(GetLineOfText(BCEditorCodePreview, 'Path :=', comment));
    end;
  end;
end;

procedure TEZCodeGenerator.EditPathOnFinalEnter(Sender: TObject);
var
  onFinalBlock : Integer;
begin
  if EditPathOnFinal.Text <> '' then
  begin
    onFinalBlock := GetLineOfText(BCEditorCodePreview, 'function OnFinal: HRESULT;', 16);
    BCEditorCodePreview.GotoLineAndCenter(GetLineOfText(BCEditorCodePreview, 'Path :=', onFinalBlock));
  end;
end;

procedure TEZCodeGenerator.EditPathOnLoginEnter(Sender: TObject);
var
  onLoginBlock : Integer;
  comment      : Integer;
begin
  if EditPathOnLogin.Text <> '' then
  begin
    onLoginBlock := GetLineOfText(BCEditorCodePreview, 'function OnLogin: HRESULT;', 16);
    if Assigned(ListViewOnLogin.Selected) then
    begin
      comment := GetLineOfText(BCEditorCodePreview, ListViewOnLogin.Selected.SubItems[2], onLoginBlock);
      BCEditorCodePreview.GotoLineAndCenter(GetLineOfText(BCEditorCodePreview, 'Path :=', comment));
    end;
  end;
end;

procedure TEZCodeGenerator.EditQueryOnEnterEnter(Sender: TObject);
var
  onEnterBlock : Integer;
  comment      : Integer;
begin
  if EditQueryOnEnter.Text <> '' then
  begin
    onEnterBlock := GetLineOfText(BCEditorCodePreview, 'function onEnter: HRESULT;', 16);
    if Assigned(ListViewOnEnter.Selected) then
    begin
      comment := GetLineOfText(BCEditorCodePreview, ListViewOnEnter.Selected.SubItems[2], onEnterBlock);
      BCEditorCodePreview.GotoLineAndCenter(GetLineOfText(BCEditorCodePreview, 'Query :=', comment));
    end;
  end;
end;

procedure TEZCodeGenerator.EditQueryOnExecuteEnter(Sender: TObject);
var
  onExecuteBlock : Integer;
  comment      : Integer;
begin
  if EditQueryOnExecute.Text <> '' then
  begin
    onExecuteBlock := GetLineOfText(BCEditorCodePreview, 'function OnExecute: HRESULT;', 16);
    if Assigned(ListViewOnExecute.Selected) then
    begin
      comment := GetLineOfText(BCEditorCodePreview, ListViewOnExecute.Selected.SubItems[2], onExecuteBlock);
      BCEditorCodePreview.GotoLineAndCenter(GetLineOfText(BCEditorCodePreview, 'Query :=', comment));
    end;
  end;
end;

procedure TEZCodeGenerator.EditQueryOnFinalEnter(Sender: TObject);
var
  onFinalBlock : Integer;
begin
  if EditPathOnFinal.Text <> '' then
  begin
    onFinalBlock := GetLineOfText(BCEditorCodePreview, 'function OnFinal: HRESULT;', 16);
    BCEditorCodePreview.GotoLineAndCenter(GetLineOfText(BCEditorCodePreview, 'Query :=', onFinalBlock));
  end;
end;

procedure TEZCodeGenerator.EditQueryOnLoginEnter(Sender: TObject);
var
  onLoginBlock : Integer;
  comment      : Integer;
begin
  if EditQueryOnLogin.Text <> '' then
  begin
    onLoginBlock := GetLineOfText(BCEditorCodePreview, 'function OnLogin: HRESULT;', 16);
    if Assigned(ListViewOnLogin.Selected) then
    begin
      comment := GetLineOfText(BCEditorCodePreview, ListViewOnLogin.Selected.SubItems[2], onLoginBlock);
      BCEditorCodePreview.GotoLineAndCenter(GetLineOfText(BCEditorCodePreview, 'Query :=', comment));
    end;
  end;
end;

procedure TEZCodeGenerator.FormShow(Sender: TObject);
var
  RecentProjectIndex, RecentModuleIndex : Int8;
begin
  //load existing or add new workspace
  ProjectSetting := TIniFile.Create( ChangeFileExt( Application.ExeName, '.INI' ) );
  if ProjectSetting.ReadString('Workspace', 'WorkspacePath', '') = '' then
    FormWorkspace.ShowModal
  else
  begin
    if TDirectory.Exists(ProjectSetting.ReadString('Workspace', 'WorkspacePath', '')) then
      TreeViewProjectExplorer.RootedAtFileSystemFolder := ProjectSetting.ReadString('Workspace', 'WorkspacePath', '');
  end;

  //expand and read the last open project module
  WorkspaceSetting := TIniFile.Create(TreeViewProjectExplorer.RootNode.FullPath + '\'+ TreeViewProjectExplorer.RootNode.Text + '.INI' );

  RecentProjectIndex := 0;
  RecentModuleIndex  := 0;
  if WorkspaceSetting.ReadString('RecentProject', 'RecentProjectIndex', '') <> '' then
    RecentProjectIndex := StrToInt(WorkspaceSetting.ReadString('RecentProject', 'RecentProjectIndex', '')) + 1;

  if WorkspaceSetting.ReadString('RecentProject', 'RecentModuleIndex', '') <> '' then
    RecentModuleIndex := StrToInt(WorkspaceSetting.ReadString('RecentProject', 'RecentModuleIndex', ''));

  TreeViewProjectExplorer.Items[RecentProjectIndex].Expand(true);
  TreeViewProjectExplorer.Items[RecentProjectIndex].Item[RecentModuleIndex].Expand(true);
  TreeViewProjectExplorer.Items[RecentProjectIndex].Item[RecentModuleIndex].Selected := True;

  if (WorkspaceSetting.ReadString('RecentProject', 'RecentProjectFilePath', '') <> '') and
     (WorkspaceSetting.ReadString('RecentProject', 'RecentMainDotPasPath', '')  <> '') and
     (WorkspaceSetting.ReadString('RecentProject', 'RecentModuleFolder', '')    <> '')
  then
  begin
  RzPageControlMain.Visible := True;
  PageControlSteps.ActivePage := TabSheetOnInit;

  OpenningProjectFilePath := WorkspaceSetting.ReadString('RecentProject', 'RecentProjectFilePath', '');
  OpenningMainFilePath :=  WorkspaceSetting.ReadString('RecentProject', 'RecentMainDotPasPath', '');

  CodeHighligher(BCEditorProjCode, OpenningProjectFilePath);
  OpenningProjectName :=  WorkspaceSetting.ReadString('RecentProject', 'RecentModuleFolder', '') + '.dpr';
  TabSheetProj.Caption := OpenningProjectName;

  CodeHighligher(BCEditorCodePreview, OpenningMainFilePath);
  projectfiletocompile.Caption := StringReplace(WorkspaceSetting.ReadString('RecentProject', 'RecentProjectFilePath', ''), '.dpr', '.dproj', [rfReplaceAll]);

  end;

  //load on init from ini
  if WorkspaceSetting.ReadString('RecentProject', 'RecentModuleFolderPath', '') <> '' then
  begin
    OpenningModuleFolderPath := WorkspaceSetting.ReadString('RecentProject', 'RecentModuleFolderPath', '');
    OnInitIni := TIniFile.Create(OpenningModuleFolderPath + '\OnInit.INI');
    FileSetAttr(OnInitIni.FileName, faHidden);

    if OnInitIni.ReadString('OnInit', 'CheckBoxIndyAgent', '') <> '' then
    CheckBoxIndyAgent.Checked := StrToBool(OnInitIni.ReadString('OnInit', 'CheckBoxIndyAgent', ''));

    if OnInitIni.ReadString('OnInit', 'CheckBoxBrowser', '') <> '' then
      CheckBoxBrowser.Checked := StrToBool(OnInitIni.ReadString('OnInit', 'CheckBoxBrowser', ''));

   if OnInitIni.ReadString('OnInit','Host', '') <> '' then
      EditHost.Text := OnInitIni.ReadString('OnInit','Host', '');
  end;

  TabSheetMain.Caption := 'main.pas';
end;

procedure TEZCodeGenerator.InputParameters1Click(Sender: TObject);
begin
  FormInputParam.ShowModal;
end;

procedure TEZCodeGenerator.ListBoxAvailableParamClick(Sender: TObject);
begin
  ButtonChooseParam.Enabled := True;
  ButtonChooseAllParamsOnParam.Enabled := True;
end;


procedure TEZCodeGenerator.ListBoxAvailableResultOutputClick(Sender: TObject);
begin
  ButtonChooseParamOnResult.Enabled := True;
  ButtonChooseAllParamOnResult.Enabled := True;
end;

procedure TEZCodeGenerator.ListBoxSelectedParamClick(Sender: TObject);
var
  i, j : Integer;
begin
  ButtonDeclineParamOnParam.Enabled := True;
  ButtonDeclineAllParamsOnParam.Enabled := True;

  BCEditorCodePreview.GotoLineAndCenter(GetLineOfText(BCEditorCodePreview, ListBoxSelectedParam.Items[ListBoxSelectedParam.ItemIndex], GetLineOfText(BCEditorCodePreview, 'OnParam', 20)));

  sectionSelectedParam := TStringList.Create;
  OnParamIni := TIniFile.Create(OpenningModuleFolderPath +'\OnParam.INI');

  ClearValueOfListbox;
  //read the section text of each param
  selectedParam := ListBoxSelectedParam.Items[ListBoxSelectedParam.ItemIndex];
  OnParamIni.ReadSection(selectedParam, sectionSelectedParam);
 for j := 4 downto 0 do
  begin
    for I := sectionSelectedParam.Count-1 downto 0 do
    begin
    selectedError := OnParamIni.ReadString(selectedParam, sectionSelectedParam[i], '');

    // read the value of section
    errorCheackText := OnParamIni.ReadString(selectedParam,sectionSelectedParam.Strings[i],'');

    if sectionSelectedParam.Strings[i] = 'chooseText['+inttostr(j)+']' then
    begin
      ListViewErrorCheck.Items[j].Checked := true;

      SetValueToCombobox(j,errorCheackText);
      //chooseText[j] := OnParam.ReadString(selectedError,'chooseText['+inttostr(j)+']','');
      break;
    end;
    end;
  end;
end;

procedure TEZCodeGenerator.ListBoxSelectedResutlOutputClick(Sender: TObject);
var
  line : Int8;
begin
  ButtonDeclineParamsOnResult.Enabled := True;
  ButtonDeclineAllParamsOnResult.Enabled := True;

  Line := GetLineOfText(BCEditorCodePreview, ListBoxSelectedResutlOutput.items[ListBoxSelectedResutlOutput.ItemIndex]);
  if Line <> 5668988 then
  BCEditorCodePreview.GotoLineAndCenter(line);
end;

  
procedure TEZCodeGenerator.ListViewErrorCheckOnEnterChange(Sender: TObject;
  Item: TListItem; Change: TItemChange);
begin
  ComboBoxChooseErrorTypeOnEnter.Enabled := False;
  EditIfContainOnEnter.Enabled           := False;
  if Assigned(ListViewErrorCheckOnEnter.Selected) then
  begin
  ComboBoxChooseErrorTypeOnEnter.ItemIndex := checkErrorType(returnErrorType(ListViewErrorCheckOnEnter.Selected.SubItems[0]));
  EditIfContainOnEnter.Text := ListViewErrorCheckOnEnter.Selected.SubItems[1];
  end;
end;

procedure TEZCodeGenerator.ListViewErrorCheckOnEnterEnter(Sender: TObject);
begin
  goToErrorCheck(ListViewOnEnter);
end;

procedure TEZCodeGenerator.ListViewErrorCheckOnEnterKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
    ButtonDeleteErrorCheckOnEnter.Click;
end;

procedure TEZCodeGenerator.ListViewErrorCheckOnExecuteChange(Sender: TObject;
  Item: TListItem; Change: TItemChange);
begin
  ComboBoxChooseErrorTypeOnExecute.Enabled := False;
  EditIfContainOnExecute.Enabled           := False;
  if Assigned(ListViewErrorCheckOnExecute.Selected) then
  begin
  ComboBoxChooseErrorTypeOnExecute.ItemIndex := checkErrorType(returnErrorType(ListViewErrorCheckOnExecute.Selected.SubItems[0]));
  EditIfContainOnExecute.Text := ListViewErrorCheckOnExecute.Selected.SubItems[1];
  end;
end;

procedure TEZCodeGenerator.ListViewErrorCheckOnExecuteEnter(Sender: TObject);
begin
  goToErrorCheck(ListViewOnExecute);
end;

procedure TEZCodeGenerator.ListViewErrorCheckOnExecuteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
    ButtonDeleteErrorCheckOnExecute.Click;
end;

procedure TEZCodeGenerator.ListViewErrorCheckOnLoginChange(Sender: TObject;
  Item: TListItem; Change: TItemChange);
begin
  ComboBoxChooseErrorTypeOnLogin.Enabled := False;
  EditIfContainOnLogin.Enabled           := False;
  if Assigned(ListViewErrorCheckOnLogin.Selected) then
  begin
  ComboBoxChooseErrorTypeOnLogin.ItemIndex := checkErrorType(returnErrorType(ListViewErrorCheckOnLogin.Selected.SubItems[0]));
  EditIfContainOnLogin.Text := ListViewErrorCheckOnLogin.Selected.SubItems[1];
  end;
end;

procedure TEZCodeGenerator.ListViewErrorCheckOnLoginEnter(Sender: TObject);
begin
  goToErrorCheck(ListViewOnLogin);
end;

procedure TEZCodeGenerator.ListViewErrorCheckOnLoginKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
    ButtonDeleteErrorCheckOnLogin.Click;
end;

procedure TEZCodeGenerator.ListViewOnEnterChange(Sender: TObject;
  Item: TListItem; Change: TItemChange);
var
  i            : Integer;
  listviewitem : TListItem;
  errorType, errorText : string;
begin
  ListViewErrorCheckOnEnter.Clear;
  if Assigned(ListViewOnEnter.Selected) then
  begin
    if EditPathOnEnter.Enabled = False then
      EditPathOnEnter.Text    := ListViewOnEnter.Selected.SubItems[0];
    if EditQueryOnEnter.Enabled = False then
      EditQueryOnEnter.Text   := ListViewOnEnter.Selected.SubItems[1];
    if EditCommentOnEnter.Enabled = False then
      EditCommentOnEnter.Text := ListViewOnEnter.Selected.SubItems[2];
    if RzSpinEditStatusOnEnter.Enabled = False then
    begin
      if ListViewOnEnter.Selected.SubItems[3] <> '' then
        RzSpinEditStatusOnEnter.Value := StrToInt(ListViewOnEnter.Selected.SubItems[3])
      else
        RzSpinEditStatusOnEnter.Value := 0;
    end;

    for I := 4 to ListViewOnEnter.Selected.SubItems.Count-1 do
    begin
      errorType := StrGrab(ListViewOnEnter.Selected.SubItems[i], '', ',');
      errorText := StrGrab(ListViewOnEnter.Selected.SubItems[i], 'PosEx(''', ''', ResultStr');
      listviewitem := ListViewErrorCheckOnEnter.Items.Add;
      listviewitem.Caption := IntToStr(i-3);
      listviewitem.SubItems.Add(ComboBoxChooseErrorTypeOnEnter.Items[checkErrorType(errorType)]);
      listviewitem.SubItems.Add(errorText);
    end;
    goToFunctionByComment('//' + ListViewOnEnter.Selected.SubItems[2], ListViewOnEnter);
  end;
  EditPathOnEnter.Enabled    := False;
  EditQueryOnEnter.Enabled   := False;
  EditCommentOnEnter.Enabled := False;
  RzSpinEditStatusOnEnter.Enabled := False;
  ListViewErrorCheckOnEnter.Selected := ListViewErrorCheckOnEnter.Items[0];
end;

procedure TEZCodeGenerator.ListViewOnEnterKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
    ButtonDeleteOnEnter.Click;
end;

procedure TEZCodeGenerator.ListViewOnExecuteChange(Sender: TObject;
  Item: TListItem; Change: TItemChange);
var
  i            : Integer;
  listviewitem : TListItem;
  errorType, errorText : string;
begin
  ListViewErrorCheckOnExecute.Clear;
  if Assigned(ListViewOnExecute.Selected) then
  begin
    if EditPathOnExecute.Enabled = False then
      EditPathOnExecute.Text    := ListViewOnExecute.Selected.SubItems[0];
    if EditQueryOnExecute.Enabled = False then
      EditQueryOnExecute.Text   := ListViewOnExecute.Selected.SubItems[1];
    if EditCommentOnExecute.Enabled = False then
      EditCommentOnExecute.Text := ListViewOnExecute.Selected.SubItems[2];
    if RzSpinEditStatusOnExecute.Enabled = False then
    begin
      if ListViewOnExecute.Selected.SubItems[3] <> '' then
        RzSpinEditStatusOnExecute.Value := StrToInt(ListViewOnExecute.Selected.SubItems[3])
      else
        RzSpinEditStatusOnExecute.Value := 0;
    end;

    for I := 4 to ListViewOnExecute.Selected.SubItems.Count-1 do
    begin
      errorType := StrGrab(ListViewOnExecute.Selected.SubItems[i], '', ',');
      errorText := StrGrab(ListViewOnExecute.Selected.SubItems[i], 'PosEx(''', ''', ResultStr');
      listviewitem := ListViewErrorCheckOnExecute.Items.Add;
      listviewitem.Caption := IntToStr(i-3);
      listviewitem.SubItems.Add(ComboBoxChooseErrorTypeOnExecute.Items[checkErrorType(errorType)]);
      listviewitem.SubItems.Add(errorText);
    end;
    goToFunctionByComment('//' + ListViewOnExecute.Selected.SubItems[2], ListViewOnExecute);
  end;
  EditPathOnExecute.Enabled    := False;
  EditQueryOnExecute.Enabled   := False;
  EditCommentOnExecute.Enabled := False;
  RzSpinEditStatusOnExecute.Enabled := False;
  ListViewErrorCheckOnExecute.Selected := ListViewErrorCheckOnExecute.Items[0];
end;

procedure TEZCodeGenerator.ListViewOnExecuteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
    ButtonDeleteOnExecute.Click;
end;

procedure TEZCodeGenerator.ListViewOnLoginChange(Sender: TObject;
  Item: TListItem; Change: TItemChange);
var
  i            : Integer;
  listviewitem : TListItem;
  errorType, errorText : string;
begin
  ListViewErrorCheckOnLogin.Clear;
  if Assigned(ListViewOnLogin.Selected) then
  begin
    if EditPathOnLogin.Enabled = False then
      EditPathOnLogin.Text    := ListViewOnLogin.Selected.SubItems[0];
    if EditQueryOnLogin.Enabled = False then
      EditQueryOnLogin.Text   := ListViewOnLogin.Selected.SubItems[1];
    if EditCommentOnLogin.Enabled = False then
      EditCommentOnLogin.Text := ListViewOnLogin.Selected.SubItems[2];
    if RzSpinEditStatusOnLogin.Enabled = False then
    begin
      if ListViewOnLogin.Selected.SubItems[3] <> '' then
        RzSpinEditStatusOnLogin.Value := StrToInt(ListViewOnLogin.Selected.SubItems[3])
      else
        RzSpinEditStatusOnLogin.Value := 0;
    end;

    for I := 4 to ListViewOnLogin.Selected.SubItems.Count-1 do
    begin
      errorType := StrGrab(ListViewOnLogin.Selected.SubItems[i], '', ',');
      errorText := StrGrab(ListViewOnLogin.Selected.SubItems[i], 'PosEx(''', ''', ResultStr');
      listviewitem := ListViewErrorCheckOnLogin.Items.Add;
      listviewitem.Caption := IntToStr(i-3);
      listviewitem.SubItems.Add(ComboBoxChooseErrorTypeOnLogin.Items[checkErrorType(errorType)]);
      listviewitem.SubItems.Add(errorText);
    end;
    goToFunctionByComment('//' + ListViewOnLogin.Selected.SubItems[2], ListViewOnLogin);
  end;
  EditPathOnLogin.Enabled    := False;
  EditQueryOnLogin.Enabled   := False;
  EditCommentOnLogin.Enabled := False;
  RzSpinEditStatusOnLogin.Enabled := False;
  ListViewErrorCheckOnLogin.Selected := ListViewErrorCheckOnLogin.Items[0];
end;

procedure TEZCodeGenerator.ListViewOnLoginKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
    ButtonDeleteOnLogin.Click;
end;

procedure TEZCodeGenerator.NewProject1Click(Sender: TObject);
begin
  NewProject.Click;
end;

procedure TEZCodeGenerator.NewProjectClick(Sender: TObject);
begin
  FormCreateProject.ShowModal;
end;

procedure TEZCodeGenerator.NewModule1Click(Sender: TObject);
begin
 FormCreateModule.ShowModal;
end;

procedure TEZCodeGenerator.NewModule2Click(Sender: TObject);
begin
  NewModule1.Click;
end;

procedure TEZCodeGenerator.ListBoxMessageDblClick(Sender: TObject);
var
  SelectedMessage, HandleFile : String;
  Line : Int8;
begin
  try
  SelectedMessage := ListBoxMessage.Items[ListBoxMessage.ItemIndex];
  if ((Pos('error', SelectedMessage) > 0)
      or  (Pos('warning', SelectedMessage) > 0))
      and (Pos('Could not compile', SelectedMessage) <= 0)
      and (Pos('_PasCoreCompile', SelectedMessage) <= 0)
      then
  begin
    HandleFile := LeftStr(SelectedMessage, Pos('(', SelectedMessage)-1);
    Line := StrToInt(StrGrab(SelectedMessage, '(', ')', 1)) -1;

    if Pos('main', HandleFile) > 0 then
    begin
      RzPageControlMain.ActivePage := TabSheetMain;
      BCEditorCodePreview.GotoLineAndCenter(Line);
    end
    else if Pos('.dpr', HandleFile) > 0 then

    begin
      RzPageControlMain.ActivePage := TabSheetProj;
     BCEditorProjCode.GotoLineAndCenter(Line);
    end;
  end;
  except on E: Exception do
  end;
end;

{ User-defined functions and procedures}
function TEZCodeGenerator.GetLineOfText(ABcEditor: TBCEditor; AString: String; AStartLineNumber: Integer=0): Integer;
var
  currentLine : Integer;
begin
  for currentLine := AStartLineNumber to ABcEditor.Lines.Count-1 do
    if Pos(AString, ABcEditor.Lines[currentLine]) >0 then begin result := currentLine; Break; end;
end;

procedure TEZCodeGenerator.CodeHighligher(ABcEditor: TBCEditor; AFilePath: String);
begin
  with ABcEditor do
  begin
    Highlighter.LoadFromFile('Object Pascal.json');
    Highlighter.Colors.LoadFromFile('Twilight.json');
    LoadFromFile(GetHighlighterFileName('Object Pascal.json'));
    lines.text := TFile.ReadAllText(AFilePath);
  end;

end;
procedure TEZCodeGenerator.ListOutputParams;
var
  OuputParams : TStringDynArray;
  I: Int8;
  SelectedParamList : TStringList;
  AvailableParamList : TStringList;
begin
  OnResultIni := TIniFile.Create(OpenningModuleFolderPath + '\OnResult.INI');
  EZCodeGenerator.ListBoxAvailableResultOutput.Clear;

  //read available param from ini
  AvailableParamList := TStringList.Create;
  try
    OnResultIni.ReadSection('AvailableResultOutput', AvailableParamList);
    if AvailableParamList.Text <> '' then
      ListBoxAvailableResultOutput.Items.AddStrings(AvailableParamList)
    else
    begin
      OuputParams :=  getOutputParam;
      for I := low(OuputParams) to high(OuputParams) do
      begin
        if not ContainsStr(OuputParams[i], '//') then
        begin
          EZCodeGenerator.ListBoxAvailableResultOutput.Items.Add(trim(splitstring(OuputParams[i], '=')[0]));
          OnResultIni.WriteString('AvailableResultOutput', trim(splitstring(OuputParams[i], '=')[0]), 'true');
        end;
      end;
    end;
  finally
    AvailableParamList.Free;
  end;

  //read selected param from ini
  ListBoxSelectedResutlOutput.Clear;
  SelectedParamList := TStringList.Create;
  try
    OnResultIni.ReadSection('SelectedResultOutput', SelectedParamList);
    if SelectedParamList.Text <> '' then
      ListBoxSelectedResutlOutput.Items.AddStrings(SelectedParamList);
  finally
    SelectedParamList.Free;
  end;


end;


procedure TEZCodeGenerator.getPopupQueryData;
var
  k : Int8;
  NewItem : TMenuItem;
begin
  PopupMenuQuery.Items.Clear;
  for k := ListBoxSelectedParam.Items.Count-1 downto 0 do
  begin
    NewItem := TMenuItem.Create(PopupMenuQuery);
    NewItem.AutoHotkeys := maManual;
    Index := PopupMenuQuery.Items.Count;
    PopupMenuQuery.Items.Add(NewItem);
    NewItem.Caption := ListBoxSelectedParam.Items[k];
    NewItem.Tag := Index;
    NewItem.OnClick := PopupMenuQueryItemsClick;
  end;
end;
procedure TEZCodeGenerator.saveOnInit;
begin
 if CheckBoxIndyAgent.Checked = true then
    OnInitIni.WriteString('OnInit', 'CheckBoxIndyAgent', 'True')
  else
    OnInitIni.WriteString('OnInit', 'CheckBoxIndyAgent', 'False');

  if CheckBoxBrowser.Checked = true then
    OnInitIni.WriteString('OnInit', 'CheckBoxBrowser', 'True')
  else
    OnInitIni.WriteString('OnInit', 'CheckBoxBrowser', 'False');

  OnInitIni.WriteString('OnInit','Host', EditHost.Text);
end;


procedure TEZCodeGenerator.PageControlStepsChange(Sender: TObject);
begin
  saveOnInit;
end;

procedure TEZCodeGenerator.PopupMenuQueryItemsClick(Sender: TObject);
var
  ClickedMenuItemCaption : String;
  I : Integer;
begin
  with Sender as TMenuItem do
  begin
  for I := 0 to PopupMenuQuery.Items.Count-1 do
    if Tag = I then
      ClickedMenuItemCaption := Caption;
  end;

  ClickedMenuItemCaption := StrRemove(ClickedMenuItemCaption, ['&']);
  if PageControlSteps.ActivePage = TabSheetOnLogin then
    EditQueryOnLogin.Text :=  StrReplace(EditQueryOnLogin.Text, EditQueryOnLogin.SelText, ClickedMenuItemCaption)
  else if PageControlSteps.ActivePage = TabSheetOnEnter then
    EditQueryOnEnter.Text :=  StrReplace(EditQueryOnEnter.Text, EditQueryOnEnter.SelText, ClickedMenuItemCaption)
  else
    EditQueryOnExecute.Text :=  StrReplace(EditQueryOnExecute.Text, EditQueryOnExecute.SelText, ClickedMenuItemCaption);

end;

procedure TEZCodeGenerator.ComboBoxChooseErrorTypeOnEnterEnter(Sender: TObject);
begin
  goToErrorCheck(ListViewOnEnter);
end;

procedure TEZCodeGenerator.ComboBoxChooseErrorTypeOnExecuteEnter(
  Sender: TObject);
begin
  goToErrorCheck(ListViewOnExecute);
end;

procedure TEZCodeGenerator.ComboBoxChooseErrorTypeOnLoginEnter(Sender: TObject);
begin
  goToErrorCheck(ListViewOnLogin);
end;

function TEZCodeGenerator.checkErrorType(AError : string) : Integer;
begin
  AError := UpperCase(AError);
  if AError      = 'E_HRD_SITE_VALID' then
    Result := 0
  else if AError = 'E_HRD_SITE_INVALID' then
    Result := 1
  else if AError = 'E_HRD_LOGIN_SUCCESS' then
    Result := 2
  else if AError = 'E_HRD_LOGIN_FAIL' then
    Result := 3
  else if AError = 'E_HRD_USER_ID_INVALID' then
    Result := 4
  else if AError = 'E_HRD_USER_EMAIL_INVALID' then
    Result := 5
  else if AError = 'E_HRD_USER_PASSWORD_INVALID' then
    Result := 6
  else if AError = 'E_HRD_USER_PASSWORD_DENIED' then
    Result := 7
  else
    Result := 8;
end;

function TEZCodeGenerator.returnErrorType(AError : string) : String;
begin
  if AError      = 'Site Valid' then
    Result := 'E_HRD_SITE_VALID'
  else if AError = 'Site Invalid' then
    Result := 'E_HRD_SITE_INVALID'
  else if AError = 'Login Success' then
    Result := 'E_HRD_LOGIN_SUCCESS'
  else if AError = 'Login Failed' then
    Result := 'E_HRD_LOGIN_FAIL'
  else if AError = 'Invalid User Name' then
    Result := 'E_HRD_USER_ID_INVALID'
  else if AError = 'Invalid Email' then
    Result := 'E_HRD_USER_EMAIL_INVALID'
  else if AError = 'Invalid Password' then
    Result := 'E_HRD_USER_PASSWORD_INVALID'
  else if AError = 'Password not match' then
    Result := 'E_HRD_USER_PASSWORD_DENIED'
  else
    Result := 'E_HRD_UNKNOWN';
end;

procedure TEZCodeGenerator.EditHostChange(Sender: TObject);
var
  currentLine : Integer;
begin
  try
    // Give the host name of website
    currentLine := GetLineOfText(BCEditorCodePreview, 'const');
    BCEditorCodePreview.DeleteLines(currentLine+2,1);
    BCEditorCodePreview.InsertLine(currentLine+2,'Host: string = '''+editHost.text+''';');

    //confirm save
    BCEditorCodePreview.OnChange(Self);
  except on E: Exception do
  end;
end;

procedure TEZCodeGenerator.goToErrorCheck(AListView : TListView);
var
  OnFunctionLine, currentFunction : Integer;
begin
  if Assigned(AListView.Selected) then
  begin
    if AListView.Parent = TabSheetOnLogin then
    begin
      OnFunctionLine := GetLineOfText(BCEditorCodePreview, 'function OnLogin: HRESULT;', 16);
      currentFunction := GetLineOfText(BCEditorCodePreview, '//' + EditCommentOnLogin.Text, OnFunctionLine);
      if ListViewErrorCheckOnLogin.Items.Count<1 then
        BCEditorCodePreview.GotoLineAndCenter(GetLineOfText(BCEditorCodePreview, 'SaveToLog(ResultStr,', currentFunction))
      else
        BCEditorCodePreview.GotoLineAndCenter(GetLineOfText(BCEditorCodePreview, '//Error Check', currentFunction));
    end
    else if AListView.Parent = TabSheetOnEnter then
    begin
      OnFunctionLine := GetLineOfText(BCEditorCodePreview, 'function onEnter: HRESULT;', 16);
      currentFunction := GetLineOfText(BCEditorCodePreview, '//' + EditCommentOnEnter.Text, OnFunctionLine);
      if ListViewErrorCheckOnEnter.Items.Count<1 then
        BCEditorCodePreview.GotoLineAndCenter(GetLineOfText(BCEditorCodePreview, 'SaveToLog(ResultStr,', currentFunction))
      else
        BCEditorCodePreview.GotoLineAndCenter(GetLineOfText(BCEditorCodePreview, '//Error Check', currentFunction));
    end
    else if AListView.Parent = TabSheetOnExecute then
    begin
      OnFunctionLine := GetLineOfText(BCEditorCodePreview, 'function OnExecute: HRESULT;', 16);
      currentFunction := GetLineOfText(BCEditorCodePreview, '//' + EditCommentOnExecute.Text, OnFunctionLine);
      if ListViewErrorCheckOnExecute.Items.Count<1 then
        BCEditorCodePreview.GotoLineAndCenter(GetLineOfText(BCEditorCodePreview, 'SaveToLog(ResultStr,', currentFunction))
      else
        BCEditorCodePreview.GotoLineAndCenter(GetLineOfText(BCEditorCodePreview, '//Error Check', currentFunction));
    end
    else
    begin
      MessageDlg('Error function type', mtError, [mbOK], 1); Exit;
    end;
  end;
end;

procedure TEZCodeGenerator.goToFunctionByComment(AComment: String; AListView: TListView);
var
  onStepLine, currentFunction : Integer;
begin
  if  AListView.Items.Count < 1 then exit;
  if AListView.Parent = TabSheetOnLogin then
    onStepLine := GetLineOfText(BCEditorCodePreview, 'function OnLogin: HRESULT;', 16)
  else if AListView.Parent = TabSheetOnEnter then
    onStepLine := GetLineOfText(BCEditorCodePreview, 'function onEnter: HRESULT;', 16)
  else if AListView.Parent = TabSheetOnExecute then
    onStepLine := GetLineOfText(BCEditorCodePreview, 'function OnExecute: HRESULT;', 16);
  currentFunction := GetLineOfText(BCEditorCodePreview, AComment, onStepLine);
  BCEditorCodePreview.GotoLineAndCenter(currentFunction);
end;
procedure TEZCodeGenerator.Help1Click(Sender: TObject);
begin
 FormHelp.Show;
end;

end.
