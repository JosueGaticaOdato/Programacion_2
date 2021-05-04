object Form1: TForm1
  Left = 0
  Top = 0
  ActiveControl = Memo1
  Caption = 'Form1'
  ClientHeight = 442
  ClientWidth = 799
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 152
    Width = 154
    Height = 16
    Caption = 'Ingresa la patente del auto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 208
    Width = 95
    Height = 13
    Caption = 'Horario de entrada:'
  end
  object Label3: TLabel
    Left = 16
    Top = 269
    Width = 84
    Height = 13
    Caption = 'Horario de salida:'
  end
  object Memo1: TMemo
    Left = 232
    Top = 48
    Width = 457
    Height = 369
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object btnGuardar: TButton
    Left = 16
    Top = 48
    Width = 169
    Height = 33
    Caption = 'Guardar auto'
    TabOrder = 1
    OnClick = btnGuardarClick
  end
  object Button2: TButton
    Left = 16
    Top = 104
    Width = 169
    Height = 33
    Caption = 'Retirar auto'
    TabOrder = 2
  end
  object Patente: TEdit
    Left = 16
    Top = 176
    Width = 169
    Height = 21
    TabOrder = 3
  end
  object autosGuardados: TButton
    Left = 16
    Top = 320
    Width = 169
    Height = 33
    Caption = 'Mostrar autos guardados'
    TabOrder = 4
    OnClick = autosGuardadosClick
  end
  object horarioEntrada: TEdit
    Left = 16
    Top = 232
    Width = 169
    Height = 21
    TabOrder = 5
  end
  object horarioSalida: TEdit
    Left = 16
    Top = 288
    Width = 169
    Height = 21
    TabOrder = 6
  end
end
