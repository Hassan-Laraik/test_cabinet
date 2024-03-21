unit uGestionPatient;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, DBGrids,
  StdCtrls,udm,uPatient;

type

  { TFrmBestionPatient }

  TFrmBestionPatient = class(TForm)
    BtnSuprimer: TButton;
    BtnModifier: TButton;
    BtnNouveau: TButton;
    BtnRchercher: TButton;
    BtnFermer: TButton;
    DBGrid1: TDBGrid;
    LblRechercher: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure BtnModifierClick(Sender: TObject);
    procedure BtnNouveauClick(Sender: TObject);
  private

  public

  end;

var
  FrmBestionPatient: TFrmBestionPatient;

implementation

{$R *.lfm}

{ TFrmBestionPatient }

procedure TFrmBestionPatient.BtnNouveauClick(Sender: TObject);
begin
  DM.ZtblPAtients.Append;
  FrmPatient.ShowModal;
end;

procedure TFrmBestionPatient.BtnModifierClick(Sender: TObject);
begin
  FrmPatient.ShowModal;
end;

end.

