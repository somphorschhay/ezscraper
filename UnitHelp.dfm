object FormHelp: TFormHelp
  Left = 195
  Top = 108
  BorderStyle = bsDialog
  Caption = 'Help'
  ClientHeight = 300
  ClientWidth = 427
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 427
    Height = 266
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 5
    ParentColor = True
    TabOrder = 0
    object PageControl1: TPageControl
      Left = 5
      Top = 5
      Width = 417
      Height = 256
      ActivePage = TabSheet1
      Align = alClient
      MultiLine = True
      Style = tsButtons
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'Workspace'
        object RichEdit1: TRichEdit
          Left = 0
          Top = 0
          Width = 409
          Height = 225
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Lines.Strings = (
            'Your workspace should be in this structure:'
            '-> Workspace'
            '   -> Common (This folder generated when you select workspace)'
            
              '   -> Project (This folder you need to create and all your proje' +
              'ct must be here)'
            '   -> Plugin (Optional folder)')
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Zoom = 100
          ExplicitTop = 3
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 266
    Width = 427
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 1
    object OKBtn: TButton
      Left = 263
      Top = 1
      Width = 75
      Height = 25
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
    object CancelBtn: TButton
      Left = 343
      Top = 1
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
    end
  end
end
