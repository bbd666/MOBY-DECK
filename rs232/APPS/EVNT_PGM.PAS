unit Evnt_pgm;

{*
** NAME: "Event Program" (EVNT_PGM & EVNT_PRJ)
**
** TYPE: Win32 Delphi.
**
** DATE: January 28, 2009.
**
** PURPOSE: This program operates as a simple terminal program
**          in which a thread is used to handle the serial I/O
**          independently of the main application.
*}

interface

uses
  Display,
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Menus,
  wsc32, keycode, ExtCtrls, StdCtrls;
type
  TEvnt = class(TForm)
    MainMenu: TMainMenu;
    menuChange: TMenuItem;
    menuPort: TMenuItem;
    menuBaud: TMenuItem;
    menuCOM1: TMenuItem;
    menuCOM2: TMenuItem;
    menuCOM3: TMenuItem;
    menuCOM4: TMenuItem;
    menu2400: TMenuItem;
    menu9600: TMenuItem;
    menu19200: TMenuItem;
    menu38400: TMenuItem;
    menu57600: TMenuItem;
    MemoMain: TMemo;
    menu115200: TMenuItem;
    menuLine: TMenuItem;
    menuExit: TMenuItem;
    menuOnLine: TMenuItem;
    menuOffLine: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure menuCOM1Click(Sender: TObject);
    procedure menuCOM2Click(Sender: TObject);
    procedure menuCOM3Click(Sender: TObject);
    procedure menuCOM4Click(Sender: TObject);
    procedure menuExitClick(Sender: TObject);
    procedure menu2400Click(Sender: TObject);
    procedure menu9600Click(Sender: TObject);
    procedure menu19200Click(Sender: TObject);
    procedure menu38400Click(Sender: TObject);
    procedure menu57600Click(Sender: TObject);
    procedure menu115200Click(Sender: TObject);
    procedure MyKeyPress(Sender: TObject; var Key: Char);
    procedure menuOnLineClick(Sender: TObject);
    procedure menuOffLineClick(Sender: TObject);

  private
    {Private declarations}

  public
    {Public declarations}
  end ;


var
  {globals}
  Evnt : TEvnt;
  Baud : Integer;
  Parity : Integer;
  DataBits : Integer;
  StopBits : Integer;
  ThreadID : DWORD;
  RxBuffer : PChar;
  KillThreadFlag : Boolean;
  OnLineFlag : Boolean;
  Port: Integer;

implementation

{$R *.DFM}

procedure GetIncoming;
var
  S : String;
  CharCount : Integer;
begin
  {Gather all incoming serial data}
  CharCount := SioGets(Port,RxBuffer,1024);
  if CharCount > 0 then
  begin
    {convert to string}
    RxBuffer[CharCount] := Chr(0);
    S := StrPas(RxBuffer);
    {display}
    DisplayString(Evnt.MemoMain,S);
  end
end; {GetIncoming}

function DoThread(Dummy:Pointer):Integer;
var
  Code : Integer;
begin
  while true do begin
    {block until data is ready}
    Code := SioEvent(Port, EV_RXCHAR);
    if Code < 0 then
      begin
        DisplayString(Evnt.MemoMain,Format('Error %d: SioEvent(%d,%d) fails',
          [Code, Port, EV_RXCHAR]));
      end;
    if KillThreadFlag then
    begin
      {terminate this thread}
      KillThreadFlag := False;
      DisplayLine(Evnt.MemoMain,'Thread terminating...');
      EndThread(0);
    end;
    {read all available data}
    GetIncoming;
  end
end; {DoThread}

procedure TEvnt.FormCreate(Sender: TObject);
begin
  DisplayLine(Evnt.MemoMain,'Run this program as an executable, not from Delphi!');
  {initialize parameters}
  Port := COM1;
  Baud := WSC_Baud19200;
  Parity := WSC_NoParity;
  DataBits := WSC_WordLength8;
  StopBits := WSC_OneStopBit;
  ThreadID := 0;
  KillThreadFlag := false;
  GetMem(RxBuffer, 1024);
  {initialize menu settings}
  menuCOM1.Checked := true;
  menu19200.Checked := true;
  menuOnLine.Enabled := true;
  menuOffLine.Enabled := false
end;

procedure TEvnt.menuCOM1Click(Sender: TObject);
begin
  menuCOM1.Checked := true;
  menuCOM2.Checked := false;
  menuCOM3.Checked := false;
  menuCOM4.Checked := false;
  Port := COM1
end;

procedure TEvnt.menuCOM2Click(Sender: TObject);
begin
  menuCOM1.Checked := false;
  menuCOM2.Checked := true;
  menuCOM3.Checked := false;
  menuCOM4.Checked := false;
  Port := COM2
end;

procedure TEvnt.menuCOM3Click(Sender: TObject);
begin
  menuCOM1.Checked := false;
  menuCOM2.Checked := false;
  menuCOM3.Checked := true;
  menuCOM4.Checked := false;
  Port := COM3
end;

procedure TEvnt.menuCOM4Click(Sender: TObject);
begin
  menuCOM1.Checked := false;
  menuCOM2.Checked := false;
  menuCOM3.Checked := false;
  menuCOM4.Checked := true;
  Port := COM4
end;

procedure TEvnt.menuExitClick(Sender: TObject);
begin
  EndThread(0);
  SioDone(Port);
  Freemem(RxBuffer,1024);
  Application.Terminate;
end;

procedure TEvnt.menu2400Click(Sender: TObject);
begin
  menu2400.Checked := true;
  menu9600.Checked := false;
  menu19200.Checked := false;
  menu38400.Checked := false;
  menu57600.Checked := false;
  menu115200.Checked := false;
  Baud := WSC_Baud2400
end;

procedure TEvnt.menu9600Click(Sender: TObject);
begin
  menu2400.Checked := false;
  menu9600.Checked := true;
  menu19200.Checked := false;
  menu38400.Checked := false;
  menu57600.Checked := false;
  menu115200.Checked := false;
  Baud := WSC_Baud9600
end;

procedure TEvnt.menu19200Click(Sender: TObject);
begin
  menu2400.Checked := false;
  menu9600.Checked := false;
  menu19200.Checked := true;
  menu38400.Checked := false;
  menu57600.Checked := false;
  menu115200.Checked := false;
  Baud := WSC_Baud19200
end;

procedure TEvnt.menu38400Click(Sender: TObject);
begin
  menu2400.Checked := false;
  menu9600.Checked := false;
  menu19200.Checked := false;
  menu38400.Checked := true;
  menu57600.Checked := false;
  menu115200.Checked := false;
  Baud := WSC_Baud38400
end;

procedure TEvnt.menu57600Click(Sender: TObject);
begin
  menu2400.Checked := false;
  menu9600.Checked := false;
  menu19200.Checked := false;
  menu38400.Checked := false;
  menu57600.Checked := true;
  menu115200.Checked := false;
  Baud := WSC_Baud57600
end;

procedure TEvnt.menu115200Click(Sender: TObject);
begin
  menu2400.Checked := false;
  menu9600.Checked := false;
  menu19200.Checked := false;
  menu38400.Checked := false;
  menu57600.Checked := false;
  menu115200.Checked := true;
  Baud := WSC_Baud115200
end;

procedure TEvnt.MyKeyPress(Sender: TObject; var Key: Char);
begin
  if OnLineFlag then SioPutc(Port,Key)
end;

procedure TEvnt.menuOnLineClick(Sender: TObject);
var
  Code : Integer;
  Dummy : Integer;
begin
  {pass the key code}
  if SioKeyCode(WSC_KEY_CODE) < 0 then
    begin 
      DisplayLine(Evnt.MemoMain,'ERROR: Bad Key Code!');
      exit      
    end;
  {initialize WSC32}
  Code := SioReset(Port,2048,1024);
  if Code < 0 then
    begin
      DisplayString(Evnt.MemoMain,Format('Error %d: Cannot reset port COM%1',
        [Code,Port+1]));
      exit
    end;
  {update menu settings}
  Evnt.Caption := 'EVENT: COM' + Chr($31+Port) + ' Online';
  menuOnLine.Enabled := false;
  menuOffLine.Enabled := true;
  menuChange.Enabled := false;
  SioBaud(Port, Baud);
  SioParms(Port, Parity, StopBits, DataBits);
  SioDTR(Port,'S');
  SioRTS(Port,'S');
  {create thread to get incoming serial data}
  BeginThread(nil,1024,@DoThread,@Dummy,0,ThreadID);
  MemoMain.SetFocus;
  OnLineFlag := true
end;

procedure TEvnt.menuOffLineClick(Sender: TObject);
begin
  {set flag so thread will terminate itself}
  KillThreadFlag := true;
  {close port}
  SioDone(Port);
  menuOnLine.Enabled := true;
  menuOffLine.Enabled := false;
  menuChange.Enabled := true;
  OnLineFlag := false
end;

end.
