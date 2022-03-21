unit wsc16;

{WSC16.PAS, Version 4.4.0, Win16 Delphi}

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
   WSC_NO_DATA  = -100;
   WSC_RANGE    = -101;
   WSC_ABORTED  = -102;
   WSC_WIN32ERR = -103;
   WSC_EXPIRED  = -104;
   WSC_BUFFERS  = -105;
   WSC_THREAD   = -106;
   WSC_TIMEOUT  = -107;
   WSC_KEYCODE  = -108;
   (* Windows comm errors *)
   WSC_IE_BADID     = -1;
   WSC_IE_OPEN      = -2;
   WSC_IE_NOPEN     = -3;
   WSC_IE_MEMORY    = -4;
   WSC_IE_DEFAULT   = -5;
   WSC_IE_HARDWARE  = -10;
   WSC_IE_BYTESIZE  = -11;
   WSC_IE_BAUDRATE  = -12;
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

function SioBaud(Port, BaudCode : Integer) : Integer;
function SioBrkSig(Port : Integer; Cmd : Char) : Integer;
function SioCTS(Port : Integer) : Integer;
function SioDCD(Port : Integer) : Integer;
function SioDebug(Cmd : Integer) : Integer;
function SioDone(Port : Integer) : Integer;
function SioDSR(Port : Integer) : Integer;
function SioDTR(Port : Integer; Cmd : Char) : Integer;
function SioFlow(Port: Integer; Cmd : Char) : Integer;
function SioGetc(Port: Integer) : Integer;
function SioGets(Port : Integer; BufPtr : PChar; Size : Word) : Integer;
function SioInfo(Cmd : Char) : Integer;
function SioParms(Port, ParityCode, StopBitsCode, DataBitsCode : Integer) : Integer;
function SioPutc(Port : Integer; Ch : Char) : Integer;
function SioPuts(Port : Integer; BufPtr : PChar; Size : Word) : Integer;
function SioRead(Port : Integer; Reg : Integer) : Integer;
function SioReset(Port, RxQueSize, TxQueSize : Integer) : Integer;
function SioRI(Port : Integer) : Integer;
function SioRTS(Port : Integer; Cmd : Char) : Integer;
function SioRxClear(Port : Integer) : Integer;
function SioRxQue(Port : Integer) : Integer;
function SioStatus(Port : Integer; Mask : Word) : Integer;
function SioTimer : LongInt;
function SioTxClear(Port : Integer) : Integer;
function SioTxQue(Port : Integer) : Integer;
function SioUnGetc(Port : Integer; Ch : Char) : Integer;
function SioKeyCode(KeyCode : Integer) : Integer; 
function SioGetReg(Buffer : PChar; BufSize : Integer) : Integer; 
function SioSetInteger(Port : Integer; ParmName : Integer; ParmValue : Integer) : Integer; 

implementation

function SioBaud; external 'WSC16.DLL';
function SioBrkSig; external 'WSC16.DLL';
function SioCTS; external 'WSC16.DLL';
function SioDCD; external 'WSC16.DLL';
function SioDebug; external 'WSC16.DLL';
function SioDone; external 'WSC16.DLL';
function SioDSR; external 'WSC16.DLL';
function SioDTR; external 'WSC16.DLL';
function SioFlow; external 'WSC16.DLL';
function SioGetc; external 'WSC16.DLL';
function SioGets; external 'WSC16.DLL';
function SioInfo; external 'WSC16.DLL';
function SioParms; external 'WSC16.DLL';
function SioPutc; external 'WSC16.DLL';
function SioPuts; external 'WSC16.DLL';
function SioRead; external 'WSC16.DLL';
function SioReset ; external 'WSC16.DLL';
function SioRI; external 'WSC16.DLL';
function SioRTS; external 'WSC16.DLL';
function SioRxClear; external 'WSC16.DLL';
function SioRxQue; external 'WSC16.DLL';
function SioStatus; external 'WSC16.DLL';
function SioTimer; external 'WSC16.DLL';
function SioTxClear; external 'WSC16.DLL';
function SioTxQue; external 'WSC16.DLL';
function SioUnGetc; external 'WSC16.DLL';
function SioKeyCode; external 'WSC16.DLL';
function SioGetReg; external 'WSC16.DLL'; 
function SioSetInteger; external 'WSC16.DLL'; 

end.
