unit Term_pgm;

{*
** NAME: "Terminal Program" (TERM_PGM & TERM_PRJ)
**
** TYPE: Win32 Delphi.
**
** DATE: January 28, 2009.
**
** PURPOSE: This program functions as a simple terminal program. Whatever 
**          is typed on the keyboard is transmitted out the serial port, 
**          and whatever is received on the serial port is displayed on
**          the screen.
*}

interface

uses
  Display,
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Menus,
  ExtCtrls, StdCtrls,
  wsc32, keycode, mio32, xym32, asd32;
const
  XMODEM = 0;
  YMODEM = 1;
  NAK = $15;
  QUE_SIZE = 2048;
  AS_TX_START = 1;
  AS_RX_START = 2;
  AS_DRIVER = 3;
  XM_TX_START = 4;
  XM_RX_START = 5;
  YM_TX_START = 6;
  YM_RX_START = 7;
  XY_DRIVER = 8;
  MIO_START = 9;
  MIO_CONNECT = 10;
  MIO_RESULT = 11;
type
  TTerm = class(TForm)
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
    menuDial: TMenuItem;
    menuSend: TMenuItem;
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
    MenuOdd: TMenuItem;
    menuOne: TMenuItem;
    menuTwo: TMenuItem;
    Timer: TTimer;
    AboutPanel: TPanel;
    AboutOK: TButton;
    AboutMemo: TMemo;
    menuReceive: TMenuItem;
    RXMODEM: TMenuItem;
    RYMODEM: TMenuItem;
    menuBreak: TMenuItem;
    menuAbout: TMenuItem;
    SXMODEM: TMenuItem;
    SYMODEM: TMenuItem;
    AcceptPanel: TPanel;
    AcceptMemo: TMemo;
    AcceptOK: TButton;
    menuStatus: TMenuItem;
    MemoMain: TMemo;
    menuSendAscii: TMenuItem;
    menuReceiveAscii: TMenuItem;
    AcceptBox: TMemo;
    menuOne5: TMenuItem;
    Label1: TLabel;
    eLocalDir: TEdit;
    cDebug: TCheckBox;
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
    procedure MenuOddClick(Sender: TObject);
    procedure menuOneClick(Sender: TObject);
    procedure menuTwoClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure MyKeyPress(Sender: TObject; var Key: Char);
    procedure AboutOKClick(Sender: TObject);
    procedure menuAboutClick(Sender: TObject);
    procedure menuDialClick(Sender: TObject);
    procedure AcceptOKClick(Sender: TObject);
    procedure menuBreakClick(Sender: TObject);
    procedure SXMODEMClick(Sender: TObject);
    procedure SYMODEMClick(Sender: TObject);
    procedure RXMODEMClick(Sender: TObject);
    procedure RYMODEMClick(Sender: TObject);
    procedure XY(Sender: TObject);
    procedure menuSendAsciiClick(Sender: TObject);
    procedure menuReceiveAsciiClick(Sender: TObject);
    procedure menuOne5Click(Sender: TObject);
    procedure cDebugClick(Sender: TObject);
  private
    { Private declarations }
    LastPacket : Integer;
    TheState : Integer;
    NewState : Integer;
    Baud : Integer;
    Parity : Integer;
    DataBits : Integer;
    StopBits : Integer;
    DirPtr   : PChar;
    DebugLevel : Integer;
    IsOnline : Boolean;
    xyCounter : LongInt;
  public
    { Public declarations }
    Port : Integer;
  end ;

var
  Term: TTerm;

implementation

{$R *.DFM}

procedure TTerm.FormCreate(Sender: TObject);
begin
  { initialize parameters }
  IsOnline := False;
  menuBreak.Enabled := False;
  Port := COM1;
  Baud := 19200;
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
  { initialize state variables }
  TheState := 0;
  DebugLevel := 0;
  xyCounter := 0;
  DisplayLine(Term.MemoMain,'FORM created. ');
end;

procedure TTerm.menuOnLineClick(Sender: TObject);
var
  Code : Integer;
  D1,D2,D3 : Integer;
begin
  { pass the key code }
  if SioKeyCode(WSC_KEY_CODE) < 0 then
    begin 
      DisplayLine(Term.MemoMain,'ERROR: Bad Key Code!');
      exit      
    end; 
  { initialize WSC }
  Code := SioReset(Port,QUE_SIZE,QUE_SIZE);
  if Code < 0 then
    begin
      DisplayLine(Term.MemoMain,Format('Error %d: Cannot reset port',[Code]));
      DisplayError(MemoMain, Code);
      exit
    end;
  { display WSC version }
  Code := SioInfo('V');
  D3 := $0F AND Code;  Code := Code SHR 4;
  D2 := $0F AND Code;  Code := Code SHR 4;
  D1 := $0F AND Code;
  DisplayLine(Term.MemoMain,'WSC Version ' + Chr(48 + D1)
            + '.' + Chr(48 + D2)
            + '.' + Chr(48 + D3));
  { set hardware flow control }
  DisplayLine(Term.MemoMain,'Setting hardware flow control');
  SioFlow(Port,'H');
  { set TX timeouts to 1mSec/char + 2 seconds }
  SioSetTimeouts(Port,-1, 0, 0, 1, 2000);
  { DSR should be set }
  If SioDSR(Port) = 0 then
    DisplayLine(Term.MemoMain,'WARNING: DSR is NOT set!');
  { attach XYDRIVER }
  xyAcquire(Port,Port);
  xyDebug(DebugLevel);
  { specify Xmodem/Ymodem upload/download directory }
  GetMem(DirPtr,50);
  StrPCopy(DirPtr,eLocalDir.Text);
  { update menu settings }
  Term.Caption := Format('Term: COM%1d: Online @ %d baud',[1+Port,Baud]);
  menuOnLine.Checked := true;
  menuOffLine.Checked := false;
  menuChange.Enabled := false;
  menuSend.Enabled := true;
  menuReceive.Enabled := true;
  menuDial.Enabled := true;
  SioBaud(Port,Baud);
  SioParms(Port, Parity, StopBits, DataBits);
  SioDTR(Port,'S');
  SioRTS(Port,'S');
  MemoMain.SetFocus;
  cDebug.Enabled := true;
  IsOnline := True
end;

procedure TTerm.menuOfflineClick(Sender: TObject);
begin
  IsOnline := False;
  Term.Caption := 'Term: Offline';
  DisplayLine(Term.MemoMain,'Shutting down COM port');
  menuOnLine.Checked := false;
  menuOffLine.Checked := true;
  menuChange.Enabled := true;
  menuSend.Enabled := false;
  menuReceive.Enabled := false;
  menuDial.Enabled := false;
  xyRelease;
  SioDone(Port)
end;

procedure TTerm.menuCOM1Click(Sender: TObject);
begin
  menuCOM1.Checked := true;
  menuCOM2.Checked := false;
  menuCOM3.Checked := false;
  menuCOM4.Checked := false;
  Port := COM1
end;

procedure TTerm.menuCOM2Click(Sender: TObject);
begin
  menuCOM1.Checked := false;
  menuCOM2.Checked := true;
  menuCOM3.Checked := false;
  menuCOM4.Checked := false;
  Port := COM2
end;

procedure TTerm.menuCOM3Click(Sender: TObject);
begin
  menuCOM1.Checked := false;
  menuCOM2.Checked := false;
  menuCOM3.Checked := true;
  menuCOM4.Checked := false;
  Port := COM3
end;

procedure TTerm.menuCOM4Click(Sender: TObject);
begin
  menuCOM1.Checked := false;
  menuCOM2.Checked := false;
  menuCOM3.Checked := false;
  menuCOM4.Checked := true;
  Port := COM4
end;

procedure TTerm.menuExitClick(Sender: TObject);
begin
  SioDone(Port);
  Application.Terminate;
end;

procedure TTerm.menu300Click(Sender: TObject);
begin
  menu300.Checked := true;
  menu1200.Checked := false;
  menu2400.Checked := false;
  menu4800.Checked := false;
  menu9600.Checked := false;
  menu19200.Checked := false;
  menu38400.Checked := false;
  menu57600.Checked := false;
  Baud := 300
end;

procedure TTerm.menu1200Click(Sender: TObject);
begin
  menu300.Checked := false;
  menu1200.Checked := true;
  menu2400.Checked := false;
  menu4800.Checked := false;
  menu9600.Checked := false;
  menu19200.Checked := false;
  menu38400.Checked := false;
  menu57600.Checked := false;
  Baud := 1200
end;

procedure TTerm.menu2400Click(Sender: TObject);
begin
  menu300.Checked := false;
  menu1200.Checked := false;
  menu2400.Checked := true;
  menu4800.Checked := false;
  menu9600.Checked := false;
  menu19200.Checked := false;
  menu38400.Checked := false;
  menu57600.Checked := false;
  Baud := 2400
end;

procedure TTerm.menu4800Click(Sender: TObject);
begin
  menu300.Checked := false;
  menu1200.Checked := false;
  menu2400.Checked := false;
  menu4800.Checked := true;
  menu9600.Checked := false;
  menu19200.Checked := false;
  menu38400.Checked := false;
  menu57600.Checked := false;
  Baud := 4800
end;

procedure TTerm.menu9600Click(Sender: TObject);
begin
  menu300.Checked := false;
  menu1200.Checked := false;
  menu2400.Checked := false;
  menu4800.Checked := false;
  menu9600.Checked := true;
  menu19200.Checked := false;
  menu38400.Checked := false;
  menu57600.Checked := false;
  Baud := 9600
end;

procedure TTerm.menu19200Click(Sender: TObject);
begin
  menu300.Checked := false;
  menu1200.Checked := false;
  menu2400.Checked := false;
  menu4800.Checked := false;
  menu9600.Checked := false;
  menu19200.Checked := true;
  menu38400.Checked := false;
  menu57600.Checked := false;
  Baud := 19200
end;

procedure TTerm.menu38400Click(Sender: TObject);
begin
  menu300.Checked := false;
  menu1200.Checked := false;
  menu2400.Checked := false;
  menu4800.Checked := false;
  menu9600.Checked := false;
  menu19200.Checked := false;
  menu38400.Checked := true;
  menu57600.Checked := false;
  Baud := 38400
end;

procedure TTerm.menu57600Click(Sender: TObject);
begin
  menu300.Checked := false;
  menu1200.Checked := false;
  menu2400.Checked := false;
  menu4800.Checked := false;
  menu9600.Checked := false;
  menu19200.Checked := false;
  menu38400.Checked := false;
  menu57600.Checked := true;
  Baud := 57600
end;

procedure TTerm.menuSevenClick(Sender: TObject);
begin
  menuSeven.Checked := true;
  menuEight.Checked := false;
  DataBits := WSC_WordLength7
end;

procedure TTerm.menuEightClick(Sender: TObject);
begin
  menuSeven.Checked := false;
  menuEight.Checked := true;
  DataBits := WSC_WordLength8
end;

procedure TTerm.menuNoneClick(Sender: TObject);
begin
  menuNone.Checked := true;
  menuEven.Checked := false;
  menuOdd.Checked := false;
  Parity := WSC_NoParity
end;

procedure TTerm.menuEvenClick(Sender: TObject);
begin
  menuNone.Checked := false;
  menuEven.Checked := true;
  menuOdd.Checked := false;
  Parity := WSC_EvenParity
end;

procedure TTerm.MenuOddClick(Sender: TObject);
begin
  menuNone.Checked := false;
  menuEven.Checked := false;
  menuOdd.Checked := true;
  Parity := WSC_OddParity
end;

procedure TTerm.menuOneClick(Sender: TObject);
begin
  menuOne.Checked := true;
  menuOne5.Checked := false;
  menuTwo.Checked := false;
  StopBits := WSC_OneStopBit
end;

procedure TTerm.menuTwoClick(Sender: TObject);
begin
  menuOne.Checked := false;
  menuOne5.Checked := false;
  menuTwo.Checked := true;
  StopBits := WSC_TwoStopBits
end;

procedure GatherIncoming(Port : Integer);
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
  DisplayString(Term.MemoMain,S);
  if Chr(Code) = Chr(10) then DisplayChar(Term.MemoMain,Chr(10));
end
end;

procedure TTerm.TimerTimer(Sender: TObject);
var
  I     : Integer;
  Code  : Integer;
  Ptr   : PChar;
  Text  : String;
  Packet  : Integer;
  ErrorState : Integer;
procedure ResetBreak;
begin
  menuBreak.Enabled := false;
  menuDial.Enabled := true;
  MemoMain.SetFocus;
end;
procedure xyReady;
begin
  xyDebug(DebugLevel);
  { specify Xmodem/Ymodem upload/download directory }
  StrPCopy(DirPtr,eLocalDir.Text);
  Code := xySetString(Port,XY_SET_FILES_DIR,DirPtr);
  if Code < 0 then
    begin
      DisplayLine(Term.MemoMain,Format('Cannot set directory %s',[eLocalDir.Text]));
      exit
    end
  else
    DisplayLine(Term.MemoMain,Format('Local X/Ymodem directory = %s',[eLocalDir.Text]));
  xyCounter := 0
end;
begin {Timer}
  if not IsOnline then exit;
  Timer.Enabled := False;
  case TheState of
    AS_TX_START :
      begin { ASCII Send }
        GetMem(Ptr,128);
        StrPCopy(Ptr,AcceptBox.Text);
        ascInit(Port,QUE_SIZE,1);
        ascStartTX(Ptr,10,0,1);
        TheState := AS_DRIVER;
        FreeMem(Ptr,128);
      end;
    AS_RX_START :
      begin { ASCII Receive }
        GetMem(Ptr,128);
        StrPCopy(Ptr,AcceptBox.Text);
        ascInit(Port,QUE_SIZE,1);
        ascStartRX(Ptr,0,30,3,1);
        TheState := AS_DRIVER;
        FreeMem(Ptr,128);
        {prompt sender with carriage return}
        SioPutc(Port,Chr($0d));
      end;
    AS_DRIVER:
      begin { ASCII Driver }
        if ascDriver <> 0 then
          begin
            { ASCII state driver is idle }
            TheState := 0;
            ResetBreak;
            ErrorState := ascGetParameter(ASC_GET_ERROR_CODE);
            if ErrorState <> 0 then
              DisplayLine(Term.MemoMain,Format('ASCII file transfer fails (%d)',[ErrorState]))
            else
              DisplayLine(Term.MemoMain,'File transfer complete');
            { restore menu buttons }
            menuSend.Enabled := true;
            menuReceive.Enabled := true;
            menuBreak.Enabled := false
          end;
        {any messages ? }
        GetMem(Ptr,90);
        while true do
        begin
          if ascGetMessage(Ptr,90) <> 0 then
            begin
              Text := StrPas(Ptr);
              DisplayLine(Term.MemoMain,Text)
            end
          else
            break;
          end;
          FreeMem(Ptr,90);
      end;
    XM_TX_START:
      begin { XM Send }
        xyReady;
        GetMem(Ptr,128);
        StrPCopy(Ptr,AcceptBox.Text);
        Code := xyStartTx(Port,Ptr,0,XMODEM);
        if Code < 0
          then DisplayLine(Term.MemoMain,Format('Error %d: XMODEM Transmit fails',[Code]))
          else TheState := XY_DRIVER;
        FreeMem(Ptr,128);
      end;
    YM_TX_START:
      begin  { YM Send }
        xyReady;
        GetMem(Ptr,128);
        StrPCopy(Ptr,AcceptBox.Text);
        Code := xyStartTx(Port,Ptr,1,YMODEM);
        if Code < 0
          then DisplayLine(Term.MemoMain,Format('Error %d: YMODEM Transmit fails',[Code]))
          else TheState := XY_DRIVER;
        FreeMem(Ptr,32)
      end;
    XM_RX_START:
      begin  { XM Receive }
        xyReady;
        GetMem(Ptr,128);
        StrPCopy(Ptr,AcceptBox.Text);
        Code := xyStartRx(Port,Ptr,CHR(NAK),XMODEM);
        if Code < 0
          then DisplayLine(Term.MemoMain,Format('Error %d: XMODEM Receive fails',[Code]))
          else TheState := XY_DRIVER;
        FreeMem(Ptr,32)
      end;
    YM_RX_START:
      begin   { YM Receive }
        xyReady;
        GetMem(Ptr,128);
        StrPCopy(Ptr,'');
        Code := xyStartRx(Port,Ptr,'C',YMODEM);
        if Code < 0
          then DisplayLine(Term.MemoMain,Format('Error %d: YMODEM Receive fails',[Code]))
          else TheState := XY_DRIVER;
        LastPacket := -1;
        FreeMem(Ptr,32)
      end;
    XY_DRIVER:
      begin   { xyDriver }
        for I := 1 to 4 do xyDriver(Port);
        if xyDriver(Port) = XY_IDLE then
          begin
            { xy state driver is idle }
            TheState := 0;
            ResetBreak;
            ErrorState := xyGetParameter(Port,XY_GET_ERROR_CODE);
            if ErrorState <> 0 then
              begin
                DisplayLine(Term.MemoMain,Format('XY file transfer fails (%d)',[ErrorState]));
              end
            else DisplayLine(Term.MemoMain,'File transfer complete');
            { restore menu buttons }
            cDebug.Enabled := false;
            menuSend.Enabled := true;
            menuReceive.Enabled := true;
            menuBreak.Enabled := false
          end
        else
          begin
            { xy state driver is running }
            Inc(xyCounter);
            Packet := xyGetParameter(Port,XY_GET_PACKET);
            if (Packet <> LastPacket) and (DebugLevel = 0) then
              begin
                {DisplayChar(Chr(CR));}
                DisplayLine(Term.MemoMain,Format('Packet %d',[Packet]) );
                LastPacket := Packet
              end
          end;
        {any messages}
        GetMem(Ptr,90);
        while true do
          begin
            if xyGetMessage(Port,Ptr,90) <> 0 then
              begin
                Text := StrPas(Ptr);
                DisplayLine(Term.MemoMain,Text)
              end
            else break;
          end;
        FreeMem(Ptr,90);
       end;
      MIO_START:
          begin
           if Length(AcceptBox.Text) = 0 then
             begin
               DisplayLine(Term.MemoMain,'Missing phone number');
               TheState := 0;
               ResetBreak;
             end
           else
             begin
               menuBreak.Enabled := true;
               menuDial.Enabled := false;
               Text := '!ATDT' + AcceptBox.Text + '!';
               DisplayLine(Term.MemoMain,Text);
               GetMem(Ptr,128);
               StrPCopy(Ptr,Text);
               mioSendTo(Port,100,Ptr);
               FreeMem(Ptr,128);
               TheState := MIO_CONNECT
             end
         end;
      MIO_CONNECT: begin
           if mioDriver(Port) = MIO_IDLE then
             begin
               Text := 'CONNECT';
               GetMem(Ptr,5);
               StrPCopy(Ptr,Text);
               mioWaitFor(Port,60000,Ptr);
               FreeMem(Ptr,5);
               TheState := MIO_RESULT
             end
         end;
      MIO_RESULT: begin
           if mioDriver(Port) = MIO_IDLE then
           begin
             TheState := 0;
             ResetBreak;
             if mioResult(Port) <> 0 then DisplayLine(Term.MemoMain,'[CONNECT was received]')
             else
               begin
                 DisplayLine(Term.MemoMain,'[CONNECT was NOT received]')
               end
           end
         end
      else
        { get all serial input }
        GatherIncoming(Port);
    end; {end - case TheState}
    {re-enable timer}
    Timer.Enabled := True
end;

procedure TTerm.MyKeyPress(Sender: TObject; var Key: Char);
var
  Code : Integer;
begin
  if not IsOnline then exit;
  if SioCTS(Port) > 0  then
    begin
      Code := SioPutc(Port,Key);
      if(Code<WSC_NO_DATA)
      then DisplayLine(Term.MemoMain,Format('SioPutc error %d',[Code]))
    end
end;

procedure TTerm.AboutOKClick(Sender: TObject);
begin
   AboutPanel.Visible := False
end;

procedure TTerm.menuAboutClick(Sender: TObject);
begin
     AboutPanel.Visible := True
end;

procedure TTerm.menuDialClick(Sender: TObject);
begin
   AcceptMemo.Lines.Clear;
   AcceptMemo.Lines.Add('Enter phone number');
   AcceptPanel.Visible := true;
   AcceptBox.Lines.Clear;
   AcceptBox.SetFocus;
   NewState := MIO_START;
end;

procedure TTerm.AcceptOKClick(Sender: TObject);
begin
  AcceptPanel.Visible := false;
  if Length(AcceptBox.Text) = 0 then
    begin
      DisplayLine(Term.MemoMain,'Missing text...');
    end
  else
    begin
      DisplayString(Term.MemoMain,'[');
      DisplayString(Term.MemoMain,AcceptBox.Text);
      DisplayLine(Term.MemoMain,']');
      { set state variable after get Accept text }
      TheState := NewState;
      NewState := 0
    end
end;

procedure TTerm.menuBreakClick(Sender: TObject);
begin
   TheState := 0;
   mioBreak(Port);
   xyAbort(Port);
   ascAbort;
   menuSend.Enabled := true;
   menuReceive.Enabled := true;
   menuDial.Enabled := true;
   menuBreak.Enabled := false;
   MemoMain.SetFocus;
end;

procedure TTerm.SXMODEMClick(Sender: TObject);
begin
  AcceptMemo.Lines.Clear;
  AcceptMemo.Lines.Add('TX: XMODEM file name');
  AcceptPanel.Visible := true;
  AcceptBox.Lines.Clear;
  AcceptBox.SetFocus;
  menuBreak.Enabled := true;
  NewState := XM_TX_START
end;

procedure TTerm.SYMODEMClick(Sender: TObject);
begin
  AcceptMemo.Lines.Clear;
  AcceptMemo.Lines.Add('TX: YMODEM file name');
  AcceptPanel.Visible := true;
  menuBreak.Enabled := true;
  AcceptBox.Lines.Clear;
  AcceptBox.SetFocus;
  NewState := YM_TX_START
end;

procedure TTerm.RXMODEMClick(Sender: TObject);
begin
  AcceptMemo.Lines.Clear;
  AcceptMemo.Lines.Add('RX: XMODEM file name');
  AcceptPanel.Visible := true;
  menuBreak.Enabled := true;
  AcceptBox.Lines.Clear;
  AcceptBox.SetFocus;
  NewState := XM_RX_START
end;

procedure TTerm.RYMODEMClick(Sender: TObject);
begin
  { set xy state variable directly }
  menuBreak.Enabled := true;
  TheState := YM_RX_START
end;

procedure TTerm.XY(Sender: TObject);
begin
  { Display state variables }
  DisplayLine(Term.MemoMain,Format('State = %d, xyCounter = %d',[TheState,xyCounter]) );
end;

procedure TTerm.menuSendAsciiClick(Sender: TObject);
begin
  AcceptMemo.Lines.Clear;
  AcceptMemo.Lines.Add('TX: ASCII file name');
  AcceptPanel.Visible := true;
  menuBreak.Enabled := true;
  AcceptBox.Lines.Clear;
  AcceptBox.SetFocus;
  NewState := AS_TX_START
end;

procedure TTerm.menuReceiveAsciiClick(Sender: TObject);
begin
  AcceptMemo.Lines.Clear;
  AcceptMemo.Lines.Add('RX: ASCII file name');
  AcceptPanel.Visible := true;
  menuBreak.Enabled := true;
  AcceptBox.Lines.Clear;
  AcceptBox.SetFocus;
  NewState := AS_RX_START
end;

procedure TTerm.menuOne5Click(Sender: TObject);
begin
  menuOne.Checked := false;
  menuOne5.Checked := true;
  menuTwo.Checked := false;
  StopBits := WSC_One5StopBits
end;

procedure TTerm.cDebugClick(Sender: TObject);
begin
  If cDebug.Checked then DebugLevel := 2
  else DebugLevel := 0;
  {DisplayLine(Term.MemoMain,Format('DebugLevel = %d',[DebugLevel]));}
end;

end.

