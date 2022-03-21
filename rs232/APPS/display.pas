unit Display;

{Display (on the screen) unit used by most of the example programs}

interface

uses
  wsc32,
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Menus,
  ExtCtrls, StdCtrls;

procedure DisplayChar(Memo: TMemo; TheChar : Char);
procedure DisplayString(Memo: TMemo; Text : String);
procedure DisplayLine(Memo: TMemo; Text : String);
procedure DisplayError(Memo: TMemo; Code : Integer);

implementation

{Display character}

procedure DisplayChar(Memo: TMemo; TheChar : Char);
var
   Count     : Integer;
   TheString : String;
begin
   if TheChar <> Chr(13) then
     {ignore CR}
     begin
       if TheChar = Chr(10) then
         begin
           {create new line}
           Memo.Lines.Add('');
         end
       else
         begin
           {printable chars only}
           if (TheChar<' ') or (TheChar>'~') then TheChar := ' ';
           {append char}
           Count := Memo.Lines.Count;
           TheString := Memo.Lines.Strings[Count-1] + TheChar;
           Memo.Lines.Strings[Count-1] := TheString;
         end
     end
end;

{Display string}

procedure DisplayString(Memo: TMemo; Text : String);
var
  S   : String;
  I   : Integer;
  Len : Integer;
  Count : Integer;
  TheChar : Char;
begin
  Len := Length(Text);
  Count := Memo.Lines.Count;
  S := '';
  for I := 1 to Len do
    begin
      TheChar := Text[I];
      if TheChar <> Chr(13) then
      {ignore CR}
      begin
        if TheChar = Chr(10) then
          begin {is linefeed}
            {update current line}
            if Length(S) > 0 Then
              begin
                S := Memo.Lines.Strings[Count-1] + S;
                Memo.Lines.Strings[Count-1] := S;
              end;
            {create new line}
            Memo.Lines.Add('');
            Inc(Count); S := '';
          end
        else {is NOT linefeed}
          begin
            {printable chars only}
            if (TheChar<' ') or (TheChar>'~') then TheChar := ' ';
            {append char}
            S := S + TheChar;
          end
      end
    end; {end-for}
  if Length(S) > 0 Then
    begin
      {update string}
      S := Memo.Lines.Strings[Count-1] + S;
      Memo.Lines.Strings[Count-1] := S;
    end
end;

{Display String & CRLF}

procedure DisplayLine(Memo: TMemo; Text : String);
begin
  DisplayString(Memo,Text);
  DisplayChar(Memo,Chr(10))
end;

(* Display error text *)

procedure DisplayError(Memo: TMemo; Code : Integer);
var
   Text : String;
{$IFDEF WIN32}
   Ptr  : PChar;
{$ENDIF}
begin
  if Code <0 then
    begin
      case Code of
        WSC_IE_BADID: Text := 'Bad port ID';
        WSC_IE_OPEN:  Text := 'Cannot open port';
        WSC_IE_NOPEN: Text := 'Port already open';
        WSC_IE_MEMORY:   Text := 'Cannot allocate memory';
        WSC_IE_DEFAULT:  Text := 'Error in default parameters';
        WSC_IE_HARDWARE: Text := 'Hardware error';
        WSC_IE_BYTESIZE: Text := 'Unsupported byte size';
        WSC_IE_BAUDRATE: Text := 'Unsupported baud rate';
        WSC_RANGE:   Text := 'Parameter out of range';
        WSC_ABORTED: Text := 'Shareware version corrupted';
        WSC_EXPIRED: Text := 'Evaluation version expired or SioKeyCode not called';
        WSC_BUFFERS: Text := 'Cannot allocate memory for buffers';
        WSC_THREAD:  Text := 'Cannot start thread';
        WSC_KEYCODE: Text := 'Bad key code';        
{$IFDEF WIN32}
        WSC_WIN32ERR:
          begin
            GetMem(Ptr, 120);
            Code := SioWinError(Ptr, 120);
            DisplayLine(Memo,StrPas(Ptr));
            Text := Format(' Win32 error %d.',[Code]);
            FreeMem(Ptr,120);
          end;
{$ENDIF}
        else Text := 'Unknown error';
      end;
      DisplayLine(Memo,Text);
    end
end;

(* initialization *)
begin
end.
