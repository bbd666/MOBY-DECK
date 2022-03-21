program Yms_prj;

uses
  Forms,
  Display in 'display.pas',
  wsc32 in 'wsc32.pas',
  xym32 in 'xym32.pas',
  yms_pgm in 'yms_pgm.pas' {yms};

{$R *.RES}

begin
  Application.CreateForm(Tyms, yms);
  Application.Run;
end.
