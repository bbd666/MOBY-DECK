unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,fft, complexf,StdCtrls, Buttons, ButtonWithColor, jpeg, ExtCtrls,math,visu;

type
  TForm1 = class(TForm)
    OpenDialog1: TOpenDialog;
    Edit1: TEdit;
    Label1: TLabel;
    BitBtnWithColor9: TBitBtnWithColor;
    Button1: TButton;
    Edit2: TEdit;
    Label2: TLabel;
    Image1: TImage;
    BitBtnWithColor1: TBitBtnWithColor;
    BitBtnWithColor2: TBitBtnWithColor;
    BitBtnWithColor3: TBitBtnWithColor;
    BitBtnWithColor4: TBitBtnWithColor;
    BitBtnWithColor5: TBitBtnWithColor;
    BitBtnWithColor6: TBitBtnWithColor;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    GroupBox1: TGroupBox;
    BitBtnWithColor7: TBitBtnWithColor;
    procedure BitBtnWithColor9Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure BitBtnWithColor1Click(Sender: TObject);
    procedure BitBtnWithColor2Click(Sender: TObject);
    procedure BitBtnWithColor3Click(Sender: TObject);
    procedure BitBtnWithColor4Click(Sender: TObject);
    procedure BitBtnWithColor5Click(Sender: TObject);
    procedure BitBtnWithColor6Click(Sender: TObject);
    procedure BitBtnWithColor7Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;
  fichierin,fichierout:string;
  f:double;
  i:integer;
  gf,g: array of tcomplex;
  gpo,gs,gfo: array of array of double;

function H( n: integer;f:double):tcomplex;

implementation

{$R *.dfm}

////////////////////////////////////////////////////////////
// ISO 5349
////////////////////////////////////////////////////////////

function H(n: integer;f:double):tcomplex;
var
   f1,f2,f3,f4,f5,f6,q4,q5,q6,q2,q1,k:double;
   numHb,denHb1,denHb2,numHw,denHw,Hw,Hb,hh,hl,ht,hs,un,num,int1,int2:tcomplex;
begin
    un.Re:=1;
    un.Im:=0;
    case n  of
1 :  begin
            f1:=0.4;
            f2:=100;
            f3:=12.5;
            f4:=12.5;
            q4:=0.63;
            f5:=2.37;
            q5:=0.91;
            f6:=3.35;
            q6:=0.91;

            hh.re:=1-sqr(f1/f);
            hh.Im:=-sqrt(2)*f1/f;
            hh:=ComplexDiv(un,hh);

            hl.re:=1-sqr(f/f2);
            hl.Im:=sqrt(2)*f/f2;
            hl:=ComplexDiv(un,hl);

            ht.re:=1-sqr(f/f4);
            ht.Im:=f/(f4*q4);
            num.Re:=1;
            num.Im:=f/f3;
            ht:=ComplexDiv(num,ht);

            hs.re:=1-sqr(f/f6);
            hs.Im:=f/(f6*q6);
            num.Re:=1-sqr(f/f5);
            num.Im:=f/(f5*q5);
            hs:=ComplexDiv(num,hs);
            hs:=Complexscl(sqr(f5/f6),hs);

            int1:=complexmul(hh,hl);
            int2:=complexmul(ht,hs);
            result:=complexmul(int1,int2);
         end;

2 :  begin
            f1:=0.4;
            f2:=100;
            f3:=2;
            f4:=2;
            q4:=0.63;

            hh.re:=1-sqr(f1/f);
            hh.Im:=-sqrt(2)*f1/f;
            hh:=ComplexDiv(un,hh);

            hl.re:=1-sqr(f/f2);
            hl.Im:=sqrt(2)*f/f2;
            hl:=ComplexDiv(un,hl);

            ht.re:=1-sqr(f/f4);
            ht.Im:=f/(f4*q4);
            num.Re:=1;
            num.Im:=f/f3;
            ht:=ComplexDiv(num,ht);

            int1:=complexmul(hh,hl);
            result:=complexmul(int1,ht);
         end;

3 :  begin
            f1:=0.08;
            f2:=0.63;
            f4:=0.25;
            q4:=0.86;
            f5:=0.0625;
            q5:=0.8;
            f6:=0.1;
            q6:=0.8;

            hh.re:=1-sqr(f1/f);
            hh.Im:=-sqrt(2)*f1/f;
            hh:=ComplexDiv(un,hh);

            hl.re:=1-sqr(f/f2);
            hl.Im:=sqrt(2)*f/f2;
            hl:=ComplexDiv(un,hl);

            ht.re:=1-sqr(f/f4);
            ht.Im:=f/(f4*q4);
            ht:=ComplexDiv(un,ht);

            hs.re:=1-sqr(f/f6);
            hs.Im:=f/(f6*q6);
            num.Re:=1-sqr(f/f5);
            num.Im:=f/(f5*q5);
            hs:=ComplexDiv(num,hs);
            hs:=Complexscl(sqr(f5/f6),hs);

            int1:=complexmul(hh,hl);
            int2:=complexmul(ht,hs);
            result:=complexmul(int1,int2);
         end;

4 :  begin
            f1:=0.4;
            f2:=100;
            f3:=8;
            f4:=8;
            q4:=0.63;

            hh.re:=1-sqr(f1/f);
            hh.Im:=-sqrt(2)*f1/f;
            hh:=ComplexDiv(un,hh);

            hl.re:=1-sqr(f/f2);
            hl.Im:=sqrt(2)*f/f2;
            hl:=ComplexDiv(un,hl);

            ht.re:=1-sqr(f/f4);
            ht.Im:=f/(f4*q4);
            num.Re:=1;
            num.Im:=f/f3;
            ht:=ComplexDiv(num,ht);

            int1:=complexmul(hh,hl);
            result:=complexmul(int1,ht);
         end;

5 :  begin
            f1:=0.4;
            f2:=100;
            f3:=1;
            f4:=1;
            q4:=0.63;

            hh.re:=1-sqr(f1/f);
            hh.Im:=-sqrt(2)*f1/f;
            hh:=ComplexDiv(un,hh);

            hl.re:=1-sqr(f/f2);
            hl.Im:=sqrt(2)*f/f2;
            hl:=ComplexDiv(un,hl);

            ht.re:=1-sqr(f/f4);
            ht.Im:=f/(f4*q4);
            num.Re:=1;
            num.Im:=f/f3;
            ht:=ComplexDiv(num,ht);

            int1:=complexmul(hh,hl);
            result:=complexmul(int1,ht);
         end;

6 :  begin
            f1:=0.4;
            f2:=100;
            f5:=3.75;
            q5:=0.91;
            f6:=5.32;
            q6:=0.91;

            hh.re:=1-sqr(f1/f);
            hh.Im:=-sqrt(2)*f1/f;
            hh:=ComplexDiv(un,hh);

            hl.re:=1-sqr(f/f2);   // pass-bas
            hl.Im:=sqrt(2)*f/f2;
            hl:=ComplexDiv(un,hl);

            hs.re:=1-sqr(f/f6);
            hs.Im:=f/(f6*q6);
						
            num.Re:=1-sqr(f/f5);
            num.Im:=f/(f5*q5);
						
            hs:=ComplexDiv(num,hs);
            hs:=Complexscl(sqr(f5/f6),hs);

            int1:=complexmul(hh,hl);
            result:=complexmul(int1,hs);
         end;

7 :  begin  // norme main-bras 5349
            f1:=6.310;
            f2:=1258.9;
            f3:=15.915;
            f4:=15.915;
            q1:=0.71;
            q2:=0.64;
            k:=1;

            numHb.re:=8*sqr(Pi);
            numHb.Im:=f*sqr(f2);
            denHb1.re:=-4*sqr(Pi)f2;
            denHb1.Im:=(4*sqr(Pi)*f1*f)/(q1 + 4*sqr(Pi)* sqr(f1);
            denHb2.re:=-4*sqr(Pi)f;
            denHb2.Im:=(4*sqr(Pi)*f2*f)/(q1 + 4*sqr(Pi)* sqr(f2);
            denHb:=ComplexMul(denHb1,denHb2);
            Hb:=ComplexDiv(numHb,denHb);

            numHw.re:=4*sqr(Pi)*f3*k*srq(f4);
            numHw.Im:=4*sqr(Pi)*f*k*sqr(f4);
            denHw.re:=(-4*sqr(Pi)*sqr(f)*f3)/(q2+4*sqr(Pi)*sqr(f4);
            denHw.Im:=(4*sqr(Pi)*f4*f*f3)/(q2+4*sqr(Pi)*sqr(f4);
            Hw:=ComplexDiv(numHw,denHw);

            result:=Complexmul(Hb,Hw);


         end;
    end;
end;

procedure TForm1.BitBtnWithColor9Click(Sender: TObject);
begin
   MessageDlg('Fichier texte contenant les échantillons temporels d''accélérations en m/s2 classés en colonne', mtInformation,
      [mbOk], 0);
end;

procedure TForm1.Edit1Exit(Sender: TObject);
begin
   fichierin:=edit1.Text; edit1.text:=fichierin;
end;

procedure TForm1.Edit1DblClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
   edit1.Text:=OpenDialog1.filename;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  Fich: TextFile;
  x,df:double;
  j,filt,k:integer;
  gi,gp: array of tcomplex;
begin
   if extractfileext(fichierin)<>'pond' then
   begin
     i:=0;
     fichierout:=changefileext(fichierin,'.pond');
     AssignFile(Fich,fichierin);
     Reset(Fich);
     while not eof(Fich) do
     begin
         readln(Fich,x);
         i:=i+1;
         setlength(g,i);
         g[i-1].re:=x;
         g[i-1].im:=0;
     end;
     setlength(gf,i);
     setlength(gi,i);
     setlength(gp,i);
     SetLength(gpo, 6, i);
     SetLength(gs, 6, i);
     SetLength(gfo, 6, i);
     CloseFile(Fich);
     ForwardFFT(g,gf,i);
     AssignFile(Fich,fichierout);
     Rewrite(Fich);

     for k:=1 to 6 do  // N° du filtre
     begin
       filt:=k;
       for j:=1 to trunc(i/2) do  // n° echantillon
       begin
         gi[j]:=complexmul(gf[j],H(filt,j*f/i));
       end;
       for j:=trunc(i/2)+1 to i-1 do
       begin
         gi[j].re:=gi[i-j].re;
         gi[j].im:=-gi[i-j].im;
       end;
       InverseFFT(gi,gp,i);
       for j:=0 to i-1 do
       begin
         gpo[k-1,j]:=gp[j].re;
         gs[k-1,j]:=complexmag(gi[j]);
         gfo[k-1,j]:=complexmag(h(k,(j+1)*f/i));
       end;
     end;


     if checkbox1.checked=true then
     begin
      k:=0;
      for j:=0 to i-1 do begin write(Fich,complexmag(gf[j])); write(Fich,' '); write(Fich,g[j].re); write(Fich,' '); write(Fich,gs[k,j]); write(Fich,' '); writeln(Fich,gpo[k,j]) end;
     end;
     if checkbox2.checked=true then
     begin
      k:=1;
      for j:=0 to i-1 do begin write(Fich,complexmag(gf[j])); write(Fich,' '); write(Fich,g[j].re); write(Fich,' '); write(Fich,gs[k,j]); write(Fich,' '); writeln(Fich,gpo[k,j]) end;
     end;
     if checkbox3.checked=true then
     begin
      k:=2;
      for j:=0 to i-1 do begin write(Fich,complexmag(gf[j])); write(Fich,' '); write(Fich,g[j].re); write(Fich,' '); write(Fich,gs[k,j]); write(Fich,' '); writeln(Fich,gpo[k,j]) end;
     end;
     if checkbox4.checked=true then
     begin
      k:=3;
      for j:=0 to i-1 do begin write(Fich,complexmag(gf[j])); write(Fich,' '); write(Fich,g[j].re); write(Fich,' '); write(Fich,gs[k,j]); write(Fich,' '); writeln(Fich,gpo[k,j]) end;
     end;
     if checkbox5.checked=true then
     begin
      k:=4;
      for j:=0 to i-1 do begin write(Fich,complexmag(gf[j])); write(Fich,' '); write(Fich,g[j].re); write(Fich,' '); write(Fich,gs[k,j]); write(Fich,' '); writeln(Fich,gpo[k,j]) end;
     end;
     if checkbox6.checked=true then
     begin
      k:=5;
      for j:=0 to i-1 do begin write(Fich,complexmag(gf[j])); write(Fich,' '); write(Fich,g[j].re); write(Fich,' '); write(Fich,gs[k,j]); write(Fich,' '); writeln(Fich,gpo[k,j]) end;
     end;

     CloseFile(Fich);
     form2.showmodal;
   end
   else MessageDlg('Vérifiez le fichier à traiter : l''extension ''.pond'' n''est pas autorisée.', mtInformation,
      [mbOk], 0);
end;

procedure TForm1.Edit2Change(Sender: TObject);
begin
   f:=strtofloat(edit2.text);
end;

procedure TForm1.BitBtnWithColor1Click(Sender: TObject);
begin
   MessageDlg('SANTE : axe Z, assise'+char(13)+'CONFORT : axe Z, assise'+char(13)+
   '                    axe Z, debout'+char(13)+
   '                    vertical, allongé (tête exceptée)'+char(13)+
   '                    axes X,Y,Z, pieds (position assise)'+char(13)+
   'PERCEPTION : axe Z, assise'+char(13)+
   '                        axe Z, debout'+char(13)+
   '                        vertical, allongé'
   , mtinformation,
      [mbOk], 0);
end;

procedure TForm1.BitBtnWithColor2Click(Sender: TObject);
begin
   MessageDlg('SANTE : axe X, assise'+char(13)+
   '              axe Y, assise'+char(13)+
   'CONFORT : axes X,Y, assise'+char(13)+
   '                    axes Y,Z, dossier'+char(13)+
   '                    horizontal, allongé'+char(13)+
   '                    axes X,Y, debout'+char(13)+
   'PERCEPTION : axes X,Y, assise'+char(13)+
   '                        axe X,Y, debout'+char(13)+
   '                        horizontal, allongé'
   , mtinformation,
      [mbOk], 0);
end;

procedure TForm1.BitBtnWithColor3Click(Sender: TObject);
begin
   MessageDlg('MAL des TRANSPORTS : vertical'
   , mtinformation,
      [mbOk], 0);
end;

procedure TForm1.BitBtnWithColor4Click(Sender: TObject);
begin
   MessageDlg('SANTE : axe X, dossier'+char(13)+
   'CONFORT : axe X, dossier'+char(13)+
   'PERCEPTION : axe X, dossier'
   , mtinformation,
      [mbOk], 0);
end;

procedure TForm1.BitBtnWithColor5Click(Sender: TObject);
begin
   MessageDlg(
   'CONFORT : rotations X,Y,Z, dossier'+char(13)+
   'PERCEPTION : rotations X,Y,Z, dossier'
   , mtinformation,
      [mbOk], 0);
end;

procedure TForm1.BitBtnWithColor6Click(Sender: TObject);
begin
   MessageDlg(
   'CONFORT : vertical, debout (tête)'+char(13)+
   'PERCEPTION : vertical, debout'
   , mtinformation,
      [mbOk], 0);
end;

procedure TForm1.BitBtnWithColor7Click(Sender: TObject);
begin
   MessageDlg('Sélectionner le fichier de valeurs d''accélérations à traiter, '+
   'spécifier la fréquence d''échantillonnage et les filtres de pondération souhaités, '+
   'puis lancer le calcul de filtrage des accélérations. Les valeurs filtrées sont écrites '+
   'dans le fichier portant le même radical que le fichier de valeurs d''entrée avec l''extension .pond. '+
   'Les différents filtrages sont écrits à la suite dans l''ordre du tableau de sélection des  filtres.'+char(13)+
   'Auteur : P LEMERLE (lemerle@inrs.fr), Date : 2/1/2005', mtinformation,
      [mbOk], 0);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   f:=strtofloat(edit2.text);
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
   f:=strtofloat(edit2.text);
end;

end.
