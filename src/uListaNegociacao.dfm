object ListaNegociacao: TListaNegociacao
  Left = 0
  Top = 0
  Caption = 'Lista de Negocia'#231#245'es'
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
        'Status'
        'C'#243'digo Produtor'
        'C'#243'digo Distribuidor')
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
        'Status'
        'C'#243'digo Produtor'
        'C'#243'digo Distribuidor')
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 57
    Width = 861
    Height = 415
    Align = alClient
    DataSource = DataModulePrincipal.DataSourceListaNegociacao
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
        FieldName = 'STATUS'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMEPRODUTOR'
        Width = 259
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMEDISTRIBUIDOR'
        Width = 317
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 472
    Width = 861
    Height = 40
    Align = alBottom
    BevelInner = bvLowered
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 2
    object ButtonAprovar: TButton
      Left = 10
      Top = 7
      Width = 75
      Height = 25
      Caption = 'Aprovar'
      TabOrder = 0
      OnClick = ButtonAprovarClick
    end
    object ButtonConcluir: TButton
      Left = 90
      Top = 7
      Width = 75
      Height = 25
      Caption = 'Concluir'
      TabOrder = 1
      OnClick = ButtonConcluirClick
    end
    object ButtonCancelar: TButton
      Left = 170
      Top = 7
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 2
      OnClick = ButtonCancelarClick
    end
    object Button1: TButton
      Left = 386
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Relat'#243'rio'
      TabOrder = 3
      OnClick = Button1Click
    end
  end
  object RelatorioDBDataset: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = RelatorioClientDataSet
    BCDToCurrency = False
    Left = 608
    Top = 216
  end
  object RelatorioClientDataSet: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <
      item
        DataType = ftDate
        Name = 'DataIni'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DataFim'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'ClienteIni'
        ParamType = ptUnknown
      end>
    ProviderName = 'RelatorioProvider'
    Left = 640
    Top = 216
    object RelatorioClientDataSetCODIGONEGOCIACAO: TIntegerField
      FieldName = 'CODIGONEGOCIACAO'
      Origin = 'ID'
      Required = True
    end
    object RelatorioClientDataSetVALORNEGOCIACAO: TFMTBCDField
      FieldName = 'VALORNEGOCIACAO'
      Origin = 'VALOR'
      Precision = 18
      Size = 2
    end
    object RelatorioClientDataSetNOMEPRODUTOR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOMEPRODUTOR'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 255
    end
    object RelatorioClientDataSetNOMEDISTRIBUIDOR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOMEDISTRIBUIDOR'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 255
    end
    object RelatorioClientDataSetDATACADASTRO: TDateField
      FieldName = 'DATACADASTRO'
      Origin = '"DATA"'
    end
    object RelatorioClientDataSetDATASTATUS: TDateField
      FieldName = 'DATASTATUS'
      Origin = '"DATA"'
      ProviderFlags = []
    end
    object RelatorioClientDataSetSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Size = 30
    end
  end
  object RelatorioProvider: TDataSetProvider
    DataSet = QueryRelatorio
    Left = 672
    Top = 216
  end
  object Relatorio: TfrxReport
    Version = '6.9.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44254.593315937500000000
    ReportOptions.LastChange = 44270.746959826400000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 608
    Top = 264
    Datasets = <
      item
        DataSet = RelatorioDBDataset
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Height = 90.708720000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 1.889765000000000000
          Top = 5.669295000000000000
          Width = 714.331170000000000000
          Height = 79.370130000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -67
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Negocia'#231#245'es')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 56.692950000000000000
        Top = 215.433210000000000000
        Width = 718.110700000000000000
        DataSet = RelatorioDBDataset
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        Stretched = True
        object frxDBDataset1NOMEPRODUTOR: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 124.724490000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          DataField = 'NOMEPRODUTOR'
          DataSet = RelatorioDBDataset
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBDataset1."NOMEPRODUTOR"]')
          ParentFont = False
        end
        object frxDBDataset1NOMEDISTRIBUIDOR: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 287.244280000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          DataField = 'NOMEDISTRIBUIDOR'
          DataSet = RelatorioDBDataset
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBDataset1."NOMEDISTRIBUIDOR"]')
          ParentFont = False
        end
        object frxDBDataset1STATUS: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 453.323130000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'STATUS'
          DataSet = RelatorioDBDataset
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBDataset1."STATUS"]')
          ParentFont = False
        end
        object frxDBDataset1DATASTATUS: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 514.016080000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DataField = 'DATASTATUS'
          DataSet = RelatorioDBDataset
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBDataset1."DATASTATUS"]')
          ParentFont = False
        end
        object frxDBDataset1VALORNEGOCIACAO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 589.606680000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          DataField = 'VALORNEGOCIACAO'
          DataSet = RelatorioDBDataset
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."VALORNEGOCIACAO"]')
          ParentFont = False
        end
        object frxDBDataset1CODIGONEGOCIACAO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'CODIGONEGOCIACAO'
          DataSet = RelatorioDBDataset
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."CODIGONEGOCIACAO"]')
          ParentFont = False
        end
        object frxDBDataset1DATACADASTRO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 60.472480000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DataField = 'DATACADASTRO'
          DataSet = RelatorioDBDataset
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBDataset1."DATACADASTRO"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 332.598640000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 642.520100000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'P'#225'gina [Page#]')
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 132.283550000000000000
        Width = 718.110700000000000000
        Stretched = True
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'Contrato')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 124.724490000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'Produtor')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 287.244280000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'Distribuidor')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 60.472480000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'Cadastro')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 453.543600000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'Status')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 514.016080000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'Data')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 589.606680000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            'Valor')
          ParentFont = False
        end
      end
    end
  end
  object QueryRelatorio: TFDQuery
    CachedUpdates = True
    Connection = DataModulePrincipal.FDConnection1
    SQL.Strings = (
      
        'select a.id CodigoNegociacao,  a.valor ValorNegociacao, b.nome N' +
        'omeProdutor, c.nome NomeDistribuidor, a.data DataCadastro, a.dat' +
        'a DataStatus, a.Status from negociacao a'
      'inner join produtor b on b.id = a.id_produtor'
      'inner join distribuidor c on c.id = a.id_distribuidor')
    Left = 640
    Top = 264
    ParamData = <
      item
        Position = 1
        Name = 'DataIni'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'DataFim'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'ClienteIni'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QueryRelatorioCODIGONEGOCIACAO: TIntegerField
      FieldName = 'CODIGONEGOCIACAO'
      Origin = 'ID'
      Required = True
    end
    object QueryRelatorioVALORNEGOCIACAO: TFMTBCDField
      FieldName = 'VALORNEGOCIACAO'
      Origin = 'VALOR'
      Precision = 18
      Size = 2
    end
    object QueryRelatorioNOMEPRODUTOR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOMEPRODUTOR'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 255
    end
    object QueryRelatorioNOMEDISTRIBUIDOR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOMEDISTRIBUIDOR'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 255
    end
    object QueryRelatorioDATACADASTRO: TDateField
      FieldName = 'DATACADASTRO'
      Origin = '"DATA"'
    end
    object QueryRelatorioDATASTATUS: TDateField
      FieldName = 'DATASTATUS'
      Origin = '"DATA"'
      ProviderFlags = []
    end
    object QueryRelatorioSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Size = 30
    end
  end
end
