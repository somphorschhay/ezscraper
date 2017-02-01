object FormFind: TFormFind
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Find/Replace'
  ClientHeight = 292
  ClientWidth = 311
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 297
    Height = 281
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 30
      Height = 13
      Caption = 'Find : '
    end
    object Label2: TLabel
      Left = 16
      Top = 50
      Width = 71
      Height = 13
      Caption = 'Replace with : '
    end
    object EditFind: TEdit
      Left = 104
      Top = 20
      Width = 186
      Height = 21
      TabOrder = 0
      OnChange = EditFindChange
    end
    object EditReplace: TEdit
      Left = 104
      Top = 47
      Width = 186
      Height = 21
      TabOrder = 1
      OnEnter = EditReplaceEnter
    end
    object RadioGroupDirection: TRadioGroup
      Left = 16
      Top = 96
      Width = 274
      Height = 73
      Caption = 'Direction'
      ItemIndex = 0
      Items.Strings = (
        'Forward'
        'Backward')
      TabOrder = 2
      OnClick = RadioGroupDirectionClick
    end
    object ButtonFind: TButton
      Left = 104
      Top = 214
      Width = 90
      Height = 25
      Caption = 'Find'
      TabOrder = 3
      OnClick = ButtonFindClick
    end
    object ButtonReplaceFind: TButton
      Left = 200
      Top = 214
      Width = 90
      Height = 25
      Caption = 'Replace'
      TabOrder = 4
      OnClick = ButtonReplaceFindClick
    end
    object ButtonClose: TButton
      Left = 200
      Top = 245
      Width = 90
      Height = 25
      Caption = 'Close'
      TabOrder = 5
      OnClick = ButtonCloseClick
    end
    object ButtonReplaceAll: TButton
      Left = 104
      Top = 245
      Width = 90
      Height = 25
      Caption = 'Replace All'
      TabOrder = 6
      OnClick = ButtonReplaceAllClick
    end
  end
end
