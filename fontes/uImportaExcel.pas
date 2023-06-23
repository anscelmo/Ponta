unit uImportaExcel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, uFuncoes, uImportaExcelExpl;

type
  TfrmImportaExcel = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    edtArquivo: TEdit;
    Label1: TLabel;
    btnSelecao: TBitBtn;
    btnExplicacoes: TBitBtn;
    Panel3: TPanel;
    memoLog: TMemo;
    btValidar: TBitBtn;
    btAvancar: TBitBtn;
    OpenDialog1: TOpenDialog;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure btValidarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSelecaoClick(Sender: TObject);
    procedure btAvancarClick(Sender: TObject);
    procedure btnExplicacoesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImportaExcel: TfrmImportaExcel;

implementation

{$R *.dfm}

procedure TfrmImportaExcel.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action := caFree;
end;

procedure TfrmImportaExcel.FormDestroy(Sender: TObject);
begin
  frmImportaExcel := nil;
end;

procedure TfrmImportaExcel.btValidarClick(Sender: TObject);
var
  RegErro: Boolean;
  i: Integer;
  slDados: TStringList;
  Identificacao, Fazenda: String;
begin
  memoLog.Lines.Clear;

  if edtArquivo.Text = '' then
  begin
    ShowMessage('Informar local do arquivo');
    Abort;
  end;

  if not FileExists(edtArquivo.Text) then
  begin
    ShowMessage('Arquivo informado não existe');
    Abort;
  end;

  slDados := TStringList.Create;;
  slDados.LoadFromFile(edtArquivo.Text);
  if slDados.Strings[0] <> 'IDENTIFICACAO;FAZENDA' then
  begin
    ShowMessage('Cabeçalho do arquivo diferente da estrutura esperada');
    Abort;
  end;

  for i := 1 to slDados.Count - 1 do
  begin
    RegErro := False;
    Identificacao := copy(slDados.Strings[i], 1, pos(';', slDados.Strings[i]) - 1);
    Fazenda := copy(slDados.Strings[i], pos(';', slDados.Strings[i]) + 1 , length(slDados.Strings[i]));

    if not RegErro then
    begin
      if Trim(Identificacao) = '' then
      begin
        memoLog.Lines.Add('Linha ' + IntToStr(i) + ': Campo "Identificação" deve ser informado');
        RegErro := True;
      end;
    end;

    if not RegErro then
    begin
      if not SomenteNumero(Identificacao) then
      begin
        memoLog.Lines.Add('Linha ' + IntToStr(i) + ': Campo "Identificação" deve ser numérico');
        RegErro := True;
      end;
    end;

    if not RegErro then
    begin
      if length(Identificacao) > 15 then
      begin
        memoLog.Lines.Add('Linha ' + IntToStr(i) + ': Campo "Identificação" não pode ultrapassar 15 caracteres');
        RegErro := True;
      end;
    end;

    if not RegErro then
    begin
      if Trim(Fazenda) = '' then
      begin
        memoLog.Lines.Add('Linha ' + IntToStr(i) + ': Campo "Fazenda" deve ser informado');
        RegErro := True;
      end;
    end;

    if not RegErro then
    begin
      if fnIdentificacaoExiste(Identificacao) then
      begin
        memoLog.Lines.Add('Linha ' + IntToStr(i) + ': Esta "Identificação" já existe');
        RegErro := True;
      end;
    end;

    if not RegErro then
    begin
      if not fnFazendaExiste(Fazenda) then
      begin
        memoLog.Lines.Add('Linha ' + IntToStr(i) + ': Esta "Fazenda" não existe');
        RegErro := True;
      end;
    end;

  end;

  slDados.Free;

  if memoLog.Lines.Count > 0 then
  begin
    Application.MessageBox(pchar('O arquivo possui erros de validação'),
                           pchar('Erro'), MB_ICONERROR + MB_OK);
    Abort;
  end
  else
  begin
    Application.MessageBox(pchar('Arquivo validado com sucesso!'),
                           pchar('Aviso'), MB_ICONINFORMATION + MB_OK);
    memoLog.Lines.Clear;
    memoLog.Lines.Add('Clique em "Avançar" para gravar os dados');
    btValidar.Visible := False;
    btAvancar.Visible := True;
  end;
end;

procedure TfrmImportaExcel.FormCreate(Sender: TObject);
begin
  memoLog.Lines.Clear;
  btValidar.Visible := True;
  btAvancar.Visible := False;
end;

procedure TfrmImportaExcel.btnSelecaoClick(Sender: TObject);
begin
  OpenDialog1.Execute;
  edtArquivo.Text := OpenDialog1.FileName;
end;

procedure TfrmImportaExcel.btAvancarClick(Sender: TObject);
var
  i, CodFazenda: Integer;
  slDados: TStringList;
  comandoSQL, Identificacao, Fazenda: String;
begin
  if Application.MessageBox(pchar('Confirma a gravação dos dados?'),
                            pchar('Confirmação'), MB_ICONQUESTION + MB_YESNO) = idYes then
  begin
    slDados := TStringList.Create;;
    slDados.LoadFromFile(edtArquivo.Text);

    for i := 1 to slDados.Count - 1 do
    begin
      Identificacao := copy(slDados.Strings[i], 1, pos(';', slDados.Strings[i]) - 1);
      Fazenda := copy(slDados.Strings[i], pos(';', slDados.Strings[i]) + 1 , length(slDados.Strings[i]));

      comandoSQL := 'select idFazenda from Fazenda where nome = ' + QuotedStr(Fazenda);
      CodFazenda := ExecutaCountSQL(comandoSQL);
      comandoSQL := 'insert into Animal (Identificacao, CodFazenda) ' +
                    'values (' + QuotedStr(Identificacao) + ',' + IntToStr(CodFazenda) + ')';
      ExecutaSQL(comandoSQL);
    end;
    ShowMessage('Dados gravados com sucesso');
    Close;
  end
  else
  begin
    ShowMessage('Operação cancelada pelo usuário');
  end;

  slDados.Free;
end;

procedure TfrmImportaExcel.btnExplicacoesClick(Sender: TObject);
begin
  frmImportaExcelExpl := TfrmImportaExcelExpl.Create(Self);
  frmImportaExcelExpl.ShowModal;
  frmImportaExcelExpl.Free;
end;

end.
