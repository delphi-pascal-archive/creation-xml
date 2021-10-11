unit AFirst;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, DBCtrls, Grids, DBGrids, DB, DBClient;

type
  Txmltable = class(TForm)
    MainMenu: TMainMenu;
    Fichier: TMenuItem;
    Crerlatable: TMenuItem;
    N1: TMenuItem;
    Quitter: TMenuItem;
    Sauvegarder: TMenuItem;
    Ouvrire: TMenuItem;
    SaveDialog: TSaveDialog;
    OpenDialog: TOpenDialog;
    DBNavigator: TDBNavigator;
    DBGrid: TDBGrid;
    procedure CrerlatableClick(Sender: TObject);
    procedure SauvegarderClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure QuitterClick(Sender: TObject);
    procedure OuvrireClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  xmltable: Txmltable;
  CDSet: TClientDataSet;

implementation

{$R *.dfm}

uses DataModule;

procedure Txmltable.CrerlatableClick(Sender: TObject);
begin
// c bien de vérifier l'existance d'un composant avant de créer la table

// Créer un TClientDataSet
CDSet:= TClientDataSet.Create(nil); // n'oubliez pas d'ajouter DBClient aux uses
// avec CDSet faire
With CDSet.FieldDefs do
begin // bedut
        Clear;                       // Effacer tous les champs
        Add('Reference',ftAutoInc,0);// n'oublie pas d'ajouter DB aux uses
        Add('Nom',ftString,40);      // ajouter le champs nom de type string et de taille 40
        Add('Prenom',ftString,40);
        Add('Adresse',ftString,40);
        Add('Ville',ftString,20);
        Add('Paye',ftString,30);
        Add('Tel_Portable',ftString,40);
        Add('Tel_Bureau',ftString,40);
        Add('Groupe',ftString,20);
        Add('Notes',ftMemo,255);     // Ajouter Notes de type Memo et de taille 255
        Add('Photo',ftGraphic,0);    // Ajouter Photo de type graphique
end; // fin
 CDSet.CreateDataSet;// créer le CDSet
 Sauvegarder.Enabled:=true; // activer l'item sauvegarder
 ShowMessage('The XML table created successfully!');
end;

procedure Txmltable.SauvegarderClick(Sender: TObject);
begin
SaveDialog.FileName:='BaseRepTel.xml';        // le nom du fichier du SaveDialog
if SaveDialog.Execute then                    // Si SaveDialog est exécuté
CDSet.SaveToFile(SaveDialog.FileName);        // enregistrer notre table
CDSet.Free;                                   // Libérer CDSet
Sauvegarder.Enabled:=false;                   // Désactiver l'item Sauvegarder
end;

procedure Txmltable.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 Application.Terminate;
end;

procedure Txmltable.QuitterClick(Sender: TObject);
begin
 Application.Terminate;
end;

procedure Txmltable.OuvrireClick(Sender: TObject);
begin
 if OpenDialog.Execute then// Si OpenDialog est exécuté
  begin
   Data.CDSet.Active:=false;// Désactiver CDSet
   Data.CDSet.LoadFromFile(OpenDialog.FileName); // charger le fichier séléction
   Data.CDSet.Active:=true;// Activer CDSet
  end;
end;

end.


