program ProjectNewtonDom;

uses
  Forms,
  newton_oscar in 'newton_oscar.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
