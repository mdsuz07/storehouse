unit UnitGoods;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
  FMX.Grid.Style, FMX.Objects, FMX.ScrollBox, FMX.Grid, FMX.Layouts,
  FMX.Controls.Presentation, FMX.StdCtrls, Data.Bind.EngExt, FMX.Bind.DBEngExt,
  FMX.Bind.Grid, System.Bindings.Outputs, FMX.Bind.Editors, Data.DB,
  Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope, FMX.Edit;

type
  TfrmGoods = class(TForm)
    ToolBar1: TToolBar;
    Layout1: TLayout;
    gGoods: TGrid;
    iOpen: TImage;
    iExit: TImage;
    iExp: TImage;
    iEdit: TImage;
    iAdd: TImage;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    iClose: TImage;
    Panel1: TPanel;
    sProduct: TEdit;
    Label1: TLabel;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    procedure iExitClick(Sender: TObject);
    procedure iOpenClick(Sender: TObject);
    procedure iCloseClick(Sender: TObject);
    procedure iAddClick(Sender: TObject);
    procedure iEditClick(Sender: TObject);
    procedure sProductChangeTracking(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGoods: TfrmGoods;

implementation

{$R *.fmx}

uses UnitDataModule, UnitAUGoods;

procedure TfrmGoods.sProductChangeTracking(Sender: TObject);
begin
  dm.qGoods.Locate('product', sProduct.Text, [loPartialKey, loCaseInsensitive]);
end;

procedure TfrmGoods.iAddClick(Sender: TObject);
begin
  frmAUGoods.Tag := 1;
  frmAUGoods.eDate.Date := Now;
  frmAUGoods.eProduct.Text := '';
  if (frmAUGoods.eMeasure.Items.Count = 0) then
    frmAUGoods.iMeasureRefreshClick(Self);
  frmAUGoods.eMeasure.ItemIndex := 0;
  frmAUGoods.eQuantity.Value := 0;
  frmAUGoods.ePrice.Value := 0;
  frmAUGoods.eCost.Value := 0;
  frmAUGoods.eVatPrcnt.Value := 0;
  frmAUGoods.eVatCost.Value := 0;
  frmAUGoods.eOvrCost.Value := 0;
  frmAUGoods.eTotalCost.Value := 0;
  frmAUGoods.eDate.SetFocus;
  frmAUGoods.ShowModal;
end;

procedure TfrmGoods.iCloseClick(Sender: TObject);
begin
  if dm.qGoods.Active then
    dm.qGoods.Close;
end;

procedure TfrmGoods.iEditClick(Sender: TObject);
begin
  frmAUGoods.Tag := 2;
  frmAUGoods.eDate.Text := dm.qGoodsdate.Value;
  frmAUGoods.eProduct.Text := dm.qGoodsproduct.Value;
  frmAUGoods.eMeasure.Text := dm.qGoodsmeasure.Value;
  frmAUGoods.eQuantity.Value := dm.qGoodsquantity.Value;
  frmAUGoods.ePrice.Value := dm.qGoodsprice.Value;
  frmAUGoods.eCost.Value := dm.qGoodscost.Value;
  frmAUGoods.eVatPrcnt.Value := dm.qGoodsvat_percent.Value;
  frmAUGoods.eVatCost.Value := dm.qGoodsvat_cost.Value;
  frmAUGoods.eOvrCost.Value := dm.qGoodsoverheads_cost.Value;
  frmAUGoods.eTotalCost.Value := dm.qGoodstotal_cost.Value;
  frmAUGoods.eDate.SetFocus;
  frmAUGoods.ShowModal;
end;

procedure TfrmGoods.iExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmGoods.iOpenClick(Sender: TObject);
begin
  if not dm.qGoods.Active then
    dm.qGoods.Open;
end;

end.
