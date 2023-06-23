unit uCadAnimal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uDM, DB, ComCtrls, StdCtrls, Buttons, ExtCtrls, ToolWin,
  DBCtrls, Mask, RXDBCtrl, uFuncoes, uPesqAnimal;

type
  TfrmCadAnimal = class(TForm)
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
    Label1: TLabel;
    edtIDAnimal: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    ToolButton6: TToolButton;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    ToolButton7: TToolButton;
    dsAnimal: TDataSource;
    edtIdentificacao: TDBEdit;
    cmbCodFazenda: TDBLookupComboBox;
    Label3: TLabel;
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
    procedure dsAnimalStateChange(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure edtIdentificacaoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadAnimal: TfrmCadAnimal;

implementation

{$R *.dfm}

procedure TfrmCadAnimal.Status(Sender: TObject);
begin
  StatusBar1.SimpleText := (Sender as TWinControl).Hint;
end;

procedure TfrmCadAnimal.btNovoClick(Sender: TObject);
begin
  DM.tbAnimal.Append;
  edtIdentificacao.SetFocus;
end;

procedure TfrmCadAnimal.btSalvarClick(Sender: TObject);
var
  ComandoSQL: String;
  DataSetState: TDataSetState;
begin
  DataSetState := DM.tbAnimal.State;

  edtIdentificacao.Text := Trim(edtIdentificacao.Text);

  ComandoSQL := 'select count(*) from Animal where Identificacao = ' + QuotedStr(edtIdentificacao.Text);
  if DataSetState = dsEdit then
    ComandoSQL := ComandoSQL + ' and IDAnimal <> ' + edtIDAnimal.Text;

  if Trim(edtIdentificacao.Text) = '' then
  begin
    showmessage('Informar identificação do animal');
    edtIdentificacao.SetFocus;
    abort;
  end;

  if Trim(cmbCodFazenda.Text) = '' then
  begin
    showmessage('Informar fazenda');
    cmbCodFazenda.SetFocus;
    abort;
  end;

  if ExecutaCountSQL(ComandoSQL) > 0 then
  begin
    showmessage('Este nome de Animal já existe');
    edtIdentificacao.SetFocus;
    abort;
  end;

  DM.tbAnimal.Post;
  if DataSetState = dsInsert then
    DM.tbAnimal.Last;
end;

procedure TfrmCadAnimal.btCancelarClick(Sender: TObject);
begin
  DM.tbAnimal.Cancel;
end;

procedure TfrmCadAnimal.btExcluirClick(Sender: TObject);
begin
  if DM.tbAnimal.IsEmpty then
  begin
    showmessage('Não há dados para excluir');
    Abort;
  end;

  if Application.MessageBox(pchar('Confirma exclusão do registro?'), pchar('Confirmação'), MB_ICONQUESTION + MB_YESNO) = idyes then
  begin
    DM.tbAnimal.Delete;
    showmessage('Registro excluído');
  end;
end;

procedure TfrmCadAnimal.BitBtn1Click(Sender: TObject);
begin
  DM.tbAnimal.First;
end;

procedure TfrmCadAnimal.BitBtn2Click(Sender: TObject);
begin
  DM.tbAnimal.Prior;
end;

procedure TfrmCadAnimal.BitBtn3Click(Sender: TObject);
begin
  DM.tbAnimal.Next;
end;

procedure TfrmCadAnimal.BitBtn4Click(Sender: TObject);
begin
  DM.tbAnimal.Last;
end;

procedure TfrmCadAnimal.FormCreate(Sender: TObject);
begin
  DM.tbAnimal.Open;
  DM.tbAnimal.IndexFieldNames := 'IDANIMAL';

  DM.qSelFazenda.Open;
end;

procedure TfrmCadAnimal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM.tbAnimal.Close;
  DM.qSelFazenda.Close;
  Action := CaFree;
end;

procedure TfrmCadAnimal.FormDestroy(Sender: TObject);
begin
  frmCadAnimal := nil;
end;

procedure TfrmCadAnimal.dsAnimalStateChange(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to ToolBar1.ControlCount - 1 do
  begin
    if ToolBar1.Controls[i].Tag <> 0 then
    begin
      if DM.tbAnimal.State in [dsInsert,dsEdit] then
        TToolButton(ToolBar1.Controls[i]).Enabled := ToolBar1.Controls[i].Tag = 2
      else
        TToolButton(ToolBar1.Controls[i]).Enabled := ToolBar1.Controls[i].Tag = 1;
    end;
  end;
end;

procedure TfrmCadAnimal.BitBtn6Click(Sender: TObject);
begin
  DM.tbAnimal.Refresh;
end;

procedure TfrmCadAnimal.BitBtn5Click(Sender: TObject);
var
  IdAnimal: string;
begin
  frmPesqAnimal := TfrmPesqAnimal.Create(self);
  frmPesqAnimal.ShowModal;
  IdAnimal := frmPesqAnimal.oIDAnimal;
  frmPesqAnimal.Free;

  if trim(IdAnimal) <> '' then
    DM.tbAnimal.Locate('IDAnimal', IdAnimal, []);
end;

procedure TfrmCadAnimal.edtIdentificacaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if  not ( Key in ['0'..'9', Chr(8), Chr(9)] ) then
    Key := #0;
end;

end.
