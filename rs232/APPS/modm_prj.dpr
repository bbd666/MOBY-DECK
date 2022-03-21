program Modm_prj;

uses
  Forms,
  Modm_pgm in 'Modm_PGM.PAS' {Modm},
  Display in 'display.pas',
  wsc32 in 'wsc32.pas';

{$R *.RES}

begin
  Application.CreateForm(TModm, Modm);
  Application.Run;
end.
