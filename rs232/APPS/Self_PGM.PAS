unit Self_pgm;

{*
** NAME: "Self Test" (SELF_PGM & SELF_PRJ)
**
** TYPE: Win32 Delphi.
**
** DATE: January 28, 2009.
**
** PURPOSE: This program performs serial port testing using a 
**          loopback serial device. See LOOPBACK.TXT.
*}

interface

uses
  Display,
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Menus,
  wsc32, keycode, ExtCtrls, StdCtrls;
const
  MaxRow = 15;
  MaxCol = 65;
type
  TSelf = class(TForm)
    MainMenu: TMainMenu;
    menuPort: TMenuItem;
    Test: TMenuItem;
    menuCOM1: TMenuItem;
    menuCOM2: TMenuItem;
    menuCOM3: TMenuItem;
    menuCOM4: TMenuItem;
    Instructions: TMenuItem;
    menuInstruct: TMenuItem;
    menuExit: TMenuItem;
    MemoMain: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure menuCOM1Click(Sender: TObject);
    procedure menuCOM2Click(Sender: TObject);
    procedure menuCOM3Click(Sender: TObject);
    procedure menuCOM4Click(Sender: TObject);
    procedure InstructionsClick(Sender: TObject);
    procedure TestClick(Sender: TObject);
    procedure menuExitClick(Sender: TObject);

  private
    { Private declarations }
    Port : Integer;
    Baud : Integer;
    Parity : Integer;
    DataBits : Integer;
    StopBits : Integer;
    TestText : string;
  public
    { Public declarations }
  end ;

var
  Self: TSelf;

implementation

{$R *.DFM}

procedure TSelf.FormCreate(Sender: TObject);
begin
  { initialize parameters }
  Port := COM1;
  Baud := WSC_Baud19200;
  Parity := WSC_NoParity;
  DataBits := WSC_WordLength8;
  StopBits := WSC_OneStopBit;
  Self.Caption := 'Selftest: COM' + Chr($31+Port);
  menuCOM1.Checked := true;
  TestText := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
end;

procedure TSelf.menuCOM1Click(Sender: TObject);
begin
  Self.Caption := 'Selftest: COM' + Chr($31+Port);
  menuCOM1.Checked := true;
  menuCOM2.Checked := false;
  menuCOM3.Checked := false;
  menuCOM4.Checked := false;
  Port := COM1
end;

procedure TSelf.menuCOM2Click(Sender: TObject);
begin
  Self.Caption := 'Selftest: COM' + Chr($32+Port);
  menuCOM1.Checked := false;
  menuCOM2.Checked := true;
  menuCOM3.Checked := false;
  menuCOM4.Checked := false;
  Port := COM2
end;

procedure TSelf.menuCOM3Click(Sender: TObject);
begin
  Self.Caption := 'Selftest: COM' + Chr($33+Port);
  menuCOM1.Checked := false;
  menuCOM2.Checked := false;
  menuCOM3.Checked := true;
  menuCOM4.Checked := false;
  Port := COM3
end;

procedure TSelf.menuCOM4Click(Sender: TObject);
begin
  Self.Caption := 'Selftest: COM' + Chr($34+Port);
  menuCOM1.Checked := false;
  menuCOM2.Checked := false;
  menuCOM3.Checked := false;
  menuCOM4.Checked := true;
  Port := COM4
end;

procedure TSelf.InstructionsClick(Sender: TObject);
begin
   DisplayLine(Self.MemoMain,'SELFTEST tests a single port for functionality.');
   DisplayLine(Self.MemoMain,'The port must terminate with a loopback adapter.');
   DisplayLine(Self.MemoMain,'See LOOPBACK.TXT for more information.')
end;

procedure TSelf.TestClick(Sender: TObject);
var
  Code : Integer;
  N : Integer;
  Loop : Integer;
  Size : Word;
  Ch   : Char;
  Hr,Mn,ms : Word;
  Sec1,Sec2: Word;
  MaxRxQue : Integer;
  MaxTxQue : Integer;
  TextPtr  : PChar;
begin
  { pass the key code }
  if SioKeyCode(WSC_KEY_CODE) < 0 then
    begin 
      DisplayLine(Self.MemoMain,'ERROR: Bad Key Code!');
      exit      
    end; 
  { initialize WSC }
  Code := SioReset(Port,2048,2048);
  if Code < 0 then
    begin
      DisplayString(Self.MemoMain,Format('Error %d: Cannot reset port',[Code]));
      exit
    end;
  { update menu settings }
  SioBaud(Port,Baud);
  SioParms(Port, Parity, StopBits, DataBits);
  SioDTR(Port,'S');
  SioRTS(Port,'S');
  SioSetInteger(Port,'W',1);
  DisplayString(Self.MemoMain,'Note: SioPuts will return immediately');
  { display the test string }
  Size := Length(TestText);
  DisplayString(Self.MemoMain,'Test string "');
  DisplayString(Self.MemoMain,TestText);
  DisplayLine(Self.MemoMain,'"');
  { create pointer to TestText }
  GetMem(TextPtr, Size+1);
  StrPCopy(TextPtr, TestText);
  { send TestText 16 times }
  DisplayString(Self.MemoMain,'  Sending: ');
  for Loop := 1 to 16 do
    begin
      DisplayString(Self.MemoMain,Format('%d ',[Loop]));
      {send test string}
      repeat
        Code := SioPuts(Port, TextPtr, Size);
        Sleep(100);
      until Code <> WSC_BUSY;
      {check for error}
      if Code < 0 Then
        begin
          DisplayString(Self.MemoMain,Format('SioPuts returns %d ',[Code]));
          exit
        end;
      {wait till data is sent}
      repeat
        Code := SioTxQue(Port);
        {DisplayString(Self.MemoMain,Format('[%d]',[Code]));}
        Sleep(100);
      until Code <= 0;
    end;
  MaxRxQue := SioRxQue(Port);
  MaxTxQue := SioTxQue(Port);
  DisplayLine(Self.MemoMain,' ');
  { receive echo }
  DisplayString(Self.MemoMain,'Receiving: ');
  for Loop := 1 to 16 do
    begin
      DisplayString(Self.MemoMain,Format('%d ',[Loop]));
      { get response }
      for N := 1 to Size do
        begin
          { expect character Ch }
          Ch := TestText[N];
          DecodeTime(Time,Hr,Mn,Sec1,ms);
          { get next incoming character }
          repeat
            { fetch serial character }
            Code := SioGetc(Port);
            if Code >= 0 then
              begin
                { is it the character expected? }
                if Ch <> char(code) then
                  begin
                    DisplayLine(Self.MemoMain,Format('Expected %s not %xH',[Ch,Code]));
                    Code := SioDone(Port);
                    Application.Terminate
                  end
              end
            { no incoming character }
            else DecodeTime(Time,Hr,Mn,Sec2,ms);
          until (Code>0) or (Sec2 = (Sec1 + 3) mod 60);
          { did we time out? }
          if Code < 0 then
            begin
              DisplayLine(Self.MemoMain,'Timed out waiting for serial input');
              SioDone(Port);
              exit
            end
        end
    end;
  DisplayLine(Self.MemoMain,' ');
  DisplayLine(Self.MemoMain,Format('RX queue size = %d',[MaxRxQue]));
  DisplayLine(Self.MemoMain,Format('TX queue size = %d',[MaxTxQue]));
  SioRxClear(Port);
  { close down }
  FreeMem(TextPtr, Size+1);
  DisplayLine(Self.MemoMain,'Shutting down COM port');
  SioDone(Port)
end;

procedure TSelf.menuExitClick(Sender: TObject);
begin
  SioDone(Port);
  Application.Terminate;
end;

end.
