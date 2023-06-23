unit uImportaExcelExpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfrmImportaExcelExpl = class(TForm)
    Label1: TLabel;
    MemoExplica: TMemo;
    btFechar: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImportaExcelExpl: TfrmImportaExcelExpl;

implementation

{$R *.dfm}

procedure TfrmImportaExcelExpl.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action := caFree;
end;

procedure TfrmImportaExcelExpl.FormDestroy(Sender: TObject);
begin
  frmImportaExcelExpl := nil;
end;

procedure TfrmImportaExcelExpl.btFecharClick(Sender: TObject);
begin
  Close;
end;

end.
