unit mio16;

interface

const

   SEND_TO  = 1;
   WAIT_FOR = 2;
   QUIET    = 3;
   HANGUP   = 4;

   MIO_IDLE = 0;
   MIO_RUNNING = -1;

function mioSendTo(Port:Integer; Pace:LongInt; Text:PChar) : Integer;
function mioQuiet(Port:Integer; QuietTime:LongInt) : Integer;
function mioWaitFor(Port:Integer; MaxTime:LongInt; Text:PChar ) : Integer;
function mioResult(Port:Integer) : Integer;
function mioDriver(Port:Integer) : Integer;
function mioBreak(Port:Integer) : Integer;
function mioDebug(Handle:Integer) : Integer;

implementation

function mioSendTo; external 'MIO16.DLL';
function mioQuiet; external 'MIO16.DLL';
function mioWaitFor; external 'MIO16.DLL';
function mioResult; external 'MIO16.DLL';
function mioBreak; external 'MIO16.DLL';
function mioDriver; external 'MIO16.DLL';
function mioDebug; external 'MIO16.DLL';
end.

