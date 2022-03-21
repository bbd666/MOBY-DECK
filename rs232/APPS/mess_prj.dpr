program Mess_prj;

uses
  Forms,
  Mess_pgm in 'Mess_PGM.PAS' {Mess},
  Display in 'display.pas',
  wsc32 in 'wsc32.pas';

{$R *.RES}

begin
  Application.CreateForm(TMess, Mess);
  Application.Run;
end.
