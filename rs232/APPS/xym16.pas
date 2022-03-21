unit xym16;

interface

const
  XY_IDLE     = 0;
  XY_RUNNING  = 1;
  (* error codes *)
  XY_NO_ERROR              = 0;
  XY_UNKNOWN_ERROR         = 300;
  XY_ALREADY_ACTIVE_ERROR  = 301;
  XY_CANNOT_OPEN_ERROR     = 302;
  XY_EMPTY_FILE_ERROR      = 303;
  XY_NO_STARTUP_CHAR_ERROR = 304;
  XY_NOT_NCG_ERROR         = 305;
  XY_DISK_READ_ERROR       = 306;
  XY_NO_EOT_ACK_ERROR      = 307;
  XY_INTERNAL_ERROR        = 308;
  XY_CANCELLED_ERROR       = 309;
  XY_OUT_OF_SYNC_ERROR     = 310;
  XY_RETRIES_ERROR         = 311;
  XY_BAD_PACKET_NBR_ERROR  = 312;
  XY_TIMED_OUT_ERROR       = 313;
  XY_NO_SUCH_FILE_ERROR    = 314;
  XY_NOT_ACTIVE_ERROR      = 315;
  XY_PORT_RANGE_ERROR      = 316;
  (* xyGetParameter commands *)
  XY_GET_ERROR_CODE     =  0;
  XY_GET_ERROR_STATE    =  1;
  XY_GET_PACKET         =  2;
  XY_GET_STATE          =  3;
  XY_GET_FILE_SIZE      =  4;
  XY_GET_NBR_NAKS       =  5;
  XY_GET_DEBUG          =  6;
  XY_GET_LAST_GET       =  7;
  XY_GET_LAST_PUT       =  8;
  XY_GET_GET_COUNT      =  9;
  XY_GET_PUT_COUNT      = 10;
  XY_GET_DRIVER_COUNT   = 11;
  XY_GET_VERSION        = 12;
  (* xySetParameter commands *)
  XY_SET_NAK_RATE       = 52;
  XY_SET_EOF_CHAR       = 53;
  XY_SET_STARTUP_WAIT   = 54;
  XY_SET_ONE_SECOND     = 55;
  XY_SET_FILES_DIR      = 58;

function xyAcquire(First:Integer; Last:Integer) : Integer;
function xyRelease : Integer;
function xyAbort(Port:Integer) : Integer;
function xyDebug(Level:Integer) : Integer;
function xyDriver(Port:Integer) : Integer;
function xyGetMessage(Port:Integer; Buffer:PChar; Size:Integer) : Integer;
function xyGetFilename(Port:Integer; Buffer:PChar; Size:Integer) : Integer;
function xyGetParameter(Port:Integer; ParamName:Integer) : Integer;
function xySetParameter(Port:Integer; ParamName:Integer; ParamValue:Integer) : Integer;
function xyStartTx(Port:Integer; Filename:PChar; OneKflag:Integer; BatchFlag:Integer) : Integer;
function xyStartRx(Port:Integer; Filename:PChar; NCGchar:Char; BatchFlag:Integer) : Integer;
function xySetString(Port:Integer; ParamName:Integer; Buffer:PChar) : Integer;

implementation

function xyAcquire; external 'XYM16.DLL';
function xyRelease; external 'XYM16.DLL';
function xyAbort; external 'XYM16.DLL';
function xyDebug; external 'XYM16.DLL';
function xyDriver; external 'XYM16.DLL';
function xyGetMessage; external 'XYM16.DLL';
function xyGetFileName; external 'XYM16.DLL';
function xyGetParameter; external 'XYM16.DLL';
function xySetParameter; external 'XYM16.DLL';
function xyStartTx; external 'XYM16.DLL';
function xyStartRx; external 'XYM16.DLL';
function xySetString; external 'XYM16.DLL';
end.
