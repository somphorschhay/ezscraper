program CodeGenerator;

uses
  Vcl.Forms,
  UnitCodeGenerator in 'UnitCodeGenerator.pas' {EZCodeGenerator},
  Vcl.Themes,
  Vcl.Styles,
  UnitResultCode in 'UnitResultCode.pas' {FormResultCode},
  UnitInputParam in 'UnitInputParam.pas' {FormInputParam},
  UnitResultOutput in 'UnitResultOutput.pas' {FormResultOutput},
  UnitCreateProject in 'UnitCreateProject.pas' {FormCreateProject},
  UnitCreateModule in 'UnitCreateModule.pas' {FormCreateModule},
  UnitABOUT in 'UnitABOUT.pas' {FormAboutBox},
  UnitWorkSpace in 'UnitWorkSpace.pas' {FormWorkspace},
  UnitFindText in 'UnitFindText.pas' {FormFind},
  UnitCompile in 'UnitCompile.pas' {FormCompile},
  FileManip in 'FileManip.pas',
  TypeConfigurer in 'TypeConfigurer.pas' {$R *.res},
  UnitHelp in 'UnitHelp.pas' {FormHelp};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Silver');

  Application.CreateForm(TEZCodeGenerator, EZCodeGenerator);
  Application.CreateForm(TFormResultCode, FormResultCode);
  Application.CreateForm(TFormInputParam, FormInputParam);
  Application.CreateForm(TFormResultOutput, FormResultOutput);
  Application.CreateForm(TFormCreateProject, FormCreateProject);
  Application.CreateForm(TFormCreateModule, FormCreateModule);
  Application.CreateForm(TFormAboutBox, FormAboutBox);
  Application.CreateForm(TFormWorkspace, FormWorkspace);
  Application.CreateForm(TFormFind, FormFind);
  Application.CreateForm(TFormCompile, FormCompile);
  Application.CreateForm(TFormHelp, FormHelp);
  Application.Run;
end.
