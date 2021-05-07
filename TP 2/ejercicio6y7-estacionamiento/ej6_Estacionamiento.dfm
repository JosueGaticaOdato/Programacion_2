object Form1: TForm1
  Left = 0
  Top = 0
  ActiveControl = Memo1
  Caption = 'Form1'
  ClientHeight = 442
  ClientWidth = 866
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 232
    Top = 48
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
    Top = 128
    Width = 89
    Height = 13
    Caption = 'Fecha de entrada:'
  end
  object Label3: TLabel
    Left = 655
    Top = 128
    Width = 78
    Height = 13
    Caption = 'Fecha de salida:'
  end
  object Label4: TLabel
    Left = 16
    Top = 200
    Width = 130
    Height = 13
    Caption = 'Ingrese horario de entrada'
  end
  object Label5: TLabel
    Left = 672
    Top = 200
    Width = 119
    Height = 13
    Caption = 'Ingrese horario de salida'
  end
  object Memo1: TMemo
    Left = 232
    Top = 96
    Width = 401
    Height = 321
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
  object btnRetirar: TButton
    Left = 672
    Top = 48
    Width = 169
    Height = 33
    Caption = 'Retirar auto'
    TabOrder = 2
    OnClick = btnRetirarClick
  end
  object Patente: TEdit
    Left = 400
    Top = 47
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
  object Fecha_Entrada: TDateTimePicker
    Left = 16
    Top = 147
    Width = 186
    Height = 21
    Date = 44320.000000000000000000
    Time = 0.840964224538765800
    TabOrder = 5
  end
  object Button1: TButton
    Left = 720
    Top = 352
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 6
  end
  object Fecha_Salida: TDateTimePicker
    Left = 655
    Top = 147
    Width = 186
    Height = 21
    Date = 44320.000000000000000000
    Time = 0.840964224538765800
    TabOrder = 7
  end
  object horaEntrada: TTimePicker
    Left = 8
    Top = 219
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 8
    TimeFormat = 'hh:mm'
  end
  object horaSalida: TTimePicker
    Left = 672
    Top = 219
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 9
    TimeFormat = 'hh:mm'
  end
end
