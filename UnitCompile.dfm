object FormCompile: TFormCompile
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  BorderWidth = 5
  Caption = 'Compile'
  ClientHeight = 167
  ClientWidth = 357
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 357
    Height = 121
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 347
    DesignSize = (
      357
      121)
    object EditLinkingPath: TEdit
      Left = 8
      Top = 35
      Width = 341
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clMenu
      Enabled = False
      TabOrder = 0
      ExplicitWidth = 331
    end
    object EditTotalLines: TEdit
      Left = 8
      Top = 62
      Width = 341
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clMenu
      Enabled = False
      TabOrder = 1
      Text = 'Total Lines:'
      ExplicitWidth = 331
    end
    object EditProjectPath: TEdit
      Left = 8
      Top = 8
      Width = 341
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clMenu
      Enabled = False
      TabOrder = 2
      ExplicitWidth = 331
    end
    object EditStatus: TEdit
      Left = 8
      Top = 89
      Width = 113
      Height = 21
      Alignment = taCenter
      Anchors = [akLeft, akTop, akRight]
      Color = clMenu
      Enabled = False
      TabOrder = 3
      Text = 'Status: Compiling'
      ExplicitWidth = 103
    end
    object EditWarning: TEdit
      Left = 127
      Top = 89
      Width = 106
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clMenu
      Enabled = False
      TabOrder = 4
      Text = 'Warning: 0'
      ExplicitWidth = 96
    end
    object EditError: TEdit
      Left = 239
      Top = 89
      Width = 110
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clMenu
      Enabled = False
      TabOrder = 5
      Text = 'Error: 0'
      ExplicitWidth = 100
    end
  end
  object ButtonCancel: TButton
    Left = 144
    Top = 127
    Width = 73
    Height = 24
    Caption = 'Cancel'
    TabOrder = 1
    OnClick = ButtonCancelClick
  end
end
