object xmltable: Txmltable
  Left = 229
  Top = 126
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Creation XML'
  ClientHeight = 353
  ClientWidth = 730
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 120
  TextHeight = 16
  object DBNavigator: TDBNavigator
    Left = 8
    Top = 320
    Width = 710
    Height = 25
    DataSource = Data.DS
    Flat = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object DBGrid: TDBGrid
    Left = 8
    Top = 8
    Width = 713
    Height = 305
    DataSource = Data.DS
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -14
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object MainMenu: TMainMenu
    Left = 40
    Top = 80
    object Fichier: TMenuItem
      Caption = 'File'
      object Ouvrire: TMenuItem
        Caption = 'Open XML'
        OnClick = OuvrireClick
      end
      object Crerlatable: TMenuItem
        Caption = 'Create XML table'
        OnClick = CrerlatableClick
      end
      object Sauvegarder: TMenuItem
        Caption = 'Enregister sous...'
        Enabled = False
        OnClick = SauvegarderClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Quitter: TMenuItem
        Caption = 'Exit'
        OnClick = QuitterClick
      end
    end
  end
  object SaveDialog: TSaveDialog
    Filter = 'BaseRepTel.xml|BaseRepTel.xml'
    Left = 72
    Top = 80
  end
  object OpenDialog: TOpenDialog
    Filter = 'BaseRepTel.xml|BaseRepTel.xml'
    Left = 104
    Top = 80
  end
end
