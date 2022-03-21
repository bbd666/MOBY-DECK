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
  ComCtrls, mmsystem, Gauges, Pci_8136, uIif, AsyncTimer,LabelEditEx;

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
    Timer1: TTimer;
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
    procedure chkMiCourseAutoClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btRazClick(Sender: TObject);
    procedure btQuitClick(Sender: TObject);
    procedure btEnableClick(Sender: TObject);
    procedure btPomClick(Sender: TObject);
    procedure TimeAsser1Timer(Sender: TObject);
    procedure TimeOut1Timer(Sender: TObject);
    procedure TimeOut2Timer(Sender: TObject);
    procedure TimeOut3Timer(Sender: TObject);
    procedure TimePosPot1Timer(Sender: TObject);
    procedure TimePosPot2Timer(Sender: TObject);
    procedure TimePosPot3Timer(Sender: TObject);
    procedure TimeTopTour1Timer(Sender: TObject);
    procedure TimeTopTour2Timer(Sender: TObject);
    procedure TimeTopTour3Timer(Sender: TObject);
    procedure TimeAsser2Timer(Sender: TObject);
    procedure TimeAsser3Timer(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
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

type sglDrArGa = Array[0..2] Of single;
type TPoint    = record x,y : double; end;
type TDroite   = record pente,cste,resid : double; end;
type TPid      = record intg,oldEc : single; end;
type TPom      = record
  bTrouve,bMiCourse : boolean;
  cptCur,cptIni : Longint;
  uVitCons,uPotIni,uPotPos,uPotRef,uPas : double;
end;
type TStatTempsReel = record
  min,max,som,moy,sigma : double;
  cpt : Int64;
end;

var
  Form1  : TForm1;
  segAng : TDroite;
  sdt    : TStatTempsReel;                    // Stat. Durée Timer
  sea    : TStatTempsReel;                    // Stat. Ecart asservissement
  pid    : array[0..2] of TPid;
  tabPom : array[0..2] of TPom;
  tabPts : array[0..2] of TPoint=((x:1;y:3),(x:2;y:5),(x:3;y:7));
  angle_moteur,F_moteur : array[0..2] of single;
  queryDeb,queryFin,queryFreq:Int64;     // pour queryPerformanceCounter
  bEnable:boolean;                       // servostar 400
  bRepos : array[0..3] of boolean;       // état de repos plate-forme (8.332°)
  cptPomp,iM:integer;                    // pour pompage, index moteur
  existcard:word;                        // carte Adlink
  MaxUpDownControl,param,param2,kressort,l0ressort,hressort:single;
  the,phi,dz:single;
  L1,L2,L3,maniv,biel,m_base,ixx_base,iyy_base,izz_base:single;
  tactive1,sgn1,tactive2,sgn2:single;
  vitRampeRoul,vitRampeTang,max_gauge,pomp:single;
  consAsser:sglDrArGa;

const DR:integer=0; const AR:integer=1; const GA:integer=2;  // ordre donné par le cablage ENC, DAC et ADC
const uOffCons:array[0..2]of double=(-0.01,-0.045,-0.035);   // offset consigne moteur

implementation

uses
  OpenGL1x,
  VectorGeometry, //vector and matrix operation unit including affinevectormake function
  VectorLists,
  newtonutil;

{$R *.dfm}
//==============================================================================
procedure initStatTempsReel(var sd:TStatTempsReel); // Initialisation Statistiques de durée du timer
begin
  sd.moy:=0.0;
  sd.som:=0.0;
  sd.moy:=0.0;
  sd.min:=10000.;
  sd.max:=0.0;
  sd.cpt:=0;
end;
//==============================================================================
procedure calcStatTempsReel(var sd:TStatTempsReel;mes:double); // Temps réel Statistiques de durée du timer
begin
  sd.cpt:=sd.cpt+1;
  sd.som:=sd.som+(sd.moy-mes)*(sd.moy-mes)*(sd.cpt-1)/sd.cpt;
  sd.moy:=sd.moy-(sd.moy-mes)/ sd.cpt;
  if (sd.cpt>1) and (sd.som>0) then sd.sigma:=sqrt(sd.som/(sd.cpt-1));
  if sd.min>mes then sd.min:=mes;
  if sd.max<mes then sd.max:=mes;
end;
//==============================================================================
procedure affDuree(); // précision 1µs
var dur:double;
begin
  queryPerformanceCounter(queryFin);
  if queryDeb=0 then exit;
  dur:=1000*(queryFin-queryDeb-550)/queryFreq;       // 550µs mini sans instruction
  if dur>0 then calcStatTempsReel(sdt,dur);
  if sdt.cpt mod 10 = 0 then
  begin
    Form1.LblStDurUnt.caption:=IIF(dur<1,'µs'                             ,'ms');
    Form1.LblStDurMes.caption:=IIF(dur<1,floatToStrf(dur*1000,fffixed,5,1),floatToStrf(dur      ,fffixed,5,2)+'  ');
    Form1.LblStDurMoy.caption:=IIF(dur<1,floatToStrf(dur*1000,fffixed,5,1),floatToStrf(sdt.moy  ,fffixed,5,2)+'  ');
    Form1.LblStDurSig.caption:=IIF(dur<1,floatToStrf(dur*1000,fffixed,5,1),floatToStrf(sdt.sigma,fffixed,5,2)+'  ');
    Form1.LblStDurMin.caption:=IIF(dur<1,floatToStrf(dur*1000,fffixed,5,1),floatToStrf(sdt.min  ,fffixed,5,2)+'  ');
    Form1.LblStDurMax.caption:=IIF(dur<1,floatToStrf(dur*1000,fffixed,5,1),floatToStrf(sdt.max  ,fffixed,5,2)+'  ');
  end;
  if (sdt.moy>1) then Form1.GaugeStDur.MaxValue:=round(3*sdt.moy);
  Form1.GaugeStDur.Progress:=round(dur);
//  Form1.edCons.Text:=IntToStr(queryFreq);
//  Form1.edMes.Text:=IntToStr(queryfin-queryDeb);
end;
//==============================================================================
{procedure calcul_AB(n:integer;pt:array of TPoint;var dtr:TDroite);
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
procedure _8136_initMultiFonct(bAna:boolean=false);   // optional
begin
  _8136_Initial(existcard);                    // Ouvre la PCI-8136 et retourne le nb de cartes trouvées (27ms)
  if existcard<>0 then
  begin
    if bAna then _8136_A_Initial(CARD0);         // Analogique (1.89s)
    _8136_P_Initial(CARD0);                      // Compteur Impulsions codeurs
    for iM:=0 to 2 do
    begin
      _8136_P_Set_Input_Type(CARD0,ENC2+iM,E_A_B,X1); // Pulse In  déphasés de 90° , multiplié par 1
      _8136_P_Set_Output_Type(CARD0,ENC2+iM,A_B);     // Pulse Out déphasés de 90°
    end
  end;
end;
//==============================================================================
procedure prepaRefCodeur(iMot:integer);  // ordre ENC : DAG
begin
  _8136_P_Clear(CARD0,ENC2+iMot);                    // RaZ compteur du codeur
//  Form1.Edit1.Text:='Compt '+IntToStr(iMot);         // Raz affichage
  tabPom[iMot].cptIni:=0;                            // init détection latch
  _8136_P_Set_Index_Latch(CARD0,ENC2+iMot,0);        // trigger de RaZ une seule fois
//  Form1.Edit3.Text:=' ';
end;
//==============================================================================================
// la POM doit être réalisée, le tableau "cons" contiend les consignes angulaires
// l'appel est cadencé pas "GLCadencer1" (10ms théorique)
procedure asservHard(cons:sglDrArGa;iMot:integer);
var mes,ecr,der,corr,kP,kI,kD:single;
    i: integer;
begin
  mes:=0;
  if iMot=0 then
  begin
    affDuree();                                                                // fin période mesurée + affichage
    queryPerformanceCounter(queryDeb);                                         // début période mesurée
  end;
  if existcard<>0 then
  begin
    _8136_P_Read(CARD0,ENC2+iMot,tabPom[iMot].cptCur);                         // Lecture 1 Encodeur Moteur/Variateur
    mes:=(tabPom[iMot].cptCur-tabPom[iMot].cptIni)*360.0/1024/40;              // Mesure angle manivelle
    ecr:=cons[iMot]-mes;                                                       // Proportionnnelle
    pid[iMot].intg:=pid[iMot].intg+ecr;                                        // Intégrale
  end
  else
    ecr:=random(800)/100+0.8;                                                  // pas d'intégrale en mode simulation
  der:=ecr-pid[iMot].oldEc;pid[iMot].oldEc:=ecr;                               // Dérivée
  kP:=Form1.TBarKP.Position/200;Form1.LblKP.Caption:=floattostrf(kP,fffixed,5,2);
  kI:=Form1.TBarKI.Position/200;Form1.LblKI.Caption:=floattostrf(kI,fffixed,5,2);
  kD:=Form1.TBarKD.Position/200;Form1.LblKD.Caption:=floattostrf(kD,fffixed,5,2);
  corr:=ecr*kP+pid[iMot].intg*kI+der*kD;                                       // Correction PID
  cons[iMot]:=corr;                                                            // Consigne corrigée
  if not bRepos[3] then                                                        // repos pas encore atteint
  begin
     if iMot=0 then for i:=0 to 2 do bRepos[i]:=false;                         // Raz 3 moteurs
     if abs(ecr)<0.1 then bRepos[iMot]:=true;                                  // repos d'un seul moteur
     if (iMot=2) and bRepos[0] and bRepos[1] and bRepos[2] then                // 3 consécutifs
     begin
       bRepos[3]:=true;                                                        // position repos atteinte
       Form1.GroupBoxPlat.enabled:=true;                                       // autorisation pour les rampes
     end;
  end;
  if iMot=0 then calcStatTempsReel(sea,abs(ecr));
  if sea.cpt mod 5 = 0 then
  begin
    Form1.LblStEctMes.caption:=floatToStrf(abs(corr),fffixed,5,2)+'  ';
    Form1.LblStEctMoy.caption:=floatToStrf(sea.moy  ,fffixed,5,2)+'  ';
    Form1.LblStEctSig.caption:=floatToStrf(sea.sigma,fffixed,5,2)+'  ';
    Form1.LblStEctMin.caption:=floatToStrf(sea.min  ,fffixed,5,2)+'  ';
    Form1.LblStEctMax.caption:=floatToStrf(sea.max  ,fffixed,5,2)+'  ';
    TLabeledEdit(form1.FindComponent('LblEdtMes'+IntToStr(iMot+1))).Text:=floattostrf(mes ,fffixed,5,3);//+' °';
    TLabeledEdit(form1.FindComponent('LblEdtEcr'+IntToStr(iMot+1))).Text:=floattostrf(ecr ,fffixed,5,3);//+' °';
    TLabeledEdit(form1.FindComponent('LblEdtCor'+IntToStr(iMot+1))).Text:=floattostrf(corr,fffixed,5,3);//+' °';
  end;
  if iMot=0 then
  begin
    //if sea.max>0.01 then Form1.GaugeStEct.MaxValue:=round(sea.max*1000);
    Form1.GaugeStEct.Progress:=round(abs(ecr)*10);
  end;
  if existcard<>0 then
  begin
    _8136_A_Write_Volt(CARD0,CH3+iMot,uOffCons[iMot]+cons[iMot]); // Sortie analogique
    _8136_A_Write_Volt(CARD0,CH4,uOffCons[1]+cons[0]); // pour comparaison
    _8136_A_Write_Volt(CARD0,CH5,uOffCons[2]+cons[0]); //
  end;
end;
//==============================================================================
procedure paramAsser(iMot: integer);
var tension:double;
begin

  if iMot<>0 then exit; // un seul moteur en mise au point
  if form1.CheckBoxAsser.Checked then
  begin
    consAsser[iMot]:=strtofloat(TLabeledEdit(form1.FindComponent('edtm'+IntToStr(iMot+1))).text);  // lit cons moteur droit
    asservHard(consAsser,iMot);                      // asservissement hardware d'un moteur
  end
  else
  begin
    with form1 do
    begin
      _8136_P_Read(CARD0,ENC2,tabPom[DR].cptCur);
    //  Edit1.Text:=floattostrf((tabPom[DR].cptCur-tabPom[DR].cptIni)*360.0/1024,fffixed,5,1)+' °';         // angle moteur
      _8136_A_Write_Volt(CARD0,CH3,IIF(Tbar16.Position=0,uOffCons[DR],Tbar16.Position/10)); // DAC4 DIN100S.52 X3.3 Droite
      _8136_A_Write_Volt(CARD0,CH4,IIF(Tbar16.Position=0,uOffCons[AR],Tbar16.Position/10)); // DAC5 DIN100S.53 X3.3 Arriére
      _8136_A_Write_Volt(CARD0,CH5,IIF(Tbar16.Position=0,uOffCons[GA],Tbar16.Position/10)); // DAC6 DIN100S.54 X3.3 Gauche
      if Tbar16.Position<>0 then edCons.Text:=' cVit= '+FloatToStrf(Tbar16.Position/10,fffixed,5,3)+' V';
      _8136_A_Read_Volt (CARD0,CH0,tension);                                  // ADC1 DB25.20 Potar Droite
      edMes.Text:=' mPot= '+FloatToStrf(tension,fffixed,5,3)+' V';
      LblEdtMes1.Text:=floattostrf((tabPom[DR].cptCur-tabPom[DR].cptIni)*360.0/1024/40,fffixed,5,3)+' °';   // angle manivelle
    end;  
  end;
end;
//==============================================================================
procedure TForm1.TimeAsser1Timer(Sender: TObject); begin paramAsser(DR); end;
procedure TForm1.TimeAsser2Timer(Sender: TObject); begin paramAsser(AR); end;
procedure TForm1.TimeAsser3Timer(Sender: TObject); begin paramAsser(GA); end;
//==============================================================================
procedure paramTimeTopTour(iMot: integer);   // détection toptour (15.6ms mini)
begin
//  affDuree();                                                    // fin timer + affichage
//  queryPerformanceCounter(queryDeb);                             // deb timer
  _8136_P_Read_Latch_Value(CARD0,ENC2+iMot,tabPom[iMot].cptIni);
  _8136_A_Read_Volt(CARD0,CH0+iMot,tabPom[iMot].uPotPos);          // ADC1 DB25.20 Lecture Potar
  Form1.edMes.Text:=' mPot= '+FloatToStrf(tabPom[iMot].uPotPos,fffixed,5,3)+' V';
  if tabPom[iMot].cptIni<>0 then
  begin
    TTimer(Form1.FindComponent('TimeOut'    +IntToStr(iMot+1))).Enabled:=false; // arrêt timeOut
    TTimer(Form1.FindComponent('TimeTopTour'+IntToStr(iMot+1))).Enabled:=false; // auto-arret
    TTimer(Form1.FindComponent('TimeAsser'  +IntToStr(iMot+1))).Enabled:=true;  // affiche angle avec trackBar en consigne
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
    _8136_A_Read_Volt(CARD0,CH0+iMot,uPotPos);                      // ADC1 DB25.20 Lecture Potar
    Form1.edMes.Text:=' mPot= '+FloatToStrf(uPotPos,fffixed,5,3)+' V';
    if(abs(uVitCons)>0.1)or(not bMiCourse)then                      // si non proche du prépositionnement
      uVitCons:=uVitCons+uPas*IIF(bMiCourse,-1,1)
                             *IIF((uPotIni-uPotRef)>0,-1,1);        // courbe accélération en S vers réf:5V
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
    _8136_A_Write_Volt(CARD0,CH3+iMot,uVitCons);                   // DAC4 DIN100S.52 X3.3
    if(abs(uPotPos-uPotRef)<0.03)then                              // si vitesse faible et position atteinte
    begin
      TTimer(Form1.FindComponent('TimePosPot'+IntToStr(iMot+1))).Enabled:=false; // auto-arret
      _8136_A_Write_Volt(CARD0,CH3+iMot,uOffCons[iMot]+0.05);      // DAC4 DIN100S.52 X3.3 Droite
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
  _8136_D_Output(CARD0,5,ENABLE);                                             // DO6 DIN100S.70 X1.3 DISABLE
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
  tabPom[iMot].uVitCons:=uOffCons[iM];                                      // Cons moteur à 0
  _8136_A_Write_Volt(CARD0,CH3+iMot,tabPom[iMot].uVitCons);                 // Moteur à l'arret
  _8136_A_Read_Volt (CARD0,CH0+iMot,tabPom[iMot].uPotIni);                  // ADC1 DB25.20 Potar Droite
  TTimer(Form1.FindComponent('TimeOut'   +IntToStr(iMot+1))).Enabled:=true; // pour POM non trouvée
  TTimer(Form1.FindComponent('TimePosPot'+IntToStr(iMot+1))).Enabled:=true; // prépositionnement avec potar
end;
//==============================================================================
procedure TForm1.btRazClick(Sender: TObject);
begin
  _8136_S_Close(CARD0);                             //  Ferme la PCI-8136 (16µs)
  _8136_initMultiFonct();                           // (30ms ou 1.9s si "_8136_A_Initial")
  prepaRefCodeur(0);                                // (40µs)
//  _8136_P_Clear(CARD0,ENC2);
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
begin
  bEnable:=not(bEnable);
  btEnable.Caption:=IIF(bEnable,'Disable','Enable');
  for iM:=0 to 2 do _8136_A_Write_Volt(CARD0,CH3+iM,uOffCons[iM]+0.1);  // vitesse faible Droite
  _8136_D_Output(CARD0,5,IIF(bEnable,DISABLE,ENABLE));   // DO6 DIN100S.70 X1.3 ENABLE
//  _8136_D_Output(CARD0,1,IIF(bEnable,DISABLE,ENABLE)); // DO2 DIN100S.62 X1.3 ENABLE pour test
//  _8136_D_Output(CARD0,3,IIF(bEnable,DISABLE,ENABLE)); // DO4 DIN100S.66 X1.3 ENABLE
//  _8136_D_Output(CARD0,6,IIF(bEnable,DISABLE,ENABLE)); // DO7 DIN100S.58 X1.3 ENABLE
  if bEnable then prepaRefCodeur(0);
  TimeTopTour1.Enabled:=bEnable;
end;
//==============================================================================
procedure TForm1.btPomClick(Sender: TObject);
begin
  bEnable:=true;                                        // enable Variateur
  btEnable.Caption:=IIF(bEnable,'Disable','Enable');
  _8136_D_Output(CARD0,5,DISABLE);                      // DO6 DIN100S.70 X1.3 ENABLE
  for iM:=0 to 0 do pomSeul(iM);
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
(*procedure TForm1.DisplayCollisionGeoms ;
begin
  NewtonWorldForEachBodyDo(FNewtonWorld, @Debug_ShowBodyCollision) ;
end ;*)
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
  cptPomp:=cptPomp+round(Tbar11.Position/200*20);
  if cptPomp>360 then cptPomp:=0;
  pomp:=sin(cptPomp*pi/180  )*Tbar10.Position/100*0.05+
        sin(cptPomp*pi/180*2)*Tbar10.Position/100*0.02+
        sin(cptPomp*pi/180*4)*Tbar10.Position/100*0.01;
//caption:=floattostr(deltatime); NewtonWorldForEachBodyDo(FNewtonWorld, @numericaldamping) ;
  NewtonUpdate(FNewtonWorld, 0.01) ;
  Bressort.Scale.Z:=(Bpiston.Position.Z-hressort{0.325}-0.057)/0.225;
//  form1.caption:=floattostr(Bpiston.Position.Z);
  edtf1.Text:=floattostrf(F_moteur[0],fffixed,5,2);
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

  relAngle:= angle - angle_moteur[1]*pi/180;
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

  relAngle:= angle - angle_moteur[2]*pi/180;
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

  relAngle:= angle - angle_moteur[0]*pi/180;
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
procedure TForm1.FormCreate(Sender: TObject);
var
  collision : PNewtoncollision;
//  v:tvector3f;
  m:tmatrix4f;
//  s:string;
//  decal:double;
  i:integer;
   data_ini:tinifile;
begin
  initStatTempsReel(sdt);initStatTempsReel(sea);
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
  LoadFrommesh('base.3d',Bbase,Mbase);
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
    LoadFrommesh('moteur.3d',Bmoteur[i],Mmoteur);
  end;
  Bmoteur[0].position.setpoint( L1+0.03,  0,0.17);
  Bmoteur[1].position.setpoint(-L2+0.03, L3,0.17);
  Bmoteur[2].position.setpoint(-L2+0.03,-L3,0.17);

  for i:=0 to 2 do
  begin
    Mbielle[i]:=TGlMateriallibrary.Create(self);
    Bbielle[i]:=TGLFreeform(GLDummyCube1.AddNewChild(TGLFreeform));
    LoadFrommesh('bielle.3d',Bbielle[i],Mbielle[i]);
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
    Mmanivelle[i]:=TGlMateriallibrary.Create(self);
    Bmanivelle[i]:=TGLFreeform(GLDummyCube1.AddNewChild(TGLFreeform));
    LoadFrommesh('manivelle.3d',Bmanivelle[i],Mmanivelle[i]);
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
  LoadFrommesh('piston.3d',Bpiston,Mpiston);
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
  LoadFrommesh('ressort.3d',Bressort,Mressort);
  Bressort.Position.Z:=-5.7;

  Maxe_cardan:=TGlMateriallibrary.Create(self);
  Baxe_cardan:=TGLFreeform(GLDummyCube1.AddNewChild(TGLFreeform));
  LoadFrommesh('axe_cardan.3d',Baxe_cardan,Maxe_cardan);
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
  LoadFrommesh('plateforme.3d',Bplateforme,Mplateforme);
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

  Mfix1:=TGlMateriallibrary.Create(self);Bfix1:=TGLFreeform(Bplateforme.AddNewChild(TGLFreeform));LoadFrommesh('fixation.3d',Bfix1,Mfix1);
  Mfix2:=TGlMateriallibrary.Create(self);Bfix2:=TGLFreeform(Bplateforme.AddNewChild(TGLFreeform));LoadFrommesh('fixation.3d',Bfix2,Mfix2);
  Mfix3:=TGlMateriallibrary.Create(self);Bfix3:=TGLFreeform(Bplateforme.AddNewChild(TGLFreeform));LoadFrommesh('fixation.3d',Bfix3,Mfix3);

  Bfix1.Position.x:= L1*100*0.25/max(L1,L2);Bfix1.Position.y:=0;
  Bfix2.Position.x:=-L2*100*0.25/max(L1,L2);Bfix2.Position.y:=-L3*100*0.25/L3;
  Bfix3.Position.x:=-L2*100*0.25/max(L1,L2);Bfix3.Position.y:= L3*100*0.25/L3;

  NewtonWorldForEachBodyDo(FNewtonWorld, @numericaldamping) ;
  edtm1.text:=inttostr(Tbar1.Position);  // active la position initiale du trackbar
  edtm2.text:=inttostr(Tbar2.Position);
  edtm3.text:=inttostr(Tbar3.Position);
  edtdz.text:=floattostr(Tbar6.Position/1000);

  cptPomp:=0;pomp:=0;
  queryPerformanceFrequency(queryFreq);        // valeur fixe : 3 166 720 000 Hz
  bEnable:=false;                              // Enable variateur
  bRepos[3]:=false;
  _8136_initMultiFonct(true);                  // init PCI9136 plus Analog
  if existcard<>0 then
  begin
    _8136_D_OutputA(CARD0,127);                  // Mise à 1 DO2,DO6 DIN100S.62,70 et raz des 6 autres sorties,
    _8136_A_Write_Volt(CARD0,CH0,10);            // DAC1 alim3Potars DB25.18
    GroupBoxPlat.enabled:=false;                  // interdiction pour les rampes
  end;
  for i:=0 to 2 do
  begin
    TLabel(form1.FindComponent('LblMaxGag'+IntToStr(i+1))).Caption:=inttostr(round(max_gauge));
    TGauge(form1.FindComponent('Gauge'    +IntToStr(i+1))).MaxValue:=round(max_gauge);
  end;
  queryPerformanceCounter(queryDeb);
end;
//==============================================================================================
//  voir le fichier "étudeCinématique.doc" : auteur Pierre Lemerle
function asserv(var ang:sglDrArGa; dzl:single):boolean;
var
  v:array[0..2] of tvector3f;
  bielV,xN,yN,xP,yP,xQ,yQ:sglDrArGa;
  iM:integer;               // index des moteurs
  flag:boolean;
  a,b,c,delta:single;
  mTang,mRoul:Tmatrix4f;
  const DR:integer=0; const AR:integer=1; const GA:integer=2;  // ordre donné par le cablage ENC, DAC et ADC
  //const AR:integer=0;const GA:integer=1;const DR:integer=2;  // ancien ordre arbitraire
begin
  flag:=true;
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
//      asservHard(ang,iM);                                     // asservissement hardware d'un moteur, çà marche pas ici, voir timer
    end
    else
      flag:=false;
  end;
  asserv:=flag;
end;
//==============================================================================================
procedure afficheAngleMoteur(ang:sglDrArGa);
var iM:integer;
begin
  for iM:=0 to 2 do
    TLabeledEdit(form1.FindComponent('edtm'+IntToStr(iM+1))).Text:=floattostrf(ang[iM],fffixed,5,2);
end;
//==============================================================================================
procedure TForm1.edtTheChange(Sender: TObject);
var
  pente:single;
  angle:sglDrArGa;
  const AMAX:single=23;const H0:single=0.38;const HMIN:single=0.261;
begin
  try the:=strtofloat(edtthe.text); except end;
  try phi:=strtofloat(edtphi.text); except end;
  if chkMiCourseAuto.Checked then
  begin
    pente:=((AMAX-abs(phi)/2)*(H0-HMIN)/AMAX+HMIN-H0)/(AMAX-abs(phi)/2); // voir fichier "vitesseAccélérationMoteurs.xlsx"
    dz:=(pente*the)*Tbar7.Position/100+H0;                               // avec mi-course proportionnelle
    if checkbox1.Checked then dz:=dZ+pomp;                               // ajout du pompage
    Tbar6.Position:=round(1000*dz);
  end;
  if asserv(angle,dz) then afficheAngleMoteur(angle);
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
procedure TForm1.Timer1Timer(Sender: TObject);     // 16 ms mini
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
procedure TForm1.chkMiCourseAutoClick(Sender: TObject); begin chkMiCourseAuto.Checked:=edtcmax.Visible; end; // if chkMiCourseAuto.Checked then edtcmax.Visible:=true else edtcmax.Visible:=false;
//==============================================================================================
procedure TForm1.GLSceneViewer1MouseMove(Sender:TObject;Shift:TShiftState;X,Y:Integer);
begin
  if ssLeft in shift then GLCamera1.MoveAroundTarget(my-y,mx-x);
  mx:=x;
  my:=y;
end;
//==============================================================================================
procedure TForm1.GLSceneViewer1MouseDown(Sender:TObject;Button:TMouseButton;Shift:TShiftState;X,Y:Integer);
begin
  mx:=x;
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
  angle:sglDrArGa;
begin
  try dz:=strtofloat(edtdz.text); except end;
  if asserv(angle,dz) then afficheAngleMoteur(angle);
end;
//==============================================================================================
procedure TForm1.edtspringChange(Sender: TObject); begin try kressort:=strtofloat(edtspring.text); except end; end;
//==============================================================================================
procedure TForm1.edtm1Change(Sender: TObject); begin try angle_moteur[0]:=strtofloat(edtm1.text)-90; except end; end;
procedure TForm1.edtm2Change(Sender: TObject); begin try angle_moteur[1]:=strtofloat(edtm2.text)-90; except end; end;
procedure TForm1.edtm3Change(Sender: TObject); begin try angle_moteur[2]:=strtofloat(edtm3.text)-90; except end; end;
//==============================================================================================
procedure TForm1.TBar1Change(Sender: TObject); begin edtm1 .text:=inttostr   (Tbar1.Position); end;
procedure TForm1.TBar2Change(Sender: TObject); begin edtm2 .text:=inttostr   (Tbar2.Position); end;
procedure TForm1.TBar3Change(Sender: TObject); begin edtm3 .text:=inttostr   (Tbar3.Position); end;
procedure TForm1.TBar4Change(Sender: TObject); begin edtthe.text:=floatToStrf(Tbar4.Position/100 ,fffixed,5,2); end;    // tangage
procedure TForm1.TBar5Change(Sender: TObject); begin edtphi.text:=inttostr   (Tbar5.Position); end;    // roulis
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
(*procedure TForm1.FormMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
 if Assigned(glCamera1) then glCamera1.AdjustDistanceToTarget(Power(1.1, WheelDelta / 240 * 1)) ;
end;*)
//==============================================================================================
procedure TForm1.TBarKPChange(Sender: TObject); begin initStatTempsReel(sea); end;
procedure TForm1.TBarKIChange(Sender: TObject); begin initStatTempsReel(sea); end;
procedure TForm1.TBarKDChange(Sender: TObject); begin initStatTempsReel(sea); end;
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
  if not flag then for iM:=0 to 2 do ang[iM]:=angle_moteur[iM]+90;
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
