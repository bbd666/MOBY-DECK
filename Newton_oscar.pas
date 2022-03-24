// Etude de la cinématique dans le fichier : cinématique.doc  : 16/02/09 : pierre Lemerle
// Conception initiale du programme                           : 16/02/09 : pierre Lemerle
// Optimisation et mise en forme                              : 16/02/09 : dominique Bruant
//
// Intégration de la commande des 3 moto-réducteurs
//
// Remarques à traiter :
// - la vitesse des moteurs semblent manquer de constance
// - constantes en "dur" dans "UpdateGraphic"
// - paramètrer les 3 procedures : bielle_proc
// - paramètrer les 3 procedures : manivelle_proc
// - paramètrer les 3 procedures : rotule
// - paramètrer les 2 procedures : cardan
//
unit newton_oscar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GLWin32Viewer, GLMisc, GLScene, GLObjects,
  Newtonimport, Vectortypes, GLCadencer,math, StdCtrls,glcolor, GLGameMenu,
  GLTexture, jpeg, GLfile3ds, GLVectorFileObjects, HKStreamCol, ExtCtrls, inifiles,
  ComCtrls, mmsystem, Gauges, Pci_8136, AsyncTimer,LabelEditEx, complexf, fft,
  OleCtrls, RSTIMERLib_TLB, UIIF,
  IdBaseComponent, IdComponent, IdUDPBase, IdUDPServer, IdChargenUDPServer,
  IdDiscardUDPServer, idglobal, IdAntiFreezeBase, IdAntiFreeze,idsockethandle,
  IdUDPClient, Buttons,unit2; //,VectorGeometry;



type TForm1 = class(TForm)
    GLScene1: TGLScene;
    GLSceneviewer1: TGLSceneViewer;
    GLDummyCube1: TGLDummyCube;
    GLDummyCube2: TGLDummyCube;
    GLCamera1: TGLCamera;
    GLCadencer1: TGLCadencer;
    GLPlane1: TGLPlane;
    GLMaterialLibrary1: TGLMaterialLibrary;
    HKS: THKStreams;
    GLLightSource1: TGLLightSource;
    Panel1: TPanel;
    GroupBoxMot: TGroupBox;
    GroupBoxCadr: TGroupBox;
    GroupBoxRess: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    GroupBoxAsser: TGroupBox;
    btRaz: TButton;
    btQuit: TButton;
    btEnable: TButton;
    btPom: TButton;
    TBarKP: TTrackBar;
    TBarKI: TTrackBar;
    TBarKD: TTrackBar;
    TBar1: TTrackBar;
    TBar2: TTrackBar;
    TBar3: TTrackBar;
    TBar4: TTrackBar;
    TBar5: TTrackBar;
    TBar6: TTrackBar;
    TBar7: TTrackBar;
    TBar8: TTrackBar;
    TBar9: TTrackBar;
    TBar10: TTrackBar;
    TBar11: TTrackBar;
    TBar12: TTrackBar;
    TBar13: TTrackBar;
    TBar14: TTrackBar;
    TBar15: TTrackBar;
    TBar16: TTrackBar;
    edCons: TEdit;
    edMes: TEdit;
    edtm1: TLabeledEdit;
    edtm2: TLabeledEdit;
    edtm3: TLabeledEdit;
    edtf1: TLabeledEdit;
    edtf2: TLabeledEdit;
    edtf3: TLabeledEdit;
    edtspring: TLabeledEdit;
    edtl0: TLabeledEdit;
    edth: TLabeledEdit;
    edtcmax: TLabeledEdit;
    edtphi: TLabeledEdit;
    edtthe: TLabeledEdit;
    edtdZ: TLabeledEdit;
    LblEdtMes2: TLabeledEdit;
    LblEdtMes3: TLabeledEdit;
    LblEdtMes1: TLabeledEdit;
    LblEdtEcr2: TLabeledEdit;
    LblEdtEcr3: TLabeledEdit;
    LblEdtEcr1: TLabeledEdit;
    LblEdtCor2: TLabeledEdit;
    LblEdtCor3: TLabeledEdit;
    LblEdtCor1: TLabeledEdit;
    lblDzMin: TLabel;
    lblDzMax: TLabel;
    LblStDurUnt: TLabel;
    LblStDurMoy: TLabel;
    LblStDurSig: TLabel;
    LblKP: TLabel;
    LblKI: TLabel;
    LblKD: TLabel;
    LblMaxGag2: TLabel;
    LblMaxGag3: TLabel;
    LblMaxGag1: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    chkMiCourseAuto: TCheckBox;
    chkJoystick: TCheckBox;
    ChkRampPomp: TCheckBox;
    StatusBar1: TStatusBar;
    Gauge1: TGauge;
    Gauge2: TGauge;
    Gauge3: TGauge;
    GaugeStDur: TGauge;
    TimeAsser1: TTimer;
    TimeOut1: TTimer;
    TimeOut2: TTimer;
    TimeOut3: TTimer;
    TimePosPot1: TTimer;
    TimePosPot2: TTimer;
    TimePosPot3: TTimer;
    TimeTopTour1: TTimer;
    TimeTopTour2: TTimer;
    TimeTopTour3: TTimer;
    TimeAsser2: TTimer;
    TimeAsser3: TTimer;
    LblStDurMin: TLabel;
    LblStDurMax: TLabel;
    LblStDurMes: TLabel;
    GaugeStEct: TGauge;
    LblStEctMes: TLabel;
    LblStEctMax: TLabel;
    LblStEctMoy: TLabel;
    LblStEctSig: TLabel;
    LblStEctMin: TLabel;
    ChkAsser: TCheckBox;
    TimerJoy: TTimer;
    TimeZeroPf1: TTimer;
    TimeZeroPf2: TTimer;
    TimeZeroPf3: TTimer;
    ChkInvAr: TCheckBox;
    RSTimerAsserv1: TRSTimer;
    RSTimerAsserv2: TRSTimer;
    RSTimerAsserv3: TRSTimer;
    btFile1: TButton;
    lblFile: TLabel;
    lblDurT: TLabel;
    lblIntg: TLabel;
    btLitParc: TButton;
    EdtSeuilGamma: TEdit;
    EdtMoyGlis: TEdit;
    EdtKang: TEdit;
    EdtPuisAng: TEdit;
    EdtAngleMax: TEdit;
    LblParc: TLabel;
    EdtCoupAng: TEdit;
    EdtKpmp: TEdit;
    EdtCoupPmp: TEdit;
    EdtPuisPmp: TEdit;
    lbltangamp: TLabel;
    LblMesRoul: TLabel;
    ChkInvBiel: TCheckBox;
    RSTimerParc: TRSTimer;
    LblUmaxMotG: TLabel;
    LblUminMotG: TLabel;
    BtRazMinMax: TButton;
    EdtDiagTens1: TEdit;
    EdtDiagTens2: TEdit;
    EdtDiagTens3: TEdit;
    EdtDiagTens4: TEdit;
    EdtDiagTens5: TEdit;
    EdtDiagTens6: TEdit;
    EdtDiagDur1: TEdit;
    EdtDiagDur2: TEdit;
    EdtDiagDur3: TEdit;
    EdtDiagDur4: TEdit;
    EdtDiagDur5: TEdit;
    EdtDiagDur6: TEdit;
    ChkDiagAct1: TCheckBox;
    ChkDiagAct2: TCheckBox;
    ChkDiagAct3: TCheckBox;
    ChkDiagInv1: TCheckBox;
    ChkDiagInv2: TCheckBox;
    ChkDiagInv3: TCheckBox;
    Label11: TLabel;
    ChkEpreuve: TCheckBox;
    ChkDiagCyc: TCheckBox;
    Label12: TLabel;
    ChkBoxUdp: TCheckBox;
    LblTimerUdp: TLabel;
    IdUDPServer1: TIdUDPServer;
    IdAntiFreeze1: TIdAntiFreeze;
    LblTraiteUdp: TLabel;
    LblFiltreUdp: TLabel;
    LblNbMax: TLabel;
    LblNbMin: TLabel;
    RSTimerUdp: TRSTimer;
    LblNbMid: TLabel;
    LblChangeUdp: TLabel;
    ChkFileLoi: TCheckBox;
    Label24: TLabel;
    TimerVentilo: TTimer;
    ChkBoxCeint: TCheckBox;
    Label25: TLabel;
    IdUDPClient1: TIdUDPClient;
    Edit1: TEdit;
    RSTimerEntreeLogique: TRSTimer;
    GroupBox1: TGroupBox;
    Lblvitesse: TLabeledEdit;
    Roulistriangle: TRadioButton;
    Roulissinus: TRadioButton;
    Tangagesinus: TRadioButton;
    Tangagetriangle: TRadioButton;
    lblroulamp: TLabel;
    lblroulfreq: TLabel;
    lbltangfreq: TLabel;
    lblmestang: TLabel;
    Warning_TR: TLabel;
    group_video: TGroupBox;
    TrackBarTangage: TTrackBar;
    TrackBarRoulis: TTrackBar;
    TrackBarPompage: TTrackBar;
    TrackBarVitesse: TTrackBar;
    lbltangage: TLabel;
    lblRoulis: TLabel;
    lblpompage: TLabel;
    lblvit: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    GroupBoxCom: TGroupBox;
    Memo1: TMemo;
    SendBtn: TButton;
    CheckBox1: TCheckBox;
    Timer1: TTimer;
    Group_tests: TGroupBox;
    Button_test1: TButton;
    Timer_test: TTimer;
    Memo2: TMemo;
    Label30: TLabel;
    VICON_ON: TTimer;
    VICON_OFF: TTimer;
    video: TTimer;
    BtnVicon: TBitBtn;
    decompte: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GLCadencer1Progress(Sender: TObject; const deltaTime, newTime: Double);
    procedure GLSceneviewer1PostRender(Sender: TObject);
    procedure GLSceneviewer1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure GLSceneviewer1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Btnn1Click(Sender: TObject);
    procedure edtm1Change(Sender: TObject);
    procedure edtm2Change(Sender: TObject);
    procedure edtm3Change(Sender: TObject);
    procedure edtl0Change(Sender: TObject);
    procedure edttheChange(Sender: TObject);
    procedure edtdZChange(Sender: TObject);
    procedure edthChange(Sender: TObject);
    procedure edtspringChange(Sender: TObject);
    procedure TBar1Change(Sender: TObject);
    procedure TBar2Change(Sender: TObject);
    procedure TBar3Change(Sender: TObject);
    procedure TBar4Change(Sender: TObject);
    procedure TBar5Change(Sender: TObject);
    procedure TBar6Change(Sender: TObject);
    procedure TBar8Change(Sender: TObject);
    procedure TBar9Change(Sender: TObject);
    procedure TBarKPChange(Sender: TObject);
    procedure TBarKIChange(Sender: TObject);
    procedure TBarKDChange(Sender: TObject);
    procedure TimerJoyTimer(Sender: TObject);
    procedure btRazClick(Sender: TObject);
    procedure btQuitClick(Sender: TObject);
    procedure btEnableClick(Sender: TObject);
    procedure btPomClick(Sender: TObject);
    procedure TimeOut1Timer(Sender: TObject);
    procedure TimeOut2Timer(Sender: TObject);
    procedure TimeOut3Timer(Sender: TObject);
    procedure TimePosPot1Timer(Sender: TObject);
    procedure TimePosPot2Timer(Sender: TObject);
    procedure TimePosPot3Timer(Sender: TObject);
    procedure TimeTopTour1Timer(Sender: TObject);
    procedure TimeTopTour2Timer(Sender: TObject);
    procedure TimeTopTour3Timer(Sender: TObject);
    procedure TimeAsser1Timer(Sender: TObject);
    procedure TimeAsser2Timer(Sender: TObject);
    procedure TimeAsser3Timer(Sender: TObject);
    procedure ChkRampTangClick(Sender: TObject);
    procedure ChkRampRoulClick(Sender: TObject);
    procedure ChkRampPompClick(Sender: TObject);
    procedure FMW(S: TObject; T: TShiftState; WD:integer; MP: TPoint; var H: Boolean);
    procedure TimeZeroPf1Timer(Sender: TObject);
    procedure TimeZeroPf2Timer(Sender: TObject);
    procedure TimeZeroPf3Timer(Sender: TObject);
    procedure RSTimerAsserv1Timer(Sender: TObject);
    procedure RSTimerAsserv2Timer(Sender: TObject);
    procedure RSTimerAsserv3Timer(Sender: TObject);
    procedure ChkAsserClick(Sender: TObject);
    procedure btFile1Click(Sender: TObject);
    procedure btLitParcClick(Sender: TObject);
    procedure ChkInvBielClick(Sender: TObject);
    procedure RSTimerParcTimer(Sender: TObject);
    procedure BtRazMinMaxClick(Sender: TObject);
    procedure ChkEpreuveClick(Sender: TObject);
    procedure ChkBoxUdpClick(Sender: TObject);
    procedure UDPServerUDPRead(Sender:TObject;AData:TBytes;ABinding:TIdSocketHandle);
    procedure RSTimerUdpTimer(Sender: TObject);
    procedure ChkFileLoiClick(Sender: TObject);
    procedure TimerVentiloTimer(Sender: TObject);
    procedure RSTimerEntreeLogiqueTimer(Sender: TObject);
    procedure RoulistriangleMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure RoulistriangleMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure RoulissinusMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure RoulissinusMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure RoulissinusClick(Sender: TObject);
    procedure RoulistriangleClick(Sender: TObject);
    procedure TangagesinusClick(Sender: TObject);
    procedure TangagesinusMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TangagesinusMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TangagetriangleClick(Sender: TObject);
    procedure TangagetriangleMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure TangagetriangleMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TrackBarTangageChange(Sender: TObject);
    procedure TrackBarVitesseChange(Sender: TObject);
    procedure TrackBarRoulisChange(Sender: TObject);
    procedure TrackBarPompageChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SendBtnClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button_test1Click(Sender: TObject);
    procedure Button1fhClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Timer_testTimer(Sender: TObject);
    procedure VICON_ONTimer(Sender: TObject);
    procedure VICON_OFFTimer(Sender: TObject);
    procedure videoTimer(Sender: TObject);
    procedure BtnViconClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private                                             { Déclarations privées }
    Jpiston                    : array[0..1] of PNewtonjoint;
    bielle ,manivelle          : array[0..2] of Pnewtonbody;
    JBielle,JManivelle         : array[0..2] of PNewtonjoint;
    Mbielle,Mmanivelle         : array[0..2] of TGLMaterialLibrary;
    Bmoteur,Bbielle,Bmanivelle : array[0..2] of Tglfreeform;
    Jplateforme                : array[0..3] of PNewtonjoint;
    base,plateforme,piston,axe_cardan : Pnewtonbody;
    Bbase,Bplateforme,Bpiston,Baxe_cardan,Bressort,BFix1,BFix2,BFix3 : Tglfreeform;
    Mbase,Mplateforme,Mpiston,Maxe_cardan,Mmoteur,Mressort,MFix1,MFix2,MFix3:TGLMaterialLibrary;
    FNewtonworld:PNewtonworld;
    // procedure DisplayCollisionGeoms ;
  public    { Déclarations publiques }
    mx,my : integer;    // souris
end;

type TPom      = record
  bTrouve,bMiCourse                     : boolean;
  cptCur,cptIni                         : Longint;
  uVitCons,uPotIni,uPotPos,uPotRef,uPas : double;
end;

type TObjectState=packed record
     Position : TVector4f;  // 4 singles
end;

type
    TObjectSend = packed record
    orientation: TVector3f; //roulis,tangage,dz
    vitesse: single;
    comm:string[100];
    warn:boolean;
end;

type sglDrArGa = Array[0..2] Of single;
type dblDrArGa = Array[0..2] Of double;
type TPointD   = record x,y               : double; end;
type TDroite   = record pente,cste,resid  : double; end;
type TPid      = record intg,oldEc        : single; end;
type TParc     = record tang,roul,pomp,vit: single; bCeinture:boolean end;
type TMinMax   = record min,max           : single; end;

type TStatRT       = record min,max,som,moy,sig          : double;
                            cpt                          : Int64; end;
type TparConv      = record gammaMax                     : integer;
                            kAng,kPmp,pAng,pPmp,angleMax : single; end;
type TretZero      = record cptR,cptT                    : integer;
                            zRl,zTg                      : single;
                            bRet                         : boolean; end;

type TmoyGlis      = record csg          : Array[0..3] Of double;
                            moy          : double;
                            cpt,cyc      : integer; end;
type TqDuree       = record qDeb,qFin    : Int64;
                            qDur         : integer; end;
type TqMemElmt     = record inter,intra  : TqDuree;
                            csg,mes,corr : double; end;
type TqMemCyc      = record IMAX,ind     : integer;           // index max et index courant
                            indBloq      : integer;           // index de blocage du buffer cyclique
                            sdtB,seaB    : TStatRT;
                            tTqMe        : array[0..299] of TqMemElmt; end;
type TbufCycVaria  = record IMAX         : integer;           // index max et index courant
                            buf          : array[0..2] of TmoyGlis; end;
type TbufCycUdp    = record iA,iP        : integer;           // index courant d'angle et de pompage
                            IMAX,IMP     : integer;           // index max d'angle et de pompage
                            bFile        : boolean;           // autorisation ecriture fichier "loiMouvement"
                            pasH0        : single;            // pas en m pour retour lent à H0=0.38m
                            pasA0        : single;            // pas en ° pour retour lent à PF horizontale
                            moy          : TParc;             // moyenne glissante / index max
                            buf          : array[0..199] of TParc; end;

var
  Form1        : TForm1;
  segAng       : TDroite;
  sdt          : TStatRT;                                     // Stat. Durée Timer
  sea          : TStatRT;                                     // Stat. Ecart asservissement
  parConv      : TparConv;                                    // conversion loi de mouvement du parcours
  retZero      : TretZero;                                    // retour à zéro de la plateforme
  bufCircUdp   : TbufCycUdp;                                  // pour éviter les fortes
  bufCircVaria : TbufCycVaria;                                // moyenne glissante de consigne variateur pour diminuer les vibrations
  moyGlis      : array[0..2] of TmoyGlis;
  snMin,snMid,snMax  : TStatRT;                               // Stat. Appel OnUDPRead durée mini, middle, maxi
  qMemCyc : array[0..2] of TqMemCyc;
  pid     : array[0..2] of TPid;
  tabPom  : array[0..2] of TPom;
  csgMot  : array[0..2] of TMinMax;
  tabPts  : array[0..2] of TPointD=((x:1;y:3),(x:2;y:5),(x:3;y:7));   // pour regress linéaire
  DiagMot : array[0..5] of TmoyGlis;
  consAngleMoteur,mesAngleMoteur,F_moteur : array[0..2] of single;
  qAsserInterDeb,qAsserInterFin : array[0..2] of Int64;      // pour queryPerformanceCounter inter-asservissement
  queryDeb,queryDeb2,queryDebLoi,queryFreq : Int64;          // pour queryPerformanceCounter
  bEnable:boolean;                                           // servostar 400
  bRepos : array[0..3] of boolean;                           // état de repos plate-forme (8.332°)
  bFile  : array[0..2] of boolean;                           // état de mémorisation pour fichier texte
  anglPomp,anglroulis,angltangage:single;                                           // pour pompage, index moteur
  existcard:word;                                            // carte Adlink
  MaxUpDownControl,param,param2,kressort,l0ressort,hressort:single;
  the,phi,dz                                          :single;
  L1,L2,L3,manv,biel,m_base,ixx_base,iyy_base,izz_base:single;
  tactive1,sgn1,tactive2,sgn2                         :single;
  vitRampeRoul,vitRampeTang,max_gauge,pomp,limiteur   :single;
  consAsser:sglDrArGa;
  udpParc, memoParc : TParc;
  tabParcAng,tabParcGam : Array of TParc;
  iParc,iDiag,iAppel : integer;
  plateforme_gam:Tvector3f;
  fileLoi:TextFile;
  switch_on:boolean;
  Roulis_triangle_state:boolean=false;
  Roulis_sinus_state:boolean=false;
  Tangage_triangle_state:boolean=false;
  Tangage_sinus_state:boolean=false;

  //broadcast sur le réseau des paramètres de la plateforme pour synchro RV
  visu_vit,visu_pomp,visu_tang,visu_roul:float;
  host_video:string;
  packet:TObjectSend;
  coef_phi,coef_the,coef_dz,coef_vit:float;
  ils:word;
  delai_ils:float;
  tf,ti,tf_old, time_out_vitesse:int64;
  envoi_msg:boolean;
  msg:string;
  counter_msg,delai_msg:integer;
  test_indicator:integer;
  tick_test:integer;
  max_tick_test:integer;
  ampl_pretest,freq_pretest:single;
  File_resu:textfile;
  fade,fade_time,duration:single;
  REC,STOP:array[1..8] of boolean;
  t_curr,t0,delay_bit:int64;


const DR:integer=0; const AR:integer=1; const GA:integer=2; // ordre donné par le cablage ENC, DAC et ADC
const VeAV:integer=0; const VeAR:integer=1;                 // 2 ventillateurs Avant et 2 Arriére
const DTIM:integer=2970;                                    // 2.97 ms
const REDUCT:integer=32;                                    // rapport de réduction du réducteur moteur
const VMOT:integer=30;                                      // vitesse moteur en tr/s
const dim_buffer=3;
const dLink_1=6;
const dLink_6=1;

var Buffer: array[1..dim_buffer] of integer;

implementation

uses
  OpenGL1x,
  VectorGeometry, //vector and matrix operation unit including affinevectormake function
  VectorLists,
  newtonutil;

{$R *.dfm}


function find_next_testNumber:integer;
var
  searchResult : TSearchREC;
  index:integer;
  sub:string;
begin
  index:=0;
  // Try to find regular files matching Unit1.d* in the current dir
  if FindFirst('resultats/Test_*.txt', faAnyFile, searchResult) = 0 then
  begin
    repeat
      sub:=extractfilename(searchResult.Name);
      sub:=ChangeFileExt(sub,'');
      sub:=copy(sub,6,6);
      if strtoint(sub)>index then  index:=strtoint(sub);
    until FindNext(searchResult) <> 0;

    // Must free up resources used by these successful finds
    FindClose(searchResult);
  end;
  index:=index+1;
  result:=index;
  //ShowMessage('next index = '+IntToStr(index));
end;

//==============================================================================
function maxi(l1,l2:single):single; begin maxi:=i2f(l1>l2,l1,l2); end;
//==============================================================================
function passBasFreq(fe:double;fc:single):tcomplex;
var
  hl,un:tcomplex;
begin
  un.Re:=1;un.Im:=0;
  hl.re:=1-sqr(fe/fc);
  hl.Im:=sqrt(2)*fe/fc;
  hl:=ComplexDiv(un,hl);
  result:=hl;
end;
//==============================================================================
procedure passBasTempo(nbL:integer;f:double);  // fréq échantillonnage
var
  col,i          : integer;
  g,gf,gi,gp,gpo : array of tcomplex;
  fcp            : single;
begin
  setlength(  g,nbL);     // temp non filtré complexe
  setlength( gf,nbL);     // frep non filtré complexe
  setlength( gi,nbL);     // freq filtré complexe
  setlength( gp,nbL);     // temp filtré complexe
  SetLength(gpo,nbL);     // temp filtré réel
  for col:=1 to 3 do begin                                // longi, trans, verti
    for i:=0 to nbL-1 do begin
      case col of
      1: g[i].re:=tabParcAng[i].roul;
      2: g[i].re:=tabParcAng[i].tang;
      3: g[i].re:=tabParcAng[i].pomp;
      end;
      g[i].im:=0;
    end;
    ForwardFFT(g,gf,nbL);
    if col<3 then fcp:=strToFloat(Form1.EdtCoupAng.Text)   // freq coupure
             else fcp:=strToFloat(Form1.EdtCoupPmp.Text);
    for i:=1 to trunc(nbL/2) do
      gi[i]:=complexmul(gf[i],passBasFreq(i*f/nbL,fcp));
    for i:=trunc(nbL/2)+1 to nbL-1 do begin
      gi[i].re:= gi[nbL-i].re;
      gi[i].im:=-gi[nbL-i].im;
    end;
    InverseFFT(gi,gp,nbL);
    for i:=0 to nbL-1 do
      case col of
      1: tabParcAng[i].roul:=gp[i].re;
      2: tabParcAng[i].tang:=gp[i].re;
      3: tabParcAng[i].pomp:=gp[i].re;
    end;
  end;
end;
//==============================================================================
procedure initStatTempsReel(var sd:TStatRT); // Initialisation Statistiques
begin
  sd.moy:=0.0;
  sd.som:=0.0;
  sd.moy:=0.0;
  sd.min:=10000.;
  sd.max:=0.0;
  sd.cpt:=0;
end;
//==============================================================================
procedure calcStatTempsReel(var sd:TStatRT;mes:double); // Temps réel Statistiques
begin
  sd.cpt:=sd.cpt+1;
  sd.som:=sd.som+(sd.moy-mes)*(sd.moy-mes)*(sd.cpt-1)/sd.cpt;
//  sd.moy:=(sd.moy*(sd.cpt-1)+mes)/ sd.cpt;  // Formule 1  de certifStatCumulEtglissant.xls
  sd.moy:=sd.moy-(sd.moy-mes)/ sd.cpt;      // Formule 2  de certifStatCumulEtglissant.xls
  if (sd.cpt>1) and (sd.som>0) then sd.sig:=sqrt(sd.som/(sd.cpt-1));
  if sd.min>mes then sd.min:=mes;
  if sd.max<mes then sd.max:=mes;
end;
//==============================================================================
procedure affDuree(); // précision 1µs
var dur :double;
    qFin:int64;
begin
  queryPerformanceCounter(qFin);
  if queryDeb=0 then exit;
  dur:=1000*(qFin-queryDeb-550)/queryFreq;       // 550 top horloge mini sans instruction
  if dur>0 then calcStatTempsReel(sdt,dur);
  if sdt.cpt mod 10 = 0 then begin
    Form1.LblStDurUnt.caption:=I2F(dur<1,'µs'                             ,'ms');
    Form1.LblStDurMes.caption:=I2F(dur<1,floatToStrf(dur*1000,fffixed,5,1),floatToStrf(dur    ,fffixed,5,2)+'  ');
    Form1.LblStDurMoy.caption:=I2F(dur<1,floatToStrf(dur*1000,fffixed,5,1),floatToStrf(sdt.moy,fffixed,5,2)+'  ');
    Form1.LblStDurSig.caption:=I2F(dur<1,floatToStrf(dur*1000,fffixed,5,1),floatToStrf(sdt.sig,fffixed,5,2)+'  ');
    Form1.LblStDurMin.caption:=I2F(dur<1,floatToStrf(dur*1000,fffixed,5,1),floatToStrf(sdt.min,fffixed,5,2)+'  ');
    Form1.LblStDurMax.caption:=I2F(dur<1,floatToStrf(dur*1000,fffixed,5,1),floatToStrf(sdt.max,fffixed,5,2)+'  ');
  end;
  if (sdt.moy>1) then Form1.GaugeStDur.MaxValue:=round(3*sdt.moy);
  Form1.GaugeStDur.Progress:=round(dur);
//  Form1.edCons.Text:=IntToStr(queryFreq);
//  Form1.edMes.Text:=IntToStr(qFin-queryDeb);
end;
//==============================================================================
procedure _8136_initMultiFonct(bAna:boolean=false);   // optional
var iM:integer;
begin
  _8136_Initial(existcard);                           // Ouvre la PCI-8136 et retourne le nb de cartes trouvées (27ms)
  if existcard<>0 then begin
    if bAna then _8136_A_Initial(CARD0);              // Analogique (1.89s)
    _8136_P_Initial(CARD0);                           // Compteur Impulsions codeurs
    for iM:=DR to GA do begin     
      _8136_P_Set_Input_Type(CARD0,ENC2+iM,E_A_B,X1); // Pulse In  déphasés de 90° , multiplié par 1
      _8136_P_Set_Output_Type(CARD0,ENC2+iM,A_B);     // Pulse Out déphasés de 90°
    end
  end;
end;
//==============================================================================
procedure _8136_A_Read_Potar(iMot:integer;var tens:double);
const uOffPot:array[0..2]of double=(-0.085,-0.09,-0.09);     // offset mesure potentiomètre à mi-course
begin
  _8136_A_Read_Volt(CARD0,CH0+iMot,tens);
  tens:=tens+uOffPot[iMot];                                  // ajustement
end;
//==============================================================================
procedure _8136_A_Write_Varia(iMot:integer;tens:double;oldTens:double=0.0);
const uOffVar:array[0..2]of double=(-0.014,-0.045,-0.035);     // offset consigne moteur
label toutVaBien;
begin
  if oldTens<>0.0 then begin                                   // si phase d'asservissement ?
    if (abs(oldTens-tens)>1) and                               // filtre contre les trop fortes implulsions
       (true) then begin                                       // filtre contre les trop fortes oscillations
//      Form1.CheckBoxAsser.Checked:=false;                    // Arrête les 3 asserv moteurs si 1 dépassement
      goto toutVaBien;
    end
    else
      goto toutVaBien;
  end
  else                                                         // hors asservissement ?
toutVaBien:                                                    // quand tout se passe bien
   if csgMot[iMot].min>tens then begin
     csgMot[iMot].min:=tens;                                   // mémo du mini => <-10V
     form1.LblUminMotG.Caption :=floatToStrf(tens,fffixed,5,1)+' V';
   end;
   if csgMot[iMot].max<tens then begin
     csgMot[iMot].max:=tens;                                   // mémo du maxi => >+10V
     form1.LblUmaxMotG.Caption:=floatToStrf(tens,fffixed,5,1)+' V';
   end;
   if tens+uOffVar[iMot]> 10 then tens:= 10-uOffVar[iMot];     // +10V maxi
   if tens+uOffVar[iMot]<-10 then tens:=-10-uOffVar[iMot];     // -10V mini
   _8136_A_Write_Volt(CARD0,CH3+iMot,tens+uOffVar[iMot]);      // DAC4(52),DAC5(53) ou DAC6(54) sur CN1 en SCSI2
end;
//==============================================================================
procedure _8136_A_Write_Ventilo(iVen:integer;tens:double);
const uOffVar:array[0..2]of double=(-0.0,-0.0,-0.0);           // offset consigne moteur
begin
   if tens+uOffVar[iVen]> 10 then tens:= 10-uOffVar[iVen];     // +10V maxi
   if tens+uOffVar[iVen]<  0 then tens:=   -uOffVar[iVen];     // 0V mini
   _8136_A_Write_Volt(CARD0,CH1+iVen,tens+uOffVar[iVen]);      // DAC2(19) ou DAC3(6) sur CN3 en SubD25
end;
//==============================================================================================
procedure TForm1.TimerVentiloTimer(Sender: TObject); // 1.8V => courant de 200mA de maintien
begin
  FORM1.TimerVentilo.Enabled:=false;                           // auto-arrêt
  _8136_A_Write_Ventilo(VeAV,1.8);                             // les 2 avant
  _8136_A_Write_Ventilo(VeAR,1.8);                             // les 2 arrière
end;
//==============================================================================
procedure cycleDemarVentilos();   // 5.5V => courant de 200mA de lancement
begin
  _8136_A_Write_Ventilo(VeAV,5.5);                             // les 2 avant
  _8136_A_Write_Ventilo(VeAR,5.5);                             // les 2 arrière
  Form1.TimerVentilo.Enabled:=true;                            // timer 0.5s
end;
//==============================================================================
procedure loiVentilo(vitLin:double); // 1.8V pour V=0 et 7.3 pour V=17km/h
var consVentilo:double;
begin
  consVentilo:=abs(vitLin)/17*(7.3-1.8)+1.8;
  if consVentilo>7.3 then consVentilo:=7.3;                   // 7.3V maxi
  if consVentilo<1.8 then consVentilo:=1.8;                   // 1.8V mini
  _8136_A_Write_Ventilo(i2f(vitLin>0,VeAV,VeAR),consVentilo); // consigne vitesse sur les 2 avant OU 2 arrière
end;
//==============================================================================
procedure prepaRefCodeur(iMot:integer);  // (40µs)
begin
  _8136_P_Clear(CARD0,ENC2+iMot);                             // RaZ compteur du codeur
//  Form1.Edit1.Text:='Compt '+IntToStr(iMot);                // Raz affichage
  tabPom[iMot].cptIni:=0;                                     // init détection latch
  _8136_P_Set_Index_Latch(CARD0,ENC2+iMot,0);                 // trigger de RaZ une seule fois
//  Form1.Edit3.Text:=' ';
end;
//==============================================================================
procedure anglesTextFile(nom:string;decal:integer=0);
var
  myFile:TextFile;
  i:integer;
  strFile,strDaTime:string;
begin
  strFile:='analyses\tangageRoulis'+nom;
  DateTimeToString(strDaTime,'--hh_nn_ss',time());strFile:=strFile+strDaTime;
  DateTimeToString(strDaTime,'--dd_mm_yy',date());strFile:=strFile+strDaTime;
  strFile:=strFile+'--'+intToStr(length(tabParcAng));
  AssignFile(myFile,strFile+'.txt');                             // init variable fichier
  ReWrite(myFile);                                               // ouverture en écriture
  decimalseparator:=',';
  for i:=decal to length(tabParcAng)-1 do
  with tabParcAng[i-decal] do
    Writeln(myFile,(i+1-decal)*0.02:5:2,chr(9),  // durée en s
                               tang:5:3,chr(9),  // tangage en °
                               roul:5:3,chr(9)); // roulis en °
  decimalseparator:='.';
  CloseFile(myFile);
end;
//==============================================================================
procedure gammaTextFile(nom:string;decal:integer=0);
var
  myFile:TextFile;
  i:integer;
  strFile,strDaTime:string;
begin
  strFile:='analyses\gamma'+nom;
  DateTimeToString(strDaTime,'--hh_nn_ss',time());strFile:=strFile+strDaTime;
  DateTimeToString(strDaTime,'--dd_mm_yy',date());strFile:=strFile+strDaTime;
  strFile:=strFile+'--'+intToStr(length(tabParcAng));
  AssignFile(myFile,strFile+'.txt');                             // init variable fichier
  ReWrite(myFile);                                               // ouverture en écriture
  decimalseparator:=',';
  for i:=decal to length(tabParcAng)-1 do
  with tabParcGam[i-decal] do
    Writeln(myFile,(i+1-decal)*0.02:5:2,chr(9),  // durée en s
                               tang:5:3,chr(9),  // gamma X
                               roul:5:3,chr(9),  // gamma Y
                               pomp:5:3,chr(9)); // gamma Z
  decimalseparator:='.';
  CloseFile(myFile);
end;
//==============================================================================
procedure TForm1.RSTimerParcTimer(Sender: TObject);   // Exécute le parcours enregistré
begin
  if iParc>0 then tabParcAng[iParc-1].tang:=strToFloat(Form1.LblMesTang.Caption);  // mesure parcours => fichier
  if iParc>0 then tabParcAng[iParc-1].roul:=strToFloat(Form1.LblMesRoul.Caption);
  edtthe.Text:=floatToStrf(tabParcAng[iParc].tang,fffixed,5,2);                    // fichier => consigne parcours
  edtphi.Text:=floatToStrf(tabParcAng[iParc].roul,fffixed,5,2);
  LblParc.Caption:=intToStr(iParc);
  tabParcGam[iParc].tang:=plateforme_gam[0];
  tabParcGam[iParc].roul:=plateforme_gam[1];
  tabParcGam[iParc].pomp:=plateforme_gam[2];
  iParc:=iParc+1;
  if iParc=length(tabParcAng) then begin
    anglesTextFile('ApresAsserv',1);                                            //
    gammaTextFile ('ApresAsserv',1);                                            //
    RSTimerParc.Enabled:=false;
    btLitParc.Enabled:=true;
  end;
end;
//==============================================================================
procedure litParamConvers(); // conversion pour la loi de mouvement X et Y
begin
  with parConv do begin
    gammaMax:=strToInt  (Form1.EdtSeuilGamma.text);
    kAng    :=strToInt  (Form1.EdtKang      .Text);  // constante
    pAng    :=strToFloat(Form1.EdtpuisAng   .Text);  // puissance de compactage
    angleMax:=strToInt  (Form1.EdtAngleMax  .Text);  // angle assev max
    kPmp    :=strToInt  (Form1.EdtKpmp      .Text);  // constante
    pPmp    :=strToFloat(Form1.EdtPuisPmp   .Text);  // puissance de compactage
  end;
end;
//==============================================================================
// Lancer par l'événement "OnUDPRead" du contrôle "IdUDPServer1"
// voir http://www.indyproject.org/docsite/html/frames.html?frmname=topic&frmfile=index.html
//..............................................................................
// Le séquencement d'écriture du client UDP (en ms):
// - n'est pas synchrone / glCadencer de la scéne de la PFLogis
// - n'est pas constant => distribution 1 : (50%/0.7),(40%/15) et (10%/30)
//                     ou  distribution 2 : (10%/0.7),(40%/2) et (50%/3)
// Le séquencement de lecture du serveur UDP (en ms):
// - réalisé par "traiteSocketUdp"
// - timer RS de 3ms (idem durée des timers d'asservissement)
procedure TForm1.UDPServerUDPRead(Sender:TObject;AData:TBytes;ABinding:TIdSocketHandle);
var
  buff  :TObjectState;
  qFin  :Int64;
  dur   :double;
  bVoid,bOscar:boolean;
begin
  move(Adata[0],buff,16);                                                       // 4 x 4 single = 16 octets   (avec vitesse)
  with udpParc do
    try
      //move(Adata[16],bVoid,1);
      //move(Adata[17],bCeinture,1);
//      move(Adata[18],bOscar,1);
//      ChkBoxCeint.Checked:=bCeinture;   // tester la form, avant
      if abs(buff.position[0])<100 then tang:= buff.position[0];
      if abs(buff.position[1])<100 then roul:=-buff.position[1];                // inversion du signe
      if (0.06-buff.position[2]>biel-manv) and
         (0.06-buff.position[2]<biel+manv) then pomp:=0.06-buff.position[2];    // ajustement en absolu => 6cm puis le 15/12/10 => 8cm (séparateur décimal)
      if abs(buff.position[3])<20 then vit:=buff.position[3];                   // vitesse d'avancement
    finally
form1.caption:=floattostrf(tang,fffixed,5,3)+'   '+floattostrf(roul,fffixed,5,3)+'   '+
               floattostrf(pomp,fffixed,5,3)+'   '+floattostrf(vit ,fffixed,5,3)+'   ';//+
          //       boolToStr(bVoid           )+'   '+  boolToStr(bCeinture       )+'   '+boolToStr(bOscar);
  end;
  queryPerformanceCounter(qFin);
  dur:=1000*(qFin-queryDeb)/queryFreq;
  if dur>20 then begin                                                          // 30 ms
    calcStatTempsReel(snMax,dur);
    if snMax.cpt mod 10=0 then begin
      LblNbMax.Caption:=intToStr(snMax.cpt);Form1.LblNbMax.Refresh;
      LblTimerUdp.Caption:=floatToStrf(1000*dur,fffixed,5,0)+' µs UDP';Form1.LblTimerUdp.Refresh;
    end;
  end
  else
    if dur>2 then begin                                                         // 15 ms
      calcStatTempsReel(snMid,dur);
      if snMid.cpt mod 10=0 then begin
        LblNbMid.Caption:=intToStr(snMid.cpt);Form1.LblNbMid.Refresh;
        LblTraiteUdp.Caption:=floatToStrf(1000*dur,fffixed,5,0)+' µs UDP';Form1.LblTraiteUdp.Refresh;
      end;
    end
    else begin                                                                  // 0.7 ms
      calcStatTempsReel(snMin,dur);
      if snMin.cpt mod 10=0 then begin
        LblNbMin.Caption:=intToStr(snMin.cpt);Form1.LblNbMin.Refresh;
        LblFiltreUdp.Caption:=floatToStrf(1000*dur,fffixed,5,0)+' µs UDP';Form1.LblFiltreUdp.Refresh;
    end;
  end;
  queryDeb:=qFin;
end;
//==============================================================================
procedure convUdpGammasAngle(); //
var poub: double;
    tg,rl :single;
begin
  with udpParc do begin tg:=tang; rl:=roul; end;      // gammas globaux => locaux
  with parConv do begin
    if tg>gammaMax then tg:=gammaMax;                 // seuillage gamma longitudinal
    if rl>gammaMax then rl:=gammaMax;                 // seuillage gamma transversal
    poub:=ArcTan(tg/9.81)*180/PI;tg:=i2f(poub>0,kAng*power(poub,pAng),-kAng*power(abs(poub),pAng));
    poub:=ArcTan(rl/9.81)*180/PI;rl:=i2f(poub>0,kAng*power(poub,pAng),-kAng*power(abs(poub),pAng));
    if abs(rl)+abs(tg)>angleMax then begin            // limite modèle mécanique ?
      rl:=rl*angleMax/(abs(rl)+abs(tg));              // bornage mécanique : roulis=f(Tangage) en losange
      tg:=tg*angleMax/(abs(rl)+abs(tg));              // rl+tg=constante=angleMax
    end;
    with bufCircUdp do begin
      moy.tang:=moy.tang-(buf[(iA+1) mod IMAX].tang-tg)/IMAX; // moyenne glissante sur IMAXx3ms
      moy.roul:=moy.roul-(buf[(iA+1) mod IMAX].roul-rl)/IMAX;
      buf[iA].tang:=tg;                                       // entrée nouveau point
      buf[iA].roul:=rl;
      form1.edtthe.Text:=floatToStrf(moy.tang,fffixed,5,2);   //
      form1.edtphi.Text:=floatToStrf(moy.roul,fffixed,5,2);
      iA:=iA+1; if iA=IMAX then iA:=0;                        // incrément du buffer circulaire
    end;
  end;
  with retZero do begin
    if (rl>3) and (zRl=rl) then cptR:=cptR+1 else begin zRl:=rl; cptR:=0 end;
    if (tg>3) and (zTg=tg) then cptT:=cptT+1 else begin zTg:=tg; cptT:=0 end;
    if (cptR>300) or (cptT>300) then bRet:=true;                  // blocage d'un angle fort pendant 1s
  end;
end;
//==============================================================================
procedure traiteSocketUdp();  // timer RS de 3ms (idem durée des timers d'asservissement)
var qFin:Int64;

begin
  with udpParc do begin
//    if snMin.cpt mod 10=0 then
//       form1.caption:=floattostrf(tang,fffixed,5,3)+'   '+floattostrf(roul,fffixed,5,3)+'   '+floattostrf(pomp,fffixed,5,3);
    bufCircUdp.bFile:=false;
    if(tang<>memoParc.tang)or(roul<>memoParc.roul) then begin   // nouvel échantillon UDP ?   => 15ms
      queryPerformanceCounter(qFin);
//      if bufCircUdp.iA mod 50 =0 then
        Form1.LblChangeUdp.Caption:=floatToStrf(1000*(qFin-queryDeb2)/queryFreq,fffixed,5,3)+' ms';Form1.LblChangeUdp.Refresh;
      memoParc.tang:=tang;
      memoParc.roul:=roul;
      if form1.chkFileLoi.Checked then bufCircUdp.bFile:=true;     // écriture fichier "loi mouvement" si newEchant ET case cochée
//      convUdpGammasAngle();
      queryDeb2:=qFin;
    end;
{    else begin     // si "convUdpGammasAngle"  pour nouvel échantillon UDP
      bufCircUdp.buf[ind].tang:=bufCircUdp.buf[(ind-1) mod bufCircUdp.IMAX].tang;
      bufCircUdp.buf[ind].roul:=bufCircUdp.buf[(ind-1) mod bufCircUdp.IMAX].roul;
    end;}
    convUdpGammasAngle();
    with bufCircUdp do begin
      moy.pomp:=moy.pomp-(buf[(iP+1) mod IMP].pomp-pomp)/IMP;      // moyenne glissante sur IMPx3ms
      buf[iP].pomp:=pomp;                                          // mémo nouvelle échantillon UDP
      iP:=iP+1; if iP=IMP then iP:=0;                              // incrément du buffer circulaire
      form1.edtdZ.Text:=floatToStrf(moy.pomp,fffixed,5,3);
      if pomp>biel+manv then pomp:=biel+manv;                      // limite haute atteinte
      if pomp<biel-manv then pomp:=biel-manv;                      // limite basse atteinte
      if pomp>biel then pomp:=pomp-pasH0;                          // descente lente vers H0
      if pomp<biel then pomp:=pomp+pasH0;                          // montée lente vers H0
    end;
    loiVentilo(vit);
  end;

end;
//==============================================================================
procedure TForm1.RSTimerUdpTimer(Sender: TObject); begin traiteSocketUdp(); end;
//==============================================================================
procedure TForm1.ChkBoxUdpClick(Sender: TObject); // liaison UDP vers asservissement
var id :integer;
begin

  if((abs(udpParc.pomp-biel )>0.01) or                // 1cm
     (abs(udpParc.tang      )>0.03) or                // 3cm/s²
     (abs(udpParc.roul)      >0.03)) and              // données UDP compatibles avec la position initiale de la PF
     ChkBoxUdp.Checked then                           // tentative de connexion UDP ?
       ChkBoxUdp.Checked:=false;
  RSTimerUdp.Enabled:=ChkBoxUdp.Checked;              // timer de traiteSocketUdp
  if ChkBoxUdp.Checked then begin
    litParamConvers();                                // lit paramètres de loi de mouvement
    with bufCircUdp do begin
      IMAX:=length(buf);iA:=0;                        // init buffer cyclique de filtrage pass-bas
      IMP:=round(IMAX/2);                             // Réduction de la taille du buffer
      moy.tang:=0;moy.roul:=0;moy.pomp:=biel;
      pasH0:=10*1E-3*RSTimerUdp.interval*1E-3;        // pas pour retour à H0 (hauteur de repos plateforme) à 10mm/s
      pasA0:= 2     *RSTimerUdp.interval*1E-3;        // pas pour retour à plateforme horizontale à 2°/s
//form1.caption:=floattostrf(pasH0,fffixed,5,7);
      for id:=0 to bufCircUdp.IMAX do begin
        buf[id].tang:=0;buf[id].roul:=0;
        buf[id].pomp:=biel;
      end;
    end;
    queryPerformanceCounter(queryDeb2);
  end;
end;
//==============================================================================
procedure TForm1.ChkFileLoiClick(Sender: TObject);
var
  strFile,strDaTime:string;
begin
  if ChkFileLoi.Checked then begin
    strFile:='analyses\loiMouvememnt';
    DateTimeToString(strDaTime,'--hh_nn_ss',time());strFile:=strFile+strDaTime;
    DateTimeToString(strDaTime,'--dd_mm_yy',date());strFile:=strFile+strDaTime;
    AssignFile(fileLoi,strFile+'.txt');                           // init variable fichier
    ReWrite(fileLoi);                                             // ouverture en écriture
//    decimalseparator:=',';
    Writeln(fileLoi,'Acc. Maxi XY, Constante Angle, Puissanse Angle, '+
                    'Taille de moyenne glissante Angle, Taille de moyenne glissante Z');
    Writeln(fileLoi,parConv.gammaMax,chr(9)
                   ,parConv.kAng:3:1,chr(9)
                   ,parConv.pAng:3:1,chr(9)
                   ,bufCircUdp.IMAX ,chr(9)
                   ,bufCircUdp.IMP);
    Writeln(fileLoi,'Dur(ms)'     ,chr(9)
                   ,'aLongi(m/s²)',chr(9)             // consigne accélération longi en m/s²
                   ,'Tang(°)'     ,chr(9)             // mesure tangage en °
                   ,'aTrans(m/s²)',chr(9)             // consigne accélération trans en m/s²
                   ,'Roul(°)'     ,chr(9)             // mesure roulis en °
                   ,'cHaut(mm)'   ,chr(9)             // consigne Hauteur en mm
                   ,'mHaut(mm)');                     // mesure Hauteur en mm
    queryPerformanceCounter(queryDebLoi);
  end
  else begin
//    decimalseparator:='.';
    CloseFile(fileLoi);
  end;
end;
//==============================================================================
procedure litFichierParcours(nomFich:string);  // prépare et lance le parcours
var
  myFile : TextFile;
  nbLig,i,i1,i2 : integer;     //g,moyGlis
  poub: double;
  n1,n2,n3,strFile : string;
begin
  strFile:='parcours\'+nomFich;
  AssignFile(myFile,strFile+'.txt');                           // init variable fichier
  Reset(myFile);                                               // ouverture en lecture
  ReadLn(myFile,nbLig);
  SetLength(tabParcAng,nbLig);                                 // dimensionnement dynamique
  SetLength(tabParcGam,nbLig);                                 // dimensionnement dynamique
  ReadLn(myFile,strFile);                                      // lit Intitulés
  decimalSeparator:=',';       // fonctionne en lecture
  i:=0;
  while not Eof(myFile) do
  with tabParcAng[i] do begin
    ReadLn(myFile,n3);                                         // transfert fichier vers tableau séparateur TAB
    i1:=Pos(chr(9),n3)+1; n1:=copy(n3,i1,length(n3)-i1+1);
    i2:=Pos(chr(9),n1)+1; n2:=copy(n1,i2,length(n1)-i2+1);
    i1:=Pos(chr(9),n2)+1; n3:=copy(n2,i1,length(n2)-i1+1);
    n1:=copy(n1,1,i2-2);
    n2:=copy(n2,1,i1-2);
    tang:=strToFloat(n1);
    roul:=strToFloat(n2);
    pomp:=strToFloat(n3);
//  ReadLn(myFile,poub,tang,roul,pomp);                        // transfert fichier vers tableau séparateur ESPACE
    i:=i+1;
  end;
  decimalseparator:='.';
  CloseFile(myFile);
  litParamConvers();
  for i:=0 to nbLig-1 do
  with parConv do
  with tabParcAng[i] do begin
    if tang>gammaMax then tang:=gammaMax;                            // seuillage gamma longitudinal
    if roul>gammaMax then roul:=gammaMax;                            // seuillage gamma transversal
  end;
  for i:=0 to nbLig-1 do                                             // conversion gamma/angle
  with parConv do
  with tabParcAng[i] do begin                                                              // compactage angulaire
    poub:=ArcTan(tang/9.81)*180/PI;tang:=I2F(poub>0,kAng*power(poub,pAng),-kAng*power(abs(poub),pAng));
    poub:=ArcTan(roul/9.81)*180/PI;roul:=I2F(poub>0,kAng*power(poub,pAng),-kAng*power(abs(poub),pAng));
    poub:=ArcTan(pomp/9.81)*180/PI;pomp:=I2F(poub>0,kPmp*power(poub,pPmp),-kPmp*power(abs(poub),pPmp));
    if abs(roul)+abs(tang)>angleMax then begin
      roul:=roul*angleMax/(abs(roul)+abs(tang));                     // bornage mécanique : roulis=f(Tangage) en losange
      tang:=tang*angleMax/(abs(roul)+abs(tang));                     // roul+tang=constante=angleMax
    end;
  end;
//  anglesTextFile('AvantFiltrage');
  passBasTempo(nbLig,50);                                            // fréq échantillonnage 50Hz car dt=20ms
//  anglesTextFile('ApresFiltrage'+Form1.EdtCoupAng.Text+'Hz');
  for i:=0 to 20-1 do                                                // démarrage progressif
  with tabParcAng[i] do begin
    tang:=tabParcAng[20].tang*i/20;
    roul:=tabParcAng[20].roul*i/20;
    pomp:=tabParcAng[20].pomp*i/20;
  end;
  for i:=nbLig-20 to nbLig-1 do                                      // arrêt progressif
  with tabParcAng[i] do begin
    tang:=tabParcAng[nbLig-1-20].tang*(nbLig-1-i)/20;
    roul:=tabParcAng[nbLig-1-20].roul*(nbLig-1-i)/20;
    pomp:=tabParcAng[nbLig-1-20].pomp*(nbLig-1-i)/20;
  end;
  Form1.btLitParc.Enabled:=false;
  iParc:=0; //3500;
  Form1.RSTimerParc.Enabled:=true;                                   // Lance le parcours
end;
//==============================================================================
procedure TForm1.btLitParcClick(Sender: TObject);
begin
  litFichierParcours('parcoursVolvoRoulisTangage');
end;
//==============================================================================
procedure bufferTextFile(iMot:integer);
var
  myFile  : TextFile;
  i,cptOc : integer;
  occur   : array[0..299]of integer;
  memOc   : double;
  decal   : int64;
  strFile,strDaTime: string;
begin
  strFile:='analyses\oscarAsser--';
  if iMot=DR then strFile:=strFile+'DR';               // moteur concerné
  if iMot=AR then strFile:=strFile+'AR';
  if iMot=GA then strFile:=strFile+'GA';
  DateTimeToString(strDaTime,'--hh_nn_ss',time());strFile:=strFile+strDaTime;
  DateTimeToString(strDaTime,'--dd_mm_yy',date());strFile:=strFile+strDaTime;
  strFile:=strFile+'--'+copy(Form1.lblFile.Caption,1,1);
  AssignFile(myFile,strFile+'.txt');                             // init variable fichier
  ReWrite(myFile);                                               // ouverture en écriture
//.................... Entête de fichier .......................................
  with qMemCyc[iMot]do begin
    Writeln(myFile,'Cause de déclenchement : '+Form1.lblFile.Caption+' '+Form1.lblDurT.Caption );
    decimalseparator:=',';
    Writeln(myFile,sdtB.moy:5:3,chr(9),
                   sdtB.sig:5:3,chr(9),
                   sdtB.min:5:3,chr(9),
                   sdtB.max:5:3,chr(9),'Statistiques durée');
    Writeln(myFile,seaB.moy:5:3,chr(9),
                   seaB.sig:5:3,chr(9),
                   seaB.min:5:3,chr(9),
                   seaB.max:5:3,chr(9),'Statistiques asservissement');
    decimalseparator:='.';
  end;
  WriteLn(myFile,intToStr(qMemCyc[iMot].ind) ,chr(9),'Index buffer');
  WriteLn(myFile,intToStr(qMemCyc[iMot].IMAX),chr(9),'Index Max');
  WriteLn(myFile,'PID : '+Form1.LblKP.Caption+' - '
                         +Form1.LblKI.Caption+' - '
                         +Form1.LblKD.Caption);
  WriteLn(myFile,'IntraD'  ,chr(9),'InterD'  ,chr(9),'Temps(s)',chr(9),
                 'Mesure'  ,chr(9),'Consigne',chr(9),'Ecart'   ,chr(9),
                 'Correct.',chr(9),'Classe'  ,chr(9),'Occur');
//.................... Courbes Excel Distribution ..............................
  for i:=0 to length(occur)-1 do occur[i]:=1;                   // MàZ de la distribution
  with qMemCyc[iMot] do begin
    memOc:=tTqMe[ind].csg;cptOc:=1;i:=1;
    while i<=qMemCyc[iMot].IMAX-2 do                            // ajouter la distribution des occurrences "asserTimer"
    with tTqMe[(i+ind) mod IMAX] do begin                       // par appel de "Gl_Cadencer"
      if memOc=csg then cptOc:=cptOc+10                         // ajoute une occurence 10/10
      else begin
        if cptOc<length(occur) then                             // cas le plus fréquent
          occur[cptOc-1]:=occur[cptOc-1]+1                      // incrémente la classe d'occurrences
        else                                                    //
          occur[length(occur)-1]:=occur[length(occur)-1]+1;
        memOc:=csg;cptOc:=1;                                    // prépare un nouveau comptage
      end;
      i:=i+1;
    end;
//................. Courbes Excel Timing, Angle/Vitesse ........................
    decal:=tTqMe[ind].intra.qDeb;                               // Décalage d'origine pour l'axe des temps
    decimalseparator:=',';
    for i:=0 to qMemCyc[iMot].IMAX-2 do                         // Pas de derniére valeur car interD impossible
      with tTqMe[(i+ind) mod IMAX] do
      Writeln(myFile,
        1000*(intra.qFin-intra.qDeb    )/queryFreq:5:3,chr(9),  // durée asserHard en ms avec queryPerformanceCounter (2 X 0.18ms)
        1000*(inter.qFin-inter.qDeb-550)/queryFreq:5:3,chr(9),  // durée Timer en ms
        1000*(intra.qDeb-     decal    )/queryFreq:5:3,chr(9),  // base de temps pour graphique en ms
                                               mes:5:3,chr(9),  // mesure
                                               csg:5:3,chr(9),  // consigne
                                           csg-mes:5:3,chr(9),  // écart
                                              corr:5:3,chr(9),  // correction
                                                   i+1,chr(9),  // classe
                                       occur[i]/10:5:1       ); // occurence (0.1 pour le graphe en Log)
    decimalseparator:='.';
  end;
  CloseFile(myFile);
end;
//==============================================================================================
procedure TForm1.ChkAsserClick(Sender: TObject);
var i :integer;
begin
  if not ChkAsser.Checked then     // quitte mode asservissement ?
    for i:=0 to 0 do //2 do
      if bFile[i] then begin            // buffer arreté ?
        bufferTextFile(i);              // extraction dans ficher texte
        bFile[i]:=false;                // réarmement buffer
//        TButton(form1.FindComponent('btFile'+IntToStr(i+1))).Font.Color:=clWindowText;;
      end;
end;
//==============================================================================================
procedure bloqueMemoTextFile(iMot:integer;strMsg:string);       // blocage mémorisation en manuel
begin
  if not bFile[iMot] then bFile[iMot]:=true;                    // blocage buffer circulaire
  CopyMemory(@qMemCyc[iMot].sdtB,@sdt,sizeof(TStatRT));         // copie des stats durée de 48 octets
  CopyMemory(@qMemCyc[iMot].seaB,@sea,sizeof(TStatRT));         // copie des stats asservissement de 48 octets
  Form1.lblFile.Caption:=strMsg;
//  TButton(form1.FindComponent('btFile'+IntToStr(iMot+1))).Font.Color:=clRed;
end;
//==============================================================================
procedure TForm1.TimeAsser1Timer(Sender: TObject); begin TimeAsser1.Enabled:=false;bloqueMemoTextFile(DR,'Timer'); end;
procedure TForm1.TimeAsser2Timer(Sender: TObject); begin TimeAsser2.Enabled:=false;bloqueMemoTextFile(AR,'Timer'); end;
procedure TForm1.TimeAsser3Timer(Sender: TObject); begin TimeAsser3.Enabled:=false;bloqueMemoTextFile(GA,'Timer'); end;
//==============================================================================================
procedure TForm1.btFile1Click(Sender: TObject); begin bloqueMemoTextFile(DR,'Bouton'); end;
//==============================================================================
// la POM doit être réalisée, le tableau "cons" contient les consignes angulaires
// l'appel est cadencé pas "RStimer" (3ms théorique)
procedure asservHard(cons:sglDrArGa;iMot:integer);
var mes,ecr,der,corr,consMoy:double;
    qAsserIntraDeb,qAsserIntraFin:Int64;        // pour queryPerformanceCounter intra-asservissement
    iM,i,durT:integer;
begin
  queryPerformanceCounter(qAsserIntraDeb);
  mes:=120;
  with qMemCyc[iMot] do begin
    qAsserInterFin[iMot]:=qAsserIntraDeb;
    durT:=trunc(1000000*(qAsserInterFin[iMot]-qAsserInterDeb[iMot]-550)/queryFreq);         //en µs
    qAsserInterDeb[iMot]:=qAsserIntraDeb;
    if not bFile[iMot] then begin
      if ind>IMAX-1 then ind:=0;
      tTqMe[ind                    ].inter.qDeb:=qAsserInterDeb[iMot];
      tTqMe[I2F(ind=0,IMAX-1,ind-1)].inter.qFin:=qAsserInterFin[iMot];
      tTqMe[ind                    ].intra.qDeb:=qAsserIntraDeb;
    end;
    if (durT>20000) and bRepos[3] then begin                                    // si manque de déterminisme et repos plateforme réalisée
      Form1.lblDurT.Caption:=intToStr(durT);
      indBloq:=(ind+trunc(qMemCyc[iMot].IMAX*90/100)) mod qMemCyc[iMot].IMAX;   // 10% avant événement, par index
    end;
    if durT>1000000 then durT:=200000;                                          // évite le dépassement de capacité
    if existcard<>0 then begin
      _8136_P_Read(CARD0,ENC2+iMot,tabPom[iMot].cptCur);                        // Lecture 1 Encodeur Moteur/Variateur
      mes:=(tabPom[iMot].cptCur-tabPom[iMot].cptIni)*360.0/1024/REDUCT;         // Mesure angle manivelle
      mesAngleMoteur[iMot]:=mes-90;                                             // pour mesure angleCadreMobile par GLscene
      with moyGlis[iMot] do begin                                               // moyenne glissante de consigne variateur pour diminuer les vibrations
        csg[cpt]:=cons[iMot];                         // mémo dernière consigne
        consMoy:=0;                                   // init somme
        for i:=0 to 3 do consMoy:=consMoy+csg[i];     // sommation
        consMoy:=consMoy/4;                           // moyenne
      end;
      ecr:=consMoy-mes;                                                         // Proportionnnelle
      pid[iMot].intg:=pid[iMot].intg+ecr;                                       // Intégrale
    end
    else
      ecr:=random(800)/100+0.8;                                                 // pas d'intégrale en mode simulation
    der:=ecr-pid[iMot].oldEc;
    pid[iMot].oldEc:=ecr;                                                       // Dérivée
    corr:=ecr           *strtofloat(Form1.LblKP.Caption)+                       // Correction PID
          {pid[iMot].intg*strtofloat(Form1.LblKI.Caption)+}
          der           *strtofloat(Form1.LblKD.Caption);
    if not bFile[iMot] then begin
      tTqMe[ind].mes :=mes;
      tTqMe[ind].csg :=cons[iMot];
      tTqMe[ind].corr:=corr;
    end;
    if not bRepos[3] then begin                                                 // repos pas encore atteint
      if iMot=DR then for iM:=DR to GA do bRepos[iM]:=false;                    // Raz 3 moteurs
      if abs(ecr)<0.1 then bRepos[iMot]:=true;                                  // repos d'un seul moteur
      if (iMot=GA) and bRepos[0] and bRepos[1] and bRepos[2] then begin         // 3 consécutifs
        bRepos[3]:=true;                                                        // position repos atteinte
        Form1.GroupBoxCadr.enabled:=true;                                       // autorisation pour les rampes
        Form1.btPom.Enabled:=false;
      end;
    end;
    if iMot=DR then begin                                                       // pour le moteur DROITE
      Form1.lblIntg.caption:=floatToStrf(pid[iMot].intg,fffixed,5,2);
      calcStatTempsReel(sea,abs(ecr));
      if sea.cpt mod 100 = 0 then begin
        Form1.LblStEctMes.caption:=floatToStrf(abs(ecr),fffixed,5,2)+'  ';
        Form1.LblStEctMoy.caption:=floatToStrf(sea.moy ,fffixed,5,3)+'  ';
        Form1.LblStEctSig.caption:=floatToStrf(sea.sig ,fffixed,5,2)+'  ';
        Form1.LblStEctMin.caption:=floatToStrf(sea.min ,fffixed,5,2)+'  ';
        Form1.LblStEctMax.caption:=floatToStrf(sea.max ,fffixed,5,2)+'  ';
      end;
      //if sea.max>0.01 then Form1.GaugeStEct.MaxValue:=round(sea.max*1000);
      if sea.moy>0.01 then Form1.GaugeStEct.MaxValue:=round(4*sea.moy*10);
      Form1.GaugeStEct.Progress:=round(abs(ecr)*10);                            // asser

      if durT div 1000>0 then calcStatTempsReel(sdt,durT/1000);                 // durT>1ms ?
      if sdt.cpt mod 100 = 0 then begin
        Form1.LblStDurMes.caption:=floatToStrf(abs(durT/1000),fffixed,5,2)+'  ';
        Form1.LblStDurMoy.caption:=floatToStrf(sdt.moy       ,fffixed,5,3)+'  ';
        Form1.LblStDurSig.caption:=floatToStrf(sdt.sig       ,fffixed,5,3)+'  ';
        Form1.LblStDurMin.caption:=floatToStrf(sdt.min       ,fffixed,5,2)+'  ';
        Form1.LblStDurMax.caption:=floatToStrf(sdt.max       ,fffixed,5,2)+'  ';
      end;
      if sdt.moy>1 then Form1.GaugeStDur.MaxValue:=round(3*sdt.moy);
      Form1.GaugeStDur.Progress:=round(durT/1000);                       // durée
    end;
{    if sea.cpt mod 100 = 0 then        // pour les 3 moteurs
    begin
      TLabeledEdit(form1.FindComponent('LblEdtMes'+IntToStr(iMot+1))).Text:=floattostrf(mes ,fffixed,5,3);//+' °';
      TLabeledEdit(form1.FindComponent('LblEdtEcr'+IntToStr(iMot+1))).Text:=floattostrf(ecr ,fffixed,5,3);//+' °';
      TLabeledEdit(form1.FindComponent('LblEdtCor'+IntToStr(iMot+1))).Text:=floattostrf(corr,fffixed,5,3);//+' °';
    end;}
//    if abs(corr)<Form1.TBarKI.Position/200 then corr:=corr*corr/Form1.TBarKI.Position/200;   // zone morte => aggrave le 92Hz
    if existcard<>0 then
      _8136_A_Write_Varia(iMot,I2F(mes=120.0,0.0,corr),tTqMe[I2F(ind=0,IMAX-1,ind-1)].corr);                    // Sortie analogique
    queryPerformanceCounter(qAsserIntraFin);
    if not bFile[iMot] then begin
      tTqMe[ind].intra.qfin:=qAsserIntraFin;
      ind:=ind+1;
      if ind=indBloq then bloqueMemoTextFile(iMot,'Tempo');
    end;
  end;
  moyGlis[iMot].cpt:=(moyGlis[iMot].cpt+1) mod 4;                               // incrément index buffer cyclique
end;
//==============================================================================
procedure paramTimeAsser(iMot: integer);
var tension:double;
begin
  if form1.ChkAsser.Checked then begin
    consAsser[iMot]:=strtofloat(TLabeledEdit(form1.FindComponent('edtm'+IntToStr(iMot+1))).text);  // lit cons angle moteur
{   if bRepos[3] then    // 3 moteurs au repos PF ?
    begin
      if iMot=DR then
      begin                                                            // un seul timer pour 3 moteurs
        Form1.RSTimer2.Enabled:=false;
        Form1.RSTimer3.Enabled:=false;
        asservHard(consAsser,DR);
        consAsser[AR]:=strtofloat(Form1.edtm2.text);                   // lit cons moteur Arriére
        asservHard(consAsser,AR);
        consAsser[GA]:=strtofloat(Form1.edtm3.text);                   // lit cons moteur Gauche
        asservHard(consAsser,GA)
      end
    end
    else }
      asservHard(consAsser,iMot)                                       // asservissement angle moteur=f(vitesse)
  end
  else begin
    if form1.ChkEpreuve.Checked then begin                             // éxécution des 3 diagrammes d'épreuve en vitesse
      if diagMot[iDiag].cpt=0 then                                     // fin de diagramme ?
        if diagMot[0].cyc=1 then                                       // cyclique ?
          begin iDiag:=0;iAppel:=0; end                                // bouclage
        else
          form1.ChkEpreuve.Checked:=false                              // arrêt épreuve
      else begin
        if iDiag=0 then
          tension:=diagMot[iDiag].csg[iMot]*iAppel/diagMot[iDiag].cpt // segment à l'origine
        else
          tension:=                  diagMot[iDiag-1].csg[iMot]+
           (diagMot[iDiag].csg[iMot]-diagMot[iDiag-1].csg[iMot])*     // segments suivants
                                  (iAppel-diagMot[iDiag-1].cpt)/
                      (diagMot[iDiag].cpt-diagMot[iDiag-1].cpt);
        _8136_A_Write_Varia(iMot,tension);                            // consigne vitesse
      end;
      if iMot=DR then begin// GA then                                                  // si 3éme moteur
        iAppel:=iAppel+1;                                              // compteur d'appel
        if iAppel>diagMot[iDiag].cpt then iDiag:=iDiag+1;              // progression dans le diag
      end;
      if iDiag=6 then                                                  // diagramme complet
        if diagMot[0].cyc=1 then                                       // cyclique ?
          begin iDiag:=0;iAppel:=0; end                                // bouclage
        else
          form1.ChkEpreuve.Checked:=false;                             // arrêt épreuve
      end
    else                                                               // repositionnement "manuel" des moteurs
    with form1 do begin
      _8136_P_Read(CARD0,ENC2+iMot,tabPom[iMot].cptCur);
//  Edit1.Text:=floattostrf((tabPom[iMot].cptCur-tabPom[iMot].cptIni)*360.0/1024,fffixed,5,1)+' °';    // angle moteur
      if (imot=AR) and ChkInvAr.Checked then
        _8136_A_Write_Varia(iMot,I2F(Tbar16.Position=0,0,-Tbar16.Position/10))                     // DAC4 DIN100S.52 X3.3 Droite
      else
        _8136_A_Write_Varia(iMot,I2F(Tbar16.Position=0,0,Tbar16.Position/10));                     // DAC4 DIN100S.52 X3.3 Droite
      if Tbar16.Position<>0 then edCons.Text:=' cVit= '+FloatToStrf(Tbar16.Position/10,fffixed,5,3)+' V';
      _8136_A_Read_Potar(iMot,tension);                                                            // ADC1 DB25.20 Potar Droite
      edMes.Text:=' mPot= '+FloatToStrf(tension,fffixed,5,3)+' V';
      LblEdtMes1.Text:=floattostrf((tabPom[iMot].cptCur-tabPom[iMot].cptIni)*360.0/1024/REDUCT,fffixed,5,3)+' °';   // angle maivelle
    end;
  end;
end;
//==============================================================================
procedure TForm1.ChkEpreuveClick(Sender: TObject);  // Construction 3 diagrammes dans "diagMot"
var iMot : integer;
    durSom : single;
    strChamp : string;
begin
  ChkAsser.Checked:=false;
  iDiag:=0;durSom:=0;
  while iDiag<length(diagMot) do begin
    durSom:=durSom+strtofloat(TLabeledEdit(form1.FindComponent('EdtDiagDur'+IntToStr(iDiag+1))).text);
    diagMot[iDiag].cpt:=round(durSom*1000/RSTimerAsserv1.interval);                         // conversion durée => nbappels
    for iMot:=DR to GA do begin
      if TcheckBox(form1.FindComponent('ChkDiagAct'+IntToStr(iMot+1))).checked then begin   // si ce moteur actif
        strChamp:=TLabeledEdit(form1.FindComponent('EdtDiagTens'+IntToStr(iDiag+1))).text;
        if strChamp<>'' then begin
          diagMot[iDiag].csg[iMot]:=strtofloat(strChamp);                                   // cas normal
          if diagMot[iDiag].csg[iMot]> 10 then diagMot[iDiag].csg[iMot]:= 10;
          if diagMot[iDiag].csg[iMot]<-10 then diagMot[iDiag].csg[iMot]:=-10;
          if TcheckBox(form1.FindComponent('ChkDiagInv'+IntToStr(iMot+1))).checked then     // inversion
            diagMot[iDiag].csg[iMot]:=-diagMot[iDiag].csg[iMot];
        end
        else
          diagMot[iDiag].csg[iMot]:=I2F(iDiag=0,0,diagMot[iDiag-1].csg[iMot]);              // tension précédente si vide
//          I2F(TcheckBox(form1.FindComponent('ChkDiagCyc'+IntToStr(iMot+1))).checked,1,0);
      end;
    end;
    diagMot[iDiag].cyc:=I2F(ChkDiagCyc.Checked,1,0);
    iDiag:=iDiag+1;
  end;
  iDiag:=0;iAppel:=0;
RSTimerAsserv1.Enabled:=true; // pour debbug
end;
//==============================================================================
procedure TForm1.RSTimerAsserv1Timer(Sender: TObject); begin paramTimeAsser(DR); end;
procedure TForm1.RSTimerAsserv2Timer(Sender: TObject); begin paramTimeAsser(AR); end;
procedure TForm1.RSTimerAsserv3Timer(Sender: TObject); begin paramTimeAsser(GA); end;
//==============================================================================
procedure paramTimeZeroPf(iMot: integer);   // zéro plateforme à 13.5°/s pour 0.5V => 8.322°(théo)=> 617ms
var i:integer;
begin
  TTimer(Form1.FindComponent('TimeZeroPf'+IntToStr(iMot+1))).Enabled:=false;     // auto-arret
  qMemCyc[iMot].IMAX:=length(qMemCyc[iMot].tTqMe);qMemCyc[iMot].ind:=0;          // pour buffer cyclique
  qMemCyc[iMot].indBloq:=-1;
  for i:=0 to 3 do moyGlis[iMot].csg[i]:=
    strtofloat(TLabeledEdit(form1.FindComponent('edtm'+IntToStr(iMot+1))).text); // init de la moyenne glissante
   //qMemCyc[iMot].tTqMe[IMAX-1].corr:=                                // init pour détection dépassement consigne variateur
//  TTimer(Form1.FindComponent('TimeAsser'+IntToStr(iMot+1))).Enabled:=true;     //
//  TTimer(Form1.FindComponent('TimeAsserGl'+IntToStr(iMot+1))).Enabled:=true;   // bug ??
//  TTimer(Form1.FindComponent('RSTimer'+IntToStr(iMot+1))).Enabled:=true;       // çà marche pas, non reconnu
  if iMot=DR then Form1.RSTimerAsserv1.Enabled:=true;
  if iMot=AR then Form1.RSTimerAsserv2.Enabled:=true;
  if iMot=GA then Form1.RSTimerAsserv3.Enabled:=true;
end;
//==============================================================================
procedure TForm1.TimeZeroPf1Timer(Sender: TObject); begin paramTimeZeroPf(DR); end; // interval=670ms
procedure TForm1.TimeZeroPf2Timer(Sender: TObject); begin paramTimeZeroPf(AR); end; // interval=670ms
procedure TForm1.TimeZeroPf3Timer(Sender: TObject); begin paramTimeZeroPf(GA); end; // interval=670ms
//==============================================================================
procedure paramTimeTopTour(iMot: integer);   // détection toptour (15.6ms mini)
var AMANR:float;
begin
  AMANR:=ArcSin(manv/2/biel);                                                   // angle manivelle pour plateforme au repos
//  affDuree();                                                                 // fin timer + affichage
//  queryPerformanceCounter(queryDeb);                                          // deb timer
  _8136_P_Read_Latch_Value(CARD0,ENC2+iMot,tabPom[iMot].cptIni);
  Form1.edCons.Text:=' Cod'+IntToStr(iMot)+'='+IntToStr(tabPom[iMot].cptIni)+' imp';
  _8136_A_Read_Potar(iMot,tabPom[iMot].uPotPos);                                // ADC1 DB25.20 Lecture Potar
  Form1.edMes.Text :=' Pot'+IntToStr(iMot)+'='+FloatToStrf(tabPom[iMot].uPotPos,fffixed,5,3)+' V';
//  if(tabPom[iMot].cptIni<512+200)and(tabPom[iMot].cptIni>512-200) then begin
  if tabPom[iMot].cptIni>0 then begin
    TTimer(Form1.FindComponent('TimeOut'    +IntToStr(iMot+1))).Enabled:=false; // arrêt timeOut
    TTimer(Form1.FindComponent('TimeTopTour'+IntToStr(iMot+1))).Enabled:=false; // auto-arret
    TTimer(Form1.FindComponent('TimeZeroPf' +IntToStr(iMot+1))).Enabled:=true;  // affiche angle avec trackBar en consigne
    if (iMot=AR) then form1.caption:='TimeZeroPf';
    _8136_A_Write_Varia(iMot,10*AMANR/2/PI*REDUCT/VMOT*1000/Form1.TimeZeroPf1.Interval+0.03); // consigne vitesse environ 0.4V
  end;
end;
//==============================================================================
procedure TForm1.TimeTopTour1Timer(Sender: TObject); begin paramTimeTopTour(DR); end; // prépositionnement avec potar(30ms)
procedure TForm1.TimeTopTour2Timer(Sender: TObject); begin paramTimeTopTour(AR); end; // prépositionnement avec potar(30ms)
procedure TForm1.TimeTopTour3Timer(Sender: TObject); begin paramTimeTopTour(GA); end; // prépositionnement avec potar(30ms)
//==============================================================================
procedure paramTimePosPot(iMot: integer);    // prépositionnement avec potar(30ms)
begin
  with tabPom[iMot] do begin
    _8136_A_Read_Potar(iMot,uPotPos);                                    // ADC1 DB25.20 Lecture Potar
//    if (iMot=AR) then form1.caption:=' mPotAr= '+FloatToStrf(uPotPos,fffixed,5,3)+' V';
    Form1.edMes.Text:=' mPot= '+FloatToStrf(uPotPos,fffixed,5,3)+' V';   // pour calage potars à 5V +/-0.02V mettre{}ligne suivante
    if(abs(uVitCons)>0.1)or(not bMiCourse)then                           // si non proche du prépositionnement
      uVitCons:=uVitCons+uPas*I2F(bMiCourse,-1,1)
                             *I2F((uPotIni-uPotRef)>0,1,-1);             // courbe accélération en S vers réf:5V
//    if uVitCons> 10 then uVitCons:=10;
//    if uVitCons<-10 then uVitCons:=-10;
    if bMiCourse then
       Form1.edCons.Text:=FloatToStrf(abs(uPotPos-uPotRef),fffixed,5,2)+' V'
    else
       Form1.edCons.Text:=FloatToStrf(((uPotIni-uPotRef)/2-(uPotPos-uPotRef)),fffixed,5,2)+' V';
    if(abs((uPotIni-uPotRef)/2-(uPotPos-uPotRef))<0.05*abs(uVitCons))and(not bMiCourse)then begin  // détection mi-course ?
      bMiCourse:=true;
      Form1.edMes.Text:='m = '+FloatToStrf(((uPotIni-uPotRef)/2-(uPotPos-uPotRef)),fffixed,5,3)+
                         ', ' +FloatToStrf(0.05*uVitCons,fffixed,5,3);
    end;
    Form1.edCons.Text:=FloatToStrf(uVitCons,fffixed,5,3)+' V';                    // consigne vitesse
    _8136_A_Write_Varia(iMot,uVitCons);                                           // DAC4 DIN100S.52 X3.3
    if(abs(uPotPos-uPotRef)<0.03)then begin                                       // si position atteinte (et vitesse faible?)
      prepaRefCodeur(iMot);                                                       // armement détection toptour codeur
      _8136_A_Write_Varia(iMot,0.05);                                             // DAC4 DIN100S.52 X3.3 Droite en vitesse très lente
      TTimer(Form1.FindComponent('TimePosPot' +IntToStr(iMot+1))).Enabled:=false; // auto-arret
      TTimer(Form1.FindComponent('TimeTopTour'+IntToStr(iMot+1))).Enabled:=true;  // détection toptour
//      if (iMot=AR) then form1.caption:='TimeTopTour';
    end;//}
  end;
end;
//==============================================================================
procedure TForm1.TimePosPot1Timer(Sender: TObject); begin paramTimePosPot(DR); end; // prépositionnement avec potar(30ms)
procedure TForm1.TimePosPot2Timer(Sender: TObject); begin paramTimePosPot(AR); end; // prépositionnement avec potar(30ms)
procedure TForm1.TimePosPot3Timer(Sender: TObject); begin paramTimePosPot(GA); end; // prépositionnement avec potar(30ms)
//==============================================================================
procedure paramTimeOut(iMot: integer);
begin
  TTimer(Form1.FindComponent('TimePosPot' +IntToStr(iMot+1))).Enabled:=false; // abandon de préPOM
  TTimer(Form1.FindComponent('TimeTopTour'+IntToStr(iMot+1))).Enabled:=false; // abandon détection toptour
  TTimer(Form1.FindComponent('TimeOut'    +IntToStr(iMot+1))).Enabled:=false; // auto-arrêt
  bEnable:=false;Form1.btEnable.Caption:='timeOutPom';                        // signalisation timeOut
  _8136_D_Output(CARD0,5,ARRET);                                              // DO6 DIN100S.70 X1.3 DISABLE
end;
//==============================================================================
procedure TForm1.TimeOut1Timer(Sender: TObject); begin paramTimeOut(DR); end; // prépositionnement avec potar(30ms)
procedure TForm1.TimeOut2Timer(Sender: TObject); begin paramTimeOut(AR); end; // prépositionnement avec potar(30ms)
procedure TForm1.TimeOut3Timer(Sender: TObject); begin paramTimeOut(GA); end; // prépositionnement avec potar(30ms)
//==============================================================================
procedure pomSeul(iMot:integer);
begin
  tabPom[iMot].bTrouve:=false;                                                 // init de la recherche
  tabPom[iMot].bMiCourse:=false;                                               // init de la recherche
  tabPom[iMot].uPas:=0.02;                                                     // pas de tension entre appels timer
  tabPom[iMot].uPotRef:=5;                                                     // mi-course du potar
  tabPom[iMot].uVitCons:=0;                                                    // Cons moteur à 0
  _8136_A_Write_Varia(iMot,tabPom[iMot].uVitCons);                             // Moteur à l'arret
  _8136_A_Read_Potar (iMot,tabPom[iMot].uPotIni);                              // ADC1 DB25.20 Potar Droite
//  TTimer(Form1.FindComponent('TimeOut'   +IntToStr(iMot+1))).Enabled:=true;  // pour POM non trouvée
  TTimer(Form1.FindComponent('TimePosPot'+IntToStr(iMot+1))).Enabled:=true;    // prépositionnement avec potar
//  if (iMot=AR) then form1.caption:='TimePosPot';
  //  form1.caption:=floattostrf(tabPom[0].uPotIni,fffixed,5,3)+'   '+floattostrf(tabPom[1].uPotIni,fffixed,5,3)+'   '+floattostrf(tabPom[2].uPotIni,fffixed,5,3);
end;
//==============================================================================
procedure initAsserv();     // initialisation compléte de l'asservissement
var i:integer;
begin
  initStatTempsReel(sdt);initStatTempsReel(sea);
  initStatTempsReel(snMin);initStatTempsReel(snMid);initStatTempsReel(snMax);
  anglPomp:=0;anglroulis:=0;angltangage:=0;pomp:=0;limiteur:=1;
  queryPerformanceFrequency(queryFreq);          // valeur fixe : 3 166 720 000 Hz
  bEnable:=false;                                // Enable variateur
  bRepos[3]:=false;                              // RAZ position globale repos plateforme
  _8136_initMultiFonct(true);                    // (30ms ou 1.9s si "_8136_A_Initial")
  if existcard<>0 then begin
  //  _8136_D_OutputA(CARD0,0);                   // marche de DO1 à DO7 DIN100S.12,62,16,66,20,70 et 58
    _8136_D_OutputA(CARD0,127);                  // arret de DO1 à DO7 DIN100S.12,62,16,66,20,70 et 58
    _8136_A_Write_Volt(CARD0,CH0,10);            // DAC1 alim3Potars DB25.18
    _8136_D_Output(CARD0,6,MARCHE);              // DO7 DIN100S.58 avec platine inversion
    _8136_D_Output(CARD0,1,MARCHE);              // DO7 DIN100S.58 avec platine inversion
    _8136_D_Output(CARD0,3,MARCHE);              // DO7 DIN100S.58 avec platine inversion
    _8136_D_Output(CARD0,6,ARRET);               // DO7 DIN100S.58 avec platine inversion
    _8136_D_Output(CARD0,1,ARRET);               // DO7 DIN100S.58 avec platine inversion
    _8136_D_Output(CARD0,3,ARRET);               // DO7 DIN100S.58 avec platine inversion
//    GroupBoxPlat.enabled:=false;                 // interdiction pour les rampes tant que pas position repos plate-forme de chaque moteur
//    sleep(200);_8136_A_Read_Potar(CH2,tens);     // ADC1 DB25.20 Potar Droite pour règlage d'offset des sorties ana
  end;
  for i:=DR to GA do begin
    csgMot[i].min:=0;csgMot[i].max:=0;
    bFile[i]:=false;
    TLabel(form1.FindComponent('LblMaxGag'+IntToStr(i+1))).Caption:=inttostr(round(max_gauge));
    TGauge(form1.FindComponent('Gauge'    +IntToStr(i+1))).MaxValue:=round(max_gauge);
  end;
  queryPerformanceCounter(queryDeb);
end;
//==============================================================================
procedure TForm1.btRazClick(Sender: TObject);
begin
  btRaz.Enabled:=false;btPom.Enabled:=false;btEnable.Enabled:=false;GroupBoxAsser.repaint;
  _8136_S_Close(CARD0);                             //  Ferme la PCI-8136 (16µs)
  initAsserv();                                     // initialisation compléte de l'asservissement
  btRaz.Enabled:=true;btPom.Enabled:=true;btEnable.Enabled:=true;
end;
//==============================================================================
procedure TForm1.btQuitClick(Sender: TObject);
begin
if ((packet.vitesse/coef_vit)<0.7) or not(bEnable) then   // interdit l'arret si le tapis est en mvt
  begin
    //  _8136_S_INT_Control(CARD0,0);                   // Désactivation de l'interruption MAtériel
    //  _8136_INT_Disable(CARD0);                       // Désactivation des interruptions Windows
      _8136_D_Output(CARD0,5,ARRET);                    // DO6 DIN100S.70 X1.3 ENABLE avec relais
      _8136_A_Write_Ventilo(VeAV,0);                    // les 2 avant pour arrêter (courant=0)
      sleep(100);
      _8136_A_Write_Ventilo(VeAR,0);                    // les 2 arrière pour arrêter (courant=0)
      sleep(500);_8136_S_Close(CARD0);                  // Ferme la PCI-8136 après tempo de 500 ms
      Close();
  end                                // sort du programme
  else
    showmessage('Arrêter le tapis roulant d''abord');
end;
//==============================================================================
procedure TForm1.btEnableClick(Sender: TObject);
var iM:integer;
begin
if (packet.vitesse/coef_vit)<0.1  then   //interdit l'arret si la plateforme est en mvt
  begin
    bEnable:=not(bEnable);
    btEnable.Caption:=I2F(bEnable,'Disable','Enable');
    for iM:=DR to GA do _8136_A_Write_Varia(iM,0);   // vitesse faible
    _8136_D_Output(CARD0,5,I2F(bEnable,MARCHE,ARRET)); // DO6 DIN100S.70 X1.3 ENABLE avec relais
    { _8136_D_Output(CARD0,6,I2F(bEnable,MARCHE,ARRET)); // DO7 DIN100S.58 avec platine inversion
    _8136_D_Output(CARD0,1,I2F(bEnable,MARCHE,ARRET)); // DO2 DIN100S.62 avec platine inversion
    _8136_D_Output(CARD0,3,I2F(bEnable,MARCHE,ARRET)); // DO4 DIN100S.66 avec platine inversion
    _8136_D_Output(CARD0,0,I2F(bEnable,MARCHE,ARRET)); // DO1 DIN100S.12 sans platine
    _8136_D_Output(CARD0,2,I2F(bEnable,MARCHE,ARRET)); // DO3 DIN100S.16 sans platine
    _8136_D_Output(CARD0,4,I2F(bEnable,MARCHE,ARRET)); // DO5 DIN100S.20 sans platine
    if bEnable then prepaRefCodeur(0);
    TimeTopTour1.Enabled:=bEnable;}
  end
  else
  showmessage('Arrêter le tapis roulant d''abord');
end;
//==============================================================================
procedure TForm1.btPomClick(Sender: TObject);
var iM:integer;
begin
  bEnable:=true;                                            // enable Variateur
  btEnable.Caption:=I2F(bEnable,'Disable','Enable');
  _8136_D_Output(CARD0,5,MARCHE);                          // DO6 DIN100S.70 X1.3 ENABLE variateur
  for iM:=DR to GA do pomSeul(iM);
end;
//==============================================================================
procedure TForm1.FMW(S: TObject; T: TShiftState; WD: Integer; MP: TPoint; var H: Boolean);
begin
  if Assigned(glCamera1) then glCamera1.AdjustDistanceToTarget(Power(1.05,WD/240));
end;
//==============================================================================================
procedure LoadFrommesh( const filename: string; var mesh:TGLfreeform; var matlibrary,lightlibrary: TGLMaterialLibrary);overload;
var
  ms1, ms2, ms3: TMemoryStream;
begin
  ms1:= TMemoryStream.Create;
  ms2:= TMemoryStream.Create;
  ms3:= TMemoryStream.Create;
  try
    Form1.HKS.LoadFromFile(filename);
    Form1.HKS.GetStream('mat',ms2);
    matlibrary.Materials.Clear;
    matlibrary.LoadFromStream( ms2);
    Form1.HKS.GetStream('light',ms3);
    lightlibrary.Materials.Clear;
    lightlibrary.LoadFromStream( ms3);
    Form1.HKS.GetStream('mesh',ms1);
    mesh.MeshObjects.Clear;
    mesh.MaterialLibrary:=matlibrary;
    mesh.LightmapLibrary:=lightlibrary;
    mesh.UseMeshMaterials:=true;
    mesh.MeshObjects.LoadFromStream( ms1 );
  finally
    ms1.Free;
    ms2.Free;
    ms3.Free;
  end;
end;
//==============================================================================================
procedure LoadFrommesh( const filename: string; var mesh:TGLfreeform; var matlibrary: TGLMaterialLibrary);overload;
var
  ms1, ms2: TMemoryStream;
begin
  ms1:= TMemoryStream.Create;
  ms2:= TMemoryStream.Create;
  try
    Form1.HKS.LoadFromFile(filename);
    Form1.HKS.GetStream('mat',ms2);
    matlibrary.Materials.Clear;
    matlibrary.LoadFromStream( ms2);
    Form1.HKS.GetStream('mesh',ms1);
    mesh.MeshObjects.Clear;
    mesh.MaterialLibrary:=matlibrary;
    mesh.UseMeshMaterials:=true;
    mesh.MeshObjects.LoadFromStream( ms1 );
  finally
    ms1.Free;
    ms2.Free;
  end;
end;
//==============================================================================================
procedure ApplyGravity(const body : PNewtonBody) ; cdecl ;
const
  GRAVITY=9.81 ;
var
  mass,Ixx,Iyy,Izz:Single ;
  force:TVector3f ;
begin
  NewtonBodyGetMassMatrix(body, @mass, @Ixx, @Iyy, @Izz) ;
  force := AffineVectorMake(0,0, -GRAVITY * mass) ;
  NewtonBodySetForce(body, @force) ;
end ;
//==============================================================================================
procedure ApplyForce(const body : PNewtonBody) ; cdecl ;
const
  GRAVITY=9.81 ;
var
  mass,Ixx,Iyy,Izz:Single ;
  force:TVector3f ;
begin
  NewtonBodyGetMassMatrix(body, @mass, @Ixx, @Iyy, @Izz) ;
  force := AffineVectorMake(0,0, -GRAVITY * mass) ;
  NewtonBodySetForce(body, @force) ;
  force:=affinevectormake(0,0,-kressort*(vectordotproduct(rel2abspoint(Form1.piston,affinevectormake(0,0,0)),affinevectormake(0,0,1))-0.057-hressort-l0ressort));
  AddForceAtPos(body,force,rel2abspoint(Form1.piston,affinevectormake(0,0,0))) ;
//  form1.caption:=floattostr((vectordotproduct(rel2abspoint(Form1.piston,affinevectormake(0,0,0)),affinevectormake(0,0,1)))-0.057)+'  '+floattostr(-kressort*(vectordotproduct(rel2abspoint(Form1.piston,affinevectormake(0,0,0)),affinevectormake(0,0,1))-0.057-hressort-l0ressort));
end ;
//==============================================================================================
procedure numericaldamping(const body : PNewtonBody ); cdecl;
var
  v:tvector3f;
begin
  NewtonBodySetLinearDamping(body,0.001);
  v:=affinevectormake(0.001,0.001,0.001);
  NewtonBodySetAngularDamping(body,@v);
end;
//==============================================================================================
procedure Debug_ShowGeometryCollision(const body : PNewtonBody ; VertexCount : Integer ; const
  FaceArray : NewtonImport.PFloat ; FaceId : Integer) ; cdecl ;
var
  i      : Integer ;
  v0, v1 : array[0..2] of Single ;
  vA     : array of Single ;
begin
  if VertexCount = 0 then Exit ;
  SetLength(vA, VertexCount * 3) ;
  Move(FaceArray^, vA[0], VertexCount * 3 * SizeOf(Single)) ;
  v0[0] := vA[(VertexCount - 1) * 3] ;
  v0[1] := vA[(VertexCount - 1) * 3 + 1] ;
  v0[2] := vA[(VertexCount - 1) * 3 + 2] ;
  for i := 0 to VertexCount - 1 do begin
    v1[0] := vA[i * 3] ;
    v1[1] := vA[i * 3 + 1] ;
    v1[2] := vA[i * 3 + 2] ;
    glVertex3f(v0[0], v0[1], v0[2]) ;
    glVertex3f(v1[0], v1[1], v1[2]) ;
    v0 := v1 ;
  end ;
end ;
//==============================================================================================
procedure Debug_ShowBodyCollision(const body : PNewtonBody) ; cdecl ;
begin
  NewtonBodyForEachPolygonDo(body, Debug_ShowGeometryCollision) ;
end ;
//==============================================================================================
procedure UpdateGraphicObject(const body : PNewtonBody ; const matrix : NewtonImport.PFloat) ; cdecl;
var
  glObj : TGLBaseSceneObject ;
begin
  glObj := TGLBaseSceneObject(NewtonBodyGetUserData(body)) ;
  glObj.matrix := pMatrix(matrix)^ ;
  globj.Scale.X:=0.01;globj.Scale.y:=0.01;globj.Scale.z:=0.01;
end ;
//==============================================================================================
procedure UpdateGraphicManivelle(const body : PNewtonBody ; const matrix : NewtonImport.PFloat) ; cdecl;
var
  glObj : TGLBaseSceneObject ;
begin
  glObj := TGLBaseSceneObject(NewtonBodyGetUserData(body)) ;
  glObj.matrix := pMatrix(matrix)^ ;
  globj.Scale.X:=0.01*manv/0.11;
  globj.Scale.y:=0.01*manv/0.11;
  globj.Scale.z:=0.01*manv/0.11;
end ;
//==============================================================================================
procedure UpdateGraphicBielle(const body : PNewtonBody ; const matrix : NewtonImport.PFloat) ; cdecl;
var
  glObj : TGLBaseSceneObject ;
begin
  glObj := TGLBaseSceneObject(NewtonBodyGetUserData(body)) ;
  glObj.matrix := pMatrix(matrix)^ ;
  globj.Scale.X:=0.01*biel/0.38;
  globj.Scale.y:=0.01*biel/0.38;
  globj.Scale.z:=0.01*biel/0.38;
end ;
//==============================================================================================
procedure UpdateGraphicplateforme(const body : PNewtonBody ; const matrix : NewtonImport.PFloat) ; cdecl;
var
  glObj : TGLBaseSceneObject ;
begin
  glObj := TGLBaseSceneObject(NewtonBodyGetUserData(body)) ;
  glObj.matrix := pMatrix(matrix)^ ;
  globj.Scale.X:=0.01*maxi(L1,L2)/0.25;globj.Scale.y:=0.01*L3/0.25;globj.Scale.z:=0.01;
end ;
//==============================================================================================
procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var
  data_ini:tinifile;              //  tens:double;
begin
    data_ini:=tinifile.Create(extractfilepath(application.exename)+'param.ini');
    DATA_INI.WRITEFLOAT('NETWORK','coef_tangage',coef_the);
    DATA_INI.WRITEFLOAT('NETWORK','coef_roulis',coef_phi);
    DATA_INI.WRITEFLOAT('NETWORK','coef_pompage',coef_dz);
    DATA_INI.WRITEFLOAT('NETWORK','coef_vitesse',coef_vit);
    data_ini.free;

    _8136_D_Output(CARD0,5,ARRET);                    // DO6 DIN100S.70 X1.3 ENABLE avec relais
    _8136_A_Write_Ventilo(VeAV,0);                    // les 2 avant pour arrêter (courant=0)
    sleep(100);
    _8136_A_Write_Ventilo(VeAR,0);                    // les 2 arrière pour arrêter (courant=0)
    sleep(500);_8136_S_Close(CARD0);                  // Ferme la PCI-8136 après tempo de 500 ms
    GLCadencer1.Enabled:= False;
    GLSceneViewer1.Buffer.DestroyRC;
end;
//==============================================================================================
procedure TForm1.GLSceneviewer1PostRender(Sender: TObject);
begin
    glPushAttrib(GL_ENABLE_BIT + GL_CURRENT_BIT + GL_POLYGON_BIT) ;
    glDisable(GL_LIGHTING) ;
    glEnable(GL_POLYGON_OFFSET_LINE) ;
    glPolygonOffset(1, 2) ;
    glColor4fv(@clrWhite) ;
    glBegin(GL_LINES) ;
//    DisplayCollisionGeoms ;
    glEnd ;
    glPopAttrib ;
end;
//==============================================================================================
procedure mesureAngleCadreMobile();
var qFin:Int64;
    vPf:TVector3d;
    t,r:double;
//  const XdVector:TVector3d=(1, 0, 0);
//  const YdVector:TVector3d=(0, 1, 0);
begin
  vPf[0]:=Form1.Bplateforme.Direction.X;                              // lire vecteur "Direction"
  vPf[1]:=Form1.Bplateforme.Direction.Y;
  vPf[2]:=Form1.Bplateforme.Direction.Z;
//  vPf[0]:=sqrt(3)/3;vPf[1]:=sqrt(3)/3;vPf[2]:=sqrt(3)/3;            // vecteur remarquable (Roul=45, Tang=45, Lacet=45) pour test
  t:= arctan(vPf[0]/vPf[2])*180/PI;                                   // dans le plan x,z
  r:=-arctan(vPf[1]/vPf[2])*180/PI;                                   // dans le plan y,z
  Form1.LblMesRoul.Caption:=floattostrf(t,fffixed,5,3);               // mesure tangage
  Form1.LblMesTang.Caption:=floattostrf(r,fffixed,5,3);               // mesure roulis
//form1.Caption:=floattostrf(Form1.Bpiston.Position.Z*1000-172,fffixed,5,2);
//  Form1.LblMesTang.Caption:=floattostrf(the-t,fffixed,5,3);         // écart : consigne-mesure
//  Form1.LblMesRoul.Caption:=floattostrf(phi-r,fffixed,5,3);         // écart : consigne-mesure
  with bufCircUdp do begin
//    if bFile then begin                                               // si new Echant (15ms) => petit pb de synchro de bFile
    if form1.chkFileLoi.Checked then begin                            // si tous les Echant (3ms)
      queryPerformanceCounter(qFin);
      WriteLn(fileLoi,1000*(qFin-queryDebLoi)/queryFreq:8:1,chr(9),
                                           buf[iA].tang:5:4,chr(9),   // consigne accélération longi en m/s²
                                                      t:5:4,chr(9),   // mesure tangage en °
                                           buf[iA].roul:5:4,chr(9),   // consigne accélération trans en m/s²
                                                      r:5:4,chr(9),
                                      buf[iP].pomp*1000:5:1,chr(9),   // consigne accélération trans en m/s²
                      Form1.Bpiston.Position.Z*1000-172:5:1);         // mesure hauteur en mm
//    queryDeb2:=qFin;
    end;
  end;
end;
//==============================================================================================
function rampe(t:single;slope_delay:single;duration:single):single;
begin
    if t<slope_delay then  result:=t/slope_delay
    else
    if t>duration-slope_delay then  result:=math.max(0,(duration-t)/slope_delay)
    else result:=1.;
end;
//==============================================================================================
procedure TForm1.GLCadencer1Progress(Sender:TObject;const deltaTime,newTime:Double);
var
  i:integer;
  m1,m2,m3:array[0..9] of single;
  plateforme_pos:Tvector3f;
begin

  if test_indicator<>0 then
  //Liste de Tests préprogrammés
  begin
    Writeln(File_resu,edtphi.text+ #9 +edtthe.text+ #9 +floattostrf(-biel+strtofloat(edtdZ.text),fffixed,5,2)+ #9 +Lblvitesse.text);
    case test_indicator of
    1:
      begin
        anglroulis:=anglroulis+deltatime*freq_pretest*360;
        fade:=fade+deltatime;
        if anglroulis>=360 then anglroulis:=0;
        duration:= max_tick_test*Timer_test.Interval/1000.;
        tactive2:=sin(anglroulis*pi/180)*ampl_pretest*rampe(fade,fade_time,duration);
        edtphi.text:=floattostrf(tactive2,fffixed,5,3);
        //form1.caption:=floattostr(fade)+'  '+floattostr(duration)+'  '+floattostr(rampe(fade,fade_time,duration))+'  '+inttostr(tick_test)+'  '+inttostr(max_tick_test);
      end
      else
      begin
        fade:=0;
        anglroulis:=0;
        btnVicon.Enabled:=true;
      end;
    end;  
  end

  else

  //Tests types paramétrés
  begin
  // Tangage Triangles
      if Tangagetriangle.Checked then begin
        tactive1:=tactive1+sgn1*vitRampeTang*Tbar15.Position/200;
        if tactive1>Tbar14.Position/100* 25 then sgn1:=-1;
        if tactive1<Tbar14.Position/100*-25 then sgn1:=1;
        edtthe.text:=floattostrf(tactive1,fffixed,5,3)                    // avec l'angle en réel
      end;
  // Tangage Sinus
      angltangage:=angltangage+10*Tbar15.Position/100;
      if angltangage>=360 then angltangage:=0;
      if Tangagesinus.Checked then begin
        tactive1:=sin(angltangage*pi/180)*Tbar14.Position/10;
        edtthe.text:=floattostrf(tactive1,fffixed,5,3) ;
        lbltangfreq.Caption:= floattostr(10*Tbar15.Position/360) ;
        lbltangamp.Caption:= floattostr(Tbar14.Position/10) ;
      end;
  // Roulis Triangles
      if Roulistriangle.Checked then begin
        tactive2:=tactive2+sgn2*vitRampeRoul*Tbar13.Position/200;
        if tactive2>Tbar12.Position/100* 25 then sgn2:=-1;
        if tactive2<Tbar12.Position/100*-25 then sgn2:=1;
        edtphi.text:=floattostrf(tactive2,fffixed,5,3);
      end;
  // Roulis Sinus
      anglroulis:=anglroulis+10*Tbar13.Position/100;
      if anglroulis>=360 then anglroulis:=0;
      if Roulissinus.Checked then begin
        tactive2:=sin(anglroulis*pi/180)*2*Tbar12.Position/10;
        edtphi.text:=floattostrf(tactive2,fffixed,5,3) ;
        lblroulfreq.Caption:= floattostr(10*Tbar13.Position/360) ;
        lblroulamp.Caption:= floattostr(2*Tbar12.Position/10) ;
      end;
    // Pompage Sinus
      anglPomp:=anglPomp+Tbar11.Position/200*20;
     if Form1.ChkRampPomp.Checked then begin      //
     if anglPomp>=360 then anglPomp:=0;
      pomp:=biel+sin(anglPomp*pi/180)*Tbar10.Position/100*0.05;
      form1.Caption:=floattostr(Pomp);
      edtdZ.text:=floattostrf(pomp,fffixed,5,3) ; //
      end;                                          //
  end;
      NewtonUpdate(FNewtonWorld,0.01);
      mesureAngleCadreMobile();
      Bressort.Scale.Z:=(Bpiston.Position.Z-hressort{0.325}-0.057)/0.225;

      edtf1.Text:=floattostrf(F_moteur[0],fffixed,5,2);   // affichage des couples
      edtf2.Text:=floattostrf(F_moteur[1],fffixed,5,2);
      edtf3.Text:=floattostrf(F_moteur[2],fffixed,5,2);

      for i:=0 to 8 do begin m1[i]:=m1[i+1];end;m1[9]:=abs(F_moteur[0]);gauge1.Progress:=round(abs(F_moteur[0]));
      for i:=0 to 8 do begin m2[i]:=m2[i+1];end;m2[9]:=abs(F_moteur[1]);gauge2.Progress:=round(abs(F_moteur[1]));
      for i:=0 to 8 do begin m3[i]:=m3[i+1];end;m3[9]:=abs(F_moteur[2]);gauge3.Progress:=round(abs(F_moteur[2]));
      plateforme_pos:=affinevectormake(0,0,0);
      plateforme_gam:=AbsAccatRelPos(plateforme,plateforme_pos);



  packet.orientation[0]:=coef_phi*strtofloat(edtphi.text);         //roulis
  packet.orientation[1]:=coef_the*strtofloat(edtthe.text);         //tangage
  packet.orientation[2]:=coef_dz*(-biel+strtofloat(edtdZ.text));  //pompage
  packet.warn:=checkbox1.Checked;
  msg:='';
  for i:=0 to memo1.lines.Count do msg:=msg+memo1.Lines[i];
  if counter_msg<(delai_msg*10) then  packet.comm:=msg else packet.comm:='';
  idUDPClient1.sendbuffer(rawtobytes(packet,SizeOf(packet)));

end;
//==============================================================================================
procedure bielle_proc0(const aJoint: PNewtonJoint); cdecl;
const
  Minangle=-15/180*pi;Maxangle=15/180*pi;
var
  mPosition0,mPosition1  : TVector3f;
  q0,q1: TVector3f;
  bielle_front,bielle_up,bielle_right:TVector3f;
  angle,relAngle,sinAngle,cosAngle: single;
begin
  mposition1:=Rel2abspoint(Form1.bielle[0],affinevectormake(0,0,0));
  mposition0:=affinevectormake(L1+0.03,0,0.17);

  bielle_front:=Rel2absvector(Form1.bielle[0],affinevectormake(1.0,0.0,0.0));
  bielle_right:=Rel2absvector(Form1.bielle[0],affinevectormake(0.0,1.0,0.0));
  bielle_up   :=Rel2absvector(Form1.bielle[0],affinevectormake(0.0,0.0,1.0));
  NewtonUserJointAddLinearRow(ajoint,@mPosition1,@mPosition0,@bielle_front);
  NewtonUserJointAddLinearRow(ajoint,@mPosition1,@mPosition0,@bielle_right);
  NewtonUserJointAddLinearRow(ajoint,@mPosition1,@mPosition0,@bielle_up);

  q0:= VectorAdd( mposition0,VectorScale(affinevectormake(1.0,0.0,0.0), 10 ) );
  q1:= VectorAdd( mposition1,VectorScale(bielle_front, 10 ) );
  NewtonUserJointAddLinearRow(ajoint,@q1[0], @q0[0],@bielle_right );
  NewtonUserJointAddLinearRow(ajoint,@q1[0], @q0[0],@bielle_up );
  sinAngle:= VectorDotProduct( bielle_front, VectorCrossProduct( bielle_right, affinevectormake(0.0,1.0,0.0) ) );
  cosAngle:= VectorDotProduct( bielle_right, affinevectormake(0.0,1.0,0.0) );
  angle:=- ArcTan2( sinAngle, cosAngle );

  relAngle:=angle-I2F(form1.ChkAsser.Checked,mesAngleMoteur[1],consAngleMoteur[1])*pi/180;
  NewtonUserJointAddAngularRow(ajoint,-relAngle, @bielle_front );
  F_moteur[1]:=NewtonUserJointGetRowForce(aJoint,5);
  NewtonUserJointSetRowStiffness(ajoint, 10);
end;
//==============================================================================================
procedure bielle_proc1(const aJoint: PNewtonJoint); cdecl;
const
  Minangle=-15/180*pi;Maxangle=15/180*pi;
var
  mPosition0,mPosition1  : TVector3f;
  q0,q1: TVector3f;
  bielle_front,bielle_up,bielle_right:TVector3f;
  angle,relAngle,sinAngle,cosAngle: single;
begin

  mposition1:=Rel2abspoint(Form1.bielle[1],affinevectormake(0,0,0));
  mposition0:=affinevectormake(-L2+0.03,-L3,0.17);

  bielle_front:=Rel2absvector(Form1.bielle[1],affinevectormake(1.0,0.0,0.0));
  bielle_right:=Rel2absvector(Form1.bielle[1],affinevectormake(0.0,1.0,0.0));
  bielle_up   :=Rel2absvector(Form1.bielle[1],affinevectormake(0.0,0.0,1.0));
  NewtonUserJointAddLinearRow (ajoint, @mPosition1, @mPosition0, @bielle_front);
  NewtonUserJointAddLinearRow (ajoint, @mPosition1, @mPosition0, @bielle_right);
  NewtonUserJointAddLinearRow (ajoint, @mPosition1, @mPosition0, @bielle_up);

  q0:= VectorAdd( mposition0, VectorScale(affinevectormake(1.0,0.0,0.0), 10 ) );
  q1:= VectorAdd( mposition1, VectorScale(bielle_front, 10 ) );
  NewtonUserJointAddLinearRow(ajoint, @q1[0], @q0[0],@bielle_right );
  NewtonUserJointAddLinearRow(ajoint, @q1[0], @q0[0],@bielle_up );
  sinAngle:= VectorDotProduct( bielle_front, VectorCrossProduct( bielle_right, affinevectormake(0.0,1.0,0.0) ) );
  cosAngle:= VectorDotProduct( bielle_right, affinevectormake(0.0,1.0,0.0) );
  angle:=- ArcTan2( sinAngle, cosAngle );

  relAngle:=angle-I2F(form1.ChkAsser.Checked,mesAngleMoteur[2],consAngleMoteur[2])*pi/180;
  NewtonUserJointAddAngularRow(ajoint,-relAngle, @bielle_front );
  F_moteur[2]:=NewtonUserJointGetRowForce(aJoint,5);
  NewtonUserJointSetRowStiffness(ajoint, 10);
end;
//==============================================================================================
procedure bielle_proc2(const aJoint: PNewtonJoint); cdecl;
const
  Minangle=-15/180*pi;Maxangle=15/180*pi;
var
  mPosition0,mPosition1  : TVector3f;
  q0,q1: TVector3f;
  bielle_front,bielle_up,bielle_right:TVector3f;
  angle,relAngle,sinAngle,cosAngle: single;
begin

  mposition1:=Rel2abspoint(Form1.bielle[2],affinevectormake(0,0,0));
  mposition0:=affinevectormake(-L2+0.03,L3,0.17);

  bielle_front:=Rel2absvector(Form1.bielle[2],affinevectormake(1.0,0.0,0.0));
  bielle_right:=Rel2absvector(Form1.bielle[2],affinevectormake(0.0,1.0,0.0));
  bielle_up   :=Rel2absvector(Form1.bielle[2],affinevectormake(0.0,0.0,1.0));
  NewtonUserJointAddLinearRow (ajoint, @mPosition1, @mPosition0, @bielle_front);
  NewtonUserJointAddLinearRow (ajoint, @mPosition1, @mPosition0, @bielle_right);
  NewtonUserJointAddLinearRow (ajoint, @mPosition1, @mPosition0, @bielle_up);

  q0:= VectorAdd( mposition0, VectorScale(affinevectormake(1.0,0.0,0.0), 10 ) );
  q1:= VectorAdd( mposition1, VectorScale(bielle_front, 10 ) );
  NewtonUserJointAddLinearRow(ajoint, @q1[0], @q0[0],@bielle_right );
  NewtonUserJointAddLinearRow(ajoint, @q1[0], @q0[0],@bielle_up );
  sinAngle:= VectorDotProduct( bielle_front, VectorCrossProduct( bielle_right, affinevectormake(0.0,1.0,0.0) ) );
  cosAngle:= VectorDotProduct( bielle_right, affinevectormake(0.0,1.0,0.0) );
  angle:=- ArcTan2( sinAngle, cosAngle );

  relAngle:=angle-I2F(form1.ChkAsser.Checked,mesAngleMoteur[0],consAngleMoteur[0])*pi/180;
  NewtonUserJointAddAngularRow(ajoint,-relAngle, @bielle_front );
  F_moteur[0]:=NewtonUserJointGetRowForce(aJoint,5);
  NewtonUserJointSetRowStiffness(ajoint, 10);
end;
//==============================================================================================
procedure manivelle_proc0(const aJoint: PNewtonJoint); cdecl;
const
  Minangle=-15/180*pi;Maxangle=15/180*pi;
var
  mPosition0,mPosition1  : TVector3f;
  manivelle_front,manivelle_up,manivelle_right:TVector3f;
begin
  mposition1     :=Rel2abspoint (Form1.manivelle[0],affinevectormake(    0,  0,   0));
  mposition0     :=Rel2abspoint (Form1.bielle   [0],affinevectormake(-0.03,  0,manv));
  manivelle_front:=Rel2absvector(Form1.manivelle[0],affinevectormake(  1.0,0.0, 0.0));
  manivelle_right:=Rel2absvector(Form1.manivelle[0],affinevectormake(  0.0,1.0, 0.0));
  manivelle_up   :=Rel2absvector(Form1.manivelle[0],affinevectormake(  0.0,0.0, 1.0));
  NewtonUserJointAddLinearRow (ajoint, @mPosition1, @mPosition0, @manivelle_front);
  NewtonUserJointAddLinearRow (ajoint, @mPosition1, @mPosition0, @manivelle_right);
  NewtonUserJointAddLinearRow (ajoint, @mPosition1, @mPosition0, @manivelle_up);
end;
//==============================================================================================
procedure manivelle_proc1(const aJoint: PNewtonJoint); cdecl;
const
  Minangle=-15/180*pi;Maxangle=15/180*pi;
var
  mPosition0,mPosition1  : TVector3f;
  manivelle_front,manivelle_up,manivelle_right:TVector3f;
begin
  mposition1:=Rel2abspoint(Form1.manivelle[1],affinevectormake(    0,0,   0));
  mposition0:=Rel2abspoint(Form1.bielle   [1],affinevectormake(-0.03,0,manv));
  manivelle_front:=Rel2absvector(Form1.manivelle[1],affinevectormake(1.0,0.0,0.0));
  manivelle_right:=Rel2absvector(Form1.manivelle[1],affinevectormake(0.0,1.0,0.0));
  manivelle_up   :=Rel2absvector(Form1.manivelle[1],affinevectormake(0.0,0.0,1.0));
  NewtonUserJointAddLinearRow (ajoint, @mPosition1, @mPosition0, @manivelle_front);
  NewtonUserJointAddLinearRow (ajoint, @mPosition1, @mPosition0, @manivelle_right);
  NewtonUserJointAddLinearRow (ajoint, @mPosition1, @mPosition0, @manivelle_up);
end;
//==============================================================================================
procedure manivelle_proc2(const aJoint: PNewtonJoint); cdecl;
const
  Minangle=-15/180*pi;Maxangle=15/180*pi;
var
  mPosition0,mPosition1  : TVector3f;
  manivelle_front,manivelle_up,manivelle_right:TVector3f;
begin
  mposition1:=Rel2abspoint(Form1.manivelle[2],affinevectormake(    0,0,   0));
  mposition0:=Rel2abspoint(Form1.bielle   [2],affinevectormake(-0.03,0,manv));
  manivelle_front:=Rel2absvector(Form1.manivelle[2],affinevectormake(1.0,0.0,0.0));
  manivelle_right:=Rel2absvector(Form1.manivelle[2],affinevectormake(0.0,1.0,0.0));
  manivelle_up   :=Rel2absvector(Form1.manivelle[2],affinevectormake(0.0,0.0,1.0));
  NewtonUserJointAddLinearRow (ajoint, @mPosition1, @mPosition0, @manivelle_front);
  NewtonUserJointAddLinearRow (ajoint, @mPosition1, @mPosition0, @manivelle_right);
  NewtonUserJointAddLinearRow (ajoint, @mPosition1, @mPosition0, @manivelle_up);
end;
//==============================================================================================
procedure glissiere(const aJoint: PNewtonJoint); cdecl;
const
  max=1.5;min=0;jeu=0.01;
var
  v:single;
  pin0,pin1,pin2,mPositiona0,mPositiona1,mPositionb0,mPositionb1,mPositionc0,mPositionc1 : TVector3f;
  v1,v2,piston_fixe_up  : TVector3f;
begin
  piston_fixe_up:=rel2absvector(form1.piston,affinevectormake(0,0,1));
  v1:=Rel2abspoint(form1.piston,affinevectormake(0,0,0));
  v2:=affinevectormake(0,0,0);
  v:=vectordotproduct(vectorsubtract(v1,v2),piston_fixe_up);
  mpositiona0:=affinevectormake(0, 0,   v);mpositiona1:=Rel2abspoint(form1.piston,affinevectormake(0, 0, 0));
  mpositionb0:=affinevectormake(0, 0,15+v);mpositionb1:=Rel2abspoint(form1.piston,affinevectormake(0, 0,15));
  mpositionc0:=affinevectormake(0,15,   v);mpositionc1:=Rel2abspoint(form1.piston,affinevectormake(0,15, 0));
  pin0 := affinevectormake(1.0,0.0,0.0);
  pin1 := affinevectormake(0.0,1.0,0.0);
  pin2 := affinevectormake(0.0,0.0,1.0);
  NewtonUserJointAddLinearRow (ajoint, @mPositiona1, @mPositiona0, @pin0);
  NewtonUserJointAddLinearRow (ajoint, @mPositiona1, @mPositiona0, @pin1);
  NewtonUserJointAddLinearRow (ajoint, @mPositionb1, @mPositionb0, @pin0);
  NewtonUserJointAddLinearRow (ajoint, @mPositionb1, @mPositionb0, @pin1);
  NewtonUserJointAddLinearRow (ajoint, @mPositionc1, @mPositionc0, @pin0);
end;
//==============================================================================================
procedure cardan1(const aJoint: PNewtonJoint); cdecl;
const
  Minangle=-15/180*pi;Maxangle=15/180*pi;
var
  mPosition0,mPosition1  : TVector3f;
  q0,q1: TVector3f;
  axe_cardan_front,axe_cardan_right,piston_front,piston_right,piston_up:TVector3f;
begin
  mposition1:=Rel2abspoint(Form1.axe_cardan,affinevectormake(0,0,0));
  mposition0:=Rel2abspoint(Form1.piston    ,affinevectormake(0,0,0));
  piston_front:=Rel2absvector(Form1.piston,affinevectormake(1.0,0.0,0.0));
  piston_right:=Rel2absvector(Form1.piston,affinevectormake(0.0,1.0,0.0));
  piston_up   :=Rel2absvector(Form1.piston,affinevectormake(0.0,0.0,1.0));
  axe_cardan_front:=Rel2absvector(Form1.axe_cardan,affinevectormake(1.0,0.0,0.0));
  axe_cardan_right:=Rel2absvector(Form1.axe_cardan,affinevectormake(0.0,1.0,0.0));
  NewtonUserJointAddLinearRow (ajoint, @mPosition1, @mPosition0, @piston_front);
  NewtonUserJointAddLinearRow (ajoint, @mPosition1, @mPosition0, @piston_right);
  NewtonUserJointAddLinearRow (ajoint, @mPosition1, @mPosition0, @piston_up);
  q0:= VectorAdd( mposition0, VectorScale(piston_right    , 10 ) );
  q1:= VectorAdd( mposition1, VectorScale(axe_cardan_right, 10 ) );
  NewtonUserJointAddLinearRow(ajoint, @q1, @q0,@piston_front );
  NewtonUserJointAddLinearRow(ajoint, @q1, @q0,@piston_up );
end;
//==============================================================================================
procedure cardan2(const aJoint: PNewtonJoint); cdecl;
const
  Minangle=-15/180*pi;Maxangle=15/180*pi;
var
  mPosition0,mPosition1  : TVector3f;
  q0,q1: TVector3f;
  axe_cardan_front,axe_cardan_up,axe_cardan_right,plateforme_front,plateforme_right:TVector3f;
begin
  mposition1:=Rel2abspoint(Form1.plateforme,affinevectormake(0,0,0));
  mposition0:=Rel2abspoint(Form1.axe_cardan,affinevectormake(0,0,0));
  axe_cardan_front:=Rel2absvector(Form1.axe_cardan,affinevectormake(1.0,0.0,0.0));
  axe_cardan_right:=Rel2absvector(Form1.axe_cardan,affinevectormake(0.0,1.0,0.0));
  axe_cardan_up   :=Rel2absvector(Form1.axe_cardan,affinevectormake(0.0,0.0,1.0));
  plateforme_front:=Rel2absvector(Form1.plateforme,affinevectormake(1.0,0.0,0.0));
  plateforme_right:=Rel2absvector(Form1.plateforme,affinevectormake(0.0,1.0,0.0));
  NewtonUserJointAddLinearRow (ajoint, @mPosition1, @mPosition0, @axe_cardan_front);
  NewtonUserJointAddLinearRow (ajoint, @mPosition1, @mPosition0, @axe_cardan_right);
  NewtonUserJointAddLinearRow (ajoint, @mPosition1, @mPosition0, @axe_cardan_up);
  q0:= VectorAdd( mposition0, VectorScale(axe_cardan_front, 10 ) );
  q1:= VectorAdd( mposition1, VectorScale(plateforme_front, 10 ) );
  NewtonUserJointAddLinearRow(ajoint, @q1, @q0,@axe_cardan_right );
  NewtonUserJointAddLinearRow(ajoint, @q1, @q0,@axe_cardan_up );
end;
//==============================================================================================
procedure rotule1(const aJoint: PNewtonJoint); cdecl;
const
  Minangle=-15/180*pi;Maxangle=15/180*pi;
var
  mPosition0,mPosition1  : TVector3f;
  manivelle_front,manivelle_up,manivelle_right:TVector3f;
begin
  mposition1:=Rel2abspoint(Form1.plateforme,affinevectormake(L1,0,0));
  mposition0:=Rel2abspoint(Form1.manivelle[0],affinevectormake(0,0,biel));
  manivelle_front:=Rel2absvector(Form1.manivelle[0],affinevectormake(1.0,0.0,0.0));
  manivelle_right:=Rel2absvector(Form1.manivelle[0],affinevectormake(0.0,1.0,0.0));
  manivelle_up   :=Rel2absvector(Form1.manivelle[0],affinevectormake(0.0,0.0,1.0));
  NewtonUserJointAddLinearRow (ajoint, @mPosition1, @mPosition0, @manivelle_front);
  NewtonUserJointAddLinearRow (ajoint, @mPosition1, @mPosition0, @manivelle_right);
  NewtonUserJointAddLinearRow (ajoint, @mPosition1, @mPosition0, @manivelle_up);
end;
//==============================================================================================
procedure rotule2(const aJoint: PNewtonJoint); cdecl;
const
  Minangle=-15/180*pi;Maxangle=15/180*pi;
var
  mPosition0,mPosition1  : TVector3f;
  manivelle_front,manivelle_up,manivelle_right:TVector3f;
begin
  mposition1:=Rel2abspoint(Form1.plateforme,affinevectormake(-L2,-L3,0));
  mposition0:=Rel2abspoint(Form1.manivelle[1],affinevectormake(0,0,biel));
  manivelle_front:=Rel2absvector(Form1.manivelle[1],affinevectormake(1.0,0.0,0.0));
  manivelle_right:=Rel2absvector(Form1.manivelle[1],affinevectormake(0.0,1.0,0.0));
  manivelle_up   :=Rel2absvector(Form1.manivelle[1],affinevectormake(0.0,0.0,1.0));
  NewtonUserJointAddLinearRow (ajoint, @mPosition1, @mPosition0, @manivelle_front);
  NewtonUserJointAddLinearRow (ajoint, @mPosition1, @mPosition0, @manivelle_right);
  NewtonUserJointAddLinearRow (ajoint, @mPosition1, @mPosition0, @manivelle_up);
end;
//==============================================================================================
procedure rotule3(const aJoint: PNewtonJoint); cdecl;
const
  Minangle=-15/180*pi;Maxangle=15/180*pi;
var
  mPosition0,mPosition1  : TVector3f;
  manivelle_front,manivelle_up,manivelle_right:TVector3f;
begin
  mposition1:=Rel2abspoint(Form1.plateforme,affinevectormake(-L2,L3,0));
  mposition0:=Rel2abspoint(Form1.manivelle[2],affinevectormake(0,0,biel));
  manivelle_front:=Rel2absvector(Form1.manivelle[2],affinevectormake(1.0,0.0,0.0));
  manivelle_right:=Rel2absvector(Form1.manivelle[2],affinevectormake(0.0,1.0,0.0));
  manivelle_up   :=Rel2absvector(Form1.manivelle[2],affinevectormake(0.0,0.0,1.0));
  NewtonUserJointAddLinearRow (ajoint, @mPosition1, @mPosition0, @manivelle_front);
  NewtonUserJointAddLinearRow (ajoint, @mPosition1, @mPosition0, @manivelle_right);
  NewtonUserJointAddLinearRow (ajoint, @mPosition1, @mPosition0, @manivelle_up);
end;
//==============================================================================================
procedure TForm1.FormCreate(Sender: TObject);
var
  collision : PNewtoncollision;   //  v:tvector3f;
  m:tmatrix4f;                    //  s:string;//  decal:double;
  i:integer;
  data_ini:tinifile;              //  tens:double;
begin
  decimalseparator:='.';
  tactive1:=0;sgn1:=1;
  tactive2:=0;sgn2:=1;
  data_ini:=tinifile.Create(extractfilepath(application.exename)+'param.ini');
  L1          :=DATA_INI.READFLOAT('GEOMETRIE' ,'L1'       ,0.25);    // en m
  L2          :=DATA_INI.READFLOAT('GEOMETRIE' ,'L2'       ,0.25);    // en m
  L3          :=DATA_INI.READFLOAT('GEOMETRIE' ,'L3'       ,0.25);    // en m
  biel        :=DATA_INI.READFLOAT('GEOMETRIE' ,'bielle'   ,0.38);    // en m
  manv        :=DATA_INI.READFLOAT('GEOMETRIE' ,'manivelle',0.11);    // en m
  m_base      :=DATA_INI.READFLOAT('MASSE'     ,'masse'    ,400);     // en Kg
  ixx_base    :=DATA_INI.READFLOAT('MASSE'     ,'Ixx'      ,32);
  iyy_base    :=DATA_INI.READFLOAT('MASSE'     ,'Iyy'      ,32);
  izz_base    :=DATA_INI.READFLOAT('MASSE'     ,'Izz'      ,65);
  max_gauge   :=DATA_INI.READFLOAT('SIMULATION','max_gauge',300);     // en mN
  vitRampeRoul:=DATA_INI.READFLOAT('SIMULATION','vit_rampe_roul',0.3);
  vitRampeTang:=DATA_INI.READFLOAT('SIMULATION','vit_rampe_tang',0.3);
  host_video:= DATA_INI.READSTRING('NETWORK','host_video','192.168.126.110');
  coef_the:=DATA_INI.READFLOAT('NETWORK','coef_tangage',-3);
  coef_phi:=DATA_INI.READFLOAT('NETWORK','coef_roulis',-1);
  coef_dz:=DATA_INI.READFLOAT('NETWORK','coef_pompage',1);
  coef_vit:=DATA_INI.READFLOAT('NETWORK','coef_vitesse',1);
  delai_msg:=DATA_INI.READINTEGER('NETWORK','delai_msg',5);
  max_tick_test:=round(DATA_INI.READFLOAT('TEST','duration',5)/Timer_test.interval*1000);
  fade_time:=DATA_INI.READFLOAT('TEST','fade_time',1);
  trackbarTangage.Position:=-round(coef_the*10);
  trackbarRoulis.Position:=-round(coef_phi*10);
  trackbarPompage.Position:=round(coef_dz*10);
  trackbarVitesse.Position:=round(coef_vit*10);

  //form1.caption:=floattostr( coef_phi)+'  '+  floattostr( coef_the)+'  '+floattostr( coef_dz);

  data_ini.free;
  MaxUpDownControl:=0.67;
  kressort:=strtofloat(edtspring.text);
  l0ressort:=strtofloat(edtl0.text);
  hressort:=strtofloat(edth.text);

  FNewtonworld:=Newtoncreate(nil,nil);
  Mbase:=TGlMateriallibrary.Create(self);
  Bbase:=TGLFreeform(GLDummyCube1.AddNewChild(TGLFreeform));
  LoadFrommesh('objet3d\base.3d',Bbase,Mbase);
  Bbase.position.setpoint(0,0,0);
  Bbase.Scale.x:=0.01;Bbase.Scale.y:=0.01;Bbase.Scale.z:=0.01;
  m:=createtranslationmatrix(affinevectormake(0,0,0));
  collision := NewtonCreateBox(FNewtonworld, 1,1,0.05, @m) ;
  base := NewtonCreateBody(FNewtonworld, collision) ;
  NewtonReleaseCollision(FNewtonworld, collision) ;
  Newtonbodysetmassmatrix(base,0,0,0,0);
  NewtonBodySetMatrix(base, @Bbase.AbsoluteMatrixAsAddress^) ;
  NewtonBodySetTransformCallback(base, UpdateGraphicObject) ;
  NewtonBodySetForceAndTorqueCallback(base, applygravity) ;
  NewtonBodySetUserData(base, Bbase) ;
  NewtonBodySetAutoFreeze(base,0);

  for i:=DR to GA do begin
    Mmoteur:=TGlMateriallibrary.Create(self);
    Bmoteur[i]:=TGLFreeform(GLDummyCube1.AddNewChild(TGLFreeform));
    Bmoteur[i].Scale.x:=0.01;Bmoteur[i].Scale.y:=0.01;Bmoteur[i].Scale.z:=0.01;
    LoadFrommesh('objet3d\moteur.3d',Bmoteur[i],Mmoteur);
  end;
  Bmoteur[0].position.setpoint( L1+0.03,  0,0.17);
  Bmoteur[1].position.setpoint(-L2+0.03, L3,0.17);
  Bmoteur[2].position.setpoint(-L2+0.03,-L3,0.17);

  for i:=DR to GA do begin
    Mbielle[i]:=TGlMateriallibrary.Create(self);
    Bbielle[i]:=TGLFreeform(GLDummyCube1.AddNewChild(TGLFreeform));
    LoadFrommesh('objet3d\bielle.3d',Bbielle[i],Mbielle[i]);
    Bbielle[i].Position.x:=0.1;Bbielle[i].Position.y:=0.1*i;Bbielle[i].Position.Z:=0.3;
    m:=matrixmultiply(createrotationmatrixy(pi/2),createtranslationmatrix(affinevectormake(0,0,0.06)));
    collision := NewtonCreateCylinder(FNewtonworld, 0.01,0.1, @m) ;
    bielle[i] := NewtonCreateBody(FNewtonworld, collision) ;
    NewtonReleaseCollision(FNewtonworld, collision) ;
    Newtonbodysetmassmatrix(bielle[i],0.5,1,1,1);
    m:=createTranslationMatrix(affinevectormake(0.25+0.03,0.1*i,0.5));
    NewtonBodySetMatrix(bielle[i],@m) ;
    NewtonBodySetUserData(bielle[i], Bbielle[i]) ;
    NewtonBodySetTransformCallback(bielle[i], UpdateGraphicManivelle) ;
    NewtonBodySetForceAndTorqueCallback(bielle[i], applygravity) ;
    NewtonBodySetAutoFreeze(bielle[i],0);
  end;
  JBielle[0]:=NewtonConstraintCreateUserJoint(FNewtonworld,6,@bielle_proc0,bielle[0],Base);NewtonjointsetUserData(JBielle[0],self);
  JBielle[1]:=NewtonConstraintCreateUserJoint(FNewtonworld,6,@bielle_proc1,bielle[1],Base);NewtonjointsetUserData(JBielle[1],self);
  JBielle[2]:=NewtonConstraintCreateUserJoint(FNewtonworld,6,@bielle_proc2,bielle[2],Base);NewtonjointsetUserData(JBielle[2],self);

  for i:=DR to GA do begin
    mesAngleMoteur[i]:=9.085-90;                   // pour mesure angleCadreMobile par GLscene
    Mmanivelle[i]:=TGlMateriallibrary.Create(self);
    Bmanivelle[i]:=TGLFreeform(GLDummyCube1.AddNewChild(TGLFreeform));
    LoadFrommesh('objet3d\manivelle.3d',Bmanivelle[i],Mmanivelle[i]);
    Bmanivelle[i].Position.x:=0.1;Bmanivelle[i].Position.y:=0.1*i;Bmanivelle[i].Position.Z:=0.3;
    m:=matrixmultiply(createrotationmatrixy(pi/2),createtranslationmatrix(affinevectormake(0,0,0.18)));
    collision := NewtonCreateCylinder(FNewtonworld, 0.01,0.30, @m) ;
    manivelle[i] := NewtonCreateBody(FNewtonworld, collision) ;
    NewtonReleaseCollision(FNewtonworld, collision) ;
    Newtonbodysetmassmatrix(manivelle[i],1,1,1,1);
    m:=createtranslationmatrix(affinevectormake(0.25,0.1*i,0.5));
    NewtonBodySetMatrix(manivelle[i],@m) ;
    NewtonBodySetUserData(manivelle[i], Bmanivelle[i]) ;
    NewtonBodySetTransformCallback(manivelle[i], UpdateGraphicBielle) ;
    NewtonBodySetForceAndTorqueCallback(manivelle[i], applygravity) ;
    NewtonBodySetAutoFreeze(manivelle[i],0);
  end;
  Jmanivelle[0]:=NewtonConstraintCreateUserJoint(FNewtonworld,6,@manivelle_proc0,manivelle[0],bielle[0]);NewtonjointsetUserData(Jmanivelle[0],self);
  Jmanivelle[1]:=NewtonConstraintCreateUserJoint(FNewtonworld,6,@manivelle_proc1,manivelle[1],bielle[1]);NewtonjointsetUserData(Jmanivelle[1],self);
  Jmanivelle[2]:=NewtonConstraintCreateUserJoint(FNewtonworld,6,@manivelle_proc2,manivelle[2],bielle[2]);NewtonjointsetUserData(Jmanivelle[2],self);

  Mpiston:=TGlMateriallibrary.Create(self);
  Bpiston:=TGLFreeform(GLDummyCube1.AddNewChild(TGLFreeform));
  LoadFrommesh('objet3d\piston.3d',Bpiston,Mpiston);
  m:=matrixmultiply(createrotationmatrixy(pi/2),createtranslationmatrix(affinevectormake(0,0,-0.25)));
  collision := NewtonCreateCylinder(FNewtonworld, 0.03,0.2, @m) ;
  piston := NewtonCreateBody(FNewtonworld, collision) ;
  NewtonReleaseCollision(FNewtonworld, collision) ;
  Newtonbodysetmassmatrix(piston,20,20,20,20);
  m:=createtranslationmatrix(affinevectormake(0,0,0.67));
  NewtonBodySetMatrix(piston,@m) ;
  NewtonBodySetUserData(piston, Bpiston) ;
  NewtonBodySetTransformCallback(piston, UpdateGraphicObject) ;
  NewtonBodySetForceAndTorqueCallback(piston, ApplyForce) ;
  NewtonBodySetAutoFreeze(piston,0);
  Jpiston[0]:=NewtonConstraintCreateUserJoint(FNewtonworld,6,@glissiere,piston,base);NewtonjointsetUserData(Jpiston[0],self);

  Mressort:=TGlMateriallibrary.Create(self);
  Bressort:=TGLFreeform(Bpiston.AddNewChild(TGLFreeform));
  LoadFrommesh('objet3d\ressort.3d',Bressort,Mressort);
  Bressort.Position.Z:=-5.7;

  Maxe_cardan:=TGlMateriallibrary.Create(self);
  Baxe_cardan:=TGLFreeform(GLDummyCube1.AddNewChild(TGLFreeform));
  LoadFrommesh('objet3d\axe_cardan.3d',Baxe_cardan,Maxe_cardan);
  m:=createtranslationmatrix(affinevectormake(0,0,0));
  collision := NewtonCreateCylinder(FNewtonworld, 0.01,0.1, @m) ;
  axe_cardan := NewtonCreateBody(FNewtonworld, collision) ;
  NewtonReleaseCollision(FNewtonworld, collision) ;
  Newtonbodysetmassmatrix(axe_cardan,0.5,0.5,0.5,0.5);
  m:=createtranslationmatrix(affinevectormake(0,0,1));
  NewtonBodySetMatrix(axe_cardan,@m) ;
  NewtonBodySetUserData(axe_cardan, Baxe_cardan) ;
  NewtonBodySetTransformCallback(axe_cardan, UpdateGraphicObject) ;
  NewtonBodySetForceAndTorqueCallback(axe_cardan, applygravity) ;
  NewtonBodySetAutoFreeze(axe_cardan,0);
  Jpiston[1]:=NewtonConstraintCreateUserJoint(FNewtonworld,6,@cardan1,axe_cardan,piston);NewtonjointsetUserData(Jpiston[1],self);

  Mplateforme:=TGlMateriallibrary.Create(self);
  Bplateforme:=TGLFreeform(GLDummyCube1.AddNewChild(TGLFreeform));
  LoadFrommesh('objet3d\plateforme.3d',Bplateforme,Mplateforme);
  m:=createtranslationmatrix(affinevectormake(0,0,0.0767));
  collision := NewtonCreateBox(FNewtonworld, 0.6,0.6,0.05, @m) ;
  plateforme := NewtonCreateBody(FNewtonworld, collision) ;
  NewtonReleaseCollision(FNewtonworld, collision) ;
  Newtonbodysetmassmatrix(plateforme,m_base,ixx_base,iyy_base,izz_base);
  m:=createtranslationmatrix(affinevectormake(0,0,2));
  NewtonBodySetMatrix(plateforme,@m) ;
  NewtonBodySetUserData(plateforme, Bplateforme) ;
  NewtonBodySetTransformCallback(plateforme, UpdateGraphicplateforme) ;
  NewtonBodySetForceAndTorqueCallback(plateforme, applygravity) ;
  NewtonBodySetAutoFreeze(plateforme,0);
  Jplateforme[0]:=NewtonConstraintCreateUserJoint(FNewtonworld,6,@cardan2,plateforme,axe_cardan);NewtonjointsetUserData(Jplateforme[0],self);
  Jplateforme[1]:=NewtonConstraintCreateUserJoint(FNewtonworld,6,@rotule1,plateforme,manivelle[0]);NewtonjointsetUserData(Jplateforme[1],self);
  Jplateforme[2]:=NewtonConstraintCreateUserJoint(FNewtonworld,6,@rotule2,plateforme,manivelle[1]);NewtonjointsetUserData(Jplateforme[2],self);
  Jplateforme[3]:=NewtonConstraintCreateUserJoint(FNewtonworld,6,@rotule3,plateforme,manivelle[2]);NewtonjointsetUserData(Jplateforme[3],self);

  Mfix1:=TGlMateriallibrary.Create(self);Bfix1:=TGLFreeform(Bplateforme.AddNewChild(TGLFreeform));LoadFrommesh('objet3d\fixation.3d',Bfix1,Mfix1);
  Mfix2:=TGlMateriallibrary.Create(self);Bfix2:=TGLFreeform(Bplateforme.AddNewChild(TGLFreeform));LoadFrommesh('objet3d\fixation.3d',Bfix2,Mfix2);
  Mfix3:=TGlMateriallibrary.Create(self);Bfix3:=TGLFreeform(Bplateforme.AddNewChild(TGLFreeform));LoadFrommesh('objet3d\fixation.3d',Bfix3,Mfix3);

  Bfix1.Position.x:= L1*100*0.25/maxi(L1,L2);Bfix1.Position.y:=0;
  Bfix2.Position.x:=-L2*100*0.25/maxi(L1,L2);Bfix2.Position.y:=-L3*100*0.25/L3;
  Bfix3.Position.x:=-L2*100*0.25/maxi(L1,L2);Bfix3.Position.y:= L3*100*0.25/L3;

  NewtonWorldForEachBodyDo(FNewtonWorld, @numericaldamping) ;
  edtm1.text:=inttostr(Tbar1.Position);               // active la position initiale du trackbar
  edtm2.text:=inttostr(Tbar2.Position);
  edtm3.text:=inttostr(Tbar3.Position);
  edtdz.text:=floattostr(Tbar6.Position/1000);

  TBarKPChange(nil);
  TBarKIChange(nil);
  TBarKDChange(nil);

  if Assigned(glCamera1) then glCamera1.AdjustDistanceToTarget(1);

  initAsserv();
  _8136_A_Write_Ventilo(VeAV,0);                    // les 2 avant pour arrêter (courant=0)
  _8136_A_Write_Ventilo(VeAR,0);                    // les 2 arrière pour arrêter (courant=0)
  cycleDemarVentilos();

  idudpclient1.Host:=host_video;
  idudpclient1.Active:=true;
  delai_ils:=0;
  _8136_A_Write_Volt(CARD0,CH0,10);
  queryPerformanceCounter(time_out_vitesse);
  RSTimerEntreeLogique.Enabled:=true;
  switch_on:=true;
  envoi_msg:=false;
  msg:='';
  counter_msg:=delai_msg*10;
  test_indicator:=0;
  tick_test:=max_tick_test;
  REC[1]:=false;REC[2]:=false;REC[3]:=false;REC[4]:=true;REC[5]:=true;REC[6]:=false;REC[7]:=false;REC[8]:=false;
  STOP[1]:=false;STOP[2]:=false;STOP[3]:=true;STOP[4]:=true;STOP[5]:=false;STOP[6]:=false;STOP[7]:=true;STOP[8]:=true;
  delay_bit:=round(3.13e3*104);
  queryPerformanceCounter(t0);

end;
//==============================================================================================
//  voir le fichier "étudeCinématique.doc" : auteur Pierre Lemerle
function asserv(var ang:dblDrArGa; dzl:single):boolean;
var
  v:array[0..2] of tvector3f;
  bielV,xN,yN,xP,yP,xQ,yQ:dblDrArGa;
  iM:integer;                                      // index des moteurs
  calc:boolean;
  a,b,c,delta:double;
  mTang,mRoul:Tmatrix4f;
  //const AR:integer=0;const GA:integer=1;const DR:integer=2;  // ancien ordre arbitraire
begin
  calc:=true;
  mTang:=createrotationmatrixY(the*pi/180);
  mRoul:=createrotationmatrixX(phi*pi/180);
  v[DR]:=vectoradd(vectortransform(affinevectormake(-L2, L3,0),matrixmultiply(mTang,mRoul)),affinevectormake(0,0,dzl));
  v[AR]:=vectoradd(vectortransform(affinevectormake( L1,  0,0),mTang                      ),affinevectormake(0,0,dzl));
  v[GA]:=vectoradd(vectortransform(affinevectormake(-L2,-L3,0),matrixmultiply(mTang,mRoul)),affinevectormake(0,0,dzl));
  bielV[DR]:=sqrt(sqr(biel)-sqr(L2+v[DR][0]));
  bielV[AR]:=sqrt(sqr(biel)-sqr(L1-v[AR][0]));                               // projection de la bielle sur le plan vertical y,z
  bielV[GA]:=sqrt(sqr(biel)-sqr(L2+v[GA][0]));
  xN[DR]:=L3-v[DR][1];xN[AR]:=v[AR][1];xN[GA]:=-v[GA][1]-L3;                 // y cadre => x centré plan vertical y,z
  yN[DR]:=   v[DR][2];yN[AR]:=v[AR][2];yN[GA]:= v[GA][2];                    // z cadre => y plan vertical
  for iM:=DR to GA do begin                                                  // index Moteur
    a:=2*xN[iM];                                                             // voir "intersection2cercles.pdf"
    b:=2*yN[iM];
    c:=sqr(xN[iM])+sqr(yN[iM])-sqr(bielV[iM])+sqr(manv);
    delta:=sqr(2*a*c)-4*(sqr(a)+sqr(b))*(sqr(c)-sqr(b)*sqr(manv));
    if delta>0 then begin                                                    // si intersection
      xP[iM]:=(2*A*C-sqrt(delta))/2/(sqr(a)+sqr(b)); yP[iM]:=(C-A*xP[iM])/B; // point P
      xQ[iM]:=(2*A*C+sqrt(delta))/2/(sqr(a)+sqr(b)); yQ[iM]:=(C-A*xQ[iM])/B; // point Q
      ang[iM]:=180/pi*ARctan(yP[iM]/abs(xP[iM]));
      if Form1.ChkInvBiel.Checked and (iM=GA) then
        ang[iM]:=180-(180/pi*ARctan(yQ[iM]/abs(xQ[iM])));                    // bielle à gauche du moteur
//      asservHard(ang,iM);  // asservissement hardware d'un moteur, çà ne marche pas ici (pas de déterminisme), voir timer
    end
    else
      calc:=false;                        // un seul moteur non calculé suffit
  end;
  limiteur:=I2F(calc,limiteur/0.995,limiteur*0.995);  // bornage mécanique : roulis=f(Tangage) en losange
  if limiteur>1 then limiteur:=1;                     // pour les cas non traités par "LitFichierParcours" ou "socketUdp"
  asserv:=calc;
end;
//==============================================================================================
procedure afficheAngleMoteur(ang:dblDrArGa);
var iM:integer;
begin
  for iM:=DR to GA do begin
    if form1.ChkInvBiel.Checked and (iM=GA) then begin
      if ang[iM]>262 then ang[iM]:=262;      // évite les oscillations manivelles hautes
      if ang[iM]< 98 then ang[iM]:= 98      // évite les oscillations manivelles basses
    end
    else begin
      if ang[iM]> 82 then ang[iM]:= 82;      // évite les oscillations manivelles hautes
      if ang[iM]<-82 then ang[iM]:=-82;      // évite les oscillations manivelles basses
    end;
//    consAngleMoteur[iM]:=ang[iM]-90;       // évite la perte de précision dans le TEdit => sans effet
    TLabeledEdit(form1.FindComponent('edtm'+IntToStr(iM+1))).Text:=floattostrf(ang[iM],fffixed,5,3);
  end;
end;
//==============================================================================================
procedure edtTheChge();
var
  pente:single;
  angle:dblDrArGa;
  const AMAX:single=23;const HMIN:single=0.261;
begin
  try the:=limiteur*strtofloat(Form1.edtthe.text); except end;
  try phi:=limiteur*strtofloat(Form1.edtphi.text); except end;
  if Form1.chkMiCourseAuto.Checked then begin
    pente:=((AMAX-abs(phi)/2)*(biel-HMIN)/AMAX+HMIN-biel)/(AMAX-abs(phi)/2); // voir fichier "vitesseAccélérationMoteurs.xlsx"
    dz:=(pente*the)*Form1.Tbar7.Position/100+biel;                           // avec mi-course proportionnelle
    if Form1.ChkRampPomp.Checked then dz:=dZ+pomp;                           // ajout du pompage
    Form1.Tbar6.Position:=round(1000*dz);
  end;
  if asserv(angle,dz) then afficheAngleMoteur(angle);
end;
//==============================================================================================
procedure TForm1.edtTheChange(Sender: TObject); begin edtTheChge(); end;    // instantané
//==============================================================================================
procedure litJoyStick(var the,phi,dzl:single);    // voir http://tcharles.developpez.com/joystick/
var
  JoyStickInfo : JOYINFOEX;
  Result:MMRESULT;
  Infoscaps:JOYCAPS;
begin
  JoyStickInfo.dwSize:=SizeOf(JoyStickInfo);                   // init taille de la structure
//  JoyStickInfo.dwFlags:= JOY_RETURNALL;                        // activation des flags de mesures à FF => toutes les voies
  JoyStickInfo.dwFlags:=$0000003F;                             // juste les 6 voies
  Result := joyGetPosEx(JOYSTICKID1, @JoyStickInfo);           // test le premier JS (16 possibles)
  if Result = JOYERR_NOERROR then begin                        // JS connecté ?
    joyGetDevCaps(JOYSTICKID1, @InfosCaps, sizeof(JOYCAPS));   //
    with InfosCaps do begin
      phi:=(JoyStickInfo.wXpos/wXmax-0.5)*60;
//      phi:=(JoyStickInfo.dwRpos/wXmax-0.5)*60;
      the:=(JoyStickInfo.wypos/wYmax-0.5)*60;
      dzl:=-(int(JoyStickInfo.wzpos)-wZmax)/(wZmax-wZmin);
//       form1.caption:='phi  :'+floattostr(phi)+'   xpos :'+inttostr(JoyStickInfo.wXpos)+'   wXmin :'+inttostr(wXmin)+'   wXmax :'+inttostr(wXmax);
      form1.lblDzMin.Caption:='Axes:'+intToStr(wNumAxes)+'/'+intToStr(wMaxAxes);   // 1/6 => pourquoi pas 8
//      form1.lblDzMax.Caption:=''+intToStr(wXmin)+'/'+intToStr(wXmax);              // 0/65536
//      form1.lblDzMin.Caption:='But:'+intToStr(wMaxButtons);                        // 32 => OK
      form1.lblDzMax.Caption:='Roulis : '+floattostrf(phi,fffixed,5,2)+ '°';         // 1/100éme degré
    end;
  end
  else showmessage('problème de connexion de l''interface de commande');
end;
//==============================================================================================
procedure TForm1.TimerJoyTimer(Sender: TObject);     // 16 ms mini
var
  a,b,c:single;
begin
  if chkJoystick.Checked then begin
    litJoyStick(a,b,c);
    Tbar4.Position:=round(a);
    Tbar5.Position:=round(b);
    Tbar6.Position:=round(1000*c);
  end;
end;
//==============================================================================================
//procedure TForm1.chkMiCourseAutoClick(Sender: TObject); begin chkMiCourseAuto.Checked:=edtcmax.Visible; end;
//==============================================================================================
procedure TForm1.GLSceneviewer1MouseMove(Sender:TObject;Shift:TShiftState;X,Y:Integer);
begin
  if ssLeft in shift then GLCamera1.MoveAroundTarget(my-y,mx-x);     // si bouton gauche alors départ-courant
  mx:=x;                // memo x, y arrivée
  my:=y;
end;
//==============================================================================================
procedure TForm1.GLSceneviewer1MouseDown(Sender:TObject;Button:TMouseButton;Shift:TShiftState;X,Y:Integer);
begin mx:=x; my:=y; end;  // memo x, y départ
//==============================================================================================
procedure TForm1.Btnn1Click(Sender: TObject);
begin
   find_next_testNumber;
end;
//==============================================================================================
procedure TForm1.edtl0Change(Sender: TObject); begin try L0ressort:=strtofloat(edtl0.text); except end; end;
//==============================================================================================
procedure TForm1.edthChange(Sender: TObject); begin try hressort:=strtofloat(edth.text); except end; end;
//==============================================================================================
procedure TForm1.edtdZChange(Sender: TObject);
var
  angle:dblDrArGa;
begin
  try dz:=strtofloat(edtdz.text); except end;
  if asserv(angle,dz) then afficheAngleMoteur(angle);
end;
//==============================================================================================
procedure TForm1.edtspringChange(Sender: TObject); begin try kressort:=strtofloat(edtspring.text); except end; end;
//==============================================================================================
procedure TForm1.edtm1Change(Sender: TObject); begin try consAngleMoteur[0]:=strtofloat(edtm1.text)-90; except end; end;
procedure TForm1.edtm2Change(Sender: TObject); begin try consAngleMoteur[1]:=strtofloat(edtm2.text)-90; except end; end;
procedure TForm1.edtm3Change(Sender: TObject); begin try consAngleMoteur[2]:=strtofloat(edtm3.text)-90; except end; end;
//==============================================================================================
procedure TForm1.TBar1Change(Sender: TObject); begin edtm1 .text:=inttostr   (Tbar1.Position); end;
procedure TForm1.TBar2Change(Sender: TObject); begin edtm2 .text:=inttostr   (Tbar2.Position); end;
procedure TForm1.TBar3Change(Sender: TObject); begin edtm3 .text:=inttostr   (Tbar3.Position); end;
procedure TForm1.TBar4Change(Sender: TObject); begin edtthe.text:=floatToStrf(Tbar4.Position/10,fffixed,5,3); end;    // tangage
procedure TForm1.TBar5Change(Sender: TObject); begin edtphi.text:=floatToStrf(Tbar5.Position/10,fffixed,5,3); end;    // roulis
procedure TForm1.TBar6Change(Sender: TObject); begin edtdz .text:=floattostrf(Tbar6.Position/1000,fffixed,5,3); end;
//==============================================================================================
procedure TForm1.TBar8Change(Sender: TObject);          // ajustage fin du tangage
begin
  if strtofloat(edtthe.text)>0 then
    edtthe.text:=floattostrf(    int(strtofloat(edtthe.text))+Tbar8.Position/100    ,fffixed,5,2)
  else
    edtthe.text:=floattostrf(abs(int(strtofloat(edtthe.text))+Tbar8.Position/100)*-1,fffixed,5,2);
end;
//==============================================================================================
procedure TForm1.TBar9Change(Sender: TObject);          // ajustage fin du roulis
begin
  if strtofloat(edtphi.text)>0 then
    edtphi.text:=floattostrf(    int(strtofloat(edtphi.text))+Tbar9.Position/100    ,fffixed,5,2)
  else
    edtphi.text:=floattostrf(abs(int(strtofloat(edtphi.text))+Tbar9.Position/100)*-1,fffixed,5,2);
end ;
//==============================================================================================
procedure TForm1.ChkRampPompClick(Sender: TObject); begin initStatTempsReel(sdt); queryPerformanceCounter(queryDeb); end;
procedure TForm1.ChkRampTangClick(Sender: TObject); begin initStatTempsReel(sdt); queryPerformanceCounter(queryDeb); end;
procedure TForm1.ChkRampRoulClick(Sender: TObject); begin initStatTempsReel(sdt); queryPerformanceCounter(queryDeb); end;
//==============================================================================================
procedure TForm1.TBarKPChange(Sender: TObject); begin LblKP.Caption:=floattostrf(TBarKP.Position/100,fffixed,5,2);initStatTempsReel(sea); end;
//procedure TForm1.TBarKIChange(Sender: TObject); begin LblKI.Caption:=floattostrf(TBarKI.Position/200,fffixed,5,2);initStatTempsReel(sea); end;
procedure TForm1.TBarKDChange(Sender: TObject); begin LblKD.Caption:=floattostrf(TBarKD.Position/ 10,fffixed,5,2);initStatTempsReel(sea); end;
procedure TForm1.TBarKIChange(Sender: TObject); begin LblKI.Caption:=floattostrf(TBarKI.Position/ 15,fffixed,5,2); end;
//==============================================================================================
procedure TForm1.ChkInvBielClick(Sender: TObject);
var mem:single;
begin
  mem:=consAngleMoteur[2]+90;
  if ChkInvBiel.Checked then begin
    TBar3.Min:= 90;TBar3.Max:=270;
    TBar3.Position:=round(180-mem);
    edtm3.text:=floatToStrf(180-mem,fffixed,5,3);
  end
  else begin
    TBar3.Min:=-90;TBar3.Max:= 90;
    TBar3.Position:=round(180-mem);
    edtm3.text:=floatToStrf(180-mem,fffixed,5,3);
  end;
end;
//==============================================================================================
procedure TForm1.BtRazMinMaxClick(Sender: TObject);
var i:integer;
begin
  for i:=DR to GA do begin csgMot[i].min:=0;csgMot[i].max:=0; end;
end;
//==============================================================================================
procedure TForm1.RSTimerEntreeLogiqueTimer(Sender: TObject);
var
i:smallint;
etat:word;
moy:float;
vmax,now:int64;
begin
   vmax:=10;
  // calcul de la vitesse du tapis roulant à partir des impulsions
   i:=_8136_D_input(0,18,etat); //borne 57 ds le bornier
   moy:=0;
   //decalage du buffer et ajout de la valeur courante de l'état à la pile
   //calcul de la moyenne glissante 
   for i:=1 to dim_buffer-1 do
   begin
    buffer[i]:=buffer[i+1];
    moy:=moy+buffer[i];
   end;
   buffer[dim_buffer]:=etat;
   moy:=moy+etat;
   moy:=moy/dim_buffer;
   queryPerformanceCounter(now);
     //detection du front descendant
     if ((moy=0) and not(switch_on)) then
     begin
      tf_old:=tf;
      queryPerformanceCounter(time_out_vitesse);
      queryPerformanceCounter(tf);
      switch_on:=true;
     end;
     //detection du front ascendant
     if ((moy=1) and (switch_on)) then
     begin
      queryPerformanceCounter(ti);
      switch_on:=false;
     end;
     delai_ils:=(tf-tf_old)/queryFreq;
     packet.vitesse:=coef_vit*arccos(-1)*0.044/delai_ils*3.6;
   if ((now-tf)/queryFreq*1000>700) then packet.vitesse:=0;

   // troncature pour éliminer les valeurs aberrantes
   if packet.vitesse>vmax then packet.vitesse:=0;
   form1.lblvitesse.text:=floattostrf(packet.vitesse/coef_vit,fffixed,5,2);

   // detection arret d'urgence tapis =>   arret du cadencer
   // le contrôle de la plateforme ne peut etre actif que si le tapis est en fonctionnement.
   i:=_8136_D_input(0,1,etat); //borne 59 ds le bornier
   //etat:=0;
   if (etat=0) then
   begin
    warning_tr.Caption:='TAPIS ROULANT ARME';
    warning_tr.color:=clyellow;
    warning_tr.Font.Color:=clblack;
    if glCadencer1.Enabled=false then glCadencer1.Enabled:=true;
   end
   else
   begin
    warning_tr.Caption:='ARRET TAPIS ROULANT';
    warning_tr.color:=clred;
    warning_tr.Font.Color:=clwhite;
    glCadencer1.Enabled:=false;
   end
end;

procedure TForm1.RoulistriangleMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin  Roulis_triangle_state:=Roulistriangle.Checked;end;

procedure TForm1.RoulistriangleMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin  if  Roulis_triangle_state then  Roulistriangle.Checked:=false;end;

procedure TForm1.RoulissinusMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin  if  Roulis_sinus_state then  Roulissinus.Checked:=false;end;

procedure TForm1.RoulissinusMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin  Roulis_sinus_state:=Roulissinus.Checked; end;

procedure TForm1.RoulissinusClick(Sender: TObject);
begin initStatTempsReel(sdt); queryPerformanceCounter(queryDeb); end;

procedure TForm1.RoulistriangleClick(Sender: TObject);
begin initStatTempsReel(sdt); queryPerformanceCounter(queryDeb); end;

procedure TForm1.TangagesinusClick(Sender: TObject);
begin initStatTempsReel(sdt); queryPerformanceCounter(queryDeb); end;

procedure TForm1.TangagesinusMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin  Tangage_sinus_state:=Tangagesinus.Checked; end;

procedure TForm1.TangagesinusMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin  if  Tangage_sinus_state then  Tangagesinus.Checked:=false;end;

procedure TForm1.TangagetriangleClick(Sender: TObject);
begin initStatTempsReel(sdt); queryPerformanceCounter(queryDeb); end;

procedure TForm1.TangagetriangleMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin  Tangage_triangle_state:=Tangagetriangle.Checked; end;

procedure TForm1.TangagetriangleMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin  if  Tangage_triangle_state then  Tangagetriangle.Checked:=false;end;


procedure TForm1.TrackBarPompageChange(Sender: TObject);
begin
  Coef_dz:=TrackBarPompage.Position/10.;
  lblPompage.Caption:=floattostrf(Coef_dz,ffgeneral,3,1);
end;

procedure TForm1.TrackBarTangageChange(Sender: TObject);
begin
  Coef_the:=-TrackBarTangage.Position/10.;
  lblTangage.Caption:=floattostrf(Coef_the,ffgeneral,3,1);
end;

procedure TForm1.TrackBarRoulisChange(Sender: TObject);
begin
  Coef_phi:=-TrackBarRoulis.Position/10.;
  lblRoulis.Caption:=floattostrf(Coef_phi,ffgeneral,3,1);
end;

procedure TForm1.TrackBarVitesseChange(Sender: TObject);
begin
  Coef_vit:=TrackBarVitesse.Position/10;
  lblvit.Caption:=floattostrf(Coef_vit,ffgeneral,3,1);
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ((packet.vitesse/coef_vit)>0.7) and  bEnable then   //interdit l'arret si la plateforme est en mvt et le TR en mvt
   begin
     CanClose := False;
     showmessage('Arrêter le tapis roulant d''abord');
   end;
end;

procedure TForm1.SendBtnClick(Sender: TObject);
begin
  envoi_msg:=true;
end;

procedure TForm1.Timer1Timer(Sender: TObject);

begin
  if envoi_msg then
  begin
    counter_msg:=0;
    envoi_msg:=false;
  end;
  counter_msg:=counter_msg+1;
  counter_msg:=min(counter_msg,delai_msg*10);
end;

procedure TForm1.Button_test1Click(Sender: TObject);
var
  i:integer;
begin
      Button_test1.Enabled:=false;
      test_indicator:=1;
      tick_test:=0;
      ampl_pretest:=5.0;
      freq_pretest:=0.5;
      form2.Memo1.Lines.Add('Essai sinus en roulis');
      form2.Memo1.Lines.Add('Amplitude : '+floattostr(ampl_pretest));
      form2.Memo1.Lines.Add('Fréquence : '+floattostr(freq_pretest));
      for i:=1 to memo2.Lines.Count do
      form2.Memo1.Lines.Add(memo2.Lines[i-1]);
      form2.Memo1.Lines.Add(FormatDateTime('ddddd', Date));
      form2.Memo1.Lines.Add(FormatDateTime('tt', time));
      Timer_test.Enabled:=true;
end;

procedure TForm1.Button1fhClick(Sender: TObject);
begin
  form2.show;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  ShowWindow(form2.Handle, SW_SHOWNOACTIVATE); form2.Visible:=true;  //evite la perte de focus de la form1 qd on utilise  form2.show;
  form2.Left:= 1920;
  form2.BorderStyle:= bsnone;
  form2.Height:=1900;
  form2.Top:=10;
  form1.SetFocus;
end;

function IsOpen(const txt:TextFile):Boolean;
const
  fmTextOpenRead = 55217;
  fmTextOpenWrite = 55218;
begin
  Result := (TTextRec(txt).Mode = fmTextOpenRead) or (TTextRec(txt).Mode = fmTextOpenWrite)
end;

procedure TForm1.Timer_testTimer(Sender: TObject);
begin
   tick_test:=tick_test+1;
   decompte.Caption:=inttostr(round((max_tick_test-tick_test)*Timer_test.interval/1000));
   tick_test:=min(tick_test,max_tick_test);
   //form1.caption:=floattostrf(fade,fffixed,5,2)+'  '+inttostr(tick_test)+'  '+floattostrf(fade*10-tick_test,fffixed,5,2);
   if tick_test=max_tick_test-1 then
   begin
          _8136_D_Output(CARD0,Dlink_1,MARCHE);       //VICON OFF
          VICON_OFF.Enabled:=true;
          {_8136_D_Output(CARD0,3,MARCHE);       // Video
          BtnVicon.Enabled:=true;   }
   end;
   if tick_test=max_tick_test then
   begin
    test_indicator:=0;
    if isOpen(File_resu)  then CloseFile(File_resu);
   end;
end;

procedure TForm1.VICON_ONTimer(Sender: TObject);
begin
          _8136_D_Output(CARD0,Dlink_6,ARRET);
          VICON_ON.Enabled:=false;
end;

procedure TForm1.VICON_OFFTimer(Sender: TObject);
begin
          _8136_D_Output(CARD0,Dlink_1,ARRET);
          VICON_OFF.Enabled:=false;
end;

procedure TForm1.videoTimer(Sender: TObject);
begin
          {_8136_D_Output(CARD0,3,ARRET);
          video.Enabled:=false;}
end;

procedure TForm1.BtnViconClick(Sender: TObject);
var
  i,buttonSelected : integer;
begin
    i:=find_next_testNumber;
    buttonSelected := messagedlg('Test_'+inttostr(i)+'.txt ?',mtError, mbOKCancel, 0);
    if buttonSelected = mrOK then
    begin
      form2.Memo1.Clear;
      form2.Memo1.Lines.Add('Test_'+inttostr(i));
      AssignFile(File_resu,'resultats/Test_'+inttostr(i)+'.txt');
      ReWrite(File_resu);
      _8136_D_Output(CARD0,Dlink_6,MARCHE); //VICON   ON
      vicon_on.Enabled:=true;
      {_8136_D_Output(CARD0,3,MARCHE);   //video
      video.Enabled:=true; }
      BtnVicon.Enabled:=false;
      Button_test1.Enabled:=true;
      Timer_test.Enabled:=false;
    end;
end;

procedure sendLANC(ordre:array of boolean);
var
  i:integer;
begin
    queryPerformanceCounter(t_curr);
    _8136_D_Output(CARD0,3,MARCHE);                                                                 //etat de repos LANC Control-L
    while t_curr<t0+15650000  do begin end;                                                         // delai de 5 ms  (3.13 GHz clock)
    t0:=t_curr;
    _8136_D_Output(CARD0,3,ARRET);                                                                  // etat haut : start bit
    while t_curr<t0+delay_bit  do begin end;                                                        // delai de 104 mu_s
    t0:=t_curr;
    for i:=1 to 8 do
    begin
       if ordre[9-i]=TRUE then  _8136_D_Output(CARD0,3,ARRET) else _8136_D_Output(CARD0,3,MARCHE);  //ordre inversé de la séquence de bits
       while t_curr<t0+delay_bit  do begin end;                                                     // delai de 104 mu_s
       t0:=t_curr;
    end;
    _8136_D_Output(CARD0,3,MARCHE);                                                                 //retour à l'etat de repos LANC Control-L
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  sendLANC(STOP);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  sendLANC(REC);
end;


end.
//==============================================================================================
(* Si plusieurs composants utilisent le même évènement, "Sender" permet de retrouver lequel en est à l'origine.
procedure TForm1.TrackBar1Change(Sender: TObject);
begin
  ShowMessage('TrackBar :'+TTrackBar(Sender).Name);
end; *)
//==============================================================================================
(*procedure TForm1.edtTheChange(Sender: TObject);
var
  dzmin,dzmax,pente:single;
  angle:sglDrArGa;
  i:integer;
  const AMAX:single=23;const HMIN:single=0.261;
begin
  try the:=strtofloat(edtthe.text); except end;
  if chkMiCourseAuto.Checked then
  begin
    dzmin:=1;dzmax:=0;
    for i:=0 to 1000 do
    begin
      dz:=i/1000;
      if asserv(angle,dz) then begin dzmin:=min(dzmin,dz);dzmax:=max(dzmax,dz); end;
    end;
    form1.lblDzMin.Caption:='Min='+floattostrf(dzmin,fffixed,5,3);
    form1.lblDzMax.Caption:='Max='+floattostrf(dzmax,fffixed,5,3);
    dz:=(dzmin+dzmax)/2;
    asserv(angle,dz);
    afficheAngleMoteur(angle);
    if (dzmax-dzmin)<>-1 then
    begin
      edtcmax.Color:=clwindow;
      form1.edtcmax.Text:=floattostrf(100*(dzmax-dzmin),fffixed,5,2);
      trackbar6.Position:=round(1000*dz);
    end
    else
    begin
      edtcmax.Color:=clred;
      form1.edtcmax.Text:='Pas de solution';
    end;
  end
  else
    if asserv(angle,dz) then afficheAngleMoteur(angle);
end; *)
//==============================================================================================
(*procedure TForm1.edtphiChange(Sender: TObject);
var
  dzmin,dzmax:single;
  angle:sglDrArGa;
  i:integer;
begin
  try phi:=strtofloat(edtphi.text); except end;
  if chkMiCourseAuto.Checked then
  begin
    dzmin:=1;dzmax:=0;
    for i:=0 to 1000 do
    begin
      dz:=i/1000;
      if asserv(angle,dz) then begin dzmin:=min(dzmin,dz);dzmax:=max(dzmax,dz); end;
    end;
    dz:=(dzmin+dzmax)/2;
    asserv(angle,dz);
    afficheAngleMoteur(angle);
    if (dzmax-dzmin)<>-1 then
    begin
      edtcmax.Color:=clwindow;
      form1.edtcmax.Text:=floattostrf(100*(dzmax-dzmin),fffixed,5,2);
      trackbar6.Position:=round(1000*(dzmin+dzmax)/2);
    end
    else
    begin
      edtcmax.Color:=clred;
      form1.edtcmax.Text:='Pas de solution';
    end;
  end
  else
    if asserv(angle,dz) then afficheAngleMoteur(angle);
end;*)
//==============================================================================================
(*procedure TForm1.edtphiChange(Sender: TObject);
var
  pente:single;
  angle:sglDrArGa;
  const AMAX:single=23;const HMIN:single=0.261;
begin
  try phi:=strtofloat(edtphi.text); except end;
  if chkMiCourseAuto.Checked then
  begin
    pente:=((AMAX-abs(the)/2)*(biel-HMIN)/AMAX+HMIN-H0)/(AMAX-abs(the)/2);
    dz:=-pente*the+H0;
    form1.lblDzMin.Caption:='pente='+floattostrf(pente*1000,fffixed,5,3);
    trackbar6.Position:=round(1000*dz);
  end;
  if asserv(angle,dz) then afficheAngleMoteur(angle);
end;
//    procedure edtphiChange(Sender: TObject);*)
//==============================================================================================
//  voir les fichiers suivants
//  - "étudeCinématique.doc" : auteur Pierre Lemerle
//  - "intersection2cercles.pdf" :
(*
function asserv(var ang:sglDrArGa; dzl:single):boolean;
var
  v:array[0..2] of tvector3f;
  bielV,xN,yN,xP,yP,xQ,yQ:sglDrArGa;
  iM:integer;               // index des moteurs
  flag:boolean;
  a,b,c,delta:single;
  mTang,mRoul:Tmatrix4f;
  const AR:integer=0;const GA:integer=1;const DR:integer=2;
begin
//      form1.Memo1.Clear;
//      form1.Memo1.Lines.Add('the  : '+floattostr(the));
//      form1.Memo1.Lines.Add('phi  : '+floattostr(phi));
//      form1.Memo1.Lines.Add('dz  : '+floattostr(dz));
  flag:=true;
  mTang:=createrotationmatrixY(the*pi/180);
  mRoul:=createrotationmatrixX(phi*pi/180);
  v[AR]:=vectoradd(vectortransform(affinevectormake( L1,  0,0),mTang                      ),affinevectormake(0,0,dzl));
  v[GA]:=vectoradd(vectortransform(affinevectormake(-L2,-L3,0),matrixmultiply(mTang,mRoul)),affinevectormake(0,0,dzl));
  v[DR]:=vectoradd(vectortransform(affinevectormake(-L2, L3,0),matrixmultiply(mTang,mRoul)),affinevectormake(0,0,dzl));
  bielV[AR]:=sqrt(sqr(biel)-sqr(L1-v[AR][0]));              // projection de la bielle sur le plan vertical
  bielV[GA]:=sqrt(sqr(biel)-sqr(L2+v[GA][0]));
  bielV[DR]:=sqrt(sqr(biel)-sqr(L2+v[DR][0]));
  xN[AR]:=v[AR][1];xN[GA]:=v[GA][1]+L3;xN[DR]:=v[DR][1]-L3; // y plateau => x centré plan vertical
  yN[AR]:=v[AR][2];yN[GA]:=v[GA][2]   ;yN[DR]:=v[DR][2];    // z plateau => y plan vertical
  for iM:=DR to GA do                                       // index Moteur
  begin
    a:=2*xN[iM];
    b:=2*yN[iM];
    c:=sqr(xN[iM])+sqr(yN[iM])-sqr(bielV[iM])+sqr(manv);  //
    delta:=sqr(2*a*c)-4*(sqr(a)+sqr(b))*(sqr(c)-sqr(b)*sqr(manv));
//        form1.Memo1.Lines.Add('delta_'+inttostr(iM)+'  '+floattostr(delta));
//  form1.lblDzMin.Caption:='delta='+floattostrf(delta,fffixed,5,3);
    if delta>0 then
    begin                                                   // si intersection
      xP[iM]:=(2*A*C-sqrt(delta))/2/(sqr(a)+sqr(b));
      xQ[iM]:=(2*A*C+sqrt(delta))/2/(sqr(a)+sqr(b));
form1.lblDzMin.Caption:='xP[DR]='+floattostrf(xP[DR],fffixed,5,3);
form1.lblDzMax.Caption:='xQ[DR]='+floattostrf(xQ[DR],fffixed,5,3);
      if B<>0 then                                          // si yN[iM]#0 (toujours notre cas)
      begin
        yP[iM]:=(C-A*xP[iM])/B;
        yQ[iM]:=(C-A*xQ[iM])/B;
      end
      else
      begin
        xP[iM]:=B/2+sqrt(sqr(bielV[iM])+sqr((2*C-sqr(A))/2/A));
        yQ[iM]:=B/2-sqrt(sqr(bielV[iM])+sqr((2*C-sqr(A))/2/A));
      end;
      if xP[iM]>0 then ang[iM]:=180/pi*ARctan(yP[iM]/abs(xP[iM]));
      if xP[iM]<0 then ang[iM]:=180/pi*ARctan(yQ[iM]/abs(xQ[iM]));
      if xP[iM]=0 then
        if yP[iM]>0 then ang[iM]:=90
        else
          if yP[iM]<0 then ang[iM]:=-90;
    end
    else
      flag:=false;
  end;
  if not flag then for iM:=DR to GA do ang[iM]:=consAngleMoteur[iM]+90;
  asserv:=flag;
end;*)
//==============================================================================================
(*procedure keytrig(var the,phi,dzl:single);
var
  //   temp:real;
  JoyStickInfo : JOYINFOEX;
  Result:MMRESULT;
  xmin,xmax,ymin,ymax,zmin,zmax:integer;//,rmin,rmax:integer;
  Infoscaps:JOYCAPS;
begin
  JoyStickInfo.dwSize:=SizeOf(JoyStickInfo);
  JoyStickInfo.dwFlags:= JOY_RETURNALL;
  Result := joyGetPosEx(JOYSTICKID1, @JoyStickInfo);
  if Result = JOYERR_NOERROR then
  begin
    joyGetDevCaps(JOYSTICKID1, @InfosCaps, sizeof(JOYCAPS));
    with
    xmin:=InfosCaps.wXmin;
    xmax:=InfosCaps.wXmax;
    ymin:=InfosCaps.wYmin;
    ymax:=InfosCaps.wYmax;
    zmin:=InfosCaps.wZmin;
    zmax:=InfosCaps.wZmax;
    //       rmin:=InfosCaps.wRmin;
    //       rmax:=InfosCaps.wRmax;
    phi:=(JoyStickInfo.wXpos-(xmax+xmin)/2)/(xmax-xmin)*2*30;
    the:=(JoyStickInfo.wypos-(ymax+ymin)/2)/(ymax-ymin)*2*30;
    dzl:=-(int(JoyStickInfo.wzpos)-zmax)/(zmax-zmin);
    //       form1.caption:='phi  :'+floattostr(phi)+'   xpos :'+inttostr(JoyStickInfo.wXpos)+'   xmin :'+inttostr(xmin)+'   xmax :'+inttostr(xmax);
  end
  else showmessage('problème de connexion de l''interface de commande');
end;*)
//==============================================================================================
(*procedure rotule(const aJoint: PNewtonJoint); cdecl;
const
  Minangle=-15/180*pi;
  Maxangle=15/180*pi;
var
  mPosition0,mPosition1  : TVector3f;
//  q0,q1: TVector3f;
  manivelle_front,manivelle_up,manivelle_right:TVector3f;
//  angle,relAngle,sinAngle,cosAngle: single;
begin
  mposition1:=Rel2abspoint(Form1.plateforme,affinevectormake(-L2,L3,0));
  mposition0:=Rel2abspoint(Form1.manivelle[2],affinevectormake(0,0,biel));
  manivelle_front:=Rel2absvector(Form1.manivelle[2],affinevectormake(1.0,0.0,0.0));
  manivelle_right:=Rel2absvector(Form1.manivelle[2],affinevectormake(0.0,1.0,0.0));
  manivelle_up   :=Rel2absvector(Form1.manivelle[2],affinevectormake(0.0,0.0,1.0));
  NewtonUserJointAddLinearRow (ajoint, @mPosition1, @mPosition0, @manivelle_front);
  NewtonUserJointAddLinearRow (ajoint, @mPosition1, @mPosition0, @manivelle_right);
  NewtonUserJointAddLinearRow (ajoint, @mPosition1, @mPosition0, @manivelle_up);
end;*)
//==============================================================================================
(*procedure TForm1.DisplayCollisionGeoms ;
begin
  NewtonWorldForEachBodyDo(FNewtonWorld, @Debug_ShowBodyCollision) ;
end ;*)
//==============================================================================
{procedure calcul_AB(n:integer;pt:array of TPointD;var dtr:TDroite);
var   i:integer;
const s_x:double=0.0;s_y:double=0.0;s_xy:double=0.0;s_x2:double=0.0;
begin
  for i:=0 to n-1 do
  begin
    s_x :=s_x +pt[i].x;
    s_y :=s_y +pt[i].y;
    s_xy:=s_xy+pt[i].x*pt[i].y;
    s_x2:=s_x2+pt[i].x*pt[i].x;
  end;
  if s_x>0 then
  begin
    dtr.pente:=(n*s_xy-s_x*s_y)/(n*s_x2-s_x*s_x);
    dtr.cste :=(s_y-dtr.pente*s_x)/n
  end
  else
  begin
    dtr.pente:=0.0;
    dtr.cste:=0.0;
  end;
  dtr.resid:=0.0;
  for i:=0 to n-1 do
    if abs(dtr.resid)<abs((pt[i].y-(dtr.pente*pt[i].x+dtr.cste))) then
      dtr.resid:=pt[i].y-(dtr.pente*pt[i].x+dtr.cste);
end;}
//==============================================================================
// issus de asservHard
//      consMoy:=cons[iMot];                                                    // sans moyenne
{      consMoy:=(cons[iMot]+
                tTqMe[I2F( ind =0           ,IMAX    -1,ind-1)].csg+
                tTqMe[I2F((ind>=0)and(ind<2),IMAX-ind-1,ind-2)].csg+
                tTqMe[I2F((ind>=0)and(ind<3),IMAX-ind-1,ind-3)].csg)/4;         // Moyenne glissante 4 points dans buffer cyclique
}
{      TTimer(Form1.FindComponent('TimeAsser'+IntToStr(iMot+1))).Interval:=
        trunc((qMemCyc[iMot].IMAX*Form1.RSTimer1.Interval*90/100)-              // tempo de sauvegarde 10% avant, 90% après
              (durT/1000         *Form1.RSTimer1.Interval/2     ));             // compression temporelle
      TTimer(Form1.FindComponent('TimeAsser'+IntToStr(iMot+1))).Enabled:=true;  // => taille buffer 300 x 3ms
}
//    if Form1.ChkBoxPond.Checked if(DTIM/durT<1.2)and(DTIM/durT>0.8) then der:=der*DTIM/durT; end;  // pondération par la durée réelle du timer
{    form1.Caption:=inttostr(sea.cpt)+'  '+inttostr(durT)+'  '+
                   inttostr(tTqMe[I2F(ind=0,IMAX-1,ind-1)].inter.qFin)+'  '+
                   inttostr(tTqMe[I2F(ind=0,IMAX-1,ind-1)].inter.qDeb); }
{//==============================================================================================
procedure badMesureAngleCadreMobile();
var
  vPf,sVc:TAffineVector;
  ang:double;
begin
  vPf[0]:=Form1.Bplateforme.Direction.X;
  vPf[1]:=Form1.Bplateforme.Direction.Y;
  vPf[2]:=Form1.Bplateforme.Direction.Z;
//  vPf[0]:=sqrt(3)/3;vPf[1]:=sqrt(3)/3;vPf[2]:=sqrt(3)/3; // vecteur remarquable (Roul=45, Tang=45, Lacet=45)
  sVc:=VectorCrossProduct(vPf,XVector);                         // produit vectoriel
  ang:=vectorlength(sVc);                                       // norme
  ang:=(90-arcsin(ang)*180/PI)*sign(vPf[0]);
  Form1.LblMesTang.Caption:=floattostrf(ang,fffixed,5,3);
  sVc:=VectorCrossProduct(vPf,YVector);
  ang:=vectorlength(sVc);
  ang:=(90-arcsin(ang)*180/PI)*sign(vPf[1]*-1);
  Form1.LblMesRoul.Caption:=floattostrf(ang,fffixed,5,3);   // OK avec incertitudes
end;}

