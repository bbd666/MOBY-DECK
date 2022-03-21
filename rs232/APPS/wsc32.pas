unit wsc32;

{WSC32.PAS, Version 4.4.0, Win32 Delphi}

interface

const
   (* COMM Ports *)
   COM1 = 0;
   COM2 = 1;
   COM3 = 2;
   COM4 = 3;
   COM5 = 4;
   COM6 = 5;
   COM7 = 6;
   COM8 = 7;
   COM9 = 8;
   COM10 = 9;
   COM11 = 10;
   COM12 = 11;
   COM13 = 12;
   COM14 = 13;
   COM15 = 14;
   COM16 = 15;
   {COM17 thru COM256 are defined in the same pattern as above}
   (* Baud Rate Codes *)
   WSC_Baud110  = 0;
   WSC_Baud300  = 1;
   WSC_Baud1200 = 2;
   WSC_Baud2400 = 3;
   WSC_Baud4800 = 4;
   WSC_Baud9600 = 5;
   WSC_Baud19200  = 6;
   WSC_Baud38400  = 7;
   WSC_Baud57600  = 8;
   WSC_Baud115200 = 9;
   (* Parity Codes *)
   WSC_NoParity    = 0;
   WSC_OddParity   = 1;
   WSC_EvenParity  = 2;
   WSC_MarkParity  = 3;
   WSC_SpaceParity = 4;
   (* Stop Bit Codes *)
   WSC_OneStopBit   = 0;
   WSC_One5StopBits = 1;
   WSC_TwoStopBits  = 2;
   (* Word Length Codes *)
   WSC_WordLength5 = 5;
   WSC_WordLength6 = 6;
   WSC_WordLength7 = 7;
   WSC_WordLength8 = 8;
   (* WSC errors *)
   WSC_BUSY      = -100;
   WSC_NO_DATA   = -100;
   WSC_RANGE     = -101;
   WSC_ABORTED   = -102;
   WSC_WIN32ERR  = -103;
   WSC_EXPIRED   = -104;
   WSC_BUFFERS   = -105;
   WSC_THREAD    = -106;
   WSC_TIMEOUT   = -107;
   WSC_KEYCODE   = -108;
   (* Windows comm errors *)
   WSC_IE_BADID     = -1;
   WSC_IE_OPEN      = -2;
   WSC_IE_NOPEN     = -3;
   WSC_IE_MEMORY    = -4;
   WSC_IE_DEFAULT   = -5;
   WSC_IE_HARDWARE  = -10;
   WSC_IE_BYTESIZE  = -11;
   WSC_IE_BAUDRATE  = -12;
   WSC_IO_ERROR     = -13;
   (* SioGetError masks *)
   WSC_RXOVER   = $0001;
   WSC_OVERRUN  = $0002;
   WSC_PARITY   = $0004;
   WSC_FRAME    = $0008;
   WSC_BREAK    = $0010;
   WSC_TXFULL   = $0100;
   (* commands *)
   WSC_ASSERT_BREAK = 'A';
   WSC_CANCEL_BREAK = 'C';
   WSC_DETECT_BREAK = 'D';
   WSC_SET_LINE     = 'S';
   WSC_CLEAR_LINE   = 'C';
   WSC_READ_LINE    = 'R';
   (* flow control *)
   WSC_HARDWARE_FLOW_CONTROL = 'H';
   WSC_SOFTWARE_FLOW_CONTROL = 'S';
   WSC_NO_FLOW_CONTROL       = 'N';
   (* SioEvent, SioEventChar, and SioEventWait codes *)
   WSC_IO_PENDING   = 2; 
   WSC_IO_COMPLETE  = 3;

 function SioBaud(Port, BaudCode : Integer) : Integer; stdcall;
 function SioBrkSig(Port : Integer; Cmd : Char) : Integer; stdcall;
 function SioCTS(Port : Integer) : Integer; stdcall;
 function SioDCD(Port : Integer) : Integer; stdcall;
 function SioDebug(Cmd : Integer) : Integer; stdcall;
 function SioDone(Port : Integer) : Integer; stdcall;
 function SioDSR(Port : Integer) : Integer; stdcall;
 function SioDTR(Port : Integer; Cmd : Char) : Integer; stdcall;
 function SioEvent(Port : Integer; Mask : Word) : Integer; stdcall;
 function SioEventChar(Port : Integer; EvtChar: Char; Timeout : Word) : Integer; stdcall;
 function SioEventWait(Port : Integer; Mask : Word; Timeout : Word) : Integer; stdcall;
 function SioFlow(Port: Integer; Cmd : Char) : Integer; stdcall;
 function SioGetc(Port: Integer) : Integer; stdcall;
 function SioGetReg(Buffer : PChar; BufSize : Integer) : Integer; stdcall;
 function SioGets(Port: Integer; Buffer : PChar; Size : Word) : Integer; stdcall;
 function SioInfo(Cmd : Char) : Integer; stdcall;
 function SioKeyCode(KeyCode : Integer) : Integer; stdcall;
 function SioMessage(Port, Handle, MsgCode: Integer; Mask: LongInt) : Integer; stdcall;
 function SioParms(Port, ParityCode, StopBitsCode, DataBitsCode : Integer) : Integer; stdcall;
 function SioPutc(Port : Integer; Ch : Char) : Integer; stdcall;
 function SioPuts(Port : Integer; Buffer : PChar; Size : Word) : Integer; stdcall;
 function SioRead(Port : Integer; Reg : Integer) : Integer; stdcall;
 function SioReset(Port, RxQueSize, TxQueSize : Integer) : Integer; stdcall;
 function SioRI(Port : Integer) : Integer; stdcall;
 function SioRTS(Port : Integer; Cmd : Char) : Integer; stdcall;
 function SioRxClear(Port : Integer) : Integer; stdcall;
 function SioRxQue(Port : Integer) : Integer; stdcall;
 function SioSetInteger(Port : Integer; ParmName : Char; ParmValue : Integer) : Integer; stdcall;
 function SioStatus(Port : Integer; Mask : Word) : Integer; stdcall;
 function SioTimer : LongInt; stdcall;
 function SioTxClear(Port : Integer) : Integer; stdcall;
 function SioTxQue(Port : Integer) : Integer; stdcall;
 function SioUnGetc(Port : Integer; Ch : Char) : Integer; stdcall;
 function SioWinError(Buffer : PChar; Size : Word) : Integer; stdcall;
 function SioByteToShort(Buffer : PChar) : Integer; stdcall; 
 function SioShortToByte(Buffer : PChar) : Integer; stdcall; 
 function SioSetTimeouts(Port : Integer; ReadInterval,ReadMult,ReadCons,WriteMult,WriteCons : Integer) : Integer; stdcall; 
 function SioSleep(MilliSecs : Integer) : Integer; stdcall; 
 
implementation

 function SioBaud; external 'WSC32.DLL';
 function SioBrkSig; external 'WSC32.DLL';
 function SioCTS; external 'WSC32.DLL';
 function SioDCD; external 'WSC32.DLL';
 function SioDebug; external 'WSC32.DLL';
 function SioDone; external 'WSC32.DLL';
 function SioDSR; external 'WSC32.DLL';
 function SioDTR; external 'WSC32.DLL';
 function SioEvent; external 'WSC32.DLL';
 function SioEventChar; external 'WSC32.DLL';
 function SioEventWait; external 'WSC32.DLL'; 
 function SioFlow; external 'WSC32.DLL';
 function SioGetc; external 'WSC32.DLL';
 function SioGetReg; external 'WSC32.DLL';
 function SioGets; external 'WSC32.DLL';
 function SioInfo; external 'WSC32.DLL';
 function SioKeyCode; external 'WSC32.DLL';
 function SioMessage; external 'WSC32.DLL';
 function SioParms; external 'WSC32.DLL';
 function SioPutc; external 'WSC32.DLL';
 function SioPuts; external 'WSC32.DLL';
 function SioRead; external 'WSC32.DLL';
 function SioReset; external 'WSC32.DLL';
 function SioRI; external 'WSC32.DLL';
 function SioRTS; external 'WSC32.DLL';
 function SioRxClear; external 'WSC32.DLL';
 function SioRxQue; external 'WSC32.DLL';
 function SioSetInteger; external 'WSC32.DLL';
 function SioStatus; external 'WSC32.DLL';
 function SioTimer; external 'WSC32.DLL';
 function SioTxClear; external 'WSC32.DLL';
 function SioTxQue; external 'WSC32.DLL';
 function SioUnGetc; external 'WSC32.DLL';
 function SioWinError; external 'WSC32.DLL';
 function SioByteToShort; external 'WSC32.DLL';
 function SioShortToByte; external 'WSC32.DLL';
 function SioSetTimeouts; external 'WSC32.DLL';
 function SioSleep; external 'WSC32.DLL';
end.
