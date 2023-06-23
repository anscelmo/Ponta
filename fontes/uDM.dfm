object DM: TDM
  OldCreateOrder = False
  Left = 388
  Top = 184
  Height = 332
  Width = 406
  object IBDatabase: TIBDatabase
    DatabaseName = 'C:\Teste\Ponta\Dados\DBPONTA.FDB'
    Params.Strings = (
      'user_name=sysdba')
    DefaultTransaction = IBTransaction
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    AllowStreamedConnected = False
    Left = 32
    Top = 16
  end
  object IBTransaction: TIBTransaction
    Active = False
    AutoStopAction = saNone
    Left = 104
    Top = 16
  end
  object tbFazenda: TIBTable
    Database = IBDatabase
    Transaction = IBTransaction
    AfterPost = tbFazendaAfterPost
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'FAZENDA'
    Left = 32
    Top = 88
    object tbFazendaIDFAZENDA: TIntegerField
      FieldName = 'IDFAZENDA'
    end
    object tbFazendaNOME: TIBStringField
      FieldName = 'NOME'
      Size = 50
    end
  end
  object tbAnimal: TIBTable
    Database = IBDatabase
    Transaction = IBTransaction
    AfterPost = tbAnimalAfterPost
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'ANIMAL'
    Left = 32
    Top = 160
    object tbAnimalIDANIMAL: TIntegerField
      FieldName = 'IDANIMAL'
    end
    object tbAnimalIDENTIFICACAO: TIBStringField
      FieldName = 'IDENTIFICACAO'
      Size = 15
    end
    object tbAnimalCODFAZENDA: TIntegerField
      FieldName = 'CODFAZENDA'
    end
  end
  object IBQuery: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 176
    Top = 16
  end
  object qPesqFazenda: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT'
      '  IDFAZENDA'
      '  ,NOME'
      'FROM'
      '  FAZENDA'
      'WHERE'
      '  1 = 1')
    Left = 104
    Top = 88
    object qPesqFazendaIDFAZENDA: TIntegerField
      FieldName = 'IDFAZENDA'
      Origin = 'FAZENDA.IDFAZENDA'
      Required = True
    end
    object qPesqFazendaNOME: TIBStringField
      FieldName = 'NOME'
      Origin = 'FAZENDA.NOME'
      Required = True
      Size = 50
    end
  end
  object dsFazenda: TDataSource
    DataSet = tbFazenda
    Left = 176
    Top = 88
  end
  object qPesqAnimal: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT'
      '  A.IDANIMAL'
      '  ,A.IDENTIFICACAO'
      '  ,A.CODFAZENDA'
      '  ,F.NOME'
      'FROM'
      '  ANIMAL A'
      '  INNER JOIN FAZENDA F'
      '    ON A.CODFAZENDA = F.IDFAZENDA'
      'WHERE'
      '  1 = 1')
    Left = 104
    Top = 160
    object qPesqAnimalIDANIMAL: TIntegerField
      FieldName = 'IDANIMAL'
      Origin = 'ANIMAL.IDANIMAL'
      Required = True
    end
    object qPesqAnimalIDENTIFICACAO: TIBStringField
      FieldName = 'IDENTIFICACAO'
      Origin = 'ANIMAL.IDENTIFICACAO'
      Required = True
      Size = 15
    end
    object qPesqAnimalCODFAZENDA: TIntegerField
      FieldName = 'CODFAZENDA'
      Origin = 'ANIMAL.CODFAZENDA'
      Required = True
    end
    object qPesqAnimalNOME: TIBStringField
      FieldName = 'NOME'
      Origin = 'FAZENDA.NOME'
      Required = True
      Size = 50
    end
  end
  object dsAnimal: TDataSource
    DataSet = tbAnimal
    Left = 176
    Top = 160
  end
  object qSelFazenda: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT'
      '  IDFAZENDA'
      '  ,NOME'
      'FROM'
      '  FAZENDA'
      'ORDER BY'
      '  NOME')
    Left = 240
    Top = 88
    object qSelFazendaIDFAZENDA: TIntegerField
      FieldName = 'IDFAZENDA'
      Origin = 'FAZENDA.IDFAZENDA'
      Required = True
    end
    object qSelFazendaNOME: TIBStringField
      FieldName = 'NOME'
      Origin = 'FAZENDA.NOME'
      Required = True
      Size = 50
    end
  end
  object dsSelFazenda: TDataSource
    DataSet = qSelFazenda
    Left = 312
    Top = 88
  end
  object qRelatorio: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT'
      '  A.IDANIMAL'
      '  ,A.IDENTIFICACAO'
      '  ,F.NOME'
      'FROM'
      '  ANIMAL A'
      '  INNER JOIN FAZENDA F'
      '    ON A.CODFAZENDA = F.IDFAZENDA'
      'ORDER BY'
      '  A.IDANIMAL')
    Left = 32
    Top = 232
    object qRelatorioIDANIMAL: TIntegerField
      FieldName = 'IDANIMAL'
      Origin = 'ANIMAL.IDANIMAL'
      Required = True
    end
    object qRelatorioIDENTIFICACAO: TIBStringField
      FieldName = 'IDENTIFICACAO'
      Origin = 'ANIMAL.IDENTIFICACAO'
      Required = True
      Size = 15
    end
    object qRelatorioNOME: TIBStringField
      FieldName = 'NOME'
      Origin = 'FAZENDA.NOME'
      Required = True
      Size = 50
    end
  end
end
