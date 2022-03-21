unit Mess_pgm;

{*
** NAME: "Message Program" (MESS_PGM & MESS_PRJ)
**
** TYPE: Win32 Delphi.
**
** DATE: January 28, 2009.
**
** PURPOSE: This program operates as a simple terminal program
**          in which Windows messages are use to signal the
**          arrival of incoming data.
*}

interface

uses
  Display,
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Menus,
  wsc32, keycode, ExtCtrls, StdCtrls;
type
  TMess = class(TForm)
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
    MemoMain: TMemo;
    Button1: TButton;
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
    procedure GetIncoming(Sender: TObject);
    procedure MyKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure Button1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    Port : Integer;
    Baud : Integer;
    Parity : Integer;
    DataBits : Integer;
    StopBits : Integer;
  end ;

const
  WM_LBUTTONDOWN = $0201;
  EV_RXCHAR = $0001;

var
  Mess: TMess;

implementation

{$R *.DFM}

procedure TMess.FormCreate(Sender: TObject);
begin
 { initialize parameters }
  Port := COM1;
  Baud := WSC_Baud19200;
  Parity := WSC_NoParity;
  DataBits := WSC_WordLength8;
  StopBits := WSC_OneStopBit;
  { initialize menu settings }
  menuOffLine.Checked := true;
  menuCOM1.Checked := true;
  menu19200.Checked := true;
  { move Button1 so use can't push it }
  Button1.Left := 900;
  MemoMain.Refresh
end;

procedure TMess.menuOnLineClick(Sender: TObject);
var
  Code : Integer;
begin
  { pass the key code }
  if SioKeyCode(WSC_KEY_CODE) < 0 then
    begin 
      DisplayLine(Mess.MemoMain,'ERROR: Bad Key Code!');
      exit      
    end; 
  { initialize WSC }
  Code := SioReset(Port,2048,2048);
  if Code < 0 then
    begin
      DisplayString(Mess.MemoMain,Format('Error %d: Cannot reset port',[Code]));
      DisplayError(Mess.MemoMain, Code);
      exit
    end;
  { update menu settings }
  Mess.Caption := 'MESS: COM' + Chr($31+Port) + ' Online';
  menuOnLine.Checked := true;
  menuOffLine.Checked := false;
  menuChange.Enabled := false;
  SioBaud(Port,Baud);
  SioParms(Port, Parity, StopBits, DataBits);
  SioDTR(Port,'S');
  SioRTS(Port,'S');
  MemoMain.SetFocus;
  { request message from WSC upon arrival of serial data }
  SioMessage(Port, Button1.Handle, WM_LBUTTONDOWN, EV_RXCHAR)
end;

procedure TMess.menuOfflineClick(Sender: TObject);
begin
  Mess.Caption := 'MESS: Offline';
  DisplayString(Mess.MemoMain,'Shutting down COM port');
  menuOnLine.Checked := false;
  menuOffLine.Checked := true;
  menuChange.Enabled := true;
  SioDone(Port)
end;

procedure TMess.menuCOM1Click(Sender: TObject);
begin
  menuCOM1.Checked := true;
  menuCOM2.Checked := false;
  menuCOM3.Checked := false;
  menuCOM4.Checked := false;
  Port := COM1
end;

procedure TMess.menuCOM2Click(Sender: TObject);
begin
  menuCOM1.Checked := false;
  menuCOM2.Checked := true;
  menuCOM3.Checked := false;
  menuCOM4.Checked := false;
  Port := COM2
end;

procedure TMess.menuCOM3Click(Sender: TObject);
begin
  menuCOM1.Checked := false;
  menuCOM2.Checked := false;
  menuCOM3.Checked := true;
  menuCOM4.Checked := false;
  Port := COM3
end;

procedure TMess.menuCOM4Click(Sender: TObject);
begin
  menuCOM1.Checked := false;
  menuCOM2.Checked := false;
  menuCOM3.Checked := false;
  menuCOM4.Checked := true;
  Port := COM4
end;

procedure TMess.menuExitClick(Sender: TObject);
begin
  SioDone(Port);
  Application.Terminate;
end;

procedure TMess.menu300Click(Sender: TObject);
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

procedure TMess.menu1200Click(Sender: TObject);
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

procedure TMess.menu2400Click(Sender: TObject);
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

procedure TMess.menu4800Click(Sender: TObject);
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

procedure TMess.menu9600Click(Sender: TObject);
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

procedure TMess.menu19200Click(Sender: TObject);
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

procedure TMess.menu38400Click(Sender: TObject);
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

procedure TMess.menu57600Click(Sender: TObject);
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

procedure TMess.MyKeyPress(Sender: TObject; var Key: Char);
begin
  { transmit the byte }
  SioPutc(Port, Key);
  { gather all available incoming data }
  GetIncoming(Mess);
  MemoMain.SetFocus
end;

procedure TMess.Button1Click(Sender: TObject);
begin
  {SioPutc(Port,Key)}
end;

procedure TMess.GetIncoming(Sender: TObject);
var
  I, Code : Integer;
  S : String;
  CharCount : Integer;
begin
  repeat
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
      DisplayString(Mess.MemoMain,S);
      if Chr(Code) = Chr(10) then DisplayChar(Mess.MemoMain,Chr(10));
    end
  until CharCount = 0
end;

{ Button1MouseDown is called when it receives a message from WSC32.DLL }

procedure TMess.Button1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   { Button1 Down }
   GetIncoming(Mess);
   { request message from WSC upon arrival of more serial data }
   SioMessage(Port, Button1.Handle, WM_LBUTTONDOWN, EV_RXCHAR);
   MemoMain.SetFocus
end;

end.
