unit testTimer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Gauges, uIif, ExtCtrls, AsyncTimer, OleCtrls,
  RSTIMERLib_TLB;
  
type
  TForm1 = class(TForm)
    GaugeStDur: TGauge;
    LblStDurMax: TLabel;
    LblStDurMin: TLabel;
    LblStDurSig: TLabel;
    LblStDurMoy: TLabel;
    LblStDurMes: TLabel;
    LblStDurUnt: TLabel;
    Timer1: TTimer;
    AsyncTimer1: TAsyncTimer;
    RSTimer1: TRSTimer;
    procedure FormCreate(Sender: TObject);
    procedure AsyncTimer1Timer(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure RSTimer1Timer(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

type TStatTempsReel = record
  min,max,som,moy,sigma : double;
  cpt : Int64;
end;

var
  Form1: TForm1;
  queryDeb,queryFin,queryFreq:Int64;     // pour queryPerformanceCounter
  sdt    : TStatTempsReel;               // Stat. Durée Timer
  bOnce : boolean;

implementation

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
  dur:=1000*(queryFin-queryDeb-550)/queryFreq;       // 550 top horloge mini sans instruction
  if not bOnce then begin bOnce:=true;exit; end;
  if dur>0 then calcStatTempsReel(sdt,dur);
  if sdt.cpt mod 10 = 0 then
  begin
    Form1.LblStDurUnt.caption:=IIF(dur<1,'µs'                             ,'ms');
    Form1.LblStDurMes.caption:=IIF(dur<1,floatToStrf(dur*1000,fffixed,5,1),floatToStrf(dur      ,fffixed,5,2)+'  ');
    Form1.LblStDurMoy.caption:=IIF(dur<1,floatToStrf(dur*1000,fffixed,5,1),floatToStrf(sdt.moy  ,fffixed,5,2)+'  ');
    Form1.LblStDurSig.caption:=IIF(dur<1,floatToStrf(dur*1000,fffixed,5,1),floatToStrf(sdt.sigma,fffixed,5,3)+'  ');
    Form1.LblStDurMin.caption:=IIF(dur<1,floatToStrf(dur*1000,fffixed,5,1),floatToStrf(sdt.min  ,fffixed,5,2)+'  ');
    Form1.LblStDurMax.caption:=IIF(dur<1,floatToStrf(dur*1000,fffixed,5,1),floatToStrf(sdt.max  ,fffixed,5,2)+'  ');
  end;
  if (sdt.moy>1) then Form1.GaugeStDur.MaxValue:=round(3*sdt.moy);
  Form1.GaugeStDur.Progress:=round(dur);
//  Form1.edCons.Text:=IntToStr(queryFreq);
//  Form1.edMes.Text:=IntToStr(queryfin-queryDeb);
end;
//==============================================================================
procedure TForm1.FormCreate(Sender: TObject);
begin
//AsyncTimer1.Create(form1);
//AsyncTimer1.Interval:=10;
//AsyncTimer1.ThreadPriority:=tpNormal;
  initStatTempsReel(sdt);
  bOnce:=false;
  queryPerformanceFrequency(queryFreq);          // valeur fixe : 3 166 720 000 Hz
  queryPerformanceCounter(queryDeb);
end;
//==============================================================================
procedure TForm1.AsyncTimer1Timer(Sender: TObject);
begin
  affDuree();
  queryPerformanceCounter(queryDeb);
end;
//==============================================================================
procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled:=false;
  queryPerformanceCounter(queryDeb);
//  AsyncTimer1.Enabled:=true;
  RSTimer1.Enabled:=true;
//  TTimer(Form1.FindComponent('RSTimer'+IntToStr(1))).Enabled:=true;  // çà marche pas

end;
//==============================================================================
procedure TForm1.RSTimer1Timer(Sender: TObject);
begin
  affDuree();
  queryPerformanceCounter(queryDeb);
end;
//==============================================================================
end.

