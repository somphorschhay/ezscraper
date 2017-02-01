unit HrdUtils;

interface

uses
  SysUtils, StrUtils, DateUtils, Math;

  function StrReplace(const S, OldPattern, NewPattern: string; IgnoreCase: boolean = false): string;
  function StrRemove(S: String; const AStrRemove: array of string; ignoreCase: Boolean = false): String;
  function StrGrab(S, AStart, AEnd: string; iIndex: Integer = 1; ignorecase : boolean = true): string;
  function DeleteDoubleSpace(const OldText: string): string;
  function StrCount(const Substring, Text: string): integer;

  function IsNumber(const S: String): Boolean;
  function IsCurrency(const S: String): Boolean;
  function IsModuleName(const S: String): Boolean;

  function IfThenStr(AValue: Boolean; const ATrue: string; AFalse: string = ''): string;
  function IfThenInt(AValue: Boolean; const ATrue: integer; AFalse: integer = 0) : integer;
  function IfBlankStr(ATrue, AFalse: string): String;

  function RemoveHTMLTag(S: string): string;
  function RemoveHTMLcomment(S: string): string;
  
  function FillStrLeft(S : String; aLength : Integer; c : Char = ' ') : string;
  function FillStrRight(S : String; aLength : Integer; c : Char = ' ') : string;
  
  function SaveToLog(const aData, aFileKeyName : string) : boolean;
  
implementation

function StrReplace(const S, OldPattern, NewPattern: string; IgnoreCase: boolean = false): string;
var
  OldPat,Srch: string; // Srch and Oldp can contain uppercase versions of S,OldPattern
  PatLength,NewPatLength,P,i,PatCount,PrevP: Integer;
  c,d: pchar;
  Flags: TReplaceFlags;
begin
  if IgnoreCase then Flags := [rfIgnoreCase, rfReplaceAll] else Flags := [rfReplaceAll];
  PatLength := Length(OldPattern);
  if PatLength = 0 then
  begin
    Result := S;
    exit;
  end;

  if rfIgnoreCase in Flags then
  begin
    Srch := AnsiUpperCase(S);
    OldPat := AnsiUpperCase(OldPattern);
  end else
  begin
    Srch := S;
    OldPat := OldPattern;
  end;

  PatLength := Length(OldPat);
  if Length(NewPattern) = PatLength then
  begin
    //Result length will not change
    Result := S;
    P := 1;
    repeat
      P := PosEx(OldPat, Srch, P);
      if P > 0 then begin
        for i := 1 to PatLength do
          Result[P+i-1] := NewPattern[i];
        if not (rfReplaceAll in Flags) then exit;
        inc(P, PatLength);
      end;
    until p = 0;
  end else begin
    //Different pattern length -> Result length will change
    //To avoid creating a lot of temporary strings, we count how many
    //replacements we're going to make.
    P := 1; PatCount := 0;
    repeat
      P := PosEx(OldPat, Srch, P);
      if P > 0 then begin
        inc(P, PatLength);
        inc(PatCount);
        if not (rfReplaceAll in Flags) then break;
      end;
    until p=0;
    if PatCount = 0 then
    begin
      Result := S;
      exit;
    end;
    NewPatLength := Length(NewPattern);
    SetLength(Result,Length(S)+PatCount*(NewPatLength-PatLength));
    P:=1; PrevP:=0;
    c := pchar(Result); d := pchar(S);
    repeat
      P := PosEx(OldPat, Srch, P);
      if P > 0 then
      begin
        for i := PrevP+1 to P-1 do begin
          c^ := d^;
          inc(c); inc(d);
        end;
        for i := 1 to NewPatLength do begin
          c^ := NewPattern[i];
          inc(c);
        end;
        if not (rfReplaceAll in Flags) then exit;
        inc(P, PatLength);
        inc(d, PatLength);
        PrevP := P-1;
      end else begin
        for i := PrevP+1 to Length(S) do begin
          c^ := d^;
          inc(c); inc(d);
        end;
      end;
    until p = 0;
  end;
end;


function StrRemove(S: String; const AStrRemove: array of string; ignoreCase: Boolean = false): String;
var
  i : integer;
begin
  for i := 0 to High(aStrRemove) do
  begin
    S := StrReplace(S, AStrRemove[i], '', ignoreCase);
  end;
  Result := S;
end;


function StrGrab(S, AStart, AEnd: string; iIndex : Integer = 1; ignorecase : boolean = true): string;
var
  Srch : string;
  Count, indexStart, indexEnd : Integer;
  LenAStart : Integer;
begin
  Result := '';
  if iIndex < 1 then exit;

  // AStart and AEnd Blank
  if (Length(AStart) = 0) and (Length(AEnd) = 0) then
    if iIndex = 1 then Result := S else Exit;


  // Check Lower Case Condition
  if not ignorecase then
  begin
    Srch := AnsiUpperCase(S);
    AStart := AnsiUpperCase(AStart);
    AEnd := AnsiUpperCase(AEnd);
  end else
  begin
    Srch := S;
  end;

  // Find index of AStart
  LenAStart := Length(AStart);
  indexStart := 1;
  if LenAStart > 0 then
  begin
    Count := 0;
    while Count < iIndex do
    begin
      indexStart := PosEx(AStart, Srch, indexStart) + LenAStart;
      if indexStart > LenAStart then begin
        Inc(Count);
      end else exit;
    end;
    if Count < iIndex then exit;
  end;

  // Find index of AEnd
  if Length(AEnd) > 0 then
  begin
    indexEnd := PosEx(AEnd, Srch, indexStart);
    if indexEnd <= 1 then Exit;
  end else
    indexEnd := Length(S) + 1;
  
  Result := Copy(S, indexStart, indexEnd - indexStart);  
end;


function DeleteDoubleSpace(const OldText: string): string;
var
  i : integer;
  s : string;
begin
  if length(OldText) > 0 then
    s := OldText[1]
  else
    s := '';
  for i:=1 to length(OldText) do
  begin
    if OldText[i] = ' ' then
    begin
      if not (OldText[i - 1] = ' ') then
        s := s + ' ';
    end else
    begin
      s := s + OldText[i];
    end;
  end;
  
  DeleteDoubleSpace := s;
end;


function StrCount(const Substring, Text: string): integer;
var
  offset: integer;
begin
  result := 0;
  offset := PosEx(Substring, Text, 1);
  while offset <> 0 do
  begin
    inc(result);
    offset := PosEx(Substring, Text, offset + length(Substring));
  end;
end;


function IsNumber(const S: String): Boolean;
var
  P: PChar;
begin
  Result := False;
  P      := PChar(S);
  while P^ <> #0 do
  begin
    if not (P^ in ['0'..'9']) then Exit;
    Inc(P);
  end;
  Result := True;
end;


function IsCurrency(const S: String): Boolean;
var
  P : PChar;
begin
  Result := False;
  P      := PChar(S);
  if p^ = '-' then inc(p);    // First Char Can be - sign
  if StrCount('.', S) > 1 then Exit; // accept only one .
  while P^ <> #0 do
  begin
    if not (P^ in ['0'..'9', '.']) then Exit;
    Inc(P);
  end;
  Result := True;
end;


function IsModuleName(const S: String): Boolean;
begin
  Result := false;
  if Length(S) <> 11 then exit;
  if Copy(S, 1, 4) <> 'PROJ' then exit;
  if not IsNumber(Copy(S, 5, 7)) then exit;
  Result := True;
end;


function IfThenStr(AValue: Boolean; const ATrue: string; AFalse: string = ''): string;
begin
  Result := IfThen(AValue, ATrue, AFalse);
end;


function IfThenInt(AValue: Boolean; const ATrue: integer; AFalse: integer = 0) : integer;
begin
  Result := IfThen(AValue, ATrue, AFalse);
end;


function IfBlankStr(ATrue, AFalse: string): String;
begin
  if ATrue <> '' then Result := ATrue else result := AFalse;
end;


function RemoveHTMLcomment(S: string): string;
var
  TagBegin, TagEnd, TagLength: integer;
begin
  TagBegin := PosEx('<!--', S, 1);              
  while (TagBegin > 0) do                
  begin
    TagEnd := PosEx('-->', S, TagBegin + 1);               
    TagLength := TagEnd - TagBegin + 1;
    Delete(S, TagBegin, TagLength + 2);      
    TagBegin := PosEx( '<!--', S, TagBegin - 1);             
  end;
  Result := S;                           
end;


function RemoveHTMLTag(S: string): string;
var
  TagBegin, TagEnd, TagLength: integer;
begin
  S := RemoveHTMLcomment(S);
  TagBegin := PosEx('<', S, 1);              
  while (TagBegin > 0) do                
  begin
    TagEnd := PosEx('>', S, TagBegin + 1);               
    TagLength := TagEnd - TagBegin + 1;
    Delete(S, TagBegin, TagLength);      
    TagBegin := PosEx( '<', S, TagBegin - 1);             
  end;
  Result := S;                           
end;


function FillStrLeft(S : String; aLength : Integer; C : Char = ' ') : string;
var
  i : Integer;
begin
  aLength := aLength - Length(S);
  for i := 1 to aLength do
    Insert(C, S, 1);

  Result := S;
end;


function FillStrRight(S : String; aLength : Integer; C : Char = ' ') : string;
var
  i : Integer;
begin
  aLength := aLength - Length(S);
  for i := 1 to aLength do 
    S := S + C;

  Result := S;
end;


function SaveToLog(const aData, aFileKeyName : string) : boolean;
var
  FileName : String;
  myFile : TextFile;
  Path : String;
begin
  Result := False;
  Path := 'D:\workspace_hrd\plugins\log';
  if not DirectoryExists(Path) then CreateDir(Path);
  
  FileName := Path + '\' + ChangeFileExt(ExtractFileName(ParamStr(0)), '');
  FileName := FileName + '_' + aFileKeyName + '_' + FormatDateTime('YYYYMMDD_HHNNSS_ZZZ', Now) + '.txt'; 

  AssignFile(myFile, FileName);
  Rewrite(myFile);
  Writeln(myFile, aData);
  CloseFile(myFile);
    
  Result := True;
end;

end.
