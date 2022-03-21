program Ver_prj;

uses
  Forms,
  wsc32 in 'WSC32.PAS',
  Display in 'DISPLAY.PAS',
  Ver_pgm in 'VER_PGM.PAS' {ver};

{$R *.RES}

begin
  Application.CreateForm(Tver, ver);
  Application.Run;
end.
