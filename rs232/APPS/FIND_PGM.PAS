unit Find_pgm;

{*
** NAME: "Modem Finder Program" (FIND_PGM & FIND_PRJ)
**
** TYPE: Win32 Delphi.
**
** DATE: January 28, 2009.
**
** PURPOSE: This program searches for a modem connected 
**          to one of the serial ports.
*}

interface

uses
  wsc32, keycode, mio32, Display,
  SysUtils, WinTypes, WinProcs, Messages,
  Classes, Graphics, Controls,
  Forms, Dialogs, Menus, StdCtrls;

type
  TFind = class(TForm)
    MainMenu: TMainMenu;
    FindModem: TMenuItem;
    Exit: TMenuItem;
    Memo: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure ExitClick(Sender: TObject);
    procedure FindModemClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Find: TFind;

implementation

{$R *.DFM}

procedure TFind.FormCreate(Sender: TObject);
begin
  DisplayLine(Find.Memo,'*** Connect your modem to this computer and turn to ON.');
  DisplayLine(Find.Memo,'*** Select FindModem above to search for your modem.');
  { pass the key code }
  if SioKeyCode(WSC_KEY_CODE) < 0 then
    begin 
      DisplayLine(Find.Memo,'ERROR: Bad Key Code!')   
    end
end;

procedure TFind.ExitClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFind.FindModemClick(Sender: TObject);
const
   COM256 = 255; {COM1 to COM16 already defined in WSC32.PAS}
var
  Port  : Integer;
  Code  : Integer;
  First : Integer;
  Last  : Integer;
  Text  : String;
  Ptr   : PChar;
begin
   {32-bit Windows supports a maximum of 256 ports}
   First := COM1;
   Last := COM256;
   DisplayLine(Find.Memo,''); 
   { look at each port in turn }
   DisplayLine(Find.Memo, Format('Examining COM%d thru COM%1d ',[1+First,1+Last]));
   for Port := First to Last do
     begin
       Code := SioReset(Port,128,128);
       if Code<0 then 
         begin
           {display erro code?}
           {DisplayError(Find.Memo,Code)}
         end
       else
         begin
           { turn on DTR or modem won't respond }
           SioDTR(Port,'S');
           { modem should raise DSR }
           if SioDSR(Port) > 0 then
             begin
               DisplayLine(Find.Memo,Format('Port COM%d is found (DSR = 1)',[1+Port]) );
               GetMem(Ptr,32);
               Text := '!!AT!';
               StrPCopy(Ptr,Text);
               { send AT }
               DisplayLine(Find.Memo,'  Sending AT');
               mioSendTo(Port,200,Ptr);
               repeat
                 Code := mioDriver(Port);
                 if(Code>=0) then DisplayChar(Find.Memo,Chr(Code))
               until Code = MIO_IDLE;
               { wait for OK }
               Text := 'OK';
               StrPCopy(Ptr,Text);
               DisplayLine(Find.Memo,'  Waiting for OK . . .');
               mioWaitFor(Port,2000,Ptr);
               repeat
                 Code := mioDriver(Port);
                 if Code>=0 then DisplayChar(Find.Memo,Chr(Code))
               until Code = MIO_IDLE;
               FreeMem(Ptr,32);
               { did we get OK ? }
               if mioResult(Port) <> 0 then
                 begin
                   DisplayLine(Find.Memo,'');
                   DisplayLine(Find.Memo,
                     Format('  Modem detected on COM%d',[1+Port]));
                   SioDone(Port);
                   Break;
                 end
               else DisplayLine(Find.Memo,'  No response.')
             end
           else DisplayLine(Find.Memo,
             Format('Port COM%d is found (DSR = 0)',[1+Port])
             );
           SioDone(Port);
         end
     end;
     DisplayLine(Find.Memo,'Done.');
end;

end.
