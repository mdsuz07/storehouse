unit UnitMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts;

type
  TfrmMain = class(TForm)
    GridPanelLayout1: TGridPanelLayout;
    iGoods: TImage;
    procedure iGoodsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

uses UnitDataModule, UnitGoods;

procedure TfrmMain.iGoodsClick(Sender: TObject);
begin
  dm.FDConn.Params.Values['Database'] :=
      ExtractFilePath(ParamStr(0)) + '\storehouse.s3db';
  if not dm.FDConn.Connected then dm.FDConn.Connected := True;
  frmGoods.ShowModal;
end;

end.
