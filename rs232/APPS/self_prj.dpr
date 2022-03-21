program Self_prj;

uses
  Forms, 
  Display in 'display.pas',
  Self_pgm in 'Self_PGM.PAS' {Self},
  wsc32 in 'wsc32.pas';

{$R *.RES}

begin
  Application.CreateForm(TSelf, Self);
  Application.Run;
end.
