object FormWorkspace: TFormWorkspace
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Workspace'
  ClientHeight = 178
  ClientWidth = 589
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -17
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 21
  object Label1: TLabel
    Left = 8
    Top = 29
    Width = 545
    Height = 42
    Caption = 
      'EZCodeGenerator store scrapping projects in a folder called a wo' +
      'rkspace.'#13#10'Choose a workspace folder.'
  end
  object Label2: TLabel
    Left = 6
    Top = 90
    Width = 97
    Height = 21
    Caption = 'Workspace : '
  end
  object Label3: TLabel
    Left = 8
    Top = 0
    Width = 160
    Height = 23
    Caption = 'Select a workspace'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object ComboBoxWorkspace: TComboBox
    Left = 99
    Top = 87
    Width = 382
    Height = 29
    TabOrder = 0
  end
  object Browse: TButton
    Left = 487
    Top = 87
    Width = 75
    Height = 29
    Caption = 'Browse...'
    TabOrder = 1
    OnClick = BrowseClick
  end
  object ButtonOK: TButton
    Left = 406
    Top = 136
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 2
    OnClick = ButtonOKClick
  end
  object ButtonCancel: TButton
    Left = 487
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = ButtonCancelClick
  end
end
