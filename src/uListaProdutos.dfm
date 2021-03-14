object ListaProdutos: TListaProdutos
  Left = 0
  Top = 0
  Caption = 'Lista de Produtos'
  ClientHeight = 512
  ClientWidth = 861
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnKeyDown = DBGrid1KeyDown
  OnKeyPress = DBGrid1KeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 861
    Height = 57
    Align = alTop
    BevelKind = bkFlat
    BevelOuter = bvNone
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 6
      Width = 83
      Height = 19
      Caption = 'Procurar por:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 288
      Top = 6
      Width = 49
      Height = 19
      Caption = 'Campo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 440
      Top = 6
      Width = 48
      Height = 19
      Caption = 'Ordem:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
    end
    object EditProcurar: TEdit
      Left = 8
      Top = 24
      Width = 273
      Height = 19
      TabOrder = 0
      OnExit = EditProcurarExit
    end
    object ComboCampos: TComboBox
      Left = 287
      Top = 23
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 1
      Text = 'C'#243'digo'
      OnExit = EditProcurarExit
      Items.Strings = (
        'C'#243'digo'
        'Nome'
        'Valor')
    end
    object ComboOrdem: TComboBox
      Left = 438
      Top = 23
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 2
      Text = 'C'#243'digo'
      OnExit = EditProcurarExit
      Items.Strings = (
        'C'#243'digo'
        'Nome'
        'Valor')
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 57
    Width = 861
    Height = 455
    Align = alClient
    DataSource = DataModulePrincipal.DataSourceListaProduto
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    OnKeyPress = DBGrid1KeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Width = 662
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Visible = True
      end>
  end
end
