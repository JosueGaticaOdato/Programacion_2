object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 541
  ClientWidth = 510
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
    Left = 8
    Top = 27
    Width = 38
    Height = 13
    Caption = 'Patente'
  end
  object Label2: TLabel
    Left = 8
    Top = 101
    Width = 88
    Height = 13
    Caption = 'Estado de la multa'
  end
  object Label3: TLabel
    Left = 8
    Top = 155
    Width = 29
    Height = 13
    Caption = 'Fecha'
  end
  object Label4: TLabel
    Left = 8
    Top = 216
    Width = 38
    Height = 13
    Caption = 'Importe'
  end
  object Label5: TLabel
    Left = 176
    Top = 287
    Width = 100
    Height = 13
    Caption = 'Consulte por su auto'
  end
  object Button1: TButton
    Left = 24
    Top = 278
    Width = 105
    Height = 33
    Caption = 'Ingresar multa'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 176
    Top = 8
    Width = 225
    Height = 273
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object Edit1: TEdit
    Left = 8
    Top = 51
    Width = 145
    Height = 21
    TabOrder = 2
  end
  object ComboBox1: TComboBox
    Left = 0
    Top = 120
    Width = 145
    Height = 21
    TabOrder = 3
    Items.Strings = (
      'Pendiente'
      'Abonada'
      'Anulada')
  end
  object DateTimePicker1: TDateTimePicker
    Left = 8
    Top = 182
    Width = 145
    Height = 21
    Date = 44354.000000000000000000
    Time = 0.901170567129156600
    TabOrder = 4
  end
  object Edit2: TEdit
    Left = 8
    Top = 251
    Width = 145
    Height = 21
    TabOrder = 5
  end
  object Button3: TButton
    Left = 150
    Top = 344
    Width = 99
    Height = 25
    Caption = 'Multa m'#225's antig'#252'a'
    TabOrder = 6
  end
  object Button2: TButton
    Left = 25
    Top = 344
    Width = 105
    Height = 25
    Caption = 'Calcular deudas'
    TabOrder = 7
    OnClick = Button2Click
  end
  object Button4: TButton
    Left = 279
    Top = 344
    Width = 99
    Height = 25
    Caption = 'Multa mas reciente'
    TabOrder = 8
  end
  object Button5: TButton
    Left = 24
    Top = 384
    Width = 105
    Height = 49
    Caption = 'Vehiculo con mayor cantidad de infracciones'
    TabOrder = 9
    WordWrap = True
  end
  object Button6: TButton
    Left = 150
    Top = 384
    Width = 99
    Height = 49
    Caption = 'Vehiculo con la mayor deuda'
    TabOrder = 10
    WordWrap = True
  end
  object Button7: TButton
    Left = 278
    Top = 384
    Width = 99
    Height = 49
    Caption = 'Vehiculo sin deudas'
    TabOrder = 11
    WordWrap = True
  end
  object Edit3: TEdit
    Left = 176
    Top = 306
    Width = 121
    Height = 21
    TabOrder = 12
  end
end
