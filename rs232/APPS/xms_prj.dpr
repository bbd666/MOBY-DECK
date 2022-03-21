program Xms_prj;

uses
  Forms,
  Display in 'display.pas',
  wsc32 in 'wsc32.pas',
  xym32 in 'xym32.pas',
  xms_pgm in 'xms_pgm.pas' {xms};

{$R *.RES}

begin
  Application.CreateForm(Txms, xms);
  Application.Run;
end.
