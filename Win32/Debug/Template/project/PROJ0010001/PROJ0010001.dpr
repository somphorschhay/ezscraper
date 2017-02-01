program PROJ0010001;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  hrdBase;
begin
  try
  
	JUID := ParamStr(1);

	run;

  Readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
