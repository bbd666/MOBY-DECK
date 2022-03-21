unit mio32;

interface

const

   SEND_TO  = 1;
   WAIT_FOR = 2;
   QUIET    = 3;
   HANGUP   = 4;

   MIO_IDLE = 0;
   MIO_RUNNING = -1;

function mioSendTo(Port:Integer; Pace:LongInt; Text:PChar) : Integer; stdcall
function mioQuiet(Port:Integer; QuietTime:LongInt) : Integer; stdcall
function mioWaitFor(Port:Integer; MaxTime:LongInt; Text:PChar ) : Integer; stdcall
function mioResult(Port:Integer) : Integer; stdcall
function mioDriver(Port:Integer) : Integer; stdcall
function mioBreak(Port:Integer) : Integer; stdcall
function mioDebug(Handle:Integer) : Integer; stdcall

implementation

function mioSendTo; external 'MIO32.DLL';
function mioQuiet; external 'MIO32.DLL';
function mioWaitFor; external 'MIO32.DLL';
function mioResult; external 'MIO32.DLL';
function mioBreak; external 'MIO32.DLL';
function mioDriver; external 'MIO32.DLL';
function mioDebug; external 'MIO32.DLL';
end.

 