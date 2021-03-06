unit Pci_8136;

interface

Const

//****************************************************************************
//      Typedef  Definitions
//****************************************************************************

 MAX_PCI_CARDS = 4;

 PLS_DIR = 0;
 CW_CCW = 1;
 A_B = 2;
 INH = 3;

 E_A_B = 0;
 E_CW_CCW = 1;
 E_PLS_DIR = 2;
 E_INH = 3;

 X0 = 0;
 X1 = 1;
 X2 = 2;
 X4 = 3;

 CARD0 = 0;
 CARD1 = 1;
 CARD2 = 2;
 CARD3 = 3;

 ENC0 = 0;
 ENC1 = 1;
 ENC2 = 2;
 ENC3 = 3;
 ENC4 = 4;
 ENC5 = 5;
 ENC6 = 6;
 ENC7 = 7;
 ENC8 = 8;

 CH0 = 0;
 CH1 = 1;
 CH2 = 2;
 CH3 = 3;
 CH4 = 4;
 CH5 = 5;

 AXIS0 = 0;
 AXIS1 = 1;
 AXIS2 = 2;
 AXIS3 = 3;
 AXIS4 = 4;
 AXIS5 = 5;

 ENABLE = 1;
 DISABLE = 0;

 MARCHE = 0;
 ARRET = 1;

//****************************************************************************
//      Error Code Definition
//****************************************************************************

 ERR_NoError = 0;
 ERR_BoardNoInit = 1;
 ERR_InvalidBoardNumber = 2;
 ERR_InitializedBoardNumber = 3;
 ERR_BaseAddressError = 4;
 ERR_BaseAddressConflict = 5;
 ERR_DuplicateBoardSetting = 6;
 ERR_DuplicateIrqSetting = 7;
 ERR_PCIBiosNotExist = 8;
 ERR_PCIIrqNotExist = 9;
 ERR_PCICardNotExist = 10;
 ERR_EncNoError = 11;
 ERR_ModuleNoError = 12;
 ERR_TimerValueError = 13;
 ERR_EnableError = 14;
 ERR_RangeError = 15;
 ERR_MemAllocError = 16;
 ERR_MotionBusy = 17;
 ERR_MotionNotStart = 18;
 ERR_SpeedError = 19;
 ERR_AccTimeError = 20;

//****************************************************************************
//      Function  Declerations
//****************************************************************************

function  _8136_Initial           (var existCards:Word)                                  :Smallint;stdcall;
function  _8136_INT_Enable        (card_number:Word; var phEvent:Longint)                :Smallint;stdcall;
function  _8136_INT_Disable       (card_number:Word)                                     :Smallint;stdcall;
procedure _8136_S_INT_Control     (CardNo:Word; intFlag:Word)                                     ;stdcall;
function  _8136_S_Close           (CardNo:Word)                                          :Smallint;stdcall;
function  _8136_S_Set_Int_Factor  (CardNo:Word; AxisNo:Word; IntFactor:Word; Option:Word):Smallint;stdcall;
function  _8136_S_Set_Timer_Value (CardNo:Word; TimerValue:Longword)                     :Smallint;stdcall;
function  _8136_S_Get_Int_Status  (CardNo:Word; AxisNo:Word; var IntStatus:Word)         :Smallint;stdcall;
procedure _8136_S_Get_IRQ_Channel (CardNo:Word; var irq_no:Word)                                  ;stdcall;
procedure _8136_S_Get_Base_Addr   (CardNo:Word; var base_addr:Word)                               ;stdcall;
function  _8136_Callback_Function (CardNo:Word; lpCallBackProc:Longint)                  :Smallint;stdcall;

function _8136_R_Set_RIO_Clk    (CardNo:Word; SlaveNo:Word; Clk_Divider:Word):Smallint;stdcall;
function _8136_A_Set_DAC_Clk    (CardNo:Word; Clk_Divider:Word)              :Smallint;stdcall;
function _8136_A_Set_ADC_Clk    (CardNo:Word; Clk_Divider:Word)              :Smallint;stdcall;
function _8136_P_Set_Enc_Filter (CardNo:Word; Filter:Word)                   :Smallint;stdcall;

function _8136_D_Output  (CardNo:Word; Channe:Word; Control:Word)     :Smallint;stdcall;
function _8136_D_Input   (CardNo:Word; Channel:Word; var Control:Word):Smallint;stdcall;
function _8136_D_OutputA (CardNo:Word; Value:Word)                    :Smallint;stdcall;
function _8136_D_InputA  (CardNo:Word; var Value:Longint)             :Smallint;stdcall;

function _8136_R_Initial (CardNo:Word; SlaveControl:Word; Control:Word)            :Smallint;stdcall;
function _8136_R_Status  (CardNo:Word)                                             :Smallint;stdcall;
function _8136_R_Write   (CardNo:Word; SlaveNo:Word; SetNo:Word; SetValue:Word)    :Smallint;stdcall;
function _8136_R_Read    (CardNo:Word; SlaveNo:Word; SetNo:Word; var SetValue:Word):Smallint;stdcall;

function _8136_A_Initial           (CardNo:Word):Smallint;stdcall;
function _8136_A_Write_Value       (CardNo:Word; Channel:Word; Value:Word)     :Smallint;stdcall;
function _8136_A_Write_Volt        (CardNo:Word; Channel:Word; Volt:Double)    :Smallint;stdcall;
function _8136_A_Read_Value        (CardNo:Word; Channel:Word; var Value:Word) :Smallint;stdcall;
function _8136_A_Read_Volt         (CardNo:Word; Channel:Word; var Volt:Double):Smallint;stdcall;
function _8136_A_Output_Control    (CardNo:Word; Channel:Word; Control:Word)   :Smallint;stdcall;
function _8136_A_Set_Compare_Value (CardNo:Word; Channel:Word; Value:Word)     :Smallint;stdcall;
function _8136_A_Set_Compare_Volt  (CardNo:Word; Channel:Word; Volt:Double)    :Smallint;stdcall;
function _8136_A_Set_Trigger_Map   (CardNo:Word; Channel:Word; Source:Word)    :Smallint;stdcall;
function _8136_A_Set_Trigger       (CardNo:Word; Channel:Word; Control:Word)   :Smallint;stdcall;
function _8136_A_Set_Preload_Volt  (CardNo:Word; Channel:Word; Volt:Double)    :Smallint;stdcall;

function _8136_P_Initial           (CardNo:Word):Smallint;stdcall;
function _8136_P_Set_Output_Type   (CardNo:Word; AxisNo:Word; PulseFmt:Word)       :Smallint;stdcall;
function _8136_P_Set_Input_Type    (CardNo:Word; EncNo:Word; EncFmt:Word; Mul:Word):Smallint;stdcall;
function _8136_P_Read              (CardNo:Word; EncNo:Word; var EncData:Longint)  :Smallint;stdcall;
function _8136_P_Read_Latch_Value  (CardNo:Word; EncNo:Word; var Value:Longint)    :Smallint;stdcall;
function _8136_P_Send              (CardNo:Word; AxisNo:Word; Frq:Double)          :Smallint;stdcall;
function _8136_P_Stop              (CardNo:Word; AxisNo:Word)                      :Smallint;stdcall;
function _8136_P_Clear             (CardNo:Word; EncNo:Word)                       :Smallint;stdcall;
function _8136_P_Set_Compare_Value (CardNo:Word; EncNo:Word; CompValue:Longint)    :Smallint;stdcall;
function _8136_P_Set_Index_Latch   (CardNo:Word; EncNo:Word; LatchType:Word)       :Smallint;stdcall;
function _8136_P_Read_Index        (CardNo:Word; AxisNo:Word; var Index:Word)      :Smallint;stdcall;
function _8136_P_Change_Speed      (CardNo:Word; AxisNo:Word; Frq:Double)          :Smallint;stdcall;

implementation

function  _8136_Initial;           external '8136.dll';
function  _8136_INT_Enable;        external '8136.dll';
function  _8136_INT_Disable;       external '8136.dll';
procedure _8136_S_INT_Control;     external '8136.dll';
function  _8136_S_Close;           external '8136.dll';
function  _8136_S_Set_Int_Factor;  external '8136.dll';
function  _8136_S_Set_Timer_Value; external '8136.dll';
function  _8136_S_Get_Int_Status;  external '8136.dll';
procedure _8136_S_Get_IRQ_Channel; external '8136.dll';
procedure _8136_S_Get_Base_Addr;   external '8136.dll';
function  _8136_Callback_Function; external '8136.dll';

function _8136_R_Set_RIO_Clk;    external '8136.dll';
function _8136_A_Set_DAC_Clk;    external '8136.dll';
function _8136_A_Set_ADC_Clk;    external '8136.dll';
function _8136_P_Set_Enc_Filter; external '8136.dll';

function _8136_D_Output;  external '8136.dll';
function _8136_D_Input;   external '8136.dll';
function _8136_D_OutputA; external '8136.dll';
function _8136_D_InputA;  external '8136.dll';

function _8136_R_Initial; external '8136.dll';
function _8136_R_Status;  external '8136.dll';
function _8136_R_Write;   external '8136.dll';
function _8136_R_Read;    external '8136.dll';

function _8136_A_Initial;           external '8136.dll';
function _8136_A_Write_Value;       external '8136.dll';
function _8136_A_Write_Volt;        external '8136.dll';
function _8136_A_Read_Value;        external '8136.dll';
function _8136_A_Read_Volt;         external '8136.dll';
function _8136_A_Output_Control;    external '8136.dll';
function _8136_A_Set_Compare_Value; external '8136.dll';
function _8136_A_Set_Compare_Volt;  external '8136.dll';
function _8136_A_Set_Trigger_Map;   external '8136.dll';
function _8136_A_Set_Trigger;       external '8136.dll';
function _8136_A_Set_Preload_Volt;  external '8136.dll';

function _8136_P_Initial;           external '8136.dll';
function _8136_P_Set_Output_Type;   external '8136.dll';
function _8136_P_Set_Input_Type;    external '8136.dll';
function _8136_P_Read;              external '8136.dll';
function _8136_P_Send;              external '8136.dll';
function _8136_P_Stop;              external '8136.dll';
function _8136_P_Clear;             external '8136.dll';
function _8136_P_Set_Compare_Value; external '8136.dll';
function _8136_P_Set_Index_Latch;   external '8136.dll';
function _8136_P_Read_Index;        external '8136.dll';
function _8136_P_Read_Latch_Value;  external '8136.dll';
function _8136_P_Change_Speed;      external '8136.dll';

end.



