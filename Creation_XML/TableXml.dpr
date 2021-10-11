program TableXml;

uses
  Forms,
  AFirst in 'AFirst.pas' {xmltable},
  DataModule in 'DataModule.pas' {Data: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Txmltable, xmltable);
  Application.CreateForm(TData, Data);
  Application.Run;
end.
