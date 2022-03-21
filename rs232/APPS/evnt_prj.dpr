program Evnt_prj;

uses
  Forms,
  Evnt_pgm in 'EVNT_PGM.PAS' {Evnt},
  Display in 'display.pas',
  wsc32 in 'wsc32.pas';

{$R *.RES}

begin
  Application.CreateForm(TEvnt, Evnt);
  Application.Run;
end.
