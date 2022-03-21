program Xmr_prj;

uses
  Forms,
  Display in 'display.pas',
  wsc32 in 'wsc32.pas',
  xym32 in 'xym32.pas',
  xmr_pgm in 'xmr_pgm.pas' {xmr};

{$R *.RES}

begin
  Application.CreateForm(Txmr, xmr);
  Application.Run;
end.
