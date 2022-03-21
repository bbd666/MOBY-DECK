unit xmr_pgm;

{*
** NAME: "XMODEM Receive" (XMR_PGM & XMR_PRJ)
**
** TYPE: Win32 Delphi.
**
** DATE: January 28, 2009.
**
** PURPOSE: This program is meant to be a minimal outline of the code
**          necessary to receive a file using the XMODEM protocol
*}

interface

uses
  wsc32, keycode, xym32, Display,
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Menus, StdCtrls;
const
  NAK = $15;
  XMODEM = 0;
type
  Txmr = class(TForm)
    MainMenu1: TMainMenu;
    mReceive: TMenuItem;
    mExit: TMenuItem;
    eResult: TMemo;
    Label1: TLabel;
    eFilename: TEdit;
    Label2: TLabel;
    eLocalDir: TEdit;
    procedure mExitClick(Sender: TObject);
    procedure mReceiveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Port : Integer;
    BaudRate : LongInt;
    FileName : String;
    DirName  : String;
  end;

var
  xmr: Txmr;

implementation

{$R *.DFM}

procedure Txmr.mExitClick(Sender: TObject);
begin
  xyAbort(Port);
  SioDone(Port);
  Application.Terminate;
end;

procedure Txmr.mReceiveClick(Sender: TObject);

var
  I, Code : Integer;
  FilePtr : PChar;
  MsgPtr  : PChar;
  DirPtr  : PChar;
  Packet  : Integer;
  LastPacket : Integer;
begin
  LastPacket := -1;
  { verify text }
  If Length(eFilename.Text) = 0 Then
    begin
       DisplayLine(xmr.eResult,'Missing "Filename" above!');
       exit
    end;
    If Length(eLocalDir.Text) = 0 Then
    begin
       DisplayLine(xmr.eResult,'Missing "Local Dir" above!');
       exit
    end;
  { copy strings }
  FileName := eFilename.Text;
  DirName  := eLocalDir.Text;
  DisplayLine(xmr.eResult,Format('DirN : %s',[DirName]));
  DisplayLine(xmr.eResult,Format('File : %s',[FileName]));
  { pass the key code }
  if SioKeyCode(WSC_KEY_CODE) < 0 then
    begin 
      DisplayLine(xmr.eResult,'ERROR: Bad Key Code!');
      exit      
    end;   
  { initialize WSC }
  Code := SioReset(Port,2048,2048);
  if Code < 0 then
    begin
      DisplayLine(xmr.eResult,Format('Error %d: Cannot reset port',[Code]));
      DisplayError(xmr.eResult, Code);
      exit
    end;
  { set parameters }
  SioBaud(Port,BaudRate);
  SioParms(Port, WSC_NoParity, WSC_OneStopBit, WSC_WordLength8);
  SioDTR(Port,'S');
  SioRTS(Port,'S');
  { set hardware (RTS/CTS) flow control, other side MUST also set hardware flow control }
  if SioCTS(Port) = 0 Then
    DisplayLine(xmr.eResult,'WARNING: Program will block until CTS is set by other side!');
  { set hardware flow control }
  SioFlow(Port, 'H');
  { acquire xyDriver }
  xyAcquire(Port,Port);
  
    {*** un-comment to speed up protocol over null modem cables ***}
       {xySetParameter(Port, XY_SET_ONE_SECOND, 200);}
       
  { set XY debug level }
  xyDebug(0);
  { specify upload/download directory }
  GetMem(DirPtr,128);
  StrPCopy(DirPtr,DirName);
  Code := xySetString(Port,XY_SET_FILES_DIR,DirPtr);
  if Code < 0 then
    begin
      DisplayLine(xmr.eResult,Format('Cannot set directory %s',[DirName]));
      exit
    end;
  { XM Receive }
  GetMem(FilePtr,128);
  StrPCopy(FilePtr,FileName);
  DisplayLine(xmr.eResult,'Starting XMODEM receive');
  Code := xyStartRx(Port,FilePtr,CHR(NAK),XMODEM);
  FreeMem(FilePtr,128);
  { check return code }
  if Code < 0 then
    begin
      DisplayLine(xmr.eResult,Format('Error %d: XMODEM receive fails',[Code]));
      exit
    end;
  { allocate memory for XY driver messages }
  GetMem(MsgPtr,90);
  { ready to go }
  SCREEN.Cursor := crHourGlass;
  mReceive.Enabled := false;
  { receive file }
  while true do
    begin
      { run the XY driver a few times }
      for I:= 1 To 4 do Code := xyDriver(Port);
      while true do
        begin
          { get next message from XY driver }
          if xyGetMessage(Port,MsgPtr,90) <> 0 then
            DisplayLine(xmr.eResult,StrPas(MsgPtr))
          else break;
        end;
      { is XY driver done ? }
      if Code = XY_IDLE then
        begin
          { XY driver is idle }
          Code := xyGetParameter(Port,XY_GET_ERROR_CODE);
          if Code <> 0 then
            DisplayLine(xmr.eResult,Format('XY file transfer fails (%d)',[Code]))
          else DisplayLine(xmr.eResult,'File transfer complete');
          { all done }
          FreeMem(MsgPtr,90);
          xyRelease;
          SioDone(Port);
          mReceive.Enabled := true;
          SCREEN.Cursor := crDefault;
          exit
        end
      else
        begin
          { XY driver is running }
          Packet := xyGetParameter(Port,XY_GET_PACKET);
          if Packet <> LastPacket then
            begin
              DisplayLine(xmr.eResult,Format('Packet %d',[Packet]) );
              LastPacket := Packet
            end
        end
    end
end;

procedure Txmr.FormCreate(Sender: TObject);
begin
  { PROGRAMMER: Edit next 2 lines to suite }
  Port := COM1;
  BaudRate := 57600;
  { END-PROGRAMMER }
  DisplayLine(xmr.eResult,Format('Port : COM%1d',[1+Port]));
  DisplayLine(xmr.eResult,Format('Baud : %d',[BaudRate]));
  DisplayLine(xmr.eResult,'Push "Receive" above to receive file')
end;

end.
