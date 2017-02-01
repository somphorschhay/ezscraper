object FormCreateProject: TFormCreateProject
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'New Project'
  ClientHeight = 221
  ClientWidth = 484
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 18
  object Label1: TLabel
    Left = 16
    Top = 75
    Width = 99
    Height = 18
    Caption = 'Project Name :'
  end
  object Label2: TLabel
    Left = 16
    Top = 123
    Width = 99
    Height = 18
    Caption = 'Project Folder :'
  end
  object Label4: TLabel
    Left = 11
    Top = 3
    Width = 134
    Height = 23
    Caption = 'Create a project'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 11
    Top = 32
    Width = 144
    Height = 18
    Caption = 'Enter a project name.'
  end
  object EditProjectName: TEdit
    Left = 121
    Top = 72
    Width = 345
    Height = 26
    TabOrder = 0
    Text = '[001] Naver.com'
    OnChange = EditProjectNameChange
  end
  object Edit1: TEdit
    Left = 121
    Top = 120
    Width = 345
    Height = 26
    Enabled = False
    TabOrder = 1
  end
  object ButtonFinish: TButton
    Left = 310
    Top = 178
    Width = 75
    Height = 25
    Caption = 'Finish'
    TabOrder = 2
    OnClick = ButtonFinishClick
  end
  object ButtonCancel: TButton
    Left = 391
    Top = 178
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = ButtonCancelClick
  end
end
