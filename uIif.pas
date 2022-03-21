{
unit� uIif.pas : impl�mentation des diff�rentes "versions" de la fonction IIF

Le principe consiste � retourner le param�tre "vrai" ou "faux", selon la
v�racit� de la condition pass�e elle-m�me en param�tre !

Le mot reserv� "overload" permet de pouvoir d�clarer et impl�menter plusieurs
fois des fonctions avec le m�me nom, mais avec des param�tres qui diff�rent...
La d�termination de la fonction � utiliser sera faite suivant les param�tres
pass�s � la fonction par le compilateur. On trouve l'exemple de fonctions
"overload�es" dans la classe TFileStream, par exemple, avec sa m�thode Create.

(Je ne commente pas le code, tellement il est simple !! :) )
}
unit uIIF;

interface

function I2F(Condition: Boolean; Vrai, Faux: String): String; overload;
function I2F(Condition: Boolean; Vrai, Faux: Integer): Integer; overload;
function I2F(Condition: Boolean; Vrai, Faux: double): double; overload;

implementation
//==============================================================================
function I2F(Condition: Boolean; Vrai, Faux: String): String; overload;
begin
  If Condition then
    I2F := Vrai
  else
    I2F := Faux;
end;
//==============================================================================
function I2F(Condition: Boolean; Vrai, Faux: Integer): Integer; overload;
begin
  If Condition then
    I2F := Vrai
  else
    I2F := Faux;
end;
//==============================================================================
function I2F(Condition: Boolean; Vrai, Faux: double): double; overload;
begin
  If Condition then
    I2F := Vrai
  else
    I2F := Faux;
end;
//==============================================================================
end.
