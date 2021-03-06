unit LabelEditEx;

interface

uses
Windows, Messages, Menus, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
StdCtrls, ExtCtrls;

type TLabeledEditEx = class(TLabeledEdit)
  private FAlignment: TAlignment;
  procedure SetAlignment(const Value: TAlignment);
  protected
  procedure CreateParams(var Params: TCreateParams); override;
  public
  published
  constructor Create(AOwner: TComponent); override;
  property Alignment: TAlignment
  read FAlignment
  write SetAlignment
  default taRightJustify;
end;

procedure Register;

implementation

//uses newton_oscar;
//==============================================================================================
{R LabelEditEx.dcr}
//==============================================================================================
procedure Register;
begin
  RegisterComponents('My Comp', [TLabeledEditEx]);
end;
//==============================================================================================
{ TLabeledEditEx }
//==============================================================================================
constructor TLabeledEditEx.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FAlignment := taRightJustify;
end;
//==============================================================================================
procedure TLabeledEditEx.CreateParams(var Params: TCreateParams);
const Alignments: array[TAlignment] of Cardinal = (ES_LEFT, ES_RIGHT, ES_CENTER);
begin
  inherited CreateParams(Params);
  Params.Style := Params.Style or {ES_MULTILINE or} Alignments[FAlignment];
end;
//==============================================================================================
procedure TLabeledEditEx.SetAlignment(const Value: TAlignment);
begin
  if FAlignment<>Value then
  begin
    FAlignment := Value;
    RecreateWnd;
  end;
end;
//==============================================================================================
end.
