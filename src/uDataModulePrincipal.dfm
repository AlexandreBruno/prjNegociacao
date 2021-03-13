object DataModulePrincipal: TDataModulePrincipal
  OldCreateOrder = False
  Height = 864
  Width = 895
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\GitHub\prjNegociacao\data\PRJNEGOCIACAO.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'CharacterSet=WIN1252'
      'Server=127.0.0.1'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 24
    Top = 24
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    VendorLib = 'C:\Program Files (x86)\Firebird\Firebird_2_1\bin\fbclient.dll'
    Left = 64
    Top = 24
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 104
    Top = 24
  end
  object QueryDistribuidor: TFDQuery
    CachedUpdates = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM DISTRIBUIDOR WHERE ID = :ID')
    Left = 24
    Top = 120
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QueryDistribuidorID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryDistribuidorNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 255
    end
    object QueryDistribuidorCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      EditMask = '###.###.###/####-##'
      Size = 30
    end
  end
  object QueryProdutor: TFDQuery
    CachedUpdates = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM PRODUTOR WHERE ID = :ID')
    Left = 24
    Top = 240
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QueryProdutorID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryProdutorNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 255
    end
  end
  object QueryProduto: TFDQuery
    CachedUpdates = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM PRODUTO WHERE ID = :ID')
    Left = 24
    Top = 408
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QueryProdutoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryProdutoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 255
    end
    object QueryProdutoVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Precision = 18
      Size = 2
    end
  end
  object QueryNegociacao: TFDQuery
    CachedUpdates = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM NEGOCIACAO WHERE ID = :ID')
    Left = 24
    Top = 528
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QueryNegociacaoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryNegociacaoID_PRODUTOR: TIntegerField
      FieldName = 'ID_PRODUTOR'
      Origin = 'ID_PRODUTOR'
    end
    object QueryNegociacaoID_DISTRIBUIDOR: TIntegerField
      FieldName = 'ID_DISTRIBUIDOR'
      Origin = 'ID_DISTRIBUIDOR'
    end
    object QueryNegociacaoSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Size = 30
    end
    object QueryNegociacaoVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Precision = 18
      Size = 2
    end
  end
  object DataSourceDistribuidor: TDataSource
    DataSet = QueryDistribuidor
    Left = 64
    Top = 120
  end
  object DataSourceProdutor: TDataSource
    DataSet = QueryProdutor
    Left = 64
    Top = 240
  end
  object DataSourceProduto: TDataSource
    DataSet = QueryProduto
    Left = 64
    Top = 408
  end
  object DataSourceNegociacao: TDataSource
    DataSet = QueryNegociacao
    Left = 64
    Top = 528
  end
  object DataSourceNegociacaoItem: TDataSource
    DataSet = QueryNegociacaoItem
    Left = 64
    Top = 584
  end
  object QueryNegociacaoItem: TFDQuery
    CachedUpdates = True
    Connection = FDConnection1
    SQL.Strings = (
      
        'SELECT * FROM NEGOCIACAO_ITEM WHERE ID_NEGOCIACAO = :ID_NEGOCIAC' +
        'AO and SEQUENCIA = :SEQUENCIA')
    Left = 24
    Top = 584
    ParamData = <
      item
        Name = 'ID_NEGOCIACAO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'SEQUENCIA'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QueryNegociacaoItemID_NEGOCIACAO: TIntegerField
      FieldName = 'ID_NEGOCIACAO'
      Origin = 'ID_NEGOCIACAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryNegociacaoItemSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
      Origin = 'SEQUENCIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryNegociacaoItemQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
    end
    object QueryNegociacaoItemVALOR_UNITARIO: TFMTBCDField
      FieldName = 'VALOR_UNITARIO'
      Origin = 'VALOR_UNITARIO'
      Precision = 18
      Size = 2
    end
    object QueryNegociacaoItemVALOR_TOTAL: TFMTBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      Precision = 18
      Size = 2
    end
    object QueryNegociacaoItemID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
    end
  end
  object QueryProdutorCredito: TFDQuery
    CachedUpdates = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM PRODUTOR_CREDITO WHERE ID = :ID order by 1,2')
    Left = 24
    Top = 288
    ParamData = <
      item
        Name = 'ID'
        ParamType = ptInput
      end>
    object QueryProdutorCreditoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryProdutorCreditoID_PRODUTOR: TIntegerField
      FieldName = 'ID_PRODUTOR'
      Origin = 'ID_PRODUTOR'
    end
    object QueryProdutorCreditoID_DISTRIBUIDOR: TIntegerField
      FieldName = 'ID_DISTRIBUIDOR'
      Origin = 'ID_DISTRIBUIDOR'
    end
    object QueryProdutorCreditoVALOR: TIntegerField
      FieldName = 'VALOR'
      Origin = 'VALOR'
    end
  end
  object DataSourceProdutorCredito: TDataSource
    DataSet = QueryProdutorCredito
    Left = 64
    Top = 288
  end
  object QueryListaDistribuidor: TFDQuery
    CachedUpdates = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM DISTRIBUIDOR')
    Left = 160
    Top = 120
    object IntegerField1: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object StringField1: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 255
    end
    object StringField2: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      EditMask = '###.###.###/####-##'
      Size = 30
    end
  end
  object DataSourceListaDistribuidor: TDataSource
    DataSet = QueryListaDistribuidor
    Left = 200
    Top = 120
  end
  object QueryListaProdutor: TFDQuery
    CachedUpdates = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM PRODUTOR')
    Left = 160
    Top = 240
    object IntegerField3: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object StringField5: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 255
    end
  end
  object DataSourceListaProdutor: TDataSource
    DataSet = QueryListaProdutor
    Left = 200
    Top = 240
  end
  object QueryListaProdutorCredito: TFDQuery
    CachedUpdates = True
    Connection = FDConnection1
    SQL.Strings = (
      
        'SELECT * FROM PRODUTOR_CREDITO WHERE ID_PRODUTOR = :ID_PRODUTOR ' +
        'order by 1,2')
    Left = 160
    Top = 288
    ParamData = <
      item
        Name = 'ID_PRODUTOR'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QueryListaProdutorCreditoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryListaProdutorCreditoID_PRODUTOR: TIntegerField
      FieldName = 'ID_PRODUTOR'
      Origin = 'ID_PRODUTOR'
    end
    object QueryListaProdutorCreditoID_DISTRIBUIDOR: TIntegerField
      FieldName = 'ID_DISTRIBUIDOR'
      Origin = 'ID_DISTRIBUIDOR'
    end
    object QueryListaProdutorCreditoVALOR: TIntegerField
      FieldName = 'VALOR'
      Origin = 'VALOR'
    end
  end
  object DataSourceListaProdutorCredito: TDataSource
    DataSet = QueryListaProdutorCredito
    Left = 200
    Top = 288
  end
  object QueryListaProduto: TFDQuery
    CachedUpdates = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM PRODUTO')
    Left = 160
    Top = 408
    object IntegerField2: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object StringField3: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 255
    end
    object FMTBCDField1: TFMTBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Precision = 18
      Size = 2
    end
  end
  object DataSourceListaProduto: TDataSource
    DataSet = QueryListaProduto
    Left = 200
    Top = 408
  end
  object QueryListaNegociacao: TFDQuery
    CachedUpdates = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM NEGOCIACAO')
    Left = 160
    Top = 528
    object IntegerField4: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IntegerField5: TIntegerField
      FieldName = 'ID_PRODUTOR'
      Origin = 'ID_PRODUTOR'
    end
    object IntegerField6: TIntegerField
      FieldName = 'ID_DISTRIBUIDOR'
      Origin = 'ID_DISTRIBUIDOR'
    end
    object StringField4: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Size = 30
    end
    object FMTBCDField2: TFMTBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Precision = 18
      Size = 2
    end
  end
  object DataSource1: TDataSource
    DataSet = QueryListaNegociacao
    Left = 200
    Top = 528
  end
  object DataSourceListaNegociacaoItem: TDataSource
    DataSet = QueryListaNegociacaoItem
    Left = 200
    Top = 584
  end
  object QueryListaNegociacaoItem: TFDQuery
    CachedUpdates = True
    Connection = FDConnection1
    SQL.Strings = (
      
        'SELECT * FROM NEGOCIACAO_ITEM WHERE ID_NEGOCIACAO = :ID_NEGOCIAC' +
        'AO ORDER BY SEQUENCIA')
    Left = 160
    Top = 584
    ParamData = <
      item
        Name = 'ID_NEGOCIACAO'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QueryListaNegociacaoItemID_NEGOCIACAO: TIntegerField
      FieldName = 'ID_NEGOCIACAO'
      Origin = 'ID_NEGOCIACAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryListaNegociacaoItemSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
      Origin = 'SEQUENCIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryListaNegociacaoItemQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
    end
    object QueryListaNegociacaoItemVALOR_UNITARIO: TFMTBCDField
      FieldName = 'VALOR_UNITARIO'
      Origin = 'VALOR_UNITARIO'
      Precision = 18
      Size = 2
    end
    object QueryListaNegociacaoItemVALOR_TOTAL: TFMTBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      Precision = 18
      Size = 2
    end
    object QueryListaNegociacaoItemID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
    end
  end
end
