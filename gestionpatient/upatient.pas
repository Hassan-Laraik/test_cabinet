unit uPatient;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, DBCtrls,
  StdCtrls,udm;

type

  { TFrmPatient }

  TFrmPatient = class(TForm)
    BtnAnnuler: TButton;
    BtnValider: TButton;
    EdtCode: TDBEdit;
    EdtNom: TDBEdit;
    EdtPrenom: TDBEdit;
    EdtGSM: TDBEdit;
    EdtEmail: TDBEdit;
    radioSexe: TDBRadioGroup;
    RadioCivilite: TDBRadioGroup;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure BtnAnnulerClick(Sender: TObject);
    procedure BtnValiderClick(Sender: TObject);
  private

  public

  end;

var
  FrmPatient: TFrmPatient;

implementation

{$R *.lfm}

{ TFrmPatient }

procedure TFrmPatient.BtnValiderClick(Sender: TObject);
begin
  //verification de la validite des donnees
  if (Length(Trim(EdtCode.Text))< 1 ) then
  begin
    ShowMessage('Remplir Votre Code');
    EdtCode.SetFocus;
     exit;
  end;
  if (Length(Trim(EdtNom.Text))< 3 ) then
  begin
    ShowMessage('Remplir Votre Nom correctement');
    EdtNom.SetFocus;
     exit;
  end;
  if (Length(Trim(EdtPrenom.Text))< 3 ) then
  begin
    ShowMessage('Remplir Votre Prénom correctement');
    EdtPrenom.SetFocus;
    exit;
  end;
  if (Length(Trim(EdtGSM.Text)) <> 10) then
  begin
    ShowMessage('Remplir Votre Numéro GSM Correctement(10 Numeros)');
    EdtPrenom.SetFocus;
    exit;
  end;
  //virifier identificateur
    DM.ZqryRecherche.Close;
     DM.ZqryRecherche.SQL.Clear;
     DM.ZqryRecherche.SQL.add('select codep from patients' );
     DM.ZqryRecherche.SQL.add('where codep=:code');
     DM.ZqryRecherche.ParamByName('code').AsString:=trim(EdtCode.text);
     DM.ZqryRecherche.Open;
     if DM.ZqryRecherche.RecordCount >= 1 then
     begin
       ShowMessage('Patient existe deja');
       EdtCode.SetFocus;
       exit;
     end;
  //verifier unicite GSM
     DM.ZqryRecherche.Close;
     DM.ZqryRecherche.SQL.Clear;
     DM.ZqryRecherche.SQL.add('select gsm from patients' );
     DM.ZqryRecherche.SQL.add('where gsm=:pgsm');
     DM.ZqryRecherche.ParamByName('pgsm').AsString:=trim(EdtGSM.text);
     DM.ZqryRecherche.Open;
     if DM.ZqryRecherche.RecordCount >= 1 then
     begin
       ShowMessage('Numéro Gsm Existe deja');
       EdtGSM.SetFocus;
       exit;
     end;
  DM.ZtblPAtients.Post;
  close;
end;

procedure TFrmPatient.BtnAnnulerClick(Sender: TObject);
begin
  DM.ZtblPAtients.Post;
  close;
end;

end.

