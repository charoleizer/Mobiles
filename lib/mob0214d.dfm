object DtmMob0214d: TDtmMob0214d
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Height = 205
  Width = 228
  object DataSource1: TDataSource
    AutoEdit = False
    DataSet = Cliente
    Left = 24
    Top = 14
  end
  object dDataSet: TPSQLDataSet
    GetMetadata = False
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DtmSis.SQLConnection1
    Left = 24
    Top = 80
  end
  object pProvider: TDataSetProvider
    DataSet = dDataSet
    Options = [poRetainServerOrder]
    Left = 88
    Top = 80
  end
  object Cliente: TPClientDataset
    Aggregates = <>
    Params = <>
    ProviderName = 'pProvider'
    OnReconcileError = ClienteReconcileError
    Left = 160
    Top = 80
  end
end
