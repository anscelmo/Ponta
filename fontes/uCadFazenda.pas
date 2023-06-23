unit uCadFazenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uDM, DB, ComCtrls, StdCtrls, Buttons, ExtCtrls, ToolWin,
  DBCtrls, Mask, uFuncoes, uPesqFazenda;

type
  TfrmCadFazenda = class(TForm)
    ToolBar1: TToolBar;
    StatusBar1: TStatusBar;
    pnlChave: TPanel;
    pnlDados: TPanel;
    btNovo: TBitBtn;
    btSalvar: TBitBtn;
    btCancelar: TBitBtn;
    btExcluir: TBitBtn;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    Label2: TLabel;
    edtNomeFazenda: TDBEdit;
    Label1: TLabel;
    edtIDFazenda: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    ToolButton6: TToolButton;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    ToolButton7: TToolButton;
    dsFazenda: TDataSource;
    procedure Status(Sender: TObject);
    procedure btNovoClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure dsFazendaStateChange(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadFazenda: TfrmCadFazenda;

implementation

{$R *.dfm}

procedure TfrmCadFazenda.Status(Sender: TObject);
begin
  StatusBar1.SimpleText := (Sender as TWinControl).Hint;
end;

procedure TfrmCadFazenda.btNovoClick(Sender: TObject);
begin
  DM.tbFazenda.Append;
  edtNomeFazenda.SetFocus;
end;

procedure TfrmCadFazenda.btSalvarClick(Sender: TObject);
var
  ComandoSQL: String;
  DataSetState: TDataSetState;
begin
  DataSetState := DM.tbFazenda.State;

  edtNomeFazenda.Text := Trim(edtNomeFazenda.Text);

  ComandoSQL := 'select count(*) from Fazenda where Nome = ' + QuotedStr(edtNomeFazenda.Text);
  if DataSetState = dsEdit then
    ComandoSQL := ComandoSQL + ' and IDFazenda <> ' + edtIDFazenda.Text;

  if trim(edtNomeFazenda.Text) = '' then
  begin
    showmessage('Informar nome da fazenda');
    edtNomeFazenda.SetFocus;
    abort;
  end;

  if ExecutaCountSQL(ComandoSQL) > 0 then
  begin
    showmessage('Este nome de fazenda já existe');
    edtNomeFazenda.SetFocus;
    abort;
  end;

  DM.tbFazenda.Post;
  if DataSetState = dsInsert then
    DM.tbFazenda.Last;
end;

procedure TfrmCadFazenda.btCancelarClick(Sender: TObject);
begin
  DM.tbFazenda.Cancel;
end;

procedure TfrmCadFazenda.btExcluirClick(Sender: TObject);
begin
  if DM.tbFazenda.IsEmpty then
  begin
    showmessage('Não há dados para excluir');
    Abort;
  end;

  if Application.MessageBox(pchar('Confirma exclusão do registro?'), pchar('Confirmação'), MB_ICONQUESTION + MB_YESNO) = idyes then
  begin
    DM.tbFazenda.Delete;
    showmessage('Registro excluído');
  end;
end;

procedure TfrmCadFazenda.BitBtn1Click(Sender: TObject);
begin
  DM.tbFazenda.First;
end;

procedure TfrmCadFazenda.BitBtn2Click(Sender: TObject);
begin
  DM.tbFazenda.Prior;
end;

procedure TfrmCadFazenda.BitBtn3Click(Sender: TObject);
begin
  DM.tbFazenda.Next;
end;

procedure TfrmCadFazenda.BitBtn4Click(Sender: TObject);
begin
  DM.tbFazenda.Last;
end;

procedure TfrmCadFazenda.FormCreate(Sender: TObject);
begin
  DM.tbFazenda.Open;
  DM.tbFazenda.IndexFieldNames := 'IDFAZENDA';
end;

procedure TfrmCadFazenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM.tbFazenda.Close;
  Action := CaFree;
end;

procedure TfrmCadFazenda.FormDestroy(Sender: TObject);
begin
  frmCadFazenda := nil;
end;

procedure TfrmCadFazenda.dsFazendaStateChange(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to ToolBar1.ControlCount - 1 do
  begin
    if ToolBar1.Controls[i].Tag <> 0 then
    begin
      if DM.tbFazenda.State in [dsInsert,dsEdit] then
        TToolButton(ToolBar1.Controls[i]).Enabled := ToolBar1.Controls[i].Tag = 2
      else
        TToolButton(ToolBar1.Controls[i]).Enabled := ToolBar1.Controls[i].Tag = 1;
    end;
  end;
end;

procedure TfrmCadFazenda.BitBtn6Click(Sender: TObject);
begin
  DM.tbFazenda.Refresh;
end;

procedure TfrmCadFazenda.BitBtn5Click(Sender: TObject);
var
  IdFazenda: string;
begin
  frmPesqFazenda := TfrmPesqFazenda.Create(self);
  frmPesqFazenda.ShowModal;
  IdFazenda := frmPesqFazenda.oIDFazenda;
  frmPesqFazenda.Free;

  if trim(IdFazenda) <> '' then
    DM.tbFazenda.Locate('IDFAZENDA', IdFazenda, []);
end;

end.
