object FormCreateModule: TFormCreateModule
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'New Scrapping Module'
  ClientHeight = 211
  ClientWidth = 484
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 18
  object Label3: TLabel
    Left = 11
    Top = 102
    Width = 100
    Height = 18
    Caption = 'Module Name :'
  end
  object Label2: TLabel
    Left = 11
    Top = 32
    Width = 245
    Height = 36
    Caption = 'Each projects contain many modules.'#13#10'Enter a module name.'
  end
  object Label4: TLabel
    Left = 11
    Top = 3
    Width = 138
    Height = 23
    Caption = 'Create a module'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object LabelMessage: TLabel
    Left = 11
    Top = 170
    Width = 15
    Height = 18
    Caption = '   '
  end
  object EditModuleName: TEdit
    Left = 121
    Top = 99
    Width = 345
    Height = 26
    TabOrder = 0
    Text = 'PROJ0010001'
  end
  object ButtonFinish: TButton
    Left = 310
    Top = 169
    Width = 75
    Height = 25
    Caption = 'Finish'
    TabOrder = 1
    OnClick = ButtonFinishClick
  end
  object ButtonCancel: TButton
    Left = 391
    Top = 169
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 2
    OnClick = ButtonCancelClick
  end
end
