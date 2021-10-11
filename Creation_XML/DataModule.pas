unit DataModule;

interface

uses
  SysUtils, Classes, DB, DBClient;

type
  TData = class(TDataModule)
    DS: TDataSource;
    CDSet: TClientDataSet;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Data: TData;

implementation

{$R *.dfm}

procedure TData.DataModuleCreate(Sender: TObject);
begin

if FileExists('BaseRepTel.xml') then
begin
CDSet.LoadFromFile('BaseRepTel.xml');
CDSet.Open;
end else
begin
With CDSet.FieldDefs do
begin
        Clear;
        Add('Reference',ftAutoInc,0);
        Add('Nom',ftString,40);
        Add('Prenom',ftString,40);
        Add('Adresse',ftString,40);
        Add('Ville',ftString,20);
        Add('Paye',ftString,30);
        Add('Tel_Portable',ftString,40);
        Add('Tel_Bureau',ftString,40);
        Add('Groupe',ftString,20);
        Add('Notes',ftMemo,0);
        Add('Photo',ftGraphic,0);
end;
CDSet.CreateDataSet;
CDSet.SaveToFile('BaseRepTel.xml');
end;
end;

end.
