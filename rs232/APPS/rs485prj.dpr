program rs485prj;

uses
  Forms,
  Rs485PGM in 'Rs485PGM.pas' {RS485},
  Display in 'display.pas',
  wsc32 in 'wsc32.pas';

{$R *.RES}

begin
  Application.CreateForm(TRS485, RS485);
  Application.Run;
end.
