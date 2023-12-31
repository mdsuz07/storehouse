object dm: Tdm
  Height = 480
  Width = 640
  object dsGoods: TDataSource
    DataSet = qGoods
    Left = 152
    Top = 88
  end
  object FDConn: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\mdsuz07\Documents\Embarcadero\Studio\Projects\' +
        'd11.3\Multi\storehouse\storehouse.s3db'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 48
    Top = 40
  end
  object qGoods: TFDQuery
    Connection = FDConn
    UpdateObject = auGoods
    SQL.Strings = (
      'Select * from Goods order by product')
    Left = 152
    Top = 32
    object qGoodsid: TFDAutoIncField
      DisplayLabel = '#'
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qGoodsproduct: TWideStringField
      DisplayLabel = #1052#1072#1203#1089#1091#1083#1086#1090' '#1085#1086#1084#1080
      FieldName = 'product'
      Origin = 'product'
      Required = True
      Size = 60
    end
    object qGoodsdate: TWideStringField
      DisplayLabel = #1040#1084#1072#1083' '#1089#1072#1085#1072#1089#1080
      FieldName = 'date'
      Origin = 'date'
      Required = True
      Size = 10
    end
    object qGoodsquantity: TFloatField
      DisplayLabel = #1057#1086#1085#1080
      FieldName = 'quantity'
      Origin = 'quantity'
      Required = True
    end
    object qGoodsmeasure: TWideStringField
      DisplayLabel = #1038#1083#1095#1086#1074#1080
      FieldName = 'measure'
      Origin = 'measure'
      Required = True
      Size = 10
    end
    object qGoodsprice: TFloatField
      DisplayLabel = #1053#1072#1088#1203#1080
      FieldName = 'price'
      Origin = 'price'
      Required = True
    end
    object qGoodscost: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'cost'
      Origin = 'cost'
      Required = True
    end
    object qGoodsvat_percent: TIntegerField
      DisplayLabel = #1178#1178#1057' %'
      FieldName = 'vat_percent'
      Origin = 'vat_percent'
    end
    object qGoodsvat_cost: TFloatField
      DisplayLabel = #1178#1178#1057' '#1089#1091#1084#1084#1072
      FieldName = 'vat_cost'
      Origin = 'vat_cost'
    end
    object qGoodsoverheads_cost: TFloatField
      DisplayLabel = #1178#1091#1096#1080#1084#1095#1072' '#1203#1072#1088#1072#1078#1072#1090#1083#1072#1088' '#1089#1091#1084#1084#1072#1089#1080
      FieldName = 'overheads_cost'
      Origin = 'overheads_cost'
    end
    object qGoodstotal_cost: TFloatField
      DisplayLabel = #1046#1072#1084#1080' '#1089#1091#1084#1084#1072
      FieldName = 'total_cost'
      Origin = 'total_cost'
    end
  end
  object auGoods: TFDUpdateSQL
    Connection = FDConn
    InsertSQL.Strings = (
      'INSERT INTO GOODS'
      '(PRODUCT, DATE, QUANTITY, MEASURE, PRICE, '
      '  COST, VAT_PERCENT, VAT_COST, OVERHEADS_COST, '
      '  TOTAL_COST)'
      
        'VALUES (:NEW_product, :NEW_date, :NEW_quantity, :NEW_measure, :N' +
        'EW_price, '
      
        '  :NEW_cost, :NEW_vat_percent, :NEW_vat_cost, :NEW_overheads_cos' +
        't, '
      '  :NEW_total_cost);'
      
        'SELECT LAST_INSERT_AUTOGEN() AS ID, PRODUCT, DATE, QUANTITY, MEA' +
        'SURE, '
      '  PRICE, COST, VAT_PERCENT, VAT_COST, OVERHEADS_COST, TOTAL_COST'
      'FROM GOODS'
      'WHERE ID = LAST_INSERT_AUTOGEN()')
    ModifySQL.Strings = (
      'UPDATE GOODS'
      
        'SET PRODUCT = :NEW_product, DATE = :NEW_date, QUANTITY = :NEW_qu' +
        'antity, '
      '  MEASURE = :NEW_measure, PRICE = :NEW_price, COST = :NEW_cost, '
      '  VAT_PERCENT = :NEW_vat_percent, VAT_COST = :NEW_vat_cost, '
      
        '  OVERHEADS_COST = :NEW_overheads_cost, TOTAL_COST = :NEW_total_' +
        'cost'
      'WHERE ID = :OLD_id;'
      
        'SELECT PRODUCT, DATE, QUANTITY, MEASURE, PRICE, COST, VAT_PERCEN' +
        'T, '
      '  VAT_COST, OVERHEADS_COST, TOTAL_COST'
      'FROM GOODS'
      'WHERE ID = :NEW_id')
    DeleteSQL.Strings = (
      'DELETE FROM GOODS'
      'WHERE ID = :OLD_id')
    FetchRowSQL.Strings = (
      
        'SELECT ID, PRODUCT, DATE, QUANTITY, MEASURE, PRICE, COST, VAT_PE' +
        'RCENT, '
      '  VAT_COST, OVERHEADS_COST, TOTAL_COST'
      'FROM GOODS'
      'WHERE ID = :OLD_id')
    Left = 224
    Top = 56
  end
  object qMeasure: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'SELECT DISTINCT measure FROM goods')
    Left = 152
    Top = 176
    object qMeasuremeasure: TWideStringField
      FieldName = 'measure'
      Origin = 'measure'
      Required = True
      Size = 10
    end
  end
  object dsMeasure: TDataSource
    DataSet = qMeasure
    Left = 152
    Top = 232
  end
end
