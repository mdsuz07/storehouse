program StoreHouse;

uses
  System.StartUpCopy,
  FMX.Forms,
  UnitMain in 'UnitMain.pas' {frmMain},
  UnitDataModule in 'UnitDataModule.pas' {dm: TDataModule},
  UnitGoods in 'UnitGoods.pas' {frmGoods},
  UnitAUGoods in 'UnitAUGoods.pas' {frmAUGoods};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfrmGoods, frmGoods);
  Application.CreateForm(TfrmAUGoods, frmAUGoods);
  Application.Run;
end.
