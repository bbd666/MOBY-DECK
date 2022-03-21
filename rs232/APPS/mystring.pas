unit MyString;

{
 Beginning with Delphi 2, strings can be a maximum of 2GB rather than
 the 256 bytes in Delphi 1.

 However, there is an error in the Delphi "StrPCopy" function in Delphi
 versions 2 and 3. The StrPCopy function will not copy more than 256 bytes.
 Use the MyStrPCopy instead.
}

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Menus,
  ExtCtrls, StdCtrls;

procedure MyStrPCopy(Ptr:PChar; Text:String);

implementation

procedure MyStrPCopy(Ptr:PChar; Text:String);
var
  I, Len : Integer;
begin
  Len := Length(Text);
  for I := 1 To Len do
    begin
      Ptr^ := Text[I];
      Inc(Ptr)
    end
end;

(* initialization *)
begin
end.
