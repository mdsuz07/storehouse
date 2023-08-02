unit UnitAUGoods;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.ComboEdit, FMX.EditBox, FMX.NumberBox, FMX.DateTimeCtrls, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, FMX.Objects,
  FMX.DialogService;

type
  TfrmAUGoods = class(TForm)
    Layout1: TLayout;
    eProduct: TEdit;
    Label1: TLabel;
    eDate: TDateEdit;
    Label2: TLabel;
    eQuantity: TNumberBox;
    ePrice: TNumberBox;
    eCost: TNumberBox;
    eVatPrcnt: TNumberBox;
    eMeasure: TComboEdit;
    eVatCost: TNumberBox;
    eOvrCost: TNumberBox;
    eTotalCost: TNumberBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    iCancel: TImage;
    iOk: TImage;
    iMeasureRefresh: TImage;
    procedure iCancelClick(Sender: TObject);
    procedure iMeasureRefreshClick(Sender: TObject);
    procedure iOkClick(Sender: TObject);
    procedure calcCost(Sender: TObject);
    procedure calcVat(Sender: TObject);
    procedure calcTCost(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAUGoods: TfrmAUGoods;

implementation

{$R *.fmx}

uses UnitDataModule;

procedure TfrmAUGoods.calcCost(Sender: TObject);
begin
  if (eQuantity.Value > 0) and (ePrice.Value > 0) then
    eCost.Value := eQuantity.Value * ePrice.Value;
end;

procedure TfrmAUGoods.calcTCost(Sender: TObject);
begin
  eTotalCost.Value := eCost.Value + eVatCost.Value + eOvrCost.Value;
end;

procedure TfrmAUGoods.calcVat(Sender: TObject);
begin
  if (eVatPrcnt.Value > 0) and (eCost.Value > 0) then
    eVatCost.Value := eCost.Value * eVatPrcnt.Value / 100;
end;

procedure TfrmAUGoods.iCancelClick(Sender: TObject);
begin
  frmAUGoods.ModalResult := mrCancel;
end;

procedure TfrmAUGoods.iMeasureRefreshClick(Sender: TObject);
begin
  // filling eMeasure from qMeasure
  if not dm.qMeasure.Active then
    dm.qMeasure.Open;
  if (eMeasure.Items.Count > 0) then
    eMeasure.Items.Clear;
  dm.qMeasure.First;
  while not dm.qMeasure.Eof do
  begin
    eMeasure.Items.Append(dm.qMeasuremeasure.Value);
    dm.qMeasure.Next;
  end;
  dm.qMeasure.Close;
end;

procedure TfrmAUGoods.iOkClick(Sender: TObject);
begin
  try
    case frmAUGoods.Tag of
      1:
        dm.qGoods.Append;
      2:
        dm.qGoods.Edit;
    else
      Close;
    end;
    dm.qGoodsdate.Value := eDate.Text;
    dm.qGoodsproduct.Value := eProduct.Text;
    dm.qGoodsmeasure.Value := eMeasure.Text;
    dm.qGoodsquantity.Value := eQuantity.Value;
    dm.qGoodsprice.Value := ePrice.Value;
    dm.qGoodscost.Value := eCost.Value;
    dm.qGoodsvat_percent.AsString := eVatPrcnt.Text;
    dm.qGoodsvat_cost.Value := eVatCost.Value;
    dm.qGoodsoverheads_cost.Value := eOvrCost.Value;
    dm.qGoodstotal_cost.Value := eTotalCost.Value;
    dm.qGoods.Post;
    frmAUGoods.ModalResult := mrOk;
  except
    on E: Exception do
    begin
      dm.qGoods.Cancel;
      TDialogService.ShowMessage(E.Message);
    end;
  end;
end;

end.
