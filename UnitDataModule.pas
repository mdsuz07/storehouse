unit UnitDataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.FMXUI.Wait, FireDAC.Comp.UI, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  Tdm = class(TDataModule)
    dsGoods: TDataSource;
    FDConn: TFDConnection;
    qGoods: TFDQuery;
    auGoods: TFDUpdateSQL;
    qMeasure: TFDQuery;
    dsMeasure: TDataSource;
    qGoodsid: TFDAutoIncField;
    qGoodsproduct: TWideStringField;
    qGoodsdate: TWideStringField;
    qGoodsquantity: TFloatField;
    qGoodsmeasure: TWideStringField;
    qGoodsprice: TFloatField;
    qGoodscost: TFloatField;
    qGoodsvat_percent: TIntegerField;
    qGoodsvat_cost: TFloatField;
    qGoodsoverheads_cost: TFloatField;
    qGoodstotal_cost: TFloatField;
    qMeasuremeasure: TWideStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.
