unit ymr_pgm;

{*
** NAME: "YMODEM Receive" (YMR_PGM & YMR_PRJ)
**
** TYPE: Win32 Delphi.
**
** DATE: January 28, 2009.
**
** PURPOSE: This program is meant to be a minimal outline of the code
**          necessary to receive a file using the YMODEM protocol
*}

interface

uses
  wsc32, keycode, xym32, Display,
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Menus, StdCtrls;
const
  YMODEM = 1;
type
  Tymr = class(TForm)
    MainMenu1: TMainMenu;
    mReceive: TMenuItem;
    mExit: TMenuItem;
    eResult: TMemo;
    Label1: TLabel;
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
    DirName  : String;
  end;

var
  ymr: Tymr;

implementation

{$R *.DFM}

procedure Tymr.mExitClick(Sender: TObject);
begin
  xyAbort(Port);
  SioDone(Port);
  Application.Terminate;
end;

procedure Tymr.mReceiveClick(Sender: TObject);

var
  I, Code : Integer;
  FilePtr : PChar;
  MsgPtr  : PChar;
  DirPtr  : PChar;
  Packet  : Integer;
  LastPacket : Integer;
begin
  { verify text }
   If Length(eLocalDir.Text) = 0 Then
   begin
      DisplayLine(ymr.eResult,'Missing "Local Dir" above!');
      exit
   end;
  { copy strings }
  DirName  := eLocalDir.Text;
  DisplayLine(ymr.eResult,Format('DirN : %s',[DirName]));
  { pass the key code }
  if SioKeyCode(WSC_KEY_CODE) < 0 then
    begin 
      DisplayLine(ymr.eResult,'ERROR: Bad Key Code!');
      exit      
    end;  
  { pass the key code }
  if SioKeyCode(WSC_KEY_CODE) < 0 then
    begin 
      DisplayLine(ymr.eResult,'ERROR: Bad Key Code!');
      exit      
    end;    
  { initialize WSC }
  Code := SioReset(Port,2048,2048);
  if Code < 0 then
    begin
      DisplayLine(ymr.eResult,Format('Error %d: Cannot reset port',[Code]));
      DisplayError(ymr.eResult, Code);
      exit
    end;
  { set parameters }
  SioBaud(Port,BaudRate);
  SioParms(Port, WSC_NoParity, WSC_OneStopBit, WSC_WordLength8);
  SioDTR(Port,'S');
  SioRTS(Port,'S');
  { set hardware (RTS/CTS) flow control, other side MUST also set hardware flow control }
  if SioCTS(Port) = 0 Then
     DisplayLine(ymr.eResult,'WARNING: Program will block until CTS is set by other side!');  
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
      DisplayLine(ymr.eResult,Format('Cannot set directory %s',[DirName]));
      exit
    end;
  { YM Receive }
  FilePtr := nil;
  DisplayLine(ymr.eResult,'Starting YMODEM receive');
  Code := xyStartRx(Port,FilePtr,'C',YMODEM);
  { check return code }
  if Code < 0 then
    begin
      DisplayLine(ymr.eResult,Format('Error %d: YMODEM receive fails',[Code]));
      exit
    end;
  { allocate memory for XY driver messages }
  GetMem(MsgPtr,90);
  { ready to go }
  SCREEN.Cursor := crHourGlass;
  mReceive.Enabled := false;
  { receive file }
  LastPacket := -1;
  while true do
    begin
      { run the XY driver a few times }
      for I:= 1 To 4 do Code := xyDriver(Port);
      while true do
        begin
          { get next message from XY driver }
          if xyGetMessage(Port,MsgPtr,90) <> 0 then
            DisplayLine(ymr.eResult,StrPas(MsgPtr))
          else break;
        end;
      { is XY driver done ? }
      if Code = XY_IDLE then
        begin
          { XY driver is idle }
          Code := xyGetParameter(Port,XY_GET_ERROR_CODE);
          if Code <> 0 then
            DisplayLine(ymr.eResult,Format('XY file transfer fails (%d)',[Code]))
          else DisplayLine(ymr.eResult,'File transfer complete');
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
              DisplayLine(ymr.eResult,Format('Packet %d',[Packet]) );
              LastPacket := Packet
            end
        end
    end
end;

procedure Tymr.FormCreate(Sender: TObject);
begin
  { PROGRAMMER: Edit next 3 lines to suite }
  Port := COM1;
  BaudRate := 57600;
  { END-PROGRAMMER }
  DisplayLine(ymr.eResult,Format('Port : COM%1d',[1+Port]));
  DisplayLine(ymr.eResult,Format('Baud : %d',[BaudRate]));
  DisplayLine(ymr.eResult,'Push "Receive" above to receive file')
end;

end.
