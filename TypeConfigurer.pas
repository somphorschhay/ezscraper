unit TypeConfigurer;

interface
uses
  System.SysUtils, hrdutils, Strutils, Types, Filemanip, Dateutils, Vcl.Dialogs, IniFiles;

function getInputParam : TStringDynArray;
function getOutputParam : TStringDynArray;
function getResultCode : TStringDynArray;
function saveInputParam (params : TStringDynArray) : boolean;
function saveOutputParam (params : TStringDynArray) : boolean;
function saveResultCode (resultcode, code : string; resulttype : integer) : boolean;
function updateInputParam(oldone, newone : TStringDynArray) : boolean;
function updateOutputParam(oldone, newone : TStringDynArray) : boolean;
function updateResultCode(oldone, newone : string) : boolean;
function deleteType(typearray : TStringDynArray) : boolean;
function isExistType(typename : string) : boolean;
function isValidType(typename:string):boolean;
function isExistCode(code: string) : boolean;
function isExistResultPair(resultpair : string) : boolean;
function getTypeLocation : string;
function getAllStringFromType : string;
function getTypeWholeLine(typename:string) : string;
implementation
const
  tab = #9 + #9 +#9 + #9 + #9 + #9 + #9 + #9;
function getInputParam(): TStringDynArray;
var
  AllText: string;
  urlSplit: TStringDynArray;
  i : integer;
begin
  alltext := getAllStringFromType;
  Alltext := StrGrab(AllText, '// Param Input', '// Result');
  urlSplit := SplitString(alltext, #13#10);

  for I := Low(urlsplit) to High(urlsplit) do
  begin
    if ContainsStr(urlsplit[i], '=') then
    begin
      SetLength(result, length(Result)+1);
      Result[High(result)] := trim(urlsplit[i]);
    end;
  end;
end;
function saveInputParam (params : TStringDynArray) : boolean;
var
  Replacer: TFileSearchReplace;
  toInsert : string;
  i : integer;
  isBlankAll : boolean;
const
  toBeReplaced = '// Param Input';
begin
  isBlankAll := true;
  toInsert := toBeReplaced + #13#10;
  for I := low(params) to high(params) do
  begin
    if trim(params[i]) = '' then
    begin
      continue;
    end;
    if isExistType(params[i]) then
    begin
     result := false;
     exit;
    end;
    if not isValidType(params[i]) then
    begin
      result := false;
      exit;
    end;
    isBlankAll := false;
  end;

  if isBlankAll then
  begin
    result := false;
    exit;
  end;

  for I := low(params) to high(params) do
  begin
    if trim(params[i]) <> '' then
    begin
      toInsert := toInsert + #13#10 + #9 + uppercase(params[i]) + tab + '=' + #9 + #9 + inttostr(i+1);
    end
    else
    begin
      toInsert := toInsert + #13#10 + #9 + '//input' + FormatDateTime('YYYYMMDDHHNNSSZZZ', Now) + inttostr(i+1) + tab + '=' + #9 + #9 + inttostr(i+1);
    end;
  end;
  toInsert := toInsert + #13#10;
  Replacer:=TFileSearchReplace.Create(getTypeLocation);
  try
    Replacer.Replace(toBeReplaced, toInsert, [rfReplaceAll]);
  finally
    Replacer.Free;
  end;
  result := true;
end;

function updateInputParam(oldone, newone : TStringDynArray) : boolean;
var
  Replacer: TFileSearchReplace;
  i : integer;
begin
  Replacer:=TFileSearchReplace.Create(getTypeLocation);
  try
    for I := low(oldone) to high(oldone) do
    begin
      if trim(newone[i]) = '' then
        Replacer.Replace(oldone[i], '//input' + FormatDateTime('YYYYMMDDHHNNSSZZZ', Now) + inttostr(i+1), [rfReplaceAll])
      else
        Replacer.Replace(oldone[i], newone[i], [rfReplaceAll]);
    end;
  finally
    Replacer.Free
  end;
end;

function getOutputParam() : TStringDynArray;
var
  AllText: string;
  urlSplit: TStringDynArray;
  i : integer;
begin
  AllText := getAllStringFromType;

  Alltext := StrGrab(AllText, '// Result Output', '// End of Result Output');
  urlSplit := SplitString(alltext, #13#10);

  for I := Low(urlsplit) to High(urlsplit) do
  begin
    if ContainsStr(urlsplit[i], '=') then
    begin
      SetLength(result, length(Result)+1);
      Result[High(result)] := trim(urlsplit[i]);
    end;
  end;
end;
function getResultCode() : TStringDynArray;
var
  AllText: string;
  urlSplit: TStringDynArray;
  i : integer;
begin
  AllText := getAllStringFromType;

  Alltext := StrGrab(AllText, '// Success Code', '// End of Error Code');
  urlSplit := SplitString(alltext, #13#10);
  for I := Low(urlsplit) to High(urlsplit) do
  begin
    if ContainsStr(urlsplit[i], '=') then
    begin
      SetLength(result, length(Result)+1);
      Result[High(result)] := trim(urlsplit[i]);
    end;
  end;
end;
function saveOutputParam (params : TStringDynArray) : boolean;
var
  Replacer: TFileSearchReplace;
  toInsert : string;
  i : integer;
  isBlankAll : boolean;
const
  toBeReplaced = '// Result Output';
begin
  isBlankAll := true;
  toInsert := toBeReplaced + #13#10;
  for I := low(params) to high(params) do
  begin
    if trim(params[i]) = '' then
    begin
      continue;
    end;
    if isExistType(params[i]) then
    begin
     result := false;
     exit;
    end;
    if not isValidType(params[i]) then
    begin
      result := false;
      exit;
    end;
    isBlankAll := false;
  end;

  if isBlankAll then
  begin
    result := false;
    exit;
  end;

  for I := low(params) to high(params) do
  begin
    if trim(params[i]) <> '' then
    begin
      toInsert := toInsert + #13#10 + #9 + uppercase(params[i]) + tab + '=' + #9 + #9 + inttostr(i+1);
    end
    else
    begin
      toInsert := toInsert + #13#10 + #9 + '//output' + FormatDateTime('YYYYMMDDHHNNSSZZZ', Now) + inttostr(i+1) + tab + '=' + #9 + #9 + inttostr(i+1);
    end;
  end;
  toInsert := toInsert + #13#10;
  Replacer:=TFileSearchReplace.Create(getTypeLocation);
  try
    Replacer.Replace(toBeReplaced, toInsert, [rfReplaceAll]);
  finally
    Replacer.Free;
  end;
  result := true;
end;
function saveResultCode (resultcode, code : string; resulttype : integer) : boolean;
var
  Replacer: TFileSearchReplace;
  toInsert : string;
  toBeReplaced : string;
  prefix : string;
begin
  if resulttype = 1 then
  begin
    toBeReplaced := '// Success Code';
    prefix := 'S_';
  end
  else if resulttype = 2 then
  begin
    toBeReplaced := '// Information Code';
    prefix := 'I_';
  end
  else if resulttype = 3 then
  begin
    toBeReplaced := '// Error Code';
    prefix := 'E_';
  end
  else
    exit;

  toInsert := toBeReplaced;

  if not isValidType(resultcode) then
  begin
    result := false;
    exit;
  end;

  if isExistType(prefix + resultcode) then
  begin
   result := false;
   exit;
  end;

  if isExistCode(code) then
  begin
    result := false;
    exit;
  end;

  if trim(resultcode) <> '' then
  begin
    toInsert := toInsert + #13#10 + #9 + uppercase(prefix + resultcode) + #9 + ': HResult' + tab + tab + '=' + #9 + #9 + 'HResult(' + code + ');';
  end
  else
  begin
    exit;
  end;
  //toInsert := toInsert + #13#10;
  Replacer:=TFileSearchReplace.Create(getTypeLocation);
  try
    Replacer.Replace(toBeReplaced, toInsert, [rfReplaceAll]);
  finally
    Replacer.Free;
  end;
  result := true;
end;

function updateOutputParam(oldone, newone : TStringDynArray) : boolean;
var
  Replacer: TFileSearchReplace;
  i : integer;
begin
  Replacer:=TFileSearchReplace.Create(gettypelocation);
  try
    for I := low(oldone) to high(oldone) do
    begin
      if trim(newone[i]) = '' then
        Replacer.Replace(oldone[i], '//output' + FormatDateTime('YYYYMMDDHHNNSSZZZ', Now) + inttostr(i+1), [rfReplaceAll])
      else
        Replacer.Replace(oldone[i], uppercase(newone[i]), [rfReplaceAll]);
    end;
  finally
    Replacer.Free
  end;
end;
function updateResultCode(oldone, newone : string) : boolean;
var
  Replacer: TFileSearchReplace;
  tobereplaced : string;
  newstr : TStringDynArray;
begin
  result := false;
  if not isExistResultPair(oldone) then
    exit;
  tobereplaced := getTypeWholeLine(splitstring(oldone, '|')[0]);
  Replacer:=TFileSearchReplace.Create(getTypeLocation);
  try
    Replacer.Replace(tobereplaced, '', [rfReplaceAll]);
  finally
    Replacer.Free
  end;
  newstr := splitstring(newone, '|');
  try
    result := saveResultCode(newstr[0], newstr[1], StrToInt(newstr[2]));
  finally
  end;

end;
function deleteType(typearray : TStringDynArray) : boolean;
var
  replacer : TFileSearchReplace;
  i : integer;
  todelete : string;
begin
  //showmessage(todelete);
  for i := Low(typearray) to High(typearray) do
  begin
    todelete := getTypeWholeLine(typearray[i]);
    Replacer:=TFileSearchReplace.Create(getTypeLocation);
    try
      replacer.Replace(todelete, '', [rfReplaceAll]);
    finally
      replacer.Free;
    end;
  end;
  result := true;
end;
function isExistType(typename : string):boolean;
var
  AllText, tmp: string;
begin
  AllText := getAllStringFromType;
  typename := uppercase(typename);
  if pos(typename, AllText) > 0  then
  begin
    tmp := MidStr(Alltext, pos(typename,Alltext)-1, length(typename)+2);
    tmp := trim(tmp);
    if pos(':', tmp) > 0 then
    begin
      if pos(':', tmp) = length(tmp) then
      begin
        tmp := LeftStr(tmp, length(tmp)-1);
      end
      else
      begin
        result := false;
        exit;
      end;
    end;

    if LowerCase(tmp) = lowercase(typename) then
    begin
      result := true;
      exit;
    end;
  end;
  result:=false;
end;
function isValidType(typename:string):boolean;
begin
  result := true;
  typename := trim(typename);
  if ContainsStr(typename, '&') then result := false;
  if ContainsStr(typename, ' ') then result := false;
  if ContainsStr(typename, '-') then result := false;
  if ContainsStr(typename, '+') then result := false;
  if ContainsStr(typename, '*') then result := false;
end;

function isExistCode(code : String ) : boolean;
var
  AllText, tmp: string;
begin
  AllText := getAllStringFromType;

  if pos(code, AllText) > 0  then
  begin
    tmp := MidStr(AllText, pos(code, AllText)+length(code), 1);
    if tmp = ')' then
    begin
      tmp := MidStr(Alltext, pos(code,Alltext)-8, 8);
      tmp := trim(tmp);
      //showmessage(tmp);
      if pos('HResult', tmp) > 0 then
      begin
        Result := true;
        exit;
      end;
    end;
  end;
  result:=false;
end;
function isExistResultPair(resultpair : string) : boolean;
var
  pair : TStringDynArray;
  alltext : string;
begin
  result := false;
  pair := splitstring(resultpair, '|');
  if not isExistType(trim(pair[0])) then
    exit;
  alltext := getAllStringFromType;
  alltext := StrGrab(alltext, pair[0], ';');
  alltext := strgrab(alltext, '(', ')');
  if alltext = pair[1] then
    result := true;
end;
function getTypeLocation : string;
var
  Fini : TIniFile;
  FileText : string;
begin
  Fini := TIniFile.Create(GetCurrentDir+'\CodeGenerator.INI');
  FileText := Fini.ReadString('Workspace','WorkspacePath','');
  result := FileText+'\common\HrdTypes.pas';
end;
function getAllStringFromType : string;
var
  Txt: TextFile;
  AllText, s: string;
begin
  alltext := '';
  AssignFile(Txt, getTypeLocation);
  Reset(Txt);
  while not Eof(Txt) do
  begin
    Readln(Txt, s);
    AllText := AllText + s + #13#10;
  end;
  CloseFile(Txt);
  result := alltext;
end;
function getTypeWholeLine(typename:string) : string;
var
  alltext : string;
  replacer : TFileSearchReplace;
begin
  alltext := getAllStringFromType;
  result := typename + StrGrab(alltext, typename, #13#10) + #13#10;
  {
  Replacer:=TFileSearchReplace.Create(getTypeLocation);
  try
    replacer.Replace(result, '', [rfReplaceAll]);
  finally
    replacer.Free;
  end;
  showmessage(result);
  }
end;
end.
