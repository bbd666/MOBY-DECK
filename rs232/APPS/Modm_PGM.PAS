unit Modm_pgm;

{*
** NAME: "Modem" (MODM_PGM & MODM_PRJ)
**
** TYPE: Win32 Delphi.
**
** DATE: January 28, 2009.
**
** PURPOSE: This program displays sets and displays modem lines.
**
**          DTR - Can be set, cleared, and read.
**          RTS - Can be set, cleared, and read.
**          DSR - Can be read ony (set by modem).
**          CTS - Can be read ony (set by modem).
*}

interface

uses
  Display,
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Menus,
  wsc32, keycode, ExtCtrls, StdCtrls;
type
  TModm = class(TForm)
    MainMenu: TMainMenu;
    menuLine: TMenuItem;
    menuOnLine: TMenuItem;
    menuOffline: TMenuItem;
    menuExit: TMenuItem;
    menuChange: TMenuItem;
    menuPort: TMenuItem;
    menuBaud: TMenuItem;
    menuDataBits: TMenuItem;
    menuParity: TMenuItem;
    menuStopBits: TMenuItem;
    menuAbout: TMenuItem;
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
    menuSeven: TMenuItem;
    menuEight: TMenuItem;
    menuNone: TMenuItem;
    menuEven: TMenuItem;
    menuOdd: TMenuItem;
    menuOne: TMenuItem;
    menuTwo: TMenuItem;
    Timer: TTimer;
    AboutPanel: TPanel;
    AboutOK: TButton;
    AboutMemo: TMemo;
    menuStatus: TMenuItem;
    menuControl: TMenuItem;
    menuFlowControl: TMenuItem;
    menuHardware: TMenuItem;
    menuSoftware: TMenuItem;
    menuNoFlow: TMenuItem;
    menuDTR: TMenuItem;
    menuRTS: TMenuItem;
    menuDTRset: TMenuItem;
    menuDTRclear: TMenuItem;
    menuRTSset: TMenuItem;
    menuRTSclear: TMenuItem;
    MemoMain: TMemo;
    menuOne5: TMenuItem;
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
    procedure menuSevenClick(Sender: TObject);
    procedure menuEightClick(Sender: TObject);
    procedure menuNoneClick(Sender: TObject);
    procedure menuEvenClick(Sender: TObject);
    procedure menuOddClick(Sender: TObject);
    procedure menuOneClick(Sender: TObject);
    procedure menuTwoClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure MyKeyPress(Sender: TObject; var Key: Char);
    procedure menuAboutClick(Sender: TObject);
    procedure Status(Sender: TObject);
    procedure AboutOKClick(Sender: TObject);
    procedure menuDTRsetClick(Sender: TObject);
    procedure menuRTSsetClick(Sender: TObject);
    procedure menuDTRclearClick(Sender: TObject);
    procedure menuRTSclearClick(Sender: TObject);
    procedure menuHardwareClick(Sender: TObject);
    procedure menuSoftwareClick(Sender: TObject);
    procedure menuNoFlowClick(Sender: TObject);
    procedure menuOne5Click(Sender: TObject);
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
  Modm: TModm;

implementation

{$R *.DFM}

procedure TModm.FormCreate(Sender: TObject);
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
  menuNone.Checked := true;
  menuEight.Checked := true;
  menuOne.Checked := true;
  menuDTRset.Checked := true;
  menuDTRclear.Checked := false;
  menuRTSset.Checked := true;
  menuRTSclear.Checked := false
end;

procedure TModm.menuOnLineClick(Sender: TObject);
var
  Code : Integer;
begin
  { pass the key code }
  if SioKeyCode(WSC_KEY_CODE) < 0 then
    begin 
      DisplayLine(Modm.MemoMain,'ERROR: Bad Key Code!');
      exit      
    end; 
  { initialize WSC }
  Code := SioReset(Port,1024,256);
  if Code < 0 then
    begin
      DisplayString(Modm.MemoMain,Format('Error %d: Cannot reset port',[Code]));
      exit
    end;
  { update menu settings }
  Modm.Caption := 'Modem: COM' + Chr($31+Port) + ' Online';
  menuOnLine.Checked := true;
  menuOffLine.Checked := false;
  menuChange.Enabled := false;
  menuStatus.Enabled := true;
  menuControl.Enabled := true;
  menuFlowControl.Enabled := true;
  menuNoFlow.Checked := true;
  SioBaud(Port,Baud);
  SioParms(Port, Parity, StopBits, DataBits);
  SioDTR(Port,'S');
  SioRTS(Port,'S');
  SioFlow(Port,'N');
  Modm.MemoMain.SetFocus
end;

procedure TModm.menuOfflineClick(Sender: TObject);
begin
  Modm.Caption := 'Modem: Offline';
  DisplayString(Modm.MemoMain,'Shutting down COM port');
  menuOnLine.Checked := false;
  menuOffLine.Checked := true;
  menuChange.Enabled := true;
  menuStatus.Enabled := false;
  menuControl.Enabled := false;
  menuFlowControl.Enabled := false;
  SioDone(Port)
end;

procedure TModm.menuCOM1Click(Sender: TObject);
begin
  menuCOM1.Checked := true;
  menuCOM2.Checked := false;
  menuCOM3.Checked := false;
  menuCOM4.Checked := false;
  Port := COM1
end;

procedure TModm.menuCOM2Click(Sender: TObject);
begin
  menuCOM1.Checked := false;
  menuCOM2.Checked := true;
  menuCOM3.Checked := false;
  menuCOM4.Checked := false;
  Port := COM2
end;

procedure TModm.menuCOM3Click(Sender: TObject);
begin
  menuCOM1.Checked := false;
  menuCOM2.Checked := false;
  menuCOM3.Checked := true;
  menuCOM4.Checked := false;
  Port := COM3
end;

procedure TModm.menuCOM4Click(Sender: TObject);
begin
  menuCOM1.Checked := false;
  menuCOM2.Checked := false;
  menuCOM3.Checked := false;
  menuCOM4.Checked := true;
  Port := COM4
end;

procedure TModm.menuExitClick(Sender: TObject);
begin
  SioDone(Port);
  Application.Terminate;
end;

procedure TModm.menu300Click(Sender: TObject);
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

procedure TModm.menu1200Click(Sender: TObject);
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

procedure TModm.menu2400Click(Sender: TObject);
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

procedure TModm.menu4800Click(Sender: TObject);
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

procedure TModm.menu9600Click(Sender: TObject);
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

procedure TModm.menu19200Click(Sender: TObject);
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

procedure TModm.menu38400Click(Sender: TObject);
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

procedure TModm.menu57600Click(Sender: TObject);
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

procedure TModm.menuSevenClick(Sender: TObject);
begin
  menuSeven.Checked := true;
  menuEight.Checked := false;
  DataBits := WSC_WordLength7
end;

procedure TModm.menuEightClick(Sender: TObject);
begin
  menuSeven.Checked := false;
  menuEight.Checked := true;
  DataBits := WSC_WordLength8
end;

procedure TModm.menuNoneClick(Sender: TObject);
begin
  menuNone.Checked := true;
  menuEven.Checked := false;
  menuOdd.Checked := false;
  Parity := WSC_NoParity
end;

procedure TModm.menuEvenClick(Sender: TObject);
begin
  menuNone.Checked := false;
  menuEven.Checked := true;
  menuOdd.Checked := false;
  Parity := WSC_EvenParity
end;

procedure TModm.menuOddClick(Sender: TObject);
begin
  menuNone.Checked := false;
  menuEven.Checked := false;
  menuOdd.Checked := true;
  Parity := WSC_OddParity
end;

procedure TModm.menuOneClick(Sender: TObject);
begin
  menuOne.Checked := true;
  menuOne5.Checked := false;
  menuTwo.Checked := false;
  StopBits := WSC_OneStopBit
end;

procedure TModm.menuTwoClick(Sender: TObject);
begin
  menuOne.Checked := false;
  menuOne5.Checked := false;
  menuTwo.Checked := true;
  StopBits := WSC_TwoStopBits
end;

procedure TModm.TimerTimer(Sender: TObject);
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
  DisplayString(Modm.MemoMain,S);
  if Chr(Code) = Chr(10) then DisplayChar(Modm.MemoMain,Chr(10));
end
end;


procedure TModm.MyKeyPress(Sender: TObject; var Key: Char);
begin
  SioPutc(Port,Key);
end;

procedure TModm.menuAboutClick(Sender: TObject);
begin
   AboutPanel.Visible := True
end;

procedure TModm.Status(Sender: TObject);
var
  Code : Integer;
begin
  if SioDSR(Port) = 0 then DisplayLine(Modm.MemoMain,'[DSR is clear]')
  else DisplayLine(Modm.MemoMain,'[DSR is set]');
  if SioCTS(Port) = 0 then DisplayLine(Modm.MemoMain,'[CTS is clear]')
  else DisplayLine(Modm.MemoMain,'[CTS is set]');
  Code := SioStatus(Port,$ffff);
  if(WSC_RXOVER AND Code) <> 0 then DisplayLine(Modm.MemoMain,'[RX queue overflow]');
  if(WSC_OVERRUN AND Code) <> 0 then DisplayLine(Modm.MemoMain,'[UART overrun]');
  if(WSC_FRAME AND Code) <> 0 then DisplayLine(Modm.MemoMain,'[Framing error]');
  if(WSC_BREAK AND Code) <> 0 then DisplayLine(Modm.MemoMain,'[BREAK detected]');
  if(WSC_TXFULL AND Code) <> 0 then DisplayLine(Modm.MemoMain,'[TX queue full]')
end;

procedure TModm.AboutOKClick(Sender: TObject);
begin
   AboutPanel.Visible := False
end;

procedure TModm.menuDTRsetClick(Sender: TObject);
begin
  SioDTR(Port,'S');
  menuDTRset.Checked := true;
  menuDTRclear.Checked := false
end;

procedure TModm.menuRTSsetClick(Sender: TObject);
begin
  SioRTS(Port,'S');
  menuRTSset.Checked := true;
  menuRTSclear.Checked := false
end;

procedure TModm.menuDTRclearClick(Sender: TObject);
begin
  SioDTR(Port,'C');
  menuDTRclear.Checked := true;
  menuDTRset.Checked := false
end;

procedure TModm.menuRTSclearClick(Sender: TObject);
begin
  SioRTS(Port,'C');
  menuRTSclear.Checked := true;
  menuRTSset.Checked := false
end;

procedure TModm.menuHardwareClick(Sender: TObject);
begin
  SioFlow(Port,'H');
  menuHardware.Checked := true;
  menuSoftware.Checked := false;
  menuNoFlow.Checked := false
end;

procedure TModm.menuSoftwareClick(Sender: TObject);
begin
  SioFlow(Port,'S');
  menuHardware.Checked := false;
  menuSoftware.Checked := true;
  menuNoFlow.Checked := false
end;

procedure TModm.menuNoFlowClick(Sender: TObject);
begin
  SioFlow(Port,'N');
  menuHardware.Checked := false;
  menuSoftware.Checked := false;
  menuNoFlow.Checked := true
end;

procedure TModm.menuOne5Click(Sender: TObject);
begin
  menuOne.Checked := false;
  menuOne5.Checked := true;
  menuTwo.Checked := false;
  StopBits := WSC_One5StopBits
end;

end.
