unit uRelatorio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, uDM, Qrprntr, PreverU, jpeg;

type
  TfrmRelatorio = class(TForm)
    QuickRep1: TQuickRep;
    qrbDetail: TQRBand;
    qrbPageHeader: TQRBand;
    qrbPageFooter: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRSysData1: TQRSysData;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRImage1: TQRImage;
    QRLabel3: TQRLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QuickRep1Preview(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorio: TfrmRelatorio;

implementation

{$R *.dfm}

procedure TfrmRelatorio.FormCreate(Sender: TObject);
begin
  DM.qRelatorio.Close;
  DM.qRelatorio.Open;
end;

procedure TfrmRelatorio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM.qRelatorio.Close;
end;

procedure TfrmRelatorio.QuickRep1Preview(Sender: TObject);
var
  frmPrever :TfrmPrever;
begin
  frmPrever := Tfrmprever.Create(self);
  with frmPrever do
  begin
    Caption := 'Gerando Relatório, Aguarde...';
    pQuickReport := QuickRep1;
    frmPrever.QRPreview.QRPrinter := TQrPrinter(Sender);
    bCanPrint := True;
    Show;
  end;
end;

end.
