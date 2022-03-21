program Easy_prj;

uses
  Forms,
  Easy_pgm in 'EASY_PGM.PAS' {Easy},
  Display in 'display.pas',
  wsc32 in 'wsc32.pas';

{$R *.RES}

begin
  Application.CreateForm(TEasy, Easy);
  Application.Run;
end.
