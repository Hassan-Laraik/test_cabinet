program test_cabinet;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, zcomponent, uGestionPatient, uPatient, uDM
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TFrmBestionPatient, FrmBestionPatient);
  Application.CreateForm(TFrmPatient, FrmPatient);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.

