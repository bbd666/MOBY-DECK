unit asd32;

interface

const
  ASC_NO_ERROR          =  0;
  ASC_NOT_ACTIVE_ERROR  = -700;
  ASC_CANNOT_OPEN_ERROR = -701;
  ASC_DISK_READ_ERROR   = -702;
  ASC_INTERNAL_ERROR    = -705;
  ASC_NOT_OPEN_ERROR    = -706;
  ASC_GET_STATE         = 0;
  ASC_GET_ERROR_STATE   = 1;
  ASC_GET_ERROR_CODE    = 2;

function ascAbort:Integer;stdcall
function ascDriver:Integer;stdcall
function ascGetMessage(Buffer:PChar;Size:Integer):Integer;stdcall
function ascGetParameter(Parameter:Integer):Integer;stdcall
function ascInit(Port,RxQueSize,xFlag:Integer):Integer;stdcall
function ascStartTx(FileName:PChar;CharPace,TermChar,EchoFlag:Integer):Integer;stdcall
function ascStartRx(FileName:PChar;TermChar,FirstWait,CharWait,EchoFlag:Integer):Integer;stdcall

implementation

function ascAbort; external 'ASD32.DLL';
function ascDriver; external 'ASD32.DLL';
function ascGetMessage; external 'ASD32.DLL';
function ascGetParameter; external 'ASD32.DLL';
function ascInit; external 'ASD32.DLL';
function ascStartTx; external 'ASD32.DLL';
function ascStartRx; external 'ASD32.DLL';

end.


