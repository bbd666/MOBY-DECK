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
  ComCtrls, mmsystem, Gauges, Pci_8136, uIif, AsyncTimer,LabelEditEx, complexf, fft,
  OleCtrls, RSTIMERLib_TLB; //,VectorGeometry;

type TForm1 = class(TForm)
    GLScene1: TGLScene;
    GLSceneViewer1: TGLSceneViewer;
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
    GroupBoxPlat: TGroupBox;
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
    CheckBox1: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
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
    CheckBoxAsser: TCheckBox;
    TimerJoy: TTimer;
    TimeZeroPf1: TTimer;
    TimeZeroPf2: TTimer;
    TimeZeroPf3: TTimer;
    CheckBoxAsserDr: TCheckBox;
    TimeAsserGl1: TAsyncTimer;
    TimeAsserGl2: TAsyncTimer;
    TimeAsserGl3: TAsyncTimer;
    ChkBoxPond: TCheckBox;
    RSTimer1: TRSTimer;
    RSTimer2: TRSTimer;
    RSTimer3: TRSTimer;
    btFile1: TButton;
    lblFile: TLabel;
    lblDurT: TLabel;
    lblIntg: TLabel;
    ChkLim: TCheckBox;
    LblStLimMes: TLabel;
    LblStLimMoy: TLabel;
    LblStLimSig: TLabel;
    LblStLimMin: TLabel;
    LblStLimMax: TLabel;
    btLitParc: TButton;
    EdtSeuilGamma: TEdit;
    EdtMoyGlis: TEdit;
    EdtKang: TEdit;
    EdtPuisAng: TEdit;
    EdtAngleMax: TEdit;
    TimerParc: TTimer;
    LblParc: TLabel;
    EdtCoupAng: TEdit;
    EdtKpmp: TEdit;
    EdtCoupPmp: TEdit;
    EdtPuisPmp: TEdit;
    LblMesTang: TLabel;
    LblMesRoul: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GLCadencer1Progress(Sender: TObject; const deltaTime, newTime: Double);
    procedure GLSceneViewer1PostRender(Sender: TObject);
    procedure GLSceneViewer1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure GLSceneViewer1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Button1Click(Sender: TObject);
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
//    procedure chkMiCourseAutoClick(Sender: TObject);
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
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FMW(S: TObject; T: TShiftState; WD:integer; MP: TPoint; var H: Boolean);
    procedure TimeZeroPf1Timer(Sender: TObject);
    procedure TimeZeroPf2Timer(Sender: TObject);
    procedure TimeZeroPf3Timer(Sender: TObject);
    procedure TimeAsserGl1Timer(Sender: TObject);
    procedure TimeAsserGl2Timer(Sender: TObject);
    procedure TimeAsserGl3Timer(Sender: TObject);
    procedure RSTimer1Timer(Sender: TObject);
    procedure RSTimer2Timer(Sender: TObject);
    procedure RSTimer3Timer(Sender: TObject);
    procedure CheckBoxAsserClick(Sender: TObject);
    procedure btFile1Click(Sender: TObject);
    procedure ChkLimClick(Sender: TObject);
    procedure btLitParcClick(Sender: TObject);
    procedure TimerParcTimer(Sender: TObject);
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

type sglDrArGa = Array[0..2] Of single;
type dblDrArGa = Array[0..2] Of double;
type TPointD   = record x,y              : double; end;
type TDroite   = record pente,cste,resid : double; end;
type TPid      = record intg,oldEc       : single; end;
type TParc     = record tang,roul,pomp   : single; end;

type TStatRT   = record min,max,som,moy,sig : double;
                        cpt                 : Int64; end;
type TmoyGlis  = record csg          : Array[0..3] Of double;
                        cpt          : integer; end;
type TqDuree   = record qDeb,qFin    : Int64;
                        qDur         : integer; end;
type TqMemElmt = record inter,intra  : TqDuree;
                        csg,mes,corr : double; end;
type TqMemCyc  = record IMAX,ind     : integer;           // index max et index courant
                        indBloq      : integer;           // index de blocage du buffer cyclique
                        sdtB,seaB    : TStatRT;
                        tTqMe        : array[0..299] of TqMemElmt; end;

var
  Form1  : TForm1;
  segAng : TDroite;
  sdt    : TStatRT;                    // Stat. Durée Timer
  sea    : TStatRT;                    // Stat. Ecart asservissement
  slm    : TStatRT;                    // Stat. Limiteur
  moyGlis: array[0..2] of TmoyGlis;
  qMemCyc: array[0..2] of TqMemCyc;
  pid    : array[0..2] of TPid;
  tabPom : array[0..2] of TPom;
  tabPts : array[0..2] of TPointD=((x:1;y:3),(x:2;y:5),(x:3;y:7));   // pour regress linéaire
  consAngleMoteur,mesAngleMoteur,F_moteur : array[0..2] of single;
  qAsserInterDeb,qAsserInterFin : array[0..2] of Int64;   // pour queryPerformanceCounter inter-asservissement
  queryDeb,queryFin,queryFreq   : Int64;                  // pour queryPerformanceCounter
  bEnable:boolean;                       // servostar 400
  bRepos : array[0..3] of boolean;       // état de repos plate-forme (8.332°)
  bFile  : array[0..2] of boolean;       // état de mémorisation pour fichier texte
  anglPomp:single;                        // pour pompage, index moteur
  existcard:word;                        // carte Adlink
  MaxUpDownControl,param,param2,kressort,l0ressort,hressort:single;
  the,phi,dz:single;
  L1,L2,L3,maniv,biel,m_base,ixx_base,iyy_base,izz_base:single;
  tactive1,sgn1,tactive2,sgn2:single;
  vitRampeRoul,vitRampeTang,max_gauge,pomp,limiteur:single;
  consAsser:sglDrArGa;
  tabParc : Array of TParc;
  iParc : integer;

const DR:integer=0; const AR:integer=1; const GA:integer=2;  // ordre donné par le cablage ENC, DAC et ADC
const DTIM:integer=2970;

implementation

uses
  OpenGL1x,
  VectorGeometry, //vector and matrix operation unit including affinevectormake function
  VectorLists,
  newtonutil;

{$R *.dfm}
//==============================================================================
// Return RC low-pass filter output samples, given input samples,
// time interval dt, and time constant RC
{ function lowpass(real[0..n] x, real dt, real RC)
var real[0..n] y
var real a := dt / (RC + dt)
y[0] := x[0]
for i from 1 to n
       y[i] := a * x[i] + (1-?) * y[i-1]
return y}
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
  for col:=1 to 3 do                                  // longi, trans, verti
  begin
    for i:=0 to nbL-1 do
    begin
      case col of
      1: g[i].re:=tabParc[i].roul;
      2: g[i].re:=tabParc[i].tang;
      3: g[i].re:=tabParc[i].pomp;
      end;
      g[i].im:=0;
    end;
    ForwardFFT(g,gf,nbL);
    if col<3 then fcp:=strToFloat(Form1.EdtCoupAng.Text)   // freq coupure
             else fcp:=strToFloat(Form1.EdtCoupPmp.Text);
    for i:=1 to trunc(nbL/2) do
      gi[i]:=complexmul(gf[i],passBasFreq(i*f/nbL,fcp));
    for i:=trunc(nbL/2)+1 to nbL-1 do
    begin
      gi[i].re:= gi[nbL-i].re;
      gi[i].im:=-gi[nbL-i].im;
    end;
    InverseFFT(gi,gp,nbL);
    for i:=0 to nbL-1 do
    case col of
    1: tabParc[i].roul:=gp[i].re;
    2: tabParc[i].tang:=gp[i].re;
    3: tabParc[i].pomp:=gp[i].re;
    end;
  end;
end;
//==============================================================================
procedure initStatTempsReel(var sd:TStatRT); // Initialisation Statistiques de durée du timer
begin
  sd.moy:=0.0;
  sd.som:=0.0;
  sd.moy:=0.0;
  sd.min:=10000.;
  sd.max:=0.0;
  sd.cpt:=0;
end;
//==============================================================================
procedure calcStatTempsReel(var sd:TStatRT;mes:double); // Temps réel Statistiques de durée du timer
begin
  sd.cpt:=sd.cpt+1;
  sd.som:=sd.som+(sd.moy-mes)*(sd.moy-mes)*(sd.cpt-1)/sd.cpt;
  sd.moy:=sd.moy-(sd.moy-mes)/ sd.cpt;
  if (sd.cpt>1) and (sd.som>0) then sd.sig:=sqrt(sd.som/(sd.cpt-1));
  if sd.min>mes then sd.min:=mes;
  if sd.max<mes then sd.max:=mes;
end;
//==============================================================================
procedure affDuree(); // précision 1µs
var dur:double;
begin
  queryPerformanceCounter(queryFin);
  if queryDeb=0 then exit;
  dur:=1000*(queryFin-queryDeb-550)/queryFreq;       // 550 top horloge mini sans instruction
  if dur>0 then calcStatTempsReel(sdt,dur);
  if sdt.cpt mod 10 = 0 then
  begin
    Form1.LblStDurUnt.caption:=IIF(dur<1,'µs'                             ,'ms');
    Form1.LblStDurMes.caption:=IIF(dur<1,floatToStrf(dur*1000,fffixed,5,1),floatToStrf(dur    ,fffixed,5,2)+'  ');
    Form1.LblStDurMoy.caption:=IIF(dur<1,floatToStrf(dur*1000,fffixed,5,1),floatToStrf(sdt.moy,fffixed,5,2)+'  ');
    Form1.LblStDurSig.caption:=IIF(dur<1,floatToStrf(dur*1000,fffixed,5,1),floatToStrf(sdt.sig,fffixed,5,2)+'  ');
    Form1.LblStDurMin.caption:=IIF(dur<1,floatToStrf(dur*1000,fffixed,5,1),floatToStrf(sdt.min,fffixed,5,2)+'  ');
    Form1.LblStDurMax.caption:=IIF(dur<1,floatToStrf(dur*1000,fffixed,5,1),floatToStrf(sdt.max,fffixed,5,2)+'  ');
  end;
  if (sdt.moy>1) then Form1.GaugeStDur.MaxValue:=round(3*sdt.moy);
  Form1.GaugeStDur.Progress:=round(dur);
//  Form1.edCons.Text:=IntToStr(queryFreq);
//  Form1.edMes.Text:=IntToStr(queryfin-queryDeb);
end;
//==============================================================================
procedure _8136_initMultiFonct(bAna:boolean=false);   // optional
var iM:integer;
begin
  _8136_Initial(existcard);                           // Ouvre la PCI-8136 et retourne le nb de cartes trouvées (27ms)
  if existcard<>0 then
  begin
    if bAna then _8136_A_Initial(CARD0);              // Analogique (1.89s)
    _8136_P_Initial(CARD0);                           // Compteur Impulsions codeurs
    for iM:=0 to 2 do
    begin
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
procedure _8136_A_Write_Varia(iMot:integer;tens:double;
                              oldTens:double=0.0);
const uOffVar:array[0..2]of double=(-0.014,-0.045,-0.035);     // offset consigne moteur
begin
  if oldTens<>0.0 then                                         // si phase d'asservissement ?
  begin
    if (abs(oldTens-tens)>1) and                                // filtre contre les trop fortes implulsions
       (true) then                                             // filtre contre les trop fortes oscillations
    begin
//      Form1.CheckBoxAsser.Checked:=false;                    // Arrête les 3 asserv moteurs si 1 dépassement
//      _8136_A_Write_Volt(CARD0,CH3+iMot,uOffVar[iMot]);      // Vitesse nulle
      _8136_A_Write_Volt(CARD0,CH3+iMot,tens+uOffVar[iMot]);     // quand tout se passe bien
    end
    else
      _8136_A_Write_Volt(CARD0,CH3+iMot,tens+uOffVar[iMot]);     // quand tout se passe bien
  end
  else                                                         // hors asservissement ?
    _8136_A_Write_Volt(CARD0,CH3+iMot,tens+uOffVar[iMot]);     // quand tout se passe bien
end;
//==============================================================================
procedure prepaRefCodeur(iMot:integer);  // (40µs)
begin
  _8136_P_Clear(CARD0,ENC2+iMot);                    // RaZ compteur du codeur
//  Form1.Edit1.Text:='Compt '+IntToStr(iMot);         // Raz affichage
  tabPom[iMot].cptIni:=0;                            // init détection latch
  _8136_P_Set_Index_Latch(CARD0,ENC2+iMot,0);        // trigger de RaZ une seule fois
//  Form1.Edit3.Text:=' ';
end;
//==============================================================================
procedure TForm1.TimerParcTimer(Sender: TObject);
begin
  edtthe.Text:=floatToStrf(tabParc[iParc].tang,fffixed,5,2);
  edtphi.Text:=floatToStrf(tabParc[iParc].roul,fffixed,5,2);
  LblParc.Caption:=intToStr(iParc);
  iParc:=iParc+1;
  if iParc=length(tabParc) then
  begin
    TimerParc.Enabled:=false;
    btLitParc.Enabled:=true;
  end;
end;
//==============================================================================
procedure anglesTextFile(nbP:integer;nom:string);
var
  myFile:TextFile;
  i:integer;
  strFile,strDaTime:string;
begin
  strFile:='analyses\tangageRoulis'+nom;
  DateTimeToString(strDaTime,'--hh_nn_ss',time());strFile:=strFile+strDaTime;
  DateTimeToString(strDaTime,'--dd_mm_yy',date());strFile:=strFile+strDaTime;
  AssignFile(myFile,strFile+'.txt');                             // init variable fichier
  ReWrite(myFile);                                               // ouverture en écriture
  decimalseparator:=',';
  for i:=0 to nbP-1 do
  with tabParc[i] do
      Writeln(myFile,(i+1)*0.02:5:2,chr(9),  // durée en s
                           tang:5:3,chr(9),  // tangage en °
                           roul:5:3,chr(9)); // roulis en °
  decimalseparator:='.';
  CloseFile(myFile);
end;
//==============================================================================
procedure litFichierParcours(nomFich:string);
var
  myFile  : TextFile;
  nbLig,i,gammaMax,i1,i2 : integer;     //g,moyGlis
  kAng,kPmp,pAng,pPmp,angleMax : single;
  poub: double;
  n1,n2,n3,strFile : string;
begin
  strFile:='parcours\'+nomFich;
  AssignFile(myFile,strFile+'.txt');                           // init variable fichier
  Reset(myFile);                                               // ouverture en lecture
  ReadLn(myFile,nbLig);
  SetLength(tabParc,nbLig);                                    // dimensionnement dynamique
  ReadLn(myFile,strFile);                                      // lit Intitulés
  decimalSeparator:=',';       // fonctionne en lecture
  i:=0;
  while not Eof(myFile) do
  with tabParc[i] do
  begin
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
  gammaMax:=strToInt(Form1.EdtSeuilGamma.text);
  for i:=0 to nbLig-1 do
  with tabParc[i] do
  begin
    if tang>gammaMax then tang:=gammaMax;                            // seuillage gamma longitudinal
    if roul>gammaMax then roul:=gammaMax;                            // seuillage gamma transversal
  end;
{ moyGlis:=strToInt(Form1.EdtMoyGlis.Text);                          // nb de points
  for i:=nbLig-1 downto moyGlis do                                   // moyenne glissante
  with tabParc[i] do
  begin
    poub:=0;for g:=i-moyGlis to i-1 do poub:=poub+tabParc[g].tang;tang:=poub/moyGlis;
    poub:=0;for g:=i-moyGlis to i-1 do poub:=poub+tabParc[g].roul;roul:=poub/moyGlis;
    poub:=0;for g:=i-moyGlis to i-1 do poub:=poub+tabParc[g].pomp;pomp:=poub/moyGlis;
  end;}
  kAng    :=strToInt  (Form1.EdtKang    .Text);                      // constante
  pAng    :=strToFloat(Form1.EdtpuisAng .Text);                      // puissance de compactage
  angleMax:=strToInt  (Form1.EdtAngleMax.Text);                      // angle assev max
  kPmp    :=strToInt  (Form1.EdtKpmp    .Text);                      // constante
  pPmp    :=strToFloat(Form1.EdtPuisPmp .Text);                      // puissance de compactage
  for i:=0 to nbLig-1 do                                             // conversion gamma/angle
  with tabParc[i] do
  begin                                                              // compactage angulaire
    poub:=ArcTan(tang/9.81)*180/PI;tang:=iif(poub>0,kAng*power(poub,pAng),-kAng*power(abs(poub),pAng));
    poub:=ArcTan(roul/9.81)*180/PI;roul:=iif(poub>0,kAng*power(poub,pAng),-kAng*power(abs(poub),pAng));
    poub:=ArcTan(pomp/9.81)*180/PI;pomp:=iif(poub>0,kPmp*power(poub,pPmp),-kPmp*power(abs(poub),pPmp));
    if roul>angleMax then roul:=angleMax else if roul<-angleMax then roul:=-angleMax;
    if tang>angleMax then tang:=angleMax else if tang<-angleMax then tang:=-angleMax;  // bornage mécanique
  end;
//  anglesTextFile(nbLig,'AvantFiltrage');
  passBasTempo(nbLig,50);                                                // fréq échantillonnage 50Hz car dt=20ms
  anglesTextFile(nbLig,'ApresFiltrage'+Form1.EdtCoupAng.Text+'Hz');
  for i:=0 to 20-1 do                                                    // démarrage progressif
  with tabParc[i] do
  begin
    tang:=tabParc[20].tang*i/20;
    roul:=tabParc[20].roul*i/20;
    pomp:=tabParc[20].pomp*i/20;
  end;
  for i:=nbLig-20 to nbLig-1 do                                          // arrêt progressif
  with tabParc[i] do
  begin
    tang:=tabParc[nbLig-1-20].tang*(nbLig-1-i)/20;
    roul:=tabParc[nbLig-1-20].roul*(nbLig-1-i)/20;
    pomp:=tabParc[nbLig-1-20].pomp*(nbLig-1-i)/20;
  end;
{  Form1.btLitParc.Enabled:=false;
  iParc:=3500;
  Form1.TimerParc.Enabled:=true;
}  
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
  if iMot=0 then strFile:=strFile+'DR';               // moteur concerné
  if iMot=1 then strFile:=strFile+'AR';
  if iMot=2 then strFile:=strFile+'GA';
  DateTimeToString(strDaTime,'--hh_nn_ss',time());strFile:=strFile+strDaTime;
  DateTimeToString(strDaTime,'--dd_mm_yy',date());strFile:=strFile+strDaTime;
  strFile:=strFile+'--'+copy(Form1.lblFile.Caption,1,1);
  AssignFile(myFile,strFile+'.txt');                             // init variable fichier
  ReWrite(myFile);                                               // ouverture en écriture
//.................... Entête de fichier .......................................
  with qMemCyc[iMot]do
  begin
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
  with qMemCyc[iMot] do
  begin
    memOc:=tTqMe[ind].csg;cptOc:=1;i:=1;
    while i<=qMemCyc[iMot].IMAX-2 do                            // ajouter la distribution des occurances "asserTimer"
    with tTqMe[(i+ind) mod IMAX] do                             // par appel de "Gl_Cadencer"
    begin
      if memOc=csg then cptOc:=cptOc+10                         // ajoute une occurence 10/10
      else
      begin
        if cptOc<length(occur) then                             // cas le plus fréquent
          occur[cptOc-1]:=occur[cptOc-1]+1                      // incrémente la classe d'occurances
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
procedure TForm1.CheckBoxAsserClick(Sender: TObject);
var i :integer;
begin
  if not CheckBoxAsser.Checked then     // quitte mode asservissement ?
  begin
    for i:=0 to 0 do //2 do
      if bFile[i] then                  // buffer arreté ?
      begin
        bufferTextFile(i);              // extraction dans ficher texte
        bFile[i]:=false;                // réarmement buffer
//        TButton(form1.FindComponent('btFile'+IntToStr(i+1))).Font.Color:=clWindowText;;
      end;
  end;
end;
//==============================================================================================
procedure bloqueMemoTextFile(iMot:integer;strMsg:string);       // blocage mémorisation en manuel
begin
  if not bFile[iMot] then bFile[iMot]:=true;             // blocage buffer circulaire
  CopyMemory(@qMemCyc[iMot].sdtB,@sdt,sizeof(TStatRT));  // copie des stats durée de 48 octets
  CopyMemory(@qMemCyc[iMot].seaB,@sea,sizeof(TStatRT));  // copie des stats asservissement de 48 octets
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
  with qMemCyc[iMot] do
  begin
    qAsserInterFin[iMot]:=qAsserIntraDeb;
    durT:=trunc(1000000*(qAsserInterFin[iMot]-qAsserInterDeb[iMot]-550)/queryFreq);         //en µs
    qAsserInterDeb[iMot]:=qAsserIntraDeb;
    if not bFile[iMot] then
    begin
      if ind>IMAX-1 then ind:=0;
      tTqMe[ind                    ].inter.qDeb:=qAsserInterDeb[iMot];
      tTqMe[iif(ind=0,IMAX-1,ind-1)].inter.qFin:=qAsserInterFin[iMot];
      tTqMe[ind                    ].intra.qDeb:=qAsserIntraDeb;
    end;
    if (durT>20000) and bRepos[3] then                                          // si manque de déterminisme et repos plateforme réalisée
    begin
      Form1.lblDurT.Caption:=intToStr(durT);
      indBloq:=(ind+trunc(qMemCyc[iMot].IMAX*90/100)) mod qMemCyc[iMot].IMAX;   // 10% avant événement, par index
{      TTimer(Form1.FindComponent('TimeAsser'+IntToStr(iMot+1))).Interval:=
        trunc((qMemCyc[iMot].IMAX*Form1.RSTimer1.Interval*90/100)-              // tempo de sauvegarde 10% avant, 90% après
              (durT/1000         *Form1.RSTimer1.Interval/2     ));             // compression temporelle
      TTimer(Form1.FindComponent('TimeAsser'+IntToStr(iMot+1))).Enabled:=true;  // => taille buffer 300 x 3ms
}
    end;
    if durT>1000000 then durT:=200000;                                          // évite le dépassement de capacité
    if existcard<>0 then
    begin
      _8136_P_Read(CARD0,ENC2+iMot,tabPom[iMot].cptCur);                        // Lecture 1 Encodeur Moteur/Variateur
      mes:=(tabPom[iMot].cptCur-tabPom[iMot].cptIni)*360.0/1024/32;             // Mesure angle manivelle
      mesAngleMoteur[iMot]:=mes-90;                                                // pour mesure angleCadreMobile par GLscene
      moyGlis[iMot].csg[moyGlis[iMot].cpt]:=cons[iMot];                         // mémo dernière consigne
      consMoy:=0;                                                               // init somme
      for i:=0 to 3 do consMoy:=consMoy+moyGlis[iMot].csg[i];                   // sommation
      consMoy:=consMoy/4;                                                       // moyenne
//      consMoy:=cons[iMot];                                                    // sans moyenne
{      consMoy:=(cons[iMot]+
                tTqMe[iif( ind =0           ,IMAX    -1,ind-1)].csg+
                tTqMe[iif((ind>=0)and(ind<2),IMAX-ind-1,ind-2)].csg+
                tTqMe[iif((ind>=0)and(ind<3),IMAX-ind-1,ind-3)].csg)/4;          // Moyenne glissante 4 points dans buffer cyclique
}
      ecr:=consMoy-mes;                                                          // Proportionnnelle
      pid[iMot].intg:=pid[iMot].intg+ecr;                                        // Intégrale
    end
    else
      ecr:=random(800)/100+0.8;                                                  // pas d'intégrale en mode simulation
    der:=ecr-pid[iMot].oldEc;
//    if Form1.ChkBoxPond.Checked if(DTIM/durT<1.2)and(DTIM/durT>0.8) then der:=der*DTIM/durT; end;  // pondération par la durée réelle du timer
{    form1.Caption:=inttostr(sea.cpt)+'  '+inttostr(durT)+'  '+
                   inttostr(tTqMe[iif(ind=0,IMAX-1,ind-1)].inter.qFin)+'  '+
                   inttostr(tTqMe[iif(ind=0,IMAX-1,ind-1)].inter.qDeb); }
    pid[iMot].oldEc:=ecr;                                                        // Dérivée
    corr:=ecr           *strtofloat(Form1.LblKP.Caption)+                        // Correction PID
          {pid[iMot].intg*strtofloat(Form1.LblKI.Caption)+}
          der           *strtofloat(Form1.LblKD.Caption);
    if not bFile[iMot] then
    begin
      tTqMe[ind].mes :=mes;
      tTqMe[ind].csg :=cons[iMot];
      tTqMe[ind].corr:=corr;
    end;
    if not bRepos[3] then                                                        // repos pas encore atteint
    begin
       if iMot=DR then for iM:=0 to 2 do bRepos[iM]:=false;                      // Raz 3 moteurs
       if abs(ecr)<0.1 then bRepos[iMot]:=true;                                  // repos d'un seul moteur
       if (iMot=GA) and bRepos[0] and bRepos[1] and bRepos[2] then               // 3 consécutifs
       begin
         bRepos[3]:=true;                                                        // position repos atteinte
         Form1.GroupBoxPlat.enabled:=true;                                       // autorisation pour les rampes
         Form1.btPom.Enabled:=false;
       end;
    end;
    if iMot=DR then                  // pour le moteur DROITE
    begin
      Form1.lblIntg.caption:=floatToStrf(pid[iMot].intg,fffixed,5,2);
      calcStatTempsReel(sea,abs(ecr));
      if sea.cpt mod 100 = 0 then
      begin
        Form1.LblStEctMes.caption:=floatToStrf(abs(ecr),fffixed,5,2)+'  ';
        Form1.LblStEctMoy.caption:=floatToStrf(sea.moy ,fffixed,5,3)+'  ';
        Form1.LblStEctSig.caption:=floatToStrf(sea.sig ,fffixed,5,2)+'  ';
        Form1.LblStEctMin.caption:=floatToStrf(sea.min ,fffixed,5,2)+'  ';
        Form1.LblStEctMax.caption:=floatToStrf(sea.max ,fffixed,5,2)+'  ';
      end;
      //if sea.max>0.01 then Form1.GaugeStEct.MaxValue:=round(sea.max*1000);
      if sea.moy>0.01 then Form1.GaugeStEct.MaxValue:=round(4*sea.moy*10);
      Form1.GaugeStEct.Progress:=round(abs(ecr)*10);                     // asser

      if durT div 1000>0 then calcStatTempsReel(sdt,durT/1000);          // durT>1ms ?
      if sdt.cpt mod 100 = 0 then
      begin
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
      _8136_A_Write_Varia(iMot,iif(mes=120.0,0.0,corr),tTqMe[iif(ind=0,IMAX-1,ind-1)].corr);                    // Sortie analogique
    queryPerformanceCounter(qAsserIntraFin);
    if not bFile[iMot] then
    begin
      tTqMe[ind].intra.qfin:=qAsserIntraFin;
      ind:=ind+1;
      if ind=indBloq then bloqueMemoTextFile(iMot,'Tempo');
    end;
  end;
  moyGlis[iMot].cpt:=moyGlis[iMot].cpt+1;
  if moyGlis[iMot].cpt=4 then moyGlis[iMot].cpt:=0;
end;
//==============================================================================
procedure paramTimeAsser(iMot: integer);
var tension:double;
begin

  if form1.CheckBoxAsser.Checked then
  begin
    consAsser[iMot]:=strtofloat(TLabeledEdit(form1.FindComponent('edtm'+IntToStr(iMot+1))).text);  // lit cons moteur
{    if (imot=GA) and form1.CheckBoxAsserDr.checked then
      asservHard(consAsser,iMot)                                        // asservissement hardware d'un moteur
    else
      _8136_A_Write_Varia(iMot,0.0);
    if (iMot=AR) or (iMot=DR) then asservHard(consAsser,iMot);          // asservissement hardware d'un moteur
}
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
      asservHard(consAsser,iMot)
  end
  else                                                                     // repositionnement "manuel" des moteurs
  begin
    with form1 do
    begin
      _8136_P_Read(CARD0,ENC2+iMot,tabPom[iMot].cptCur);
    //  Edit1.Text:=floattostrf((tabPom[iMot].cptCur-tabPom[iMot].cptIni)*360.0/1024,fffixed,5,1)+' °';         // angle moteur
      _8136_A_Write_Varia(iMot,IIF(Tbar16.Position=0,0,Tbar16.Position/10)); // DAC4 DIN100S.52 X3.3 Droite
      if Tbar16.Position<>0 then edCons.Text:=' cVit= '+FloatToStrf(Tbar16.Position/10,fffixed,5,3)+' V';
      _8136_A_Read_Potar(iMot,tension);                                  // ADC1 DB25.20 Potar Droite
      edMes.Text:=' mPot= '+FloatToStrf(tension,fffixed,5,3)+' V';
      LblEdtMes1.Text:=floattostrf((tabPom[iMot].cptCur-tabPom[iMot].cptIni)*360.0/1024/32,fffixed,5,3)+' °';   // angle manivelle
    end;
  end;
end;
//==============================================================================
procedure TForm1.RSTimer1Timer(Sender: TObject); begin paramTimeAsser(DR); end;
procedure TForm1.RSTimer2Timer(Sender: TObject); begin paramTimeAsser(AR); end;
procedure TForm1.RSTimer3Timer(Sender: TObject); begin paramTimeAsser(GA); end;
//==============================================================================
procedure TForm1.TimeAsserGl1Timer(Sender: TObject); begin paramTimeAsser(DR); end;
procedure TForm1.TimeAsserGl2Timer(Sender: TObject); begin paramTimeAsser(AR); end;
procedure TForm1.TimeAsserGl3Timer(Sender: TObject); begin paramTimeAsser(GA); end;
//==============================================================================
{procedure TForm1.TimeAsser1Timer(Sender: TObject); begin paramTimeAsser(DR); end;
procedure TForm1.TimeAsser2Timer(Sender: TObject); begin paramTimeAsser(AR); end;
procedure TForm1.TimeAsser3Timer(Sender: TObject); begin paramTimeAsser(GA); end;}
//==============================================================================
procedure paramTimeZeroPf(iMot: integer);   // zéro plateforme à 13.5°/s pour 0.5V => 8.332° => 617ms
var i:integer;
begin                                                                            // => 9.08°  => 670ms
  TTimer(Form1.FindComponent('TimeZeroPf'+IntToStr(iMot+1))).Enabled:=false;     // auto-arret
  qMemCyc[iMot].IMAX:=length(qMemCyc[iMot].tTqMe);qMemCyc[iMot].ind:=0;          // pour buffer cyclique
  qMemCyc[iMot].indBloq:=-1;
  for i:=0 to 3 do moyGlis[iMot].csg[i]:=
    strtofloat(TLabeledEdit(form1.FindComponent('edtm'+IntToStr(iMot+1))).text); // init de la moyenne glissante
   //qMemCyc[iMot].tTqMe[IMAX-1].corr:=                                // init pour détection dépassement consigne variateur
//  TTimer(Form1.FindComponent('TimeAsser'+IntToStr(iMot+1))).Enabled:=true;     //
//  TTimer(Form1.FindComponent('TimeAsserGl'+IntToStr(iMot+1))).Enabled:=true;   // bug ??
//  TTimer(Form1.FindComponent('RSTimer'+IntToStr(iMot+1))).Enabled:=true;       // çà marche pas, non reconnu
  if iMot=0 then Form1.RSTimer1.Enabled:=true;
  if iMot=1 then Form1.RSTimer2.Enabled:=true;
  if iMot=2 then Form1.RSTimer3.Enabled:=true;
end;
//==============================================================================
procedure TForm1.TimeZeroPf1Timer(Sender: TObject); begin paramTimeZeroPf(DR); end;
procedure TForm1.TimeZeroPf2Timer(Sender: TObject); begin paramTimeZeroPf(AR); end;
procedure TForm1.TimeZeroPf3Timer(Sender: TObject); begin paramTimeZeroPf(GA); end;
//==============================================================================
procedure paramTimeTopTour(iMot: integer);   // détection toptour (15.6ms mini)
begin
//  affDuree();                                                    // fin timer + affichage
//  queryPerformanceCounter(queryDeb);                             // deb timer
  _8136_P_Read_Latch_Value(CARD0,ENC2+iMot,tabPom[iMot].cptIni);
  _8136_A_Read_Potar(iMot,tabPom[iMot].uPotPos);                   // ADC1 DB25.20 Lecture Potar
  Form1.edMes.Text:=' mPot= '+FloatToStrf(tabPom[iMot].uPotPos,fffixed,5,3)+' V';
  if tabPom[iMot].cptIni<>0 then
  begin
    TTimer(Form1.FindComponent('TimeOut'    +IntToStr(iMot+1))).Enabled:=false; // arrêt timeOut
    TTimer(Form1.FindComponent('TimeTopTour'+IntToStr(iMot+1))).Enabled:=false; // auto-arret
    _8136_A_Write_Varia(iMot,0.5);                                              //
    TTimer(Form1.FindComponent('TimeZeroPf' +IntToStr(iMot+1))).Enabled:=true;  // affiche angle avec trackBar en consigne
    Form1.edCons.Text:=''+IntToStr(tabPom[iMot].cptIni)+' imp';
  end;
end;
//==============================================================================
procedure TForm1.TimeTopTour1Timer(Sender: TObject); begin paramTimeTopTour(DR); end; // prépositionnement avec potar(30ms)
procedure TForm1.TimeTopTour2Timer(Sender: TObject); begin paramTimeTopTour(AR); end; // prépositionnement avec potar(30ms)
procedure TForm1.TimeTopTour3Timer(Sender: TObject); begin paramTimeTopTour(GA); end; // prépositionnement avec potar(30ms)
//==============================================================================
procedure paramTimePosPot(iMot: integer);    // prépositionnement avec potar(30ms)
begin
  with tabPom[iMot] do
  begin
    _8136_A_Read_Potar(iMot,uPotPos);                               // ADC1 DB25.20 Lecture Potar
    Form1.edMes.Text:=' mPot= '+FloatToStrf(uPotPos,fffixed,5,3)+' V';
    if(abs(uVitCons)>0.1)or(not bMiCourse)then                      // si non proche du prépositionnement
      uVitCons:=uVitCons+uPas*IIF(bMiCourse,-1,1)
                             *IIF((uPotIni-uPotRef)>0,1,-1);        // courbe accélération en S vers réf:5V
//    if uVitCons> 10 then uVitCons:=10;
//    if uVitCons<-10 then uVitCons:=-10;
    if bMiCourse then
       Form1.edCons.Text:=FloatToStrf(abs(uPotPos-uPotRef),fffixed,5,2)+' V'
    else
       Form1.edCons.Text:=FloatToStrf(((uPotIni-uPotRef)/2-(uPotPos-uPotRef)),fffixed,5,2)+' V';
    if(abs((uPotIni-uPotRef)/2-(uPotPos-uPotRef))<0.05*abs(uVitCons))and(not bMiCourse)then   // détection mi-course
    begin
      bMiCourse:=true;
      Form1.edMes.Text:='m = '+FloatToStrf(((uPotIni-uPotRef)/2-(uPotPos-uPotRef)),fffixed,5,3)+
                         ', ' +FloatToStrf(0.05*uVitCons,fffixed,5,3);
    end;
    Form1.edCons.Text:=FloatToStrf(uVitCons,fffixed,5,3)+' V';
    _8136_A_Write_Varia(iMot,uVitCons);                            // DAC4 DIN100S.52 X3.3
    if(abs(uPotPos-uPotRef)<0.03)then                              // si vitesse faible et position atteinte
    begin
      TTimer(Form1.FindComponent('TimePosPot'+IntToStr(iMot+1))).Enabled:=false; // auto-arret
      _8136_A_Write_Varia(iMot,0.05);                              // DAC4 DIN100S.52 X3.3 Droite
      prepaRefCodeur(iMot);                                        // armement détection toptour codeur
      TTimer(Form1.FindComponent('TimeTopTour'+IntToStr(iMot+1))).Enabled:=true; // détection toptour
    end;
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
  bEnable:=false;Form1.btEnable.Caption:='out_Enable';                        // signalisation timeOut
  _8136_D_Output(CARD0,5,ARRET);                                             // DO6 DIN100S.70 X1.3 DISABLE
end;
//==============================================================================
procedure TForm1.TimeOut1Timer(Sender: TObject); begin paramTimeOut(DR); end; // prépositionnement avec potar(30ms)
procedure TForm1.TimeOut2Timer(Sender: TObject); begin paramTimeOut(AR); end; // prépositionnement avec potar(30ms)
procedure TForm1.TimeOut3Timer(Sender: TObject); begin paramTimeOut(GA); end; // prépositionnement avec potar(30ms)
//==============================================================================
procedure pomSeul(iMot:integer);
begin
  tabPom[iMot].bTrouve:=false;                                              // init de la recherche
  tabPom[iMot].bMiCourse:=false;                                            // init de la recherche
  tabPom[iMot].uPas:=0.02;                                                  // pas de tension entre appels timer
  tabPom[iMot].uPotRef:=5;                                                  // mi-course du potar
  tabPom[iMot].uVitCons:=0;                                                 // Cons moteur à 0
  _8136_A_Write_Varia(iMot,tabPom[iMot].uVitCons);                          // Moteur à l'arret
  _8136_A_Read_Potar (iMot,tabPom[iMot].uPotIni);                           // ADC1 DB25.20 Potar Droite
  TTimer(Form1.FindComponent('TimeOut'   +IntToStr(iMot+1))).Enabled:=true; // pour POM non trouvée
  TTimer(Form1.FindComponent('TimePosPot'+IntToStr(iMot+1))).Enabled:=true; // prépositionnement avec potar
end;
//==============================================================================
procedure initAsserv();     // initialisation compléte de l'asservissement
var i:integer;
begin
  initStatTempsReel(sdt);initStatTempsReel(sea);
  anglPomp:=0;pomp:=0;limiteur:=1;
  queryPerformanceFrequency(queryFreq);          // valeur fixe : 3 166 720 000 Hz
  bEnable:=false;                                // Enable variateur
  bRepos[3]:=false;                              // RAZ position globale repos plateforme
  _8136_initMultiFonct(true);                    // (30ms ou 1.9s si "_8136_A_Initial")
  if existcard<>0 then
  begin
//  _8136_D_OutputA(CARD0,0);                    // marche de DO1 à DO7 DIN100S.12,62,16,66,20,70 et 58
    _8136_D_OutputA(CARD0,127);                  // arret de DO1 à DO7 DIN100S.12,62,16,66,20,70 et 58
    _8136_A_Write_Volt(CARD0,CH0,10);            // DAC1 alim3Potars DB25.18
    _8136_D_Output(CARD0,6,MARCHE); // DO7 DIN100S.58 avec platine inversion
    _8136_D_Output(CARD0,1,MARCHE); // DO7 DIN100S.58 avec platine inversion
    _8136_D_Output(CARD0,3,MARCHE); // DO7 DIN100S.58 avec platine inversion
    _8136_D_Output(CARD0,6,ARRET); // DO7 DIN100S.58 avec platine inversion
    _8136_D_Output(CARD0,1,ARRET); // DO7 DIN100S.58 avec platine inversion
    _8136_D_Output(CARD0,3,ARRET); // DO7 DIN100S.58 avec platine inversion
  //    GroupBoxPlat.enabled:=false;                 // interdiction pour les rampes tant que pas position repos plate-forme de chaque moteur
//    sleep(200);_8136_A_Read_Potar(CH2,tens);     // ADC1 DB25.20 Potar Droite pour règlage d'offset des sorties ana
  end;
  for i:=0 to 2 do
  begin
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
//  _8136_S_INT_Control(CARD0,0);                   //  Désactivation de l'interruption MAtériel
//  _8136_INT_Disable(CARD0);                       //  Désactivation des interruptions Windows
  _8136_S_Close(CARD0);                             //  Ferme la PCI-8136
  Close();                                          //  sort du programme
end;
//==============================================================================
procedure TForm1.btEnableClick(Sender: TObject);
var iM:integer;
begin
  bEnable:=not(bEnable);
  btEnable.Caption:=IIF(bEnable,'Disable','Enable');
  for iM:=0 to 2 do _8136_A_Write_Varia(iM,0.1);       // vitesse faible
  _8136_D_Output(CARD0,5,IIF(bEnable,MARCHE,ARRET)); // DO6 DIN100S.70 X1.3 ENABLE avec relais
{ _8136_D_Output(CARD0,6,IIF(bEnable,MARCHE,ARRET)); // DO7 DIN100S.58 avec platine inversion
  _8136_D_Output(CARD0,1,IIF(bEnable,MARCHE,ARRET)); // DO2 DIN100S.62 avec platine inversion
  _8136_D_Output(CARD0,3,IIF(bEnable,MARCHE,ARRET)); // DO4 DIN100S.66 avec platine inversion
  _8136_D_Output(CARD0,0,IIF(bEnable,MARCHE,ARRET)); // DO1 DIN100S.12 sans platine
  _8136_D_Output(CARD0,2,IIF(bEnable,MARCHE,ARRET)); // DO3 DIN100S.16 sans platine
  _8136_D_Output(CARD0,4,IIF(bEnable,MARCHE,ARRET)); // DO5 DIN100S.20 sans platine
  if bEnable then prepaRefCodeur(0);
  TimeTopTour1.Enabled:=bEnable;}
end;
//==============================================================================
procedure TForm1.btPomClick(Sender: TObject);
var iM:integer;
begin
  bEnable:=true;                                            // enable Variateur
  btEnable.Caption:=IIF(bEnable,'Disable','Enable');
  _8136_D_Output(CARD0,5,MARCHE);                          // DO6 DIN100S.70 X1.3 ENABLE variateur
  for iM:=0 to 2 do pomSeul(iM);
{  for iM:=1 to 2 do
  begin
    _8136_P_Clear(CARD0,ENC2+iM);                           // RaZ compteur du codeur
    tabPom[iM].cptIni:=0;                                   // fausse POM
    _8136_A_Write_Varia(iM,0);                               // Moteur à l'arret
    TTimer(Form1.FindComponent('TimeAsser'+IntToStr(iM+1))).Enabled:=true;
  end;}
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
procedure UpdateGraphicbielle(const body : PNewtonBody ; const matrix : NewtonImport.PFloat) ; cdecl;
var
  glObj : TGLBaseSceneObject ;
begin
  glObj := TGLBaseSceneObject(NewtonBodyGetUserData(body)) ;
  glObj.matrix := pMatrix(matrix)^ ;
  globj.Scale.X:=0.01*maniv/0.12;
  globj.Scale.y:=0.01*maniv/0.12;
  globj.Scale.z:=0.01*maniv/0.12;
end ;
//==============================================================================================
procedure UpdateGraphicmanivelle(const body : PNewtonBody ; const matrix : NewtonImport.PFloat) ; cdecl;
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
  globj.Scale.X:=0.01*max(L1,L2)/0.25;globj.Scale.y:=0.01*L3/0.25;globj.Scale.z:=0.01;
end ;
//==============================================================================================
procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GLCadencer1.Enabled:= False;
  GLSceneViewer1.Buffer.DestroyRC;
end;
//==============================================================================================
procedure TForm1.GLSceneViewer1PostRender(Sender: TObject);
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
procedure mesureDAngleCadreMobile();
var
  vPltFrm,vTang,vRoul:TVector3d;//TAffineVector;
  angTang,angRoul:double;
  const XdVector:TVector3d=(1, 0, 0);
  const YdVector:TVector3d=(0, 1, 0);
begin
  vPltFrm[0]:=Form1.Bplateforme.Direction.X;
  vPltFrm[1]:=Form1.Bplateforme.Direction.Y;
  vPltFrm[2]:=Form1.Bplateforme.Direction.Z;
//  vPltFrm[0]:=sqrt(2)/2;
//  vPltFrm[1]:=sqrt(2)/2;
//  vPltFrm[2]:=0;
  vTang:=VectorCrossProduct(vPltFrm,XdVector);
  angTang:=sqrt(vTang[0]*vTang[0])+sqrt(vTang[1]*vTang[1])+sqrt(vTang[2]*vTang[2]);
  if angTang> 1 then angTang:=1;
  if angTang<-1 then angTang:=-1;
  angTang:=(90-arcsin(angTang)*180/PI)*sign(vPltFrm[0]);
  Form1.LblMesTang.Caption:=floattostrf(angTang,fffixed,5,2);
  vRoul:=VectorCrossProduct(vPltFrm,YdVector);
  angRoul:=sqrt(vRoul[0]*vRoul[0])+sqrt(vRoul[1]*vRoul[1])+sqrt(vRoul[2]*vRoul[2]);
  if angRoul> 1 then angRoul:=1;
  if angRoul<-1 then angRoul:=-1;
  angRoul:=(90-arcsin(angRoul)*180/PI)*sign(vPltFrm[1]*-1);
  Form1.LblMesRoul.Caption:=floattostrf(angRoul,fffixed,5,2);            // OK avec incertitudes des liaisons
end;
//==============================================================================================
procedure mesureAngleCadreMobile();
var
  vPltFrm,vTang,vRoul:TAffineVector;
  angTang,angRoul:double;
begin
  vPltFrm[0]:=Form1.Bplateforme.Direction.X;
  vPltFrm[1]:=Form1.Bplateforme.Direction.Y;
  vPltFrm[2]:=Form1.Bplateforme.Direction.Z;
//  vPltFrm[0]:=sqrt(2)/2;
//  vPltFrm[1]:=sqrt(2)/2;
//  vPltFrm[2]:=0;
  vTang:=VectorCrossProduct(vPltFrm,XVector);
  angTang:=vectorlength(vTang);
  angTang:=(90-arcsin(angTang)*180/PI)*sign(vPltFrm[0]);
  Form1.LblMesTang.Caption:=floattostrf(angTang,fffixed,5,2);
  vRoul:=VectorCrossProduct(vPltFrm,YVector);
  angRoul:=vectorlength(vRoul);
  angRoul:=(90-arcsin(angRoul)*180/PI)*sign(vPltFrm[1]*-1);
  Form1.LblMesRoul.Caption:=floattostrf(angRoul,fffixed,5,2);            // OK avec incertitudes des liaisons
end;
//==============================================================================================
procedure TForm1.GLCadencer1Progress(Sender:TObject;const deltaTime,newTime:Double);
var
  i:integer;
  m1,m2,m3:array[0..9] of single;
begin
  if checkbox3.Checked then
  begin
    tactive1:=tactive1+sgn1*vitRampeTang*Tbar15.Position/200;
    if tactive1>Tbar14.Position/100* 25 then sgn1:=-1;
    if tactive1<Tbar14.Position/100*-25 then sgn1:=1;
    edtthe.text:=floattostrf(tactive1,fffixed,5,2) // avec l'angle en réel
//  trackbar4.position:=round(tactive1) ;        // uniquement entier
  end;
  if checkbox4.Checked then
  begin
    tactive2:=tactive2+sgn2*vitRampeRoul*Tbar13.Position/200;
    if tactive2>Tbar12.Position/100* 25 then sgn2:=-1;
    if tactive2<Tbar12.Position/100*-25 then sgn2:=1;
    edtphi.text:=floattostrf(tactive2,fffixed,5,2)
//  trackbar5.position:=round(tactive2) ;
  end;
  anglPomp:=anglPomp+Tbar11.Position/200*20;
  if anglPomp>=360 then anglPomp:=0;
  pomp:=sin(anglPomp*pi/180)*Tbar10.Position/100*0.05;
{       +sin(anglPomp*pi/180*2)*Tbar10.Position/100*0.02+
       +sin(anglPomp*pi/180*4)*Tbar10.Position/100*0.01;}
//caption:=floattostr(deltatime); NewtonWorldForEachBodyDo(FNewtonWorld, @numericaldamping) ;
  NewtonUpdate(FNewtonWorld,0.01);
  mesureAngleCadreMobile();
  Bressort.Scale.Z:=(Bpiston.Position.Z-hressort{0.325}-0.057)/0.225;
//  form1.caption:=floattostr(Bpiston.Position.Z);
  edtf1.Text:=floattostrf(F_moteur[0],fffixed,5,2);   // affichage des couples
  edtf2.Text:=floattostrf(F_moteur[1],fffixed,5,2);
  edtf3.Text:=floattostrf(F_moteur[2],fffixed,5,2);//  g:=0;
  for i:=0 to 8 do begin m1[i]:=m1[i+1]; end;  //  g:=g+m2[i];
  m1[9]:=abs(F_moteur[0]);                     //  g:=g+m1[9];  g:=g/10;  gauge1.Progress:=round(g);
  gauge1.Progress:=round(abs(F_moteur[0]));    //  g:=0;
  for i:=0 to 8 do begin m2[i]:=m2[i+1]; end;  //  g:=g+m2[i];
  m2[9]:=abs(F_moteur[1]);                     //  g:=g+m2[9];  g:=g/10;  gauge2.Progress:=round(g);
  gauge2.Progress:=round(abs(F_moteur[1]));    //  g:=0;
  for i:=0 to 8 do begin m3[i]:=m3[i+1];  end; //  g:=g+m3[i];
  m3[9]:=abs(F_moteur[2]);                     //  g:=g+m3[9];  g:=g/10;  gauge3.Progress:=round(g);
  gauge3.Progress:=round(abs(F_moteur[2]));
end;
//==============================================================================================
procedure bielle_proc0(const aJoint: PNewtonJoint); cdecl;
const
  Minangle=-15/180*pi;
  Maxangle=15/180*pi;
var
  mPosition0,mPosition1  : TVector3f;
  q0,q1: TVector3f;
  bielle_front,bielle_up,bielle_right:TVector3f;
  angle: single;
  relAngle: single;
  sinAngle: single;
  cosAngle: single;
begin
  mposition1:=Rel2abspoint(Form1.bielle[0],affinevectormake(0,0,0));
  mposition0:=affinevectormake(L1+0.03,0,0.17);

  bielle_front:=Rel2absvector(Form1.bielle[0],affinevectormake(1.0,0.0,0.0));
  bielle_right:=Rel2absvector(Form1.bielle[0],affinevectormake(0.0,1.0,0.0));
  bielle_up:=Rel2absvector(Form1.bielle[0],affinevectormake(0.0,0.0,1.0));
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

  relAngle:=angle-iif(form1.CheckBoxAsser.Checked,mesAngleMoteur[1],consAngleMoteur[1])*pi/180;
  NewtonUserJointAddAngularRow(ajoint,-relAngle, @bielle_front );
  F_moteur[1]:=NewtonUserJointGetRowForce(aJoint,5);
  NewtonUserJointSetRowStiffness(ajoint, 10);
end;
//==============================================================================================
procedure bielle_proc1(const aJoint: PNewtonJoint); cdecl;
const
  Minangle=-15/180*pi;
  Maxangle=15/180*pi;
var
  mPosition0,mPosition1  : TVector3f;
  q0,q1: TVector3f;
  bielle_front,bielle_up,bielle_right:TVector3f;
  angle: single;
  relAngle: single;
  sinAngle: single;
  cosAngle: single;
begin

  mposition1:=Rel2abspoint(Form1.bielle[1],affinevectormake(0,0,0));
  mposition0:=affinevectormake(-L2+0.03,-L3,0.17);

  bielle_front:=Rel2absvector(Form1.bielle[1],affinevectormake(1.0,0.0,0.0));
  bielle_right:=Rel2absvector(Form1.bielle[1],affinevectormake(0.0,1.0,0.0));
  bielle_up:=Rel2absvector(Form1.bielle[1],affinevectormake(0.0,0.0,1.0));
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

  relAngle:=angle-iif(form1.CheckBoxAsser.Checked,mesAngleMoteur[2],consAngleMoteur[2])*pi/180;
  NewtonUserJointAddAngularRow(ajoint,-relAngle, @bielle_front );
  F_moteur[2]:=NewtonUserJointGetRowForce(aJoint,5);
  NewtonUserJointSetRowStiffness(ajoint, 10);
end;
//==============================================================================================
procedure bielle_proc2(const aJoint: PNewtonJoint); cdecl;
const
  Minangle=-15/180*pi;
  Maxangle=15/180*pi;
var
  mPosition0,mPosition1  : TVector3f;
  q0,q1: TVector3f;
  bielle_front,bielle_up,bielle_right:TVector3f;
  angle: single;
  relAngle: single;
  sinAngle: single;
  cosAngle: single;
begin

  mposition1:=Rel2abspoint(Form1.bielle[2],affinevectormake(0,0,0));
  mposition0:=affinevectormake(-L2+0.03,L3,0.17);

  bielle_front:=Rel2absvector(Form1.bielle[2],affinevectormake(1.0,0.0,0.0));
  bielle_right:=Rel2absvector(Form1.bielle[2],affinevectormake(0.0,1.0,0.0));
  bielle_up:=Rel2absvector(Form1.bielle[2],affinevectormake(0.0,0.0,1.0));
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

  relAngle:=angle-iif(form1.CheckBoxAsser.Checked,mesAngleMoteur[0],consAngleMoteur[0])*pi/180;
  NewtonUserJointAddAngularRow(ajoint,-relAngle, @bielle_front );
  F_moteur[0]:=NewtonUserJointGetRowForce(aJoint,5);
  NewtonUserJointSetRowStiffness(ajoint, 10);
end;
//==============================================================================================
procedure manivelle_proc0(const aJoint: PNewtonJoint); cdecl;
const
  Minangle=-15/180*pi;
  Maxangle=15/180*pi;
var
  mPosition0,mPosition1  : TVector3f;
//  q0,q1: TVector3f;
  manivelle_front,manivelle_up,manivelle_right:TVector3f;
//  angle,relAngle,sinAngle,cosAngle: single;
begin
  mposition1:=Rel2abspoint(Form1.manivelle[0],affinevectormake(    0,0,0    ));
  mposition0:=Rel2abspoint(Form1.bielle   [0],affinevectormake(-0.03,0,maniv));
  manivelle_front:=Rel2absvector(Form1.manivelle[0],affinevectormake(1.0,0.0,0.0));
  manivelle_right:=Rel2absvector(Form1.manivelle[0],affinevectormake(0.0,1.0,0.0));
  manivelle_up   :=Rel2absvector(Form1.manivelle[0],affinevectormake(0.0,0.0,1.0));
  NewtonUserJointAddLinearRow (ajoint, @mPosition1, @mPosition0, @manivelle_front);
  NewtonUserJointAddLinearRow (ajoint, @mPosition1, @mPosition0, @manivelle_right);
  NewtonUserJointAddLinearRow (ajoint, @mPosition1, @mPosition0, @manivelle_up);
end;
//==============================================================================================
procedure manivelle_proc1(const aJoint: PNewtonJoint); cdecl;
const
  Minangle=-15/180*pi;
  Maxangle=15/180*pi;
var
  mPosition0,mPosition1  : TVector3f;
//  q0,q1: TVector3f;
  manivelle_front,manivelle_up,manivelle_right:TVector3f;
//  angle,relAngle,sinAngle,cosAngle: single;
begin
  mposition1:=Rel2abspoint(Form1.manivelle[1],affinevectormake(0,0,0));
  mposition0:=Rel2abspoint(Form1.bielle   [1],affinevectormake(-0.03,0,maniv));
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
  Minangle=-15/180*pi;
  Maxangle=15/180*pi;
var
  mPosition0,mPosition1  : TVector3f;
//  q0,q1: TVector3f;
  manivelle_front,manivelle_up,manivelle_right:TVector3f;
//  angle,relAngle,sinAngle,cosAngle: single;
begin
  mposition1:=Rel2abspoint(Form1.manivelle[2],affinevectormake(0,0,0));
  mposition0:=Rel2abspoint(Form1.bielle   [2],affinevectormake(-0.03,0,maniv));
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
  max=1.5;
  min=0;
  jeu=0.01;
var
  v:single;
  pin0,pin1,pin2,mPositiona0,mPositiona1,mPositionb0,mPositionb1,mPositionc0,mPositionc1 : TVector3f;
  v1,v2,piston_fixe_up  : TVector3f;
begin
  piston_fixe_up:=rel2absvector(form1.piston,affinevectormake(0,0,1));

  v1:=Rel2abspoint(form1.piston,affinevectormake(0,0,0));
  v2:=affinevectormake(0,0,0);
  v:=vectordotproduct(vectorsubtract(v1,v2),piston_fixe_up);

  mpositiona0:=affinevectormake(0,0,v);
  mpositiona1:=Rel2abspoint(form1.piston,affinevectormake(0,0,0));
  mpositionb0:=affinevectormake(0,0,15+v);
  mpositionb1:=Rel2abspoint(form1.piston,affinevectormake(0,0,15));
  mpositionc0:=affinevectormake(0,15,v);
  mpositionc1:=Rel2abspoint(form1.piston,affinevectormake(0,15,0));
  pin0 := affinevectormake(1.0,0.0,0.0);
  pin1 := affinevectormake(0.0,1.0,0.0);
  pin2 := affinevectormake(0.0,0.0,1.0);
  NewtonUserJointAddLinearRow (ajoint, @mPositiona1, @mPositiona0, @pin0);
  NewtonUserJointAddLinearRow (ajoint, @mPositiona1, @mPositiona0, @pin1);
  NewtonUserJointAddLinearRow (ajoint, @mPositionb1, @mPositionb0, @pin0);
  NewtonUserJointAddLinearRow (ajoint, @mPositionb1, @mPositionb0, @pin1);
  NewtonUserJointAddLinearRow (ajoint, @mPositionc1, @mPositionc0, @pin0);

//  mpositiona0:=affinevectormake(0,0,MaxUpDownControl);
//  NewtonUserJointAddLinearRow (ajoint, @mPositiona1, @mPositiona0, @pin2);

end;
//==============================================================================================
procedure cardan1(const aJoint: PNewtonJoint); cdecl;
const
  Minangle=-15/180*pi;
  Maxangle=15/180*pi;
var
  mPosition0,mPosition1  : TVector3f;
  q0,q1: TVector3f;
  axe_cardan_front,axe_cardan_right,piston_front,piston_right,piston_up:TVector3f;
//  axe_cardan_up:TVector3f;
//  angle,relAngle,sinAngle,cosAngle: single;
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
//  sinAngle:= VectorDotProduct( axe_cardan_right, VectorCrossProduct( axe_cardan_front, piston_front ) );
//  cosAngle:= VectorDotProduct( axe_cardan_front, piston_front );
//  angle:=- ArcTan2( sinAngle, cosAngle );
//  relAngle:= angle - param*pi/180;
//  NewtonUserJointAddAngularRow(ajoint,-relAngle, @axe_cardan_right );
//  NewtonUserJointSetRowStiffness(ajoint, 1);
end;
//==============================================================================================
procedure cardan2(const aJoint: PNewtonJoint); cdecl;
const
  Minangle=-15/180*pi;
  Maxangle=15/180*pi;
var
  mPosition0,mPosition1  : TVector3f;
  q0,q1: TVector3f;
  axe_cardan_front,axe_cardan_up,axe_cardan_right,plateforme_front,plateforme_right:TVector3f;
//  plateforme_up:TVector3f;
// angle,relAngle,sinAngle,cosAngle: single;
begin
  mposition1:=Rel2abspoint(Form1.plateforme,affinevectormake(0,0,0));
  mposition0:=Rel2abspoint(Form1.axe_cardan,affinevectormake(0,0,0));
  axe_cardan_front:=Rel2absvector(Form1.axe_cardan,affinevectormake(1.0,0.0,0.0));
  axe_cardan_right:=Rel2absvector(Form1.axe_cardan,affinevectormake(0.0,1.0,0.0));
  axe_cardan_up:=Rel2absvector(Form1.axe_cardan,affinevectormake(0.0,0.0,1.0));
  plateforme_front:=Rel2absvector(Form1.plateforme,affinevectormake(1.0,0.0,0.0));
  plateforme_right:=Rel2absvector(Form1.plateforme,affinevectormake(0.0,1.0,0.0));
  NewtonUserJointAddLinearRow (ajoint, @mPosition1, @mPosition0, @axe_cardan_front);
  NewtonUserJointAddLinearRow (ajoint, @mPosition1, @mPosition0, @axe_cardan_right);
  NewtonUserJointAddLinearRow (ajoint, @mPosition1, @mPosition0, @axe_cardan_up);
  q0:= VectorAdd( mposition0, VectorScale(axe_cardan_front, 10 ) );
  q1:= VectorAdd( mposition1, VectorScale(plateforme_front, 10 ) );
  NewtonUserJointAddLinearRow(ajoint, @q1, @q0,@axe_cardan_right );
  NewtonUserJointAddLinearRow(ajoint, @q1, @q0,@axe_cardan_up );
//  sinAngle:= VectorDotProduct( plateforme_front, VectorCrossProduct( plateforme_right, axe_cardan_right ) );
//  cosAngle:= VectorDotProduct( plateforme_right, axe_cardan_right );
//  angle:=- ArcTan2( sinAngle, cosAngle );
//  relAngle:= angle - param2*pi/180;
//  NewtonUserJointAddAngularRow(ajoint,-relAngle, @plateforme_front );
//  NewtonUserJointSetRowStiffness(ajoint, 1);
end;
//==============================================================================================
procedure rotule1(const aJoint: PNewtonJoint); cdecl;
const
  Minangle=-15/180*pi;
  Maxangle=15/180*pi;
var
  mPosition0,mPosition1  : TVector3f;
//  q0,q1: TVector3f;
  manivelle_front,manivelle_up,manivelle_right:TVector3f;
//  angle,relAngle,sinAngle,cosAngle: single;
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
  Minangle=-15/180*pi;
  Maxangle=15/180*pi;
var
  mPosition0,mPosition1  : TVector3f;
//  q0,q1: TVector3f;
  manivelle_front,manivelle_up,manivelle_right:TVector3f;
//  angle,relAngle,sinAngle,cosAngle: single;
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
  maniv       :=DATA_INI.READFLOAT('GEOMETRIE' ,'manivelle',0.12);    // en m
  m_base      :=DATA_INI.READFLOAT('MASSE'     ,'masse'    ,400);     // en Kg
  ixx_base    :=DATA_INI.READFLOAT('MASSE'     ,'Ixx'      ,32);
  iyy_base    :=DATA_INI.READFLOAT('MASSE'     ,'Iyy'      ,32);
  izz_base    :=DATA_INI.READFLOAT('MASSE'     ,'Izz'      ,65);
  max_gauge   :=DATA_INI.READFLOAT('SIMULATION','max_gauge',300);     // en mN
  vitRampeRoul:=DATA_INI.READFLOAT('SIMULATION','vit_rampe_roul',0.3);
  vitRampeTang:=DATA_INI.READFLOAT('SIMULATION','vit_rampe_tang',0.3);

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

  for i:=0 to 2 do
  begin
    Mmoteur:=TGlMateriallibrary.Create(self);
    Bmoteur[i]:=TGLFreeform(GLDummyCube1.AddNewChild(TGLFreeform));
    Bmoteur[i].Scale.x:=0.01;Bmoteur[i].Scale.y:=0.01;Bmoteur[i].Scale.z:=0.01;
    LoadFrommesh('objet3d\moteur.3d',Bmoteur[i],Mmoteur);
  end;
  Bmoteur[0].position.setpoint( L1+0.03,  0,0.17);
  Bmoteur[1].position.setpoint(-L2+0.03, L3,0.17);
  Bmoteur[2].position.setpoint(-L2+0.03,-L3,0.17);

  for i:=0 to 2 do
  begin
    Mbielle[i]:=TGlMateriallibrary.Create(self);
    Bbielle[i]:=TGLFreeform(GLDummyCube1.AddNewChild(TGLFreeform));
    LoadFrommesh('objet3d\bielle.3d',Bbielle[i],Mbielle[i]);
    Bbielle[i].Position.x:=0.1;Bbielle[i].Position.y:=0.1*i;Bbielle[i].Position.Z:=0.3;
    m:=matrixmultiply(createrotationmatrixy(pi/2),createtranslationmatrix(affinevectormake(0,0,0.06)));
    collision := NewtonCreateCylinder(FNewtonworld, 0.01,0.1, @m) ;
    bielle[i] := NewtonCreateBody(FNewtonworld, collision) ;
    NewtonReleaseCollision(FNewtonworld, collision) ;
    Newtonbodysetmassmatrix(bielle[i],0.5,1,1,1);
    m:=createtranslationmatrix(affinevectormake(0.25+0.03,0.1*i,0.5));
    NewtonBodySetMatrix(bielle[i],@m) ;
    NewtonBodySetUserData(bielle[i], Bbielle[i]) ;
    NewtonBodySetTransformCallback(bielle[i], UpdateGraphicbielle) ;
    NewtonBodySetForceAndTorqueCallback(bielle[i], applygravity) ;
    NewtonBodySetAutoFreeze(bielle[i],0);
  end;
  JBielle[0]:=NewtonConstraintCreateUserJoint(FNewtonworld,6,@bielle_proc0,bielle[0],Base);NewtonjointsetUserData(JBielle[0],self);
  JBielle[1]:=NewtonConstraintCreateUserJoint(FNewtonworld,6,@bielle_proc1,bielle[1],Base);NewtonjointsetUserData(JBielle[1],self);
  JBielle[2]:=NewtonConstraintCreateUserJoint(FNewtonworld,6,@bielle_proc2,bielle[2],Base);NewtonjointsetUserData(JBielle[2],self);

  for i:=0 to 2 do
  begin
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
    NewtonBodySetTransformCallback(manivelle[i], UpdateGraphicmanivelle) ;
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
//  Newtonbodysetmassmatrix(plateforme,400,32,32,65);
  m:=createtranslationmatrix(affinevectormake(0,0,2));
  NewtonBodySetMatrix(plateforme,@m) ;
  NewtonBodySetUserData(plateforme, Bplateforme) ;
  NewtonBodySetTransformCallback(plateforme, UpdateGraphicplateforme) ;
  NewtonBodySetForceAndTorqueCallback(plateforme, applygravity) ;
  NewtonBodySetAutoFreeze(plateforme,0);
  Jplateforme[0]:=NewtonConstraintCreateUserJoint(FNewtonworld,6,@cardan2,plateforme,axe_cardan);NewtonjointsetUserData(Jplateforme[0],self);
(*  for i:=0 to 2 do
  begin
    Jplateforme[i+1]:=NewtonConstraintCreateUserJoint(FNewtonworld,6,@rotule,plateforme,manivelle[i]);
    NewtonjointsetUserData(Jplateforme[i+1],self);
  end;*)
  Jplateforme[1]:=NewtonConstraintCreateUserJoint(FNewtonworld,6,@rotule1,plateforme,manivelle[0]);NewtonjointsetUserData(Jplateforme[1],self);
  Jplateforme[2]:=NewtonConstraintCreateUserJoint(FNewtonworld,6,@rotule2,plateforme,manivelle[1]);NewtonjointsetUserData(Jplateforme[2],self);
  Jplateforme[3]:=NewtonConstraintCreateUserJoint(FNewtonworld,6,@rotule3,plateforme,manivelle[2]);NewtonjointsetUserData(Jplateforme[3],self);

  Mfix1:=TGlMateriallibrary.Create(self);Bfix1:=TGLFreeform(Bplateforme.AddNewChild(TGLFreeform));LoadFrommesh('objet3d\fixation.3d',Bfix1,Mfix1);
  Mfix2:=TGlMateriallibrary.Create(self);Bfix2:=TGLFreeform(Bplateforme.AddNewChild(TGLFreeform));LoadFrommesh('objet3d\fixation.3d',Bfix2,Mfix2);
  Mfix3:=TGlMateriallibrary.Create(self);Bfix3:=TGLFreeform(Bplateforme.AddNewChild(TGLFreeform));LoadFrommesh('objet3d\fixation.3d',Bfix3,Mfix3);

  Bfix1.Position.x:= L1*100*0.25/max(L1,L2);Bfix1.Position.y:=0;
  Bfix2.Position.x:=-L2*100*0.25/max(L1,L2);Bfix2.Position.y:=-L3*100*0.25/L3;
  Bfix3.Position.x:=-L2*100*0.25/max(L1,L2);Bfix3.Position.y:= L3*100*0.25/L3;

  NewtonWorldForEachBodyDo(FNewtonWorld, @numericaldamping) ;
  edtm1.text:=inttostr(Tbar1.Position);  // active la position initiale du trackbar
  edtm2.text:=inttostr(Tbar2.Position);
  edtm3.text:=inttostr(Tbar3.Position);
  edtdz.text:=floattostr(Tbar6.Position/1000);

  TBarKPChange(nil);
  TBarKIChange(nil);
  TBarKDChange(nil);

  if Assigned(glCamera1) then glCamera1.AdjustDistanceToTarget(1);

  initAsserv();
end;
//==============================================================================================
//  voir le fichier "étudeCinématique.doc" : auteur Pierre Lemerle
function asserv(var ang:dblDrArGa; dzl:single):boolean;
var
  v:array[0..2] of tvector3f;
  bielV,xN,yN,xP,yP,xQ,yQ:dblDrArGa;
  iM:integer;               // index des moteurs
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
  bielV[AR]:=sqrt(sqr(biel)-sqr(L1-v[AR][0]));              // projection de la bielle sur le plan vertical
  bielV[GA]:=sqrt(sqr(biel)-sqr(L2+v[GA][0]));
  xN[DR]:=v[DR][1]-L3;xN[AR]:=v[AR][1];xN[GA]:=v[GA][1]+L3; // y plateau => x centré plan vertical
  yN[DR]:=v[DR][2];   yN[AR]:=v[AR][2];yN[GA]:=v[GA][2];    // z plateau => y plan vertical
  for iM:=0 to 2 do                                         // index Moteur
  begin
    a:=2*xN[iM];                                                             // voir "intersection2cercles.pdf"
    b:=2*yN[iM];
    c:=sqr(xN[iM])+sqr(yN[iM])-sqr(bielV[iM])+sqr(maniv);
    delta:=sqr(2*a*c)-4*(sqr(a)+sqr(b))*(sqr(c)-sqr(b)*sqr(maniv));
    if delta>0 then                                                          // si intersection
    begin
      xP[iM]:=(2*A*C-sqrt(delta))/2/(sqr(a)+sqr(b)); yP[iM]:=(C-A*xP[iM])/B; // point P
      xQ[iM]:=(2*A*C+sqrt(delta))/2/(sqr(a)+sqr(b)); yQ[iM]:=(C-A*xQ[iM])/B; // point Q
      ang[iM]:=180/pi*ARctan(yP[iM]/abs(xP[iM]));          // bielle à droite du moteur
//      if iM<>2 then ang[iM]:=    180/pi*ARctan(yP[iM]/abs(xP[iM]));          // bielle à droite du moteur
//      if iM=2  then ang[iM]:=180-180/pi*ARctan(yQ[iM]/abs(xQ[iM]));          // bielle à gauche du moteur
//      asservHard(ang,iM);           // asservissement hardware d'un moteur, çà marche pas ici (pas de déterminisme), voir timer
    end
    else
      calc:=false;                        // un seul moteur non calculé suffit
  end;
  if Form1.ChkLim.Checked then
  begin
    limiteur:=iif(calc,limiteur/0.995,limiteur*0.995);
    if limiteur>1 then limiteur:=1;
    calcStatTempsReel(slm,limiteur);
  end;
  asserv:=calc;
end;
//==============================================================================================
procedure TForm1.ChkLimClick(Sender: TObject); begin if ChkLim.Checked then initStatTempsReel(slm); end;
//==============================================================================================
procedure afficheAngleMoteur(ang:dblDrArGa);
var iM:integer;
begin
  for iM:=0 to 2 do
  begin
    if ang[iM]> 82 then ang[iM]:= 82;      // évite les oscillations manivelles hautes
    if ang[iM]<-82 then ang[iM]:=-82;      // évite les oscillations manivelles basses
    consAngleMoteur[iM]:=ang[iM]-90;
    TLabeledEdit(form1.FindComponent('edtm'+IntToStr(iM+1))).Text:=floattostrf(ang[iM],fffixed,5,3);
  end;
end;
//==============================================================================================
procedure TForm1.edtTheChange(Sender: TObject);
var
  pente:single;
  angle:dblDrArGa;
  const AMAX:single=23;const H0:single=0.38;const HMIN:single=0.261;
begin
  try the:=limiteur*strtofloat(edtthe.text); except end;
  try phi:=limiteur*strtofloat(edtphi.text); except end;
  if chkMiCourseAuto.Checked then
  begin
    pente:=((AMAX-abs(phi)/2)*(H0-HMIN)/AMAX+HMIN-H0)/(AMAX-abs(phi)/2); // voir fichier "vitesseAccélérationMoteurs.xlsx"
    dz:=(pente*the)*Tbar7.Position/100+H0;                               // avec mi-course proportionnelle
    if checkbox1.Checked then dz:=dZ+pomp;                               // ajout du pompage
    Tbar6.Position:=round(1000*dz);
  end;
  if asserv(angle,dz) then afficheAngleMoteur(angle);
  if slm.cpt mod 100 = 0 then
  begin
    Form1.LblStLimMes.caption:=floatToStrf(limiteur,fffixed,5,2)+'  ';
    Form1.LblStLimMoy.caption:=floatToStrf(slm.moy ,fffixed,5,3)+'  ';
    Form1.LblStLimSig.caption:=floatToStrf(slm.sig ,fffixed,5,2)+'  ';
    Form1.LblStLimMin.caption:=floatToStrf(slm.min ,fffixed,5,2)+'  ';
    Form1.LblStLimMax.caption:=floatToStrf(slm.max ,fffixed,5,2)+'  ';
  end;
end;
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
  if Result = JOYERR_NOERROR then                              // JS connecté ?
  begin
    joyGetDevCaps(JOYSTICKID1, @InfosCaps, sizeof(JOYCAPS));   //
    with InfosCaps do
    begin
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
  if chkJoystick.Checked then
  begin
    litJoyStick(a,b,c);
    Tbar4.Position:=round(a);
    Tbar5.Position:=round(b);
    Tbar6.Position:=round(1000*c);
  end;
end;
//==============================================================================================
//procedure TForm1.chkMiCourseAutoClick(Sender: TObject); begin chkMiCourseAuto.Checked:=edtcmax.Visible; end;
//==============================================================================================
procedure TForm1.GLSceneViewer1MouseMove(Sender:TObject;Shift:TShiftState;X,Y:Integer);
begin
  if ssLeft in shift then GLCamera1.MoveAroundTarget(my-y,mx-x);     // si bouton gauche alors départ-courant
  mx:=x;                // memo x, y arrivée
  my:=y;
end;
//==============================================================================================
procedure TForm1.GLSceneViewer1MouseDown(Sender:TObject;Button:TMouseButton;Shift:TShiftState;X,Y:Integer);
begin
  mx:=x;               // memo x, y départ
  my:=y;
end;
//==============================================================================================
procedure TForm1.Button1Click(Sender: TObject); begin glcadencer1.Enabled:=not glcadencer1.Enabled; end;
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
procedure TForm1.edtm1Change(Sender: TObject); begin {try consAngleMoteur[0]:=strtofloat(edtm1.text)-90; except end;} end;
procedure TForm1.edtm2Change(Sender: TObject); begin {try consAngleMoteur[1]:=strtofloat(edtm2.text)-90; except end;} end;
procedure TForm1.edtm3Change(Sender: TObject); begin {try consAngleMoteur[2]:=strtofloat(edtm3.text)-90; except end;} end;
//==============================================================================================
procedure TForm1.TBar1Change(Sender: TObject); begin edtm1 .text:=inttostr   (Tbar1.Position); end;
procedure TForm1.TBar2Change(Sender: TObject); begin edtm2 .text:=inttostr   (Tbar2.Position); end;
procedure TForm1.TBar3Change(Sender: TObject); begin edtm3 .text:=inttostr   (Tbar3.Position); end;
procedure TForm1.TBar4Change(Sender: TObject); begin edtthe.text:=floatToStrf(Tbar4.Position/10,fffixed,5,2); end;    // tangage
procedure TForm1.TBar5Change(Sender: TObject); begin edtphi.text:=floatToStrf(Tbar5.Position/10,fffixed,5,2); end;    // roulis
procedure TForm1.TBar6Change(Sender: TObject); begin edtdz .text:=floattostrf(Tbar6.Position/1000,fffixed,5,3); end;
//==============================================================================================
procedure TForm1.TBar8Change(Sender: TObject);          // ajustage fin du tangage
begin
  if strtofloat(edtthe.text)>0 then
    edtthe.text:=floattostrf(int(strtofloat(edtthe.text))+Tbar8.Position/100,fffixed,5,2)
  else
    edtthe.text:=floattostrf((abs(int(strtofloat(edtthe.text)))+Tbar8.Position/100)*-1,fffixed,5,2);
end;
//==============================================================================================
procedure TForm1.TBar9Change(Sender: TObject);          // ajustage fin du roulis
begin
  if strtofloat(edtphi.text)>0 then
    edtphi.text:=floattostrf(int(strtofloat(edtphi.text))+Tbar9.Position/100,fffixed,5,2)
  else
    edtphi.text:=floattostrf((abs(int(strtofloat(edtphi.text)))+Tbar9.Position/100)*-1,fffixed,5,2);
end ;
//==============================================================================================
procedure TForm1.CheckBox1Click(Sender: TObject); begin initStatTempsReel(sdt); queryPerformanceCounter(queryDeb); end;
procedure TForm1.CheckBox3Click(Sender: TObject); begin initStatTempsReel(sdt); queryPerformanceCounter(queryDeb); end;
procedure TForm1.CheckBox4Click(Sender: TObject); begin initStatTempsReel(sdt); queryPerformanceCounter(queryDeb); end;
//==============================================================================================
procedure TForm1.TBarKPChange(Sender: TObject); begin LblKP.Caption:=floattostrf(TBarKP.Position/100,fffixed,5,2);initStatTempsReel(sea); end;
procedure TForm1.TBarKIChange(Sender: TObject); begin LblKI.Caption:=floattostrf(TBarKI.Position/200,fffixed,5,2);initStatTempsReel(sea); end;
procedure TForm1.TBarKDChange(Sender: TObject); begin LblKD.Caption:=floattostrf(TBarKD.Position/ 10,fffixed,5,2);initStatTempsReel(sea); end;
//==============================================================================================
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
  const AMAX:single=23;const H0:single=0.38;const HMIN:single=0.261;
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
  const AMAX:single=23;const H0:single=0.38;const HMIN:single=0.261;
begin
  try phi:=strtofloat(edtphi.text); except end;
  if chkMiCourseAuto.Checked then
  begin
    pente:=((AMAX-abs(the)/2)*(H0-HMIN)/AMAX+HMIN-H0)/(AMAX-abs(the)/2);
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
  for iM:=0 to 2 do                                         // index Moteur
  begin
    a:=2*xN[iM];
    b:=2*yN[iM];
    c:=sqr(xN[iM])+sqr(yN[iM])-sqr(bielV[iM])+sqr(maniv);  //
    delta:=sqr(2*a*c)-4*(sqr(a)+sqr(b))*(sqr(c)-sqr(b)*sqr(maniv));
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
  if not flag then for iM:=0 to 2 do ang[iM]:=consAngleMoteur[iM]+90;
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

