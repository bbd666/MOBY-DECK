unit Easy_pgm;

{*
** NAME: "Simple Terminal Program" (EASY_PGM & EASY_PRJ)
**
** TYPE: Win32 Delphi.
**
** DATE: January 28, 2009.
**
** PURPOSE: This program operates as a simple terminal program.
**          Compare to MESS_PGM.PAS and EVNT_PGM.PAS
*}

interface

uses
  Display,
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Menus,
  wsc32, keycode, ExtCtrls, StdCtrls;
type
  TEasy = class(TForm)
    MainMenu: TMainMenu;
    menuLine: TMenuItem;
    menuOnLine: TMenuItem;
    menuOffline: TMenuItem;
    menuExit: TMenuItem;
    menuChange: TMenuItem;
    menuPort: TMenuItem;
    menuBaud: TMenuItem;
    menuCOM1: TMenuItem;
    menuCOM2: TMenuItem;
    menuCOM3: TMenuItem;
    menuCOM4: TMenuItem;
    menu300: TMenuItem;
    menu1200: TMenuItem;
    menu2400: TMenuItem;
    menu4800: TMenuItem;
    menu9600: TMenuItem;
    menu19200: TMenuItem;
    menu38400: TMenuItem;
    menu57600: TMenuItem;
    Timer: TTimer;
    MemoMain: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure menuOnLineClick(Sender: TObject);
    procedure menuOfflineClick(Sender: TObject);
    procedure menuCOM1Click(Sender: TObject);
    procedure menuCOM2Click(Sender: TObject);
    procedure menuCOM3Click(Sender: TObject);
    procedure menuCOM4Click(Sender: TObject);
    procedure menuExitClick(Sender: TObject);
    procedure menu300Click(Sender: TObject);
    procedure menu1200Click(Sender: TObject);
    procedure menu2400Click(Sender: TObject);
    procedure menu4800Click(Sender: TObject);
    procedure menu9600Click(Sender: TObject);
    procedure menu19200Click(Sender: TObject);
    procedure menu38400Click(Sender: TObject);
    procedure menu57600Click(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure MyKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    Port : Integer;
    Baud : Integer;
    Parity : Integer;
    DataBits : Integer;
    StopBits : Integer;

  public
    { Public declarations }
  end ;

var
  Easy: TEasy;

implementation

{$R *.DFM}

procedure TEasy.FormCreate(Sender: TObject);
begin
 (* initialize parameters *)
  Port := COM1;
  Baud := WSC_Baud19200;
  Parity := WSC_NoParity;
  DataBits := WSC_WordLength8;
  StopBits := WSC_OneStopBit;
  (* initialize menu settings *)
  menuOffLine.Checked := true;
  menuCOM1.Checked := true;
  menu19200.Checked := true
end;

procedure TEasy.menuOnLineClick(Sender: TObject);
var
  Code : Integer;
begin
  (* pass the key code *)
  if SioKeyCode(WSC_KEY_CODE) < 0 then
    begin 
      DisplayLine(Easy.MemoMain,'ERROR: Bad Key Code!');
      exit      
    end; 
  (* initialize WSC *)
  Code := SioReset(Port,2048,1024);
  if Code < 0 then
    begin
      DisplayLine(Easy.MemoMain,Format('Error %d: Cannot reset port',[Code]));
      DisplayError(Easy.MemoMain, Code);
      exit
    end;
  (* update menu settings *)
  Easy.Caption := 'EASY: COM' + Chr($31+Port) + ' Online';
  menuOnLine.Checked := true;
  menuOffLine.Checked := false;
  menuChange.Enabled := false;
  (* set baud rate, parity, stop bits, & data bits *)
  SioBaud(Port,Baud);
  SioParms(Port, Parity, StopBits, DataBits);
  (* set DTR & turn on hardware flow control *)
  SioDTR(Port,'S');
  SioFlow(Port,'H');
  (* set TX timeouts to 1mSec/char + 2 seconds *) 
  SioSetTimeouts(Port,-1, 0, 0, 1, 2000);
  
  MemoMain.SetFocus
end;

procedure TEasy.menuOfflineClick(Sender: TObject);
begin
  Easy.Caption := 'EASY: Offline';
  DisplayString(Easy.MemoMain,'Shutting down COM port');
  menuOnLine.Checked := false;
  menuOffLine.Checked := true;
  menuChange.Enabled := true;
  SioDone(Port)
end;

procedure TEasy.menuCOM1Click(Sender: TObject);
begin
  menuCOM1.Checked := true;
  menuCOM2.Checked := false;
  menuCOM3.Checked := false;
  menuCOM4.Checked := false;
  Port := COM1
end;

procedure TEasy.menuCOM2Click(Sender: TObject);
begin
  menuCOM1.Checked := false;
  menuCOM2.Checked := true;
  menuCOM3.Checked := false;
  menuCOM4.Checked := false;
  Port := COM2
end;

procedure TEasy.menuCOM3Click(Sender: TObject);
begin
  menuCOM1.Checked := false;
  menuCOM2.Checked := false;
  menuCOM3.Checked := true;
  menuCOM4.Checked := false;
  Port := COM3
end;

procedure TEasy.menuCOM4Click(Sender: TObject);
begin
  menuCOM1.Checked := false;
  menuCOM2.Checked := false;
  menuCOM3.Checked := false;
  menuCOM4.Checked := true;
  Port := COM4
end;

procedure TEasy.menuExitClick(Sender: TObject);
begin
  SioDone(Port);
  Application.Terminate;
end;

procedure TEasy.menu300Click(Sender: TObject);
begin
  menu300.Checked := true;
  menu1200.Checked := false;
  menu2400.Checked := false;
  menu4800.Checked := false;
  menu9600.Checked := false;
  menu19200.Checked := false;
  menu38400.Checked := false;
  menu57600.Checked := false;
  Baud := WSC_Baud300
end;

procedure TEasy.menu1200Click(Sender: TObject);
begin
  menu300.Checked := false;
  menu1200.Checked := true;
  menu2400.Checked := false;
  menu4800.Checked := false;
  menu9600.Checked := false;
  menu19200.Checked := false;
  menu38400.Checked := false;
  menu57600.Checked := false;
  Baud := WSC_Baud1200
end;

procedure TEasy.menu2400Click(Sender: TObject);
begin
  menu300.Checked := false;
  menu1200.Checked := false;
  menu2400.Checked := true;
  menu4800.Checked := false;
  menu9600.Checked := false;
  menu19200.Checked := false;
  menu38400.Checked := false;
  menu57600.Checked := false;
  Baud := WSC_Baud2400
end;

procedure TEasy.menu4800Click(Sender: TObject);
begin
  menu300.Checked := false;
  menu1200.Checked := false;
  menu2400.Checked := false;
  menu4800.Checked := true;
  menu9600.Checked := false;
  menu19200.Checked := false;
  menu38400.Checked := false;
  menu57600.Checked := false;
  Baud := WSC_Baud4800
end;

procedure TEasy.menu9600Click(Sender: TObject);
begin
  menu300.Checked := false;
  menu1200.Checked := false;
  menu2400.Checked := false;
  menu4800.Checked := false;
  menu9600.Checked := true;
  menu19200.Checked := false;
  menu38400.Checked := false;
  menu57600.Checked := false;
  Baud := WSC_Baud9600
end;

procedure TEasy.menu19200Click(Sender: TObject);
begin
  menu300.Checked := false;
  menu1200.Checked := false;
  menu2400.Checked := false;
  menu4800.Checked := false;
  menu9600.Checked := false;
  menu19200.Checked := true;
  menu38400.Checked := false;
  menu57600.Checked := false;
  Baud := WSC_Baud19200
end;

procedure TEasy.menu38400Click(Sender: TObject);
begin
  menu300.Checked := false;
  menu1200.Checked := false;
  menu2400.Checked := false;
  menu4800.Checked := false;
  menu9600.Checked := false;
  menu19200.Checked := false;
  menu38400.Checked := true;
  menu57600.Checked := false;
  Baud := WSC_Baud38400
end;

procedure TEasy.menu57600Click(Sender: TObject);
begin
  menu300.Checked := false;
  menu1200.Checked := false;
  menu2400.Checked := false;
  menu4800.Checked := false;
  menu9600.Checked := false;
  menu19200.Checked := false;
  menu38400.Checked := false;
  menu57600.Checked := true;
  Baud := WSC_Baud57600
end;

procedure TEasy.TimerTimer(Sender: TObject);
const
  EV_RXCHAR = 1;
var
  I, Code : Integer;
  S : String;
  CharCount : Integer;
begin
  Timer.Enabled := False;
  {Gather all incoming}
  CharCount := 0;
  S := '';
  for I := 1 to 128 do
  begin
    Code := SioGetc(Port);
    if Code < 0 then break;
    {ignore CR}
    if Chr(Code) <> Chr(13) then
    begin
      {got character (other than CR)}
      Inc(CharCount);
      if Chr(Code) = Chr(10) then break;
      S := S + Chr(Code);
    end
  end; {for}
{display}
if CharCount > 0 then
begin
  DisplayString(Easy.MemoMain,S);
  if Chr(Code) = Chr(10) then DisplayChar(Easy.MemoMain,Chr(10));
end;
{efficiently wait for more data}
Code := SioEventWait(Port, EV_RXCHAR, 250);
Timer.Interval := 1;
Timer.Enabled := True;
end;

procedure TEasy.MyKeyPress(Sender: TObject; var Key: Char);
begin
  SioPutc(Port,Key)
end;

end.
