object FormResultCode: TFormResultCode
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Result Code'
  ClientHeight = 481
  ClientWidth = 610
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PanelAddResult: TPanel
    Left = 8
    Top = 8
    Width = 584
    Height = 177
    TabOrder = 0
    object lblname: TLabel
      Left = 32
      Top = 29
      Width = 27
      Height = 13
      Caption = 'Name'
    end
    object lblcode: TLabel
      Left = 32
      Top = 56
      Width = 25
      Height = 13
      AutoSize = False
      Caption = 'Code'
    end
    object lbl1: TLabel
      Left = 34
      Top = 83
      Width = 24
      Height = 13
      Caption = 'Type'
    end
    object EditName: TEdit
      Left = 88
      Top = 26
      Width = 318
      Height = 21
      TabOrder = 0
    end
    object EditCode: TEdit
      Left = 88
      Top = 53
      Width = 318
      Height = 21
      TabOrder = 1
    end
    object ComboBoxType: TComboBox
      Left = 88
      Top = 80
      Width = 318
      Height = 21
      Style = csDropDownList
      TabOrder = 2
      Items.Strings = (
        'SUCCESS'
        'INFORMATION'
        'ERROR')
    end
    object ButtonAdd: TButton
      Left = 88
      Top = 120
      Width = 75
      Height = 27
      Caption = 'Add'
      TabOrder = 3
      OnClick = ButtonAddClick
    end
    object ButtonEdit: TButton
      Left = 169
      Top = 120
      Width = 75
      Height = 27
      Caption = 'Edit'
      TabOrder = 4
      OnClick = ButtonEditClick
    end
    object ButtonSave: TButton
      Left = 331
      Top = 120
      Width = 75
      Height = 27
      Caption = 'Save'
      TabOrder = 5
      OnClick = ButtonSaveClick
    end
    object ButtonDelete: TButton
      Left = 250
      Top = 120
      Width = 75
      Height = 27
      Caption = 'Delete'
      TabOrder = 6
      OnClick = ButtonDeleteClick
    end
  end
  object ListViewCodeType: TListView
    Left = 8
    Top = 200
    Width = 584
    Height = 273
    Columns = <
      item
        Caption = 'N'#186
      end
      item
        Caption = 'Name'
        Width = 220
      end
      item
        Caption = 'Code'
        Width = 180
      end
      item
        AutoSize = True
        Caption = 'Type'
      end>
    RowSelect = True
    TabOrder = 1
    ViewStyle = vsReport
    OnChange = ListViewCodeTypeChange
  end
end
