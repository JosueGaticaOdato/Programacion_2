object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 424
  ClientWidth = 618
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object Button1: TButton
    Left = 8
    Top = 112
    Width = 129
    Height = 49
    Caption = 'Mostrar polinomio'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 207
    Width = 129
    Height = 58
    Caption = 'Evaluar en un punto'
    TabOrder = 1
  end
  object Edit1: TEdit
    Left = 8
    Top = 167
    Width = 129
    Height = 23
    TabOrder = 2
    Text = 'Edit1'
  end
  object Button3: TButton
    Left = 8
    Top = 271
    Width = 129
    Height = 58
    Caption = 'Valores caracter'#237'sticos'
    TabOrder = 3
    WordWrap = True
  end
  object Button4: TButton
    Left = 262
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Cargar'
    TabOrder = 4
    OnClick = Button4Click
  end
  object C: TEdit
    Left = 8
    Top = 8
    Width = 121
    Height = 23
    TabOrder = 5
    Text = 'Coeficiente'
  end
  object G: TEdit
    Left = 135
    Top = 8
    Width = 121
    Height = 23
    TabOrder = 6
    Text = 'Grado'
  end
  object Memo1: TMemo
    Left = 152
    Top = 112
    Width = 313
    Height = 217
    Lines.Strings = (
      'Memo1')
    TabOrder = 7
  end
end
