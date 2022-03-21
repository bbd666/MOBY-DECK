{event constants for SioEvent and SioEventWait}
const
  EV_RXCHAR   = $0001;  {Any Character received}
  EV_RXFLAG   = $0002;  {Received certain character}
  EV_TXEMPTY  = $0004;  {Transmitt Queue Empty}
  EV_CTS      = $0008;  {CTS changed state}
  EV_DSR      = $0010;  {DSR changed state}
  EV_RLSD     = $0020;  {RLSD changed state}
  EV_BREAK    = $0040;  {BREAK received}
  EV_ERR      = $0080;  {Line status error occurred}
  EV_RING     = $0100;  {Ring signal detected}
  EV_PERR     = $0200;  {Printer error occured}
  EV_RX80FULL = $0400;  {Receive buffer is 80 percent full}
