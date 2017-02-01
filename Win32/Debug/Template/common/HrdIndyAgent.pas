unit HrdIndyAgent;

interface
  uses
    Classes,
    IdHTTP,IdIOHandlerSocket, IdCompressorZLib,IdCookieManager,
    HrdUtils;
  type
    THrdIndyAgent = class
    private
      FAgent : TIdHTTP;
      idCompressor : TIdCompressorZLib;
      FCookieManager : TIdCookieManager;
      FResultStr : String;
      FRedirectURL : String;
      FCookies : String;
      isSetCookie : Boolean;
      function Get(url: string):Boolean;
      function Post(url: string; query: string):Boolean;
      procedure Split (const Delimiter: Char; Input: string; const Strings: TStrings) ;
      procedure resetHeader();
      procedure onRedirectEvent(Sender: TObject; var dest: String; var NumRedirect: Integer; var Handled: Boolean; var VMethod: String);
    public
      constructor Create();
      procedure setHeader(key: string; value: string);
      //procedure setHeaders( strHeaders: string);
      procedure setCookie(key: string; value: string);
      function connect(url: string): Boolean; overload;
      function connect(url: string; queryStr: string): Boolean; overload;
      function getHeader(key: string): string;
      function getHeaders: string;
      function getCookie(key: string): string;
      function getCookies: string;
      property ResultStr: string read FResultStr write FResultStr;
      property RedirectURL: string read FRedirectURL write FRedirectURL;

  end;

implementation
  uses
  StrUtils, SysUtils,
  IdIOHandler, IdIOHandlerStack, IdSSL,
  IdSSLOpenSSL, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdCookie, IdURI,
  IdExceptionCore, IdStack, IdHTTPHeaderInfo;

  {Indy Agent Implementation code}

constructor THrdIndyAgent.Create();
begin
  try
    FAgent := TIdHTTP.Create(nil);
    FCookieManager := TIdCookieManager.Create(nil);
    FAgent.CookieManager := FCookieManager;
    FAgent.IOHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
    FAgent.OnRedirect := onRedirectEvent;
    idCompressor :=  TIdCompressorZLib.Create(nil);

    FAgent.Compressor := idCompressor;
    FAgent.HandleRedirects := True;
    FAgent.AllowCookies := True;
    resetHeader;
  except

  end;
  {code here}
end;

function THrdIndyAgent.Get(url: string):Boolean;
var
  ResponseStream : TStringStream;
begin
  try

    ResponseStream := TStringStream.Create('');
    Writeln(FAgent.Request.RawHeaders.Text);
    FAgent.Get(url,ResponseStream);
    ResultStr := ResponseStream.DataString;
    Result := True;

  except
    on E: EIdHTTPProtocolException do
    begin
      Result := False;
    end;
    on E: EIdSocketError do
    begin
      Result := False;
    end;
    on E: EIdReadTimeout do
    begin
      Result := False;
    end;
    on E: EIdConnectTimeout do
    begin
      Result := False;
    end;
  end;
end;


function THrdIndyAgent.Post(url: string; query: string):Boolean;
var
  ResponseStream: TStringStream;
  QueryStream: TStringStream;
begin
  try
    ResponseStream := TStringStream.Create('');
    QueryStream := TStringStream.Create('');
    QueryStream.WriteString(query);

    FAgent.Post(url, QueryStream, ResponseStream);
    ResultStr := ResponseStream.DataString;
    Result := True;
  except
    on E: EIdHTTPProtocolException do
    begin
      Result := False;
    end;
    on E: EIdSocketError do
    begin
      Result := False;
    end;
    on E: EIdReadTimeout do
    begin
      Result := False;
    end;
    on E: EIdConnectTimeout do
    begin
      Result := False;
    end;
  end;
end;

procedure THrdIndyAgent.Split (const Delimiter: Char; Input: string; const Strings: TStrings) ;
begin
  Assert(Assigned(Strings)) ;
  Strings.Clear;
  Strings.Delimiter := Delimiter;
  Strings.DelimitedText :=  '"' + StringReplace(Input, Delimiter, '"' + Delimiter + '"', [rfReplaceAll]) + '"' ;
end;

procedure ThrdIndyAgent.resetHeader;
begin
  // Back Up Cookie Request Header
  FCookies := FAgent.Request.RawHeaders.Values['Cookie'];
  // Reset Headers
  FAgent.Request.Clear;
  FAgent.Request.CustomHeaders.Clear;

  // Set Default Header
  FAgent.Request.UserAgent   := 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36';
  FAgent.Request.Accept      := 'image/gif, image/jpeg, image/pjpeg, image/pjpeg, application/x-shockwave-flash, application/x-ms-application, '
                              + 'application/x-ms-xbap, application/vnd.ms-xpsdocument, application/xaml+xml, application/vnd.ms-powerpoint, '
                              + 'application/vnd.ms-excel, application/msword, */*';

  FAgent.Request.Connection  := 'Keep-Alive';
  FAgent.Request.ContentType := 'application/x-www-form-urlencoded';

end;

procedure THrdIndyAgent.setHeader(key: string; value: string);
begin
  try
    if key = 'User-Agent' then
       FAgent.Request.UserAgent := value
    else if key ='Accept' then
       FAgent.Request.Accept := value
    else if key = 'Accept-Encoding' then
       FAgent.Request.AcceptEncoding := value
    else if key = 'Accept-CharSet' then
       FAgent.Request.AcceptCharSet := value
    else if key = 'Accept-Language' then
       FAgent.Request.AcceptLanguage := value
    else if key = 'CharSet' then
       FAgent.Request.CharSet := value
    else if key = 'Referer' then
       FAgent.Request.Referer := value
    else if key = 'Content-Type' then
       FAgent.Request.ContentType := value
    else if key = 'Host' then
       FAgent.Request.Host := value
    else if key = 'Contend-Encoding' then
       FAgent.Request.ContentEncoding := value
    else if key = 'Transfer-Encoding' then
       FAgent.Request.TransferEncoding := value
    else
    begin
      FAgent.Request.CustomHeaders.AddValue(key,value)
    end;
  except
  end;
end;
(*
procedure THrdIndyAgent.setHeaders(strHeaders: string);
var
  stringList: TStringList;
  i: Integer;
begin

  stringList := TStringList.Create;
  Split(#13,strHeaders, stringList);

  for i:=0 to stringList.Count - 1 do
  begin
    setHeader(
      Trim(leftStr(Trim(stringList[i]),Pos(':',trim(stringList[i]))-1)),
      Trim(RightStr(Trim(stringList[i]),Length(stringList[i]) - pos(':',Trim(stringList[i]))-1))
    );
  end;
  stringList.Clear;
end;
}
{
procedure THrdIndyAgent.setCookie(key: string; value: string);
var
  cookie, cookies, tempStr : string;
  position : integer;
begin
 isSetCookie := true;
 cookie := key + '=' + value;
 if FCookies = '' then
 begin
    FAgent.Request.CustomHeaders.AddValue('Cookie', cookie);
    Exit;
 end
 else
 begin
  // Check key position
  position := Pos(key, FCookies);

  // Replace and override cookie with value
  if position > 0 then
  begin
    tempStr := Copy(FCookies, position, Length(FCookies) - position + 1);
    if(Pos(';', tempStr) > 0) then
    begin
      tempStr := Copy(tempStr, 1, Pos(';', tempStr));
      cookie  := StrReplace(FCookies, tempStr, key + '=' + value + ';',true);
    end
    else
    begin
      tempStr := Copy(tempStr, 1, Length(tempStr) + 1);
      cookie  := StrReplace(FCookies,tempStr,key + '=' + value ,true);
    end;
  end
  // Insert new cookie
  else
  begin
    if FCookies <> '' then
    begin
      cookie := FCookies + ';' + key + '=' + value;
    end
    else
    begin
      cookie := key + '=' + value;
    end;
  end;
 end;
 FAgent.CookieManager.CookieCollection.clear;
 FAgent.Request.CustomHeaders.Values['Cookie'] := cookie;//('Cookie', cookie);
 {code here}
end;
*)
procedure THrdIndyAgent.setCookie(key: string; value: string);
var
  cookie : TIdCookie;
  uri : TIdURI;
begin
  cookie := TIdCookie.Create(nil);
  uri    := TIdURI.Create('http://www.camhr.com');
  cookie.CookieName := key;

  FCookieManager.CookieCollection.AddCookie(cookie,uri,True);
end;
function THrdIndyAgent.connect(url: string): Boolean;
begin
    Result := Get(url);
    resetHeader;
end;


function THrdIndyAgent.connect(url: string; queryStr: string): Boolean;
begin
    Result := Post(url, queryStr);
    resetHeader;
end;


function THrdIndyAgent.getHeader(key: string): string;
begin
 {code here}
 Result := '';
end;


function THrdIndyAgent.getHeaders: string;
begin
 {code here}
 Result := '';
end;


function THrdIndyAgent.getCookie(key: string): string;
begin
 try
 except
 end;
 {code here}
 Result := '';
end;


function THrdIndyAgent.getCookies: string;
var
  cookies: string;
  i, count: integer;
begin
 try
    count := FAgent.CookieManager.CookieCollection.Count;
    if count > 0 then
    begin
      for i:=0 to count - 1 do
      begin
        cookies := cookies + FAgent.CookieManager.CookieCollection.Cookies[i].CookieName
                 + '='
                 + FAgent.CookieManager.CookieCollection.Cookies[i].CookieText
                 + ';'
                 ;
      end;
    end
 except
 end;
 Result := cookies;
end;

procedure THrdIndyAgent.onRedirectEvent(Sender: TObject; var dest: String; var NumRedirect: Integer; var Handled: Boolean; var VMethod: String);
begin
  RedirectURL := dest;

end;
{ End Indy Agent Implementation code }

end.


