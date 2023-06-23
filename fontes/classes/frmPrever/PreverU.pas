unit PreverU;
{
  A sample custom preview for QuickReport 2.0
  Last update: March 5th, 1998
}

interface

uses MaskUtils,  Variants, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, Spin, qrprntr,quickrpt,qrextra, Buttons,
  Math;

type
  TfrmPrever = class(TForm)
    Panel1: TPanel;
    QRPreview: TQRPreview;
    Label1: TLabel;
    Label3: TLabel;
    sePage: TSpinEdit;
    seZoom: TSpinEdit;
    SaveDialogExport: TSaveDialog;
    sbFirstPage: TSpeedButton;
    sbPreviousPage: TSpeedButton;
    sbNextPage: TSpeedButton;
    sbLastPage: TSpeedButton;
    ZoomToWidth: TSpeedButton;
    ZoomTo100: TSpeedButton;
    ZoomToFit: TSpeedButton;
    PrintSetup: TSpeedButton;
    Print: TSpeedButton;
    BitBtnExit: TBitBtn;
    lblCopies: TLabel;
    SpinEditCopies: TSpinEdit;
    Load: TSpeedButton;
    Save: TSpeedButton;
    procedure Init;
    procedure sePageChange(Sender: TObject);
    procedure seZoomChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmdExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QRPreviewPageAvailable(Sender: TObject; PageNum: Integer);
    procedure FormCreate(Sender: TObject);
    procedure sbFirstPageClick(Sender: TObject);
    procedure sbPreviousPageClick(Sender: TObject);
    procedure sbNextPageClick(Sender: TObject);
    procedure sbLastPageClick(Sender: TObject);
    procedure ZoomToFitClick(Sender: TObject);
    procedure ZoomTo100Click(Sender: TObject);
    procedure ZoomToWidthClick(Sender: TObject);
    procedure PrintSetupClick(Sender: TObject);
    procedure PrintClick(Sender: TObject);
    procedure SaveClick(Sender: TObject);
    procedure BitBtnExitClick(Sender: TObject);
    procedure CancelReport;
    procedure LoadClick(Sender: TObject);
  private
    FbBuildTitle: boolean;
    procedure SetbBuildTitle(const Value: boolean);
    { Private declarations }
  public
    pQuickreport : TQuickRep;
    bPleaseInit : Boolean;
    sTitle : string;
    bCanPrint: boolean;
    { Public declarations }
  published
    property bBuildTitle: boolean read FbBuildTitle write SetbBuildTitle;
  end;


implementation

{$R *.DFM}


procedure TfrmPrever.sePageChange(Sender: TObject);
begin
  Application.ProcessMessages;
  QRPreview.PageNumber:=sePage.Value;
end;

procedure TfrmPrever.seZoomChange(Sender: TObject);
begin
  Application.ProcessMessages;
  QRPreview.Zoom:=seZoom.Value;
end;

procedure TfrmPrever.Init;
begin
  if bPleaseInit then
  begin
    bPleaseInit := False;
    sePage.MaxValue := QRPreview.QRPrinter.PageCount;
    sePage.MinValue := 1;
    sePage.Value := 1;

    { Force the preview to come up in the zoom setting that we want}
//    QRPreview.ZoomToFit;
//    ZoomToFit.Down := True;

    seZoom.Value:=QRPreview.Zoom;
  end;
end;
procedure TfrmPrever.FormShow(Sender: TObject);
var
  OffSet: integer;
begin
  { Signal ourselves that we need to update the form }
  bPleaseInit := True;

  if FbBuildTitle then
  begin
    if not Assigned(pQuickReport.Bands.Titleband) then
    begin
      pQuickReport.CreateBand(rbTitle).Height := 1;
      pQuickReport.CreateBand(rbTitle).TransparentBand := true;
    end;
    pQuickReport.Bands.HasTitle := True;
  end;

  { If the caller reports want to disable printing, then it will set}
  { the following boolean to false }

  if not bCanPrint then
  begin
    Print.Enabled := False;//bCanPrint;
    Print.Visible := False;//bCanPrint;
    PrintSetup.Enabled := Print.Enabled;
    PrintSetup.Visible := Print.Enabled;
    lblCopies.Visible := Print.Enabled;
    SpinEditCopies.Enabled := Print.Enabled;
    SpinEditCopies.Visible := Print.Enabled;

    OffSet := Load.Left - lblCopies.Left;
    Load.Left := Load.Left - Offset;
    Save.Left := Save.Left - Offset;
    BitBtnExit.Left := BitBtnExit.Left - Offset;
  end;
end;

procedure TfrmPrever.cmdExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrever.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  { You must clear the preview's qrpinter property}
  QRPreview.QRPrinter := nil;
  { tell Delphi to free this form automaticly }
  Action := caFree;
end;

procedure TfrmPrever.QRPreviewPageAvailable(Sender: TObject;
  PageNum: Integer);
begin
  Init;
  sePage.MaxValue := Max(PageNum, sePage.MaxValue);
  sePage.ReadOnly := sePage.MaxValue = 1;

  { Display the number of rendered pages }
  if QRPreview.QRPrinter.PageCount = 1 then
    Caption := QRPreview.QRPrinter.Title + ' - 1 página'
  else
    Caption := QRPreview.QRPrinter.Title + ' - ' + IntToStr(QRPreview.QRPrinter.PageCount) + ' páginas';

  { Here's one way to show the current status of the report }
  case QRPreview.QRPrinter.Status of
    mpReady: Caption := Caption + ' PRONTA';
    mpBusy: Caption := Caption + ' OCUPADA';
    mpFinished: Caption := Caption + ' TERMINADA';
  end;
end;

procedure TfrmPrever.FormCreate(Sender: TObject);
begin
//  ControlaTela(self);
  FbBuildTitle := True;

  // Load the glyphs into the buttons
  sbFirstPage.Glyph.Handle := LoadBitmap(hinstance, 'QRFIRSTPAGEBITMAP');
  sbPreviousPage.Glyph.Handle := LoadBitmap(hinstance, 'QRPREVPAGEBITMAP');
  sbNextPage.Glyph.Handle := LoadBitmap(hinstance, 'QRNEXTPAGEBITMAP');
  sbLastPage.Glyph.Handle := LoadBitmap(hinstance, 'QRLASTPAGEBITMAP');
  ZoomToFit.Glyph.Handle := LoadBitmap(hinstance, 'QRZOOMTOFITBITMAP');
  ZoomTo100.Glyph.Handle := LoadBitmap(hinstance, 'QRZOOMTO100BITMAP');
  ZoomToWidth.Glyph.Handle := LoadBitmap(hinstance, 'QRZOOMTOWIDTHBITMAP');
  PrintSetup.Glyph.Handle := LoadBitmap(hinstance, 'QRPRINTSETUPBITMAP');
  Print.Glyph.Handle := LoadBitmap(hinstance, 'QRPRINTBITMAP');
  Load.Glyph.Handle := LoadBitmap(hinstance, 'QROPENBITMAP');
  Save.Glyph.Handle := LoadBitmap(hinstance, 'QRSAVEBITMAP');

{ Load strings for hints }

{  ZoomToFit.Hint := LoadStr( SqrZoomToFit );
  ZoomTo100.Hint := LoadStr( SqrZoom100 );
  ZoomToWidth.Hint := LoadStr( SqrZoomToWidth );
  sbFirstPage.Hint := LoadStr( SqrFirstPage );
  sbLastPage.Hint := LoadStr( SqrLastPage );
  sbPreviousPage.Hint := LoadStr( SqrPrevPage );
  sbNextPage.Hint := LoadStr( SqrNextPage );
  PrintSetup.Hint := LoadStr( SqrPrinterSetup );
  Print.Hint := LoadStr( SqrPrintReport );
  Save.Hint := LoadStr( SqrSaveReport );
  Load.Hint := LoadStr( SqrLoadReport );}

{ this is temporary. Not exists the resourcestring in qr2const.rc }
//  Exit.Caption := LoadStr( SqrCancel );


  { You can put code in here to control how the form behaves}
  WindowState := wsMaximized;
  FormStyle   := fsnormal;//fsStayOnTop;//fsNormal;

  { We can disable functionality at runtime }
  bCanPrint := False;
end;

procedure TfrmPrever.sbFirstPageClick(Sender: TObject);
begin
  Application.ProcessMessages;
  sePage.Value := 1;
  QRPreview.PageNumber:=sePage.Value;
end;

procedure TfrmPrever.sbPreviousPageClick(Sender: TObject);
begin
  Application.ProcessMessages;
  if sePage.Value > 1 then
  begin
    sePage.Value := sePage.Value - 1;
    QRPreview.PageNumber:=sePage.Value;
  end;
end;

procedure TfrmPrever.sbNextPageClick(Sender: TObject);
begin
  Application.ProcessMessages;
  if sePage.Value < QRPreview.QRPrinter.PageCount then
  begin
    sePage.Value := sePage.Value + 1;
    QRPreview.PageNumber:=sePage.Value;
  end;
end;

procedure TfrmPrever.sbLastPageClick(Sender: TObject);
begin
  Application.ProcessMessages;
  sePage.Value := QRPreview.QRPrinter.PageCount;
  QRPreview.PageNumber:=sePage.Value;
end;

procedure TfrmPrever.ZoomToFitClick(Sender: TObject);
begin
  Application.ProcessMessages;
  QRPreview.ZoomToFit;
  seZoom.Value:=QRPreview.Zoom;
end;

procedure TfrmPrever.ZoomTo100Click(Sender: TObject);
begin
  Application.ProcessMessages;
  QRPreview.Zoom:=100;
  seZoom.Value:=QRPreview.Zoom;
end;

procedure TfrmPrever.ZoomToWidthClick(Sender: TObject);
begin
  Application.ProcessMessages;
  QRPreview.ZoomToWidth;
  seZoom.Value:=QRPreview.Zoom;
end;

procedure TfrmPrever.PrintSetupClick(Sender: TObject);
begin
  {
     With 2.0j, QuickReport will set the report's tag property to -1 if the
     user cancels the printersetup.  By checking for this value, we can call
     the print method directly from setup if the users selects OK
  }
  with pQuickReport do
  begin
    tag := -1; { Just in case you are using an older version }
    PrinterSetup;
    if tag = 0 then
      print;
  end;
end;

procedure TfrmPrever.PrintClick(Sender: TObject);
begin
  Print.Enabled := False;
  QRPreview.qrprinter.Print;
  Print.Enabled := True;
end;

procedure TfrmPrever.SaveClick(Sender: TObject);
var
  aExportFilter : TQRExportFilter;
{$ifndef win32}
  FileExt : string;
  I : integer;
{$endif}
begin
  aExportFilter := nil;
  with TSaveDialog.Create(Application) do
  try
    Filter := QRExportFilterLibrary.SaveDialogFilterString;
{    DefaultExt := cQRPDefaultExt;}
    if Execute then
    begin
    {$ifdef win32}
      if FilterIndex = 1 then
      begin
        if Pos('.', Filename) = 0 then
          Filename := Filename + '.qrp';
        QRPreview.QRPrinter.Save(Filename);
      end
      else
      begin
        try
          aExportFilter := TQRExportFilterLibraryEntry(
            QRExportFilterLibrary.Filters[FilterIndex - 2]).ExportFilterClass.Create(Filename);
          QRPreview.QRPrinter.ExportToFilter(aExportFilter);
        finally
          aExportFilter.Free
        end
      end
    {$else}
      FileExt := ExtractFileExt(Filename);
      if copy(FileExt, 1, 1) = '.' then delete(FileExt, 1, 1);
      if (FileExt = '') or (FileExt = cQRPDefaultExt) then
        QRPreview.QRPrinter.Save(Filename)
      else
      begin
        for I := 0 to QRExportFilterLibrary.Filters.Count - 1 do
        begin
          if TQRExportFilterLibraryEntry(QRExportFilterLibrary.Filters[I]).Extension = FileExt then
          try
            aExportFilter := TQRExportFilterLibraryEntry(
              QRExportFilterLibrary.Filters[I]).ExportFilterClass.Create(Filename);
            QRPreview.QRPrinter.ExportToFilter(aExportFilter);
          finally
            aExportFilter.Free;
          end;
        end;
      end;
    {$endif}
    end;
  finally
    Free;
  end;
end;

procedure TfrmPrever.BitBtnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrever.CancelReport;
begin
  if pQuickReport.qrprinter.status = mpBusy then
    if MessageDlg('Cancele este relatorio?', mtConfirmation, mbOKCancel,0) = mrOK then
    begin
      QRPrinter.Cancel;
      QRPreview.qrprinter := nil;
    end;
end;

procedure TfrmPrever.LoadClick(Sender: TObject);
begin
  with TOpenDialog.Create(Application) do
  try
    Filter := 'QuickReport arquivos (*.qrp)|*.qrp';
    if Execute then
      if FileExists(FileName) then
      begin
        QRPreview.QRPrinter.Load(Filename);
        QRPreview.PageNumber := 1;
        QRPreview.PreviewImage.PageNumber := 1;
        if QRPreview.QRPrinter.Title = '' then
          QRPreview.QRPrinter.Title := Filename;
        if QRPreview.QRPrinter.PageCount = 1 then
          Self.Caption := QRPreview.QRPrinter.Title + ' - ' + IntToStr(QRPreview.QRPrinter.PageCount) + ' page'
        else
          Self.Caption := QRPreview.QRPrinter.Title + ' - ' + IntToStr(QRPreview.QRPrinter.PageCount) + ' pages';
        bPleaseInit := True;
        Init;
      end
      else
        ShowMessage('Nao posso carregar esse arquivo: ' + FileName);
  finally
    free;
  end;
end;

procedure TfrmPrever.SetbBuildTitle(const Value: boolean);
begin
  FbBuildTitle := Value;
end;

end.
