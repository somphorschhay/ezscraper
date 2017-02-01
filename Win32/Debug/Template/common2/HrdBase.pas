{******************************************************************************}
{*        File : HrdBase.pas                                                  *}
{******************************************************************************}
unit HrdBase;

interface

uses
  windows, SysUtils, HrdUtils, messages, HTTPApp;

type
  ThrdParam = record
    items : array[1..10] of string;
  end;
  
  ThrdResult = record
    items : array[1..10] of string;
  end;
  
  TStatusCode = (
    HRD_STATE_BEGIN,
    HRD_STATE_INIT,
    HRD_STATE_PARAM,
    HRD_STATE_LOGIN,
    HRD_STATE_ENTER,
    HRD_STATE_EXECUTE,
    HRD_STATE_RESULT,
    HRD_STATE_FINAL,
    HRD_STATE_DONE
  );

  procedure hrdParamParser;
  procedure hrdSetStatus(const aState: TStatusCode; const aPercent : Integer);
  procedure hrdSetResults(const aExistNext : Boolean);
  function  hrdOccurError: Boolean;
  procedure hrdCheckError(const aErrCode: HResult; const aErrConst: array of Boolean);
  procedure SendString(const identifynumber : Integer; AStr : String);
  procedure Run;

var
  FLastError : HResult;
  PageCount  : Integer = 0;
  RecordCount: Integer = 0;
  JUID       : string;
  hrdParam   : ThrdParam;
  hrdResult  : ThrdResult;
  
implementation
uses
  main;

procedure SendString(const identifynumber : Integer; AStr : String);
var
  HRDEngin : HWND;
  DataStruc : TCopyDataStruct;
begin
  HRDEngin := FindWindow(nil, 'HRDEngine 1.0');
  if HRDEngin = 0 then Exit;

  with DataStruc do                     // http://www.swissdelphicenter.ch/en/showcode.php?id=1242
  begin
    dwData := identifynumber;           // may use a value do identify content of message
    cbData := StrLen(PChar(AStr)) + 1;          // Need to transfer terminating #0 as well
    lpData := PChar(AStr)
  end;
  
  SendMessage(HRDEngin, WM_COPYDATA, 0, LPARAM(@DataStruc));
end;


procedure hrdParamParser;
var
  i : Integer;
begin
  JUID := ',' + JUID + ',';
  for i := Low(hrdParam.items) to High(hrdParam.items) do
  begin
    hrdParam.items[i] := HTTPDecode(StrGrab(JUID, ',', ',', i));
  end;
end;


procedure hrdSetStatus(const aState: TStatusCode; const aPercent : Integer);
var
  FileName : String;
  Show : String;
begin
  Sleep(100);
  FileName := ExtractFileName(ParamStr(0));
  FileName := ChangeFileExt(FileName, '');
  Show := FileName+ ': aState:['+ IntToStr(Ord(aState))+ '], aPercent:['+ IntToStr(aPercent) + ']';
  Writeln(Show);
  SendString(0, Show);
end;


procedure hrdSetResults(const aExistNext : Boolean);
var
  i: Integer;
  Show : String;
begin
  if not aExistNext then 
  begin
    Inc(RecordCount);
    for i := Low(hrdResult.items) to High(hrdResult.items) do
    begin
      Show := ' - Result [' + FillStrLeft(IntToStr(i), 2, '0') + '] : ' + hrdResult.items[i];
      Writeln(Show);
      SendString(1, Show);
    end;
  end;
end;

  
procedure hrdCheckError(const aErrCode: HResult; const aErrConst: array of Boolean);
var
  i: Integer;
begin
  if FLastError <> S_OK then exit; 
  for i := Low(aErrConst) to High(aErrConst) do
  begin
    if not aErrConst[i] then
    begin
      FLastError := aErrCode;
      break;
    end;
  end;
end;

  
function hrdOccurError: Boolean;
begin
  Result := Failed(FLastError);
end;


procedure Run;
var
  ErrorCode: HResult;
begin
  hrdSetStatus(HRD_STATE_BEGIN, 0);
  
  hrdParamParser;

  while True do
  begin
    ErrorCode := OnInit;    
    if Failed(ErrorCode) and Succeeded(FLastError) then FLastError := ErrorCode;
    if Failed(FLastError) then break;

    ErrorCode := OnParam;
    if Failed(ErrorCode) and Succeeded(FLastError) then FLastError := ErrorCode;
    if Failed(FLastError) then break;

    ErrorCode := OnLogin;
    if Failed(ErrorCode) and Succeeded(FLastError) then FLastError := ErrorCode;
    if Failed(FLastError) then break;

    ErrorCode := OnEnter;
    if Failed(ErrorCode) and Succeeded(FLastError) then FLastError := ErrorCode;
    if Failed(FLastError) then break;

    ErrorCode := OnExecute;
    if Failed(ErrorCode) and Succeeded(FLastError) then FLastError := ErrorCode;
    if Failed(FLastError) then break;

    ErrorCode := OnResult;
    if Failed(ErrorCode) and Succeeded(FLastError) then FLastError := ErrorCode;
    if Failed(FLastError) then break;

    break;
  end;
    
  ErrorCode := OnFinal;
  if Failed(ErrorCode) and Succeeded(FLastError) then FLastError := ErrorCode;
  //if Failed(FLastError) then exit;
  
  hrdSetStatus(HRD_STATE_DONE, 100);

  Writeln('RecordCount : ', inttoStr(RecordCount));
  SendString(1, 'RecordCount : ' + inttoStr(RecordCount));
  
  Writeln('FLastError : ', inttohex(FLastError, 8));
  SendString(1, 'FLastError : ' + inttohex(FLastError, 8));
end;

end.
