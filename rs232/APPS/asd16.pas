unit asd16;

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

function ascAbort:Integer;
function ascDriver:Integer;
function ascGetMessage(Buffer:PChar;Size:Integer):Integer;
function ascGetParameter(Parameter:Integer):Integer;
function ascInit(Port,RxQueSize,xFlag:Integer):Integer;
function ascStartTx(FileName:PChar;CharPace,TermChar,EchoFlag:Integer):Integer;
function ascStartRx(FileName:PChar;TermChar,FirstWait,CharWait,EchoFlag:Integer):Integer;

implementation

function ascAbort; external 'ASD16.DLL';
function ascDriver; external 'ASD16.DLL';
function ascGetMessage; external 'ASD16.DLL';
function ascGetParameter; external 'ASD16.DLL';
function ascInit; external 'ASD16.DLL';
function ascStartTx; external 'ASD16.DLL';
function ascStartRx; external 'ASD16.DLL';

end.


