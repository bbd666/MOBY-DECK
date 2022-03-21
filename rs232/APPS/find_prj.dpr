program Find_prj;

uses
  Forms,
  Find_pgm in 'FIND_PGM.PAS' {Find},
  wsc32 in 'WSC32.PAS',
  Display in 'DISPLAY.PAS';

{$R *.RES}

begin
  Application.CreateForm(TFind, Find);
  Application.Run;
end.
