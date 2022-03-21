program Term_prj;

uses
  Forms,
  Display in 'display.pas',
  wsc32 in 'wsc32.pas',
  mio32 in 'mio32.pas',
  xym32 in 'xym32.pas',
  asd32 in 'asd32.pas',
  Term_Pgm in 'term_pgm.pas' {Term};

{$R *.RES}

begin
  Application.CreateForm(TTerm, Term);
  Application.Run;
end.
