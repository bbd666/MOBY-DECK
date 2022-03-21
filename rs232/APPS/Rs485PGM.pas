unit Rs485PGM;

{*
** NAME: "RS 485 Program" (RS485PGM & RS485PRJ)
**
** TYPE: Win32 Delphi.
**
** DATE: January 28, 2009.
**
** PURPOSE: This program functions as a terminal program onm a RS485 loop.
*}

interface

uses
  Display,
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Menus,
  wsc32, keycode, ExtCtrls, StdCtrls;
type
  TRS485 = class(TForm)
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
    menuCOM5: TMenuItem;
    menuCOM6: TMenuItem;
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
    procedure menuCOM5Click(Sender: TObject);
    procedure menuCOM6Click(Sender: TObject);    
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
  RS485: TRS485;

implementation

{$R *.DFM}

procedure TRS485.FormCreate(Sender: TObject);
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

procedure TRS485.menuOnLineClick(Sender: TObject);
var
  Code : Integer;
begin
  (* pass the key code *)
  if SioKeyCode(WSC_KEY_CODE) < 0 then
    begin 
      DisplayLine(Rs485.MemoMain,'ERROR: Bad Key Code!');
      exit      
    end;
  (* initialize WSC *)
  Code := SioReset(Port,2048,2048);
  if Code < 0 then
    begin
      DisplayString(Rs485.MemoMain,Format('Error %d: Cannot reset port',[Code]));
      DisplayError(Rs485.MemoMain, Code);
      exit
    end;
  (* update menu settings *)
  Rs485.Caption := 'Rs485: COM' + Chr($31+Port) + ' Online';
  menuOnLine.Checked := true;
  menuOffLine.Checked := false;
  menuChange.Enabled := false;
  SioBaud(Port,Baud);
  SioParms(Port, Parity, StopBits, DataBits);
  SioDTR(Port,'S');
  SioRTS(Port,'S');
  MemoMain.SetFocus
end;

procedure TRS485.menuOfflineClick(Sender: TObject);
begin
  Rs485.Caption := 'Rs485: Offline';
  DisplayString(Rs485.MemoMain,'Shutting down COM port');
  menuOnLine.Checked := false;
  menuOffLine.Checked := true;
  menuChange.Enabled := true;
  SioDone(Port)
end;

procedure TRS485.menuCOM1Click(Sender: TObject);
begin
  menuCOM1.Checked := true;
  menuCOM2.Checked := false;
  menuCOM3.Checked := false;
  menuCOM4.Checked := false;
  menuCOM5.Checked := false;
  menuCOM6.Checked := false; 
  Port := COM1
end;

procedure TRS485.menuCOM2Click(Sender: TObject);
begin
  menuCOM1.Checked := false;
  menuCOM2.Checked := true;
  menuCOM3.Checked := false;
  menuCOM4.Checked := false;
  menuCOM5.Checked := false;
  menuCOM6.Checked := false;    
  Port := COM2
end;

procedure TRS485.menuCOM3Click(Sender: TObject);
begin
  menuCOM1.Checked := false;
  menuCOM2.Checked := false;
  menuCOM3.Checked := true;
  menuCOM4.Checked := false;
  menuCOM5.Checked := false;
  menuCOM6.Checked := false;   
  Port := COM3
end;

procedure TRS485.menuCOM4Click(Sender: TObject);
begin
  menuCOM1.Checked := false;
  menuCOM2.Checked := false;
  menuCOM3.Checked := false;
  menuCOM4.Checked := true;
  menuCOM5.Checked := false;
  menuCOM6.Checked := false;  
  Port := COM4
end;

procedure TRS485.menuCOM5Click(Sender: TObject);
begin
  menuCOM1.Checked := false;
  menuCOM2.Checked := false;
  menuCOM3.Checked := false;
  menuCOM4.Checked := false;
  menuCOM5.Checked := true;
  menuCOM6.Checked := false;    
  Port := COM5
end;

procedure TRS485.menuCOM6Click(Sender: TObject);
begin
  menuCOM1.Checked := false;
  menuCOM2.Checked := false;
  menuCOM3.Checked := false;
  menuCOM4.Checked := false;
  menuCOM5.Checked := false;
  menuCOM6.Checked := true;    
  Port := COM6
end;


procedure TRS485.menuExitClick(Sender: TObject);
begin
  SioDone(Port);
  Application.Terminate;
end;

procedure TRS485.menu300Click(Sender: TObject);
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

procedure TRS485.menu1200Click(Sender: TObject);
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

procedure TRS485.menu2400Click(Sender: TObject);
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

procedure TRS485.menu4800Click(Sender: TObject);
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

procedure TRS485.menu9600Click(Sender: TObject);
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

procedure TRS485.menu19200Click(Sender: TObject);
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

procedure TRS485.menu38400Click(Sender: TObject);
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

procedure TRS485.menu57600Click(Sender: TObject);
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

procedure TRS485.TimerTimer(Sender: TObject);
var
  I, Code : Integer;
  S : String;
  CharCount : Integer;
begin
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
  DisplayString(Rs485.MemoMain,S);
  if Chr(Code) = Chr(10) then DisplayChar(Rs485.MemoMain,Chr(10));
end
end;

{PROGRAMMER: Optionally delete $DEFINE below if running on Win 3.1/95/98/Me}

{$DEFINE USE_FOR_WIN_NT}

procedure TRS485.MyKeyPress(Sender: TObject; var Key: Char);
var
  Code : Integer;
{$IFDEF USE_FOR_WIN_NT}
procedure Wait4Done; {works with all versions of Windows}
begin
  Sleep(1);
end;
{$ELSE}
procedure Wait4Done; {works for Win 3.1/95/98/Me only}
begin
  while true do
    begin
      Code := SioRead(Port, 5);
      If ($60 AND Code) = $60 Then exit;
      Sleep(0);
   end
end;
{$ENDIF}
begin
  {send 'OK' if user types '$'}
  if Key = '$' then
    begin
      {set RTS}
      SioRTS(Port,'S');
      Code := SioPutc(Port, 'O');
      Code := SioPutc(Port, 'K');
      Code := SioPutc(Port, Chr(13));
      {wait for queue to empty}
      if SioTxQue(Port) > 1 then SioEvent(Port, EV_TXEMPTY);
      {wait for last bit of last character to be transmitted}
      Wait4Done;
      {drop RTS}
      SioRTS(Port,'C')
    end
  else
    begin
      {set RTS}
      SioRTS(Port,'S');
      SioPutc(Port,Key);
      {wait for queue to empty}
      if SioTxQue(Port) > 1 then SioEvent(Port, EV_TXEMPTY);
      {wait for last bit of last character to be transmitted}
      Wait4Done;
      {drop RTS}
      SioRTS(Port,'C')
    end
end;

end.
