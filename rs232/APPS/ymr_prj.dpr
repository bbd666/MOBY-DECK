program Ymr_prj;

uses
  Forms,
  Display in 'display.pas',
  wsc32 in 'wsc32.pas',
  xym32 in 'xym32.pas',
  ymr_pgm in 'ymr_pgm.pas' {ymr};

{$R *.RES}

begin
  Application.CreateForm(Tymr, ymr);
  Application.Run;
end.
