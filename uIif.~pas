{
unité uIif.pas : implémentation des différentes "versions" de la fonction IIF

Le principe consiste à retourner le paramètre "vrai" ou "faux", selon la
véracité de la condition passée elle-même en paramètre !

Le mot reservé "overload" permet de pouvoir déclarer et implémenter plusieurs
fois des fonctions avec le même nom, mais avec des paramètres qui diffèrent...
La détermination de la fonction à utiliser sera faite suivant les paramètres
passés à la fonction par le compilateur. On trouve l'exemple de fonctions
"overloadées" dans la classe TFileStream, par exemple, avec sa méthode Create.

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
