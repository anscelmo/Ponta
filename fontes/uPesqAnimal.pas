unit uPesqAnimal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ToolWin, ComCtrls, Grids, DBGrids, DB,
  ADODB, uDM, Buttons, Mask, uFuncoes, DBCtrls;

type
  TfrmPesqAnimal = class(TForm)
    dsPesqAnimal: TDataSource;
    gridPesqAnimal: TDBGrid;
    ToolBar1: TToolBar;
    Label3: TLabel;
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
    edtIDAnimal: TEdit;
    edtIdentificacao: TEdit;
    Label2: TLabel;
    Label1: TLabel;
    cmbCodFazenda: TDBLookupComboBox;
    procedure Status(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cClick(Sender: TObject);
    procedure edtIDAnimalKeyPress(Sender: TObject; var Key: Char);
    procedure edtIdentificacaoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    oIDAnimal: string;
  end;

var
  frmPesqAnimal: TfrmPesqAnimal;

implementation

{$R *.dfm}

procedure TfrmPesqAnimal.Status(Sender: TObject);
begin
  StatusBar1.SimpleText := (Sender as TWinControl).Hint;
end;

procedure TfrmPesqAnimal.BitBtn1Click(Sender: TObject);
begin
  DM.qPesqAnimal.First;
end;

procedure TfrmPesqAnimal.BitBtn2Click(Sender: TObject);
begin
  DM.qPesqAnimal.Prior;
end;

procedure TfrmPesqAnimal.BitBtn3Click(Sender: TObject);
begin
  DM.qPesqAnimal.Next;
end;

procedure TfrmPesqAnimal.BitBtn4Click(Sender: TObject);
begin
  DM.qPesqAnimal.Last;
end;

procedure TfrmPesqAnimal.BitBtn5Click(Sender: TObject);
begin
  oIDAnimal := DM.qPesqAnimalIDAnimal.AsString;
  Close;
end;

procedure TfrmPesqAnimal.BitBtn7Click(Sender: TObject);
begin
  oIDAnimal := '';
  Close;
end;

procedure TfrmPesqAnimal.FormCreate(Sender: TObject);
begin
  oIDAnimal := '';
  DM.qPesqAnimal.Close;
end;

procedure TfrmPesqAnimal.cClick(Sender: TObject);
var
  i, iFiltro: integer;
begin
  DM.qPesqAnimal.Close;
  iFiltro := DM.qPesqAnimal.SQL.IndexOf('  1 = 1') + 1;
  for i := DM.qPesqAnimal.SQL.Count - 1 downto iFiltro do
    DM.qPesqAnimal.SQL.Delete(i);

  if Trim(edtIDAnimal.Text) <> '' then
    DM.qPesqAnimal.SQL.Add('  AND A.IDANIMAL = ' + edtIDAnimal.Text + '');

  if Trim(edtIdentificacao.Text) <> '' then
    DM.qPesqAnimal.SQL.Add('  AND A.IDENTIFICACAO LIKE ''%' + edtIdentificacao.Text + '%''');

  if Trim(cmbCodFazenda.Text) <> '' then
    DM.qPesqAnimal.SQL.Add('  AND A.CODFAZENDA = ' + IntToStr(cmbCodFazenda.KeyValue) + '');

  DM.qPesqAnimal.SQL.Add('ORDER BY A.IDANIMAL');

  DM.qPesqAnimal.Open;
end;

procedure TfrmPesqAnimal.edtIDAnimalKeyPress(Sender: TObject;
  var Key: Char);
begin
  if  not ( Key in ['0'..'9', Chr(8), Chr(9)] ) then
    Key := #0;
end;

procedure TfrmPesqAnimal.edtIdentificacaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if  not ( Key in ['0'..'9', Chr(8), Chr(9)] ) then
    Key := #0;
end;

end.
