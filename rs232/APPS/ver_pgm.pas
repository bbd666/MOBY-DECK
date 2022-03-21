unit Ver_pgm;

{*
** NAME: "Version" (VER_PGM & VER_PRJ)
**
** TYPE: Win32 Delphi.
**
** DATE: January 28, 2009.
**
** PURPOSE: This program displayes the WSC version, build, and
**          registration string.
*}

interface

uses
  wsc32, keycode, Display,
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Menus, StdCtrls;
type
  Tver = class(TForm)
    MainMenu1: TMainMenu;
    mPushMe: TMenuItem;
    mExit: TMenuItem;
    eResult: TMemo;
    procedure mExitClick(Sender: TObject);
    procedure mPushMeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ver: Tver;

implementation

{$R *.DFM}

procedure Tver.mExitClick(Sender: TObject);
begin
  Application.Terminate
end;

procedure Tver.mPushMeClick(Sender: TObject);
var
  Code : Integer;
  Text : String;
  D1,D2,D3 : Integer;
  BuffPtr  : PChar;
begin
  { pass the key code }
  if SioKeyCode(WSC_KEY_CODE) < 0 then
    begin 
      DisplayLine(VER.eResult,'ERROR: Bad Key Code!');
      exit      
    end;   
  { get WSC version }
  Code := SioInfo('V');
  { DisplayLine(VER.eResult,Format('Version (in hex) = %x',[Code])); }
  D3 := $0F AND Code;  Code := Code SHR 4;
  D2 := $0F AND Code;  Code := Code SHR 4;
  D1 := $0F AND Code;
  { display WSC version }
  if SioInfo('3') <> 0 then
    DisplayLine(VER.eResult,'WSC32 Version ' + Chr(48 + D1)
            + '.' + Chr(48 + D2)
            + '.' + Chr(48 + D3))
  else
      DisplayLine(VER.eResult,'WSC16 Version ' + Chr(48 + D1)
            + '.' + Chr(48 + D2)
            + '.' + Chr(48 + D3));
  DisplayLine(VER.eResult, Format('Build %d',[SioInfo('B')] ));
  { display registration string }
  GetMem(BuffPtr,50);
  Code := SioGetReg(BuffPtr, 50);
  If Code > 0 then
    begin
      Text := Format('%s',[BuffPtr]);
      DisplayLine(VER.eResult, Text);
    end;
  FreeMem(BuffPtr, 50)
end;

end.
