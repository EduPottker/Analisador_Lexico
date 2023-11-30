object fAnalisadorLexico: TfAnalisadorLexico
  Left = 0
  Top = 0
  Caption = 'Analisador L'#233'xico - Eduardo P'#246'ttker da Silva'
  ClientHeight = 571
  ClientWidth = 872
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poDesktopCenter
  ScreenSnap = True
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    872
    571)
  PixelsPerInch = 96
  TextHeight = 15
  object lbl_VldTokens: TLabel
    Left = 296
    Top = 8
    Width = 92
    Height = 14
    Caption = 'Validar Tokens:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl_Obs: TLabel
    Left = 530
    Top = 10
    Width = 112
    Height = 11
    Alignment = taRightJustify
    Caption = 'Digite '#39'Espa'#231'o'#39' para validar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -9
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object SplitView: TSplitView
    Left = 0
    Top = 0
    Width = 290
    Height = 571
    BevelOuter = bvSpace
    Color = clWhite
    OpenedWidth = 290
    Placement = svpLeft
    TabOrder = 0
    DesignSize = (
      290
      571)
    object lbl_AddTokens: TLabel
      Left = 8
      Top = 8
      Width = 108
      Height = 14
      Caption = 'Adicionar Tokens:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_QtdLetras: TLabel
      Left = 236
      Top = 11
      Width = 18
      Height = 11
      Alignment = taRightJustify
      Caption = '0/50'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lv_Tokens: TListView
      Left = 8
      Top = 64
      Width = 274
      Height = 468
      Anchors = [akLeft, akTop, akRight, akBottom]
      BevelOuter = bvRaised
      Columns = <
        item
          AutoSize = True
          Caption = 'TOKENS'
          MaxWidth = 269
          MinWidth = 269
        end>
      ColumnClick = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ReadOnly = True
      RowSelect = True
      ParentFont = False
      TabOrder = 2
      ViewStyle = vsReport
      OnAdvancedCustomDrawItem = lv_TokensAdvancedCustomDrawItem
      OnKeyUp = lv_TokensKeyUp
    end
    object btn_Limpar: TButton
      Left = 200
      Top = 538
      Width = 82
      Height = 27
      Cursor = crHandPoint
      Hint = 'Limpar Lista'
      Anchors = [akLeft, akRight, akBottom]
      Caption = 'Limpar'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = btn_LimparClick
    end
    object edt_AddTokens: TEdit
      Left = 8
      Top = 28
      Width = 248
      Height = 22
      Cursor = crIBeam
      CharCase = ecLowerCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 50
      ParentFont = False
      TabOrder = 0
      TextHint = 'Apenas letras min'#250'sculas'
      OnChange = edt_AddTokensChange
      OnKeyDown = edt_AddTokensKeyDown
      OnKeyPress = edt_AddTokensKeyPress
    end
    object btn_AddToken: TBitBtn
      Left = 256
      Top = 27
      Width = 26
      Height = 24
      Cursor = crHandPoint
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000F1
        351BF1351B000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF000000F1351BF1351B000000FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000F1
        351BF1351B000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF000000F1351BF1351B000000FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000F1
        351BF1351B000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
        000000000000000000000000000000F1351BF1351B0000000000000000000000
        00000000000000000000000000F1351BF1351BF1351BF1351BF1351BF1351BF1
        351BF1351BF1351BF1351BF1351BF1351BF1351BF1351B000000000000F1351B
        F1351BF1351BF1351BF1351BF1351BF1351BF1351BF1351BF1351BF1351BF135
        1BF1351BF1351B000000000000000000000000000000000000000000000000F1
        351BF1351B000000000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF000000F1351BF1351B000000FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000F1
        351BF1351B000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF000000F1351BF1351B000000FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000F1
        351BF1351B000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF000000F1351BF1351B000000FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000
        0000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      TabOrder = 1
      OnClick = btn_AddTokenClick
    end
    object btn_Remover: TButton
      Left = 112
      Top = 538
      Width = 82
      Height = 27
      Cursor = crHandPoint
      Hint = 'Limpar Lista'
      Anchors = [akLeft, akRight, akBottom]
      Caption = 'Remover'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = btn_RemoverClick
    end
  end
  object strg_Analisador: TStringGrid
    Left = 296
    Top = 64
    Width = 576
    Height = 507
    Anchors = [akLeft, akTop, akRight, akBottom]
    ColCount = 26
    DefaultColWidth = 46
    RowCount = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnDrawCell = strg_AnalisadorDrawCell
    OnSelectCell = strg_AnalisadorSelectCell
  end
  object edt_Validador: TEdit
    Left = 296
    Top = 27
    Width = 346
    Height = 23
    Cursor = crIBeam
    Enabled = False
    MaxLength = 50
    TabOrder = 1
    OnKeyDown = edt_ValidadorKeyDown
    OnKeyUp = edt_ValidadorKeyUp
  end
  object pnl_Status: TPanel
    Left = 648
    Top = 8
    Width = 113
    Height = 42
    Caption = 'pnl_Status'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 2
  end
end
