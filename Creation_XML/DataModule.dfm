object Data: TData
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 227
  Top = 200
  Height = 150
  Width = 215
  object DS: TDataSource
    DataSet = CDSet
    Left = 8
    Top = 56
  end
  object CDSet: TClientDataSet
    Aggregates = <>
    FileName = '.\BaseRepTel.xml'
    Params = <>
    Left = 8
    Top = 8
  end
end
