unit main;

interface

uses
  SysUtils,
  HrdUtils, HrdTypes, hrdBase;

function OnInit: HRESULT;
function OnParam: HRESULT;
function OnLogin: HRESULT;
function onEnter: HRESULT;
function OnExecute: HRESULT;
function OnResult: HRESULT;
function OnFinal: HRESULT;

const
  Host: string = '';

var
  ResultStr, Query, Path: string;

implementation

function OnInit: HRESULT;
begin
  Result := E_HRD_UNKNOWN;

  hrdSetStatus(HRD_STATE_INIT, 5);

  Result := S_HRD_OK;
end;

function OnParam: HRESULT;
var
  x : double;
  value : TDateTime;
begin
  Result := E_HRD_UNKNOWN;

  hrdSetStatus(HRD_STATE_PARAM, 10);

  if hrdOccurError then begin Result := FLastError; Exit end;
  Result := S_HRD_OK;
end;

function OnLogin: HRESULT;
begin
  Result := E_HRD_UNKNOWN;

  hrdSetStatus(HRD_STATE_LOGIN, 20);

  Result := S_HRD_OK;
end;

function onEnter: HRESULT;
begin
  Result := E_HRD_UNKNOWN;

  hrdSetStatus(HRD_STATE_ENTER, 30);

  Result := S_HRD_OK;
end;

function OnExecute: HRESULT;
begin
  Result := E_HRD_UNKNOWN;

  hrdSetStatus(HRD_STATE_EXECUTE, 40);

  Result := S_HRD_OK;
end;

function OnResult: HRESULT;
var
  i : Int8;
begin
  Result := E_HRD_UNKNOWN;

  hrdSetStatus(HRD_STATE_RESULT, 70);

  while True do
  begin
    inc(i);

    //custom check to break here
    if i = 10 then Break; 

    hrdSetResults(False);

  end;
  
  Result := S_HRD_OK;
end;

function OnFinal: HRESULT;
begin
  Result := E_HRD_UNKNOWN;

  hrdSetStatus(HRD_STATE_FINAL, 99);

  Result := S_HRD_OK;
end;

end.


