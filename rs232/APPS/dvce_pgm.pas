unit Dvce_pgm;

{*
** NAME: "Simple Terminal Program" (DVCE_PGM & DVCE_PRJ)
**
** TYPE: Win32 Delphi.
**
** DATE: January 28, 2009.
**
** PURPOSE: This program sends a command string (followed by a CR) 
**          to a serial device, then gets a response.
*}

interface

uses
  wsc32, keycode, Display,
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    ePort: TEdit;
    eBaud: TEdit;
    Label3: TLabel;
    eString: TEdit;
    bSend: TButton;
    bExit: TButton;
    eResult: TMemo;
    Timer1: TTimer;
    Timer2: TTimer;
    procedure bSendClick(Sender: TObject);
    procedure bExitClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Port : Integer;
    SendIdx : Integer;
    SendLen : Integer;
    SendMe : String;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.bSendClick(Sender: TObject);
var
  Code : Integer;
  Baud : LongInt;
begin
  { send string }
  VAL(ePort.Text,Port,Code);
  if Code <> 0 then
    begin
      DisplayLine(form1.eResult,'Bad <Port> value');
      exit
    end;
  { COM1 has value 0 }
  Port := Port - 1;
  If Port < COM1 then
    begin
      DisplayLine(form1.eResult,'<Port> out of range');
      exit
    end;
  VAL(eBaud.Text,Baud,Code);
  if Code <> 0 then
    begin
      DisplayLine(form1.eResult,'Bad <Baud> value');
      exit
    end;
  DisplayLine(form1.eResult,Format('Port : COM%1d',[1+Port]));
  DisplayLine(form1.eResult,Format('Baud : %d',[Baud]));
  DisplayLine(form1.eResult,Format('Text : "%s"',[eString.Text]));
  { pass the key code }
  if SioKeyCode(WSC_KEY_CODE) < 0 then
    begin 
      DisplayLine(form1.eResult,'ERROR: Bad Key Code!');
      exit      
    end;  
  { open the port }
  Code := SioReset(Port, 1024, 1024);
  if Code < 0 then
    begin
      DisplayLine(form1.eResult,'Cannot open serial port');
      exit
    end;
  Code := SioBaud(Port, Baud);
  Code := SioDTR(Port, 'S');
  Code := SioRTS(Port, 'S');
  { save string to send }
  SendMe := Chr(13) + eString.Text + Chr(13);
  SendLen := Length(eString.Text) + 2;
  SendIdx := 1;
  { Timer1 transmits the characters in 'Sendme' }
  { at the rate of one character each 125 milliseconds }
  Timer1.Interval := 125;
  Timer1.Enabled := true;
  { use timer2 to stop timer1 after 2 seconds }
  Timer2.Interval := 2000;
  Timer2.Enabled := true;
  bSend.Enabled := false
end;

procedure TForm1.bExitClick(Sender: TObject);
begin
  { exit }
  SioDone(Port);
  Application.Terminate;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  Code : Integer;
  C : Char;
begin
  { any incoming ? }
  Code := SioGetc(Port);
  if Code >= 0 then DisplayChar(form1.eResult,Chr(Code));
  { got anything to send ? }
  if SendLen > 0 then
    begin
      { send next character }
      C := SendMe[SendIdx];
      SioPutc(Port, C);
      Inc(SendIdx);
      if SendIdx > SendLen then SendLen := 0
    end
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
  { disable Timer2 }
  Timer2.Enabled := false;
  { disable Timer1 }
  Timer1.Enabled := false;
  { close port }
  bSend.Enabled := true;
  MessageBeep(0);
  SioDone(Port)
end;

end.
