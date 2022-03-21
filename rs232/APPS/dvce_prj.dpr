program Dvce_prj;

uses
  Forms,
  wsc32 in 'WSC32.PAS',
  Display in 'DISPLAY.PAS',
  Dvce_pgm in 'DVCE_PGM.PAS' {Form1};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
