unit uPesqFazenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ToolWin, ComCtrls, Grids, DBGrids, DB,
  ADODB, uDM, Buttons, Mask, uFuncoes;

type
  TfrmPesqFazenda = class(TForm)
    dsPesqFazenda: TDataSource;
    gridPesqFazenda: TDBGrid;
    ToolBar1: TToolBar;
    edtNomeFazenda: TEdit;
    Label1: TLabel;
    Label5: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    BitBtn5: TBitBtn;
    BitBtn7: TBitBtn;
    c: TBitBtn;
    pnlFIltro: TPanel;
    StatusBar1: TStatusBar;
    edtIDFazenda: TEdit;
    Label2: TLabel;
    procedure Status(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cClick(Sender: TObject);
    procedure edtIDFazendaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    oIDFazenda: string;
  end;

var
  frmPesqFazenda: TfrmPesqFazenda;

implementation

{$R *.dfm}

procedure TfrmPesqFazenda.Status(Sender: TObject);
begin
  StatusBar1.SimpleText := (Sender as TWinControl).Hint;
end;

procedure TfrmPesqFazenda.BitBtn1Click(Sender: TObject);
begin
  DM.qPesqFazenda.First;
end;

procedure TfrmPesqFazenda.BitBtn2Click(Sender: TObject);
begin
  DM.qPesqFazenda.Prior;
end;

procedure TfrmPesqFazenda.BitBtn3Click(Sender: TObject);
begin
  DM.qPesqFazenda.Next;
end;

procedure TfrmPesqFazenda.BitBtn4Click(Sender: TObject);
begin
  DM.qPesqFazenda.Last;
end;

procedure TfrmPesqFazenda.BitBtn5Click(Sender: TObject);
begin
  oIDFazenda := DM.qPesqFazendaIDFAZENDA.AsString;
  Close;
end;

procedure TfrmPesqFazenda.BitBtn7Click(Sender: TObject);
begin
  oIDFazenda := '';
  Close;
end;

procedure TfrmPesqFazenda.FormCreate(Sender: TObject);
begin
  oIDFazenda := '';
  DM.qPesqFazenda.Close;
end;

procedure TfrmPesqFazenda.cClick(Sender: TObject);
var
  i, iFiltro: integer;
begin
  DM.qPesqFazenda.Close;
  iFiltro := DM.qPesqFazenda.SQL.IndexOf('  1 = 1') + 1;
  for i := DM.qPesqFazenda.SQL.Count - 1 downto iFiltro do
    DM.qPesqFazenda.SQL.Delete(i);

  if Trim(edtIDFazenda.Text) <> '' then
    DM.qPesqFazenda.SQL.Add('  AND IDFAZENDA = ' + edtIDFazenda.Text + '');

  if Trim(edtNomeFazenda.Text) <> '' then
    DM.qPesqFazenda.SQL.Add('  AND NOME LIKE ''%' + edtNomeFazenda.Text + '%''');

  DM.qPesqFazenda.SQL.Add('ORDER BY IDFAZENDA');

  DM.qPesqFazenda.Open;
end;

procedure TfrmPesqFazenda.edtIDFazendaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if  not ( Key in ['0'..'9', Chr(8), Chr(9)] ) then
    Key := #0;
end;

end.
