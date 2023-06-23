unit uCadAnimalLote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, DBClient, ExtCtrls, StdCtrls, Buttons,
  uDM, uFuncoes;

type
  TfrmCadAnimalLote = class(TForm)
    pnlTop: TPanel;
    pnlCenter: TPanel;
    pnlBottom: TPanel;
    dsDados: TDataSource;
    cdsDados: TClientDataSet;
    gridDados: TDBGrid;
    cdsDadosIDENTIFICACAO: TStringField;
    cdsDadosFAZENDA: TStringField;
    cdsDadosSTATUS: TStringField;
    cdsDadosDESCRICAOERRO: TStringField;
    btValidar: TBitBtn;
    btAvancar: TBitBtn;
    btExcluir: TBitBtn;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure gridDadosKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure btValidarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure gridDadosExit(Sender: TObject);
    procedure btAvancarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadAnimalLote: TfrmCadAnimalLote;

implementation

{$R *.dfm}

procedure TfrmCadAnimalLote.FormCreate(Sender: TObject);
begin
  if not cdsDados.Active then
    cdsDados.CreateDataSet;
  cdsDados.EmptyDataSet;
  cdsDados.LogChanges := False;

  gridDados.Columns.Items[1].PickList.Clear;
  DM.qSelFazenda.Close;
  DM.qSelFazenda.Open;
  while not DM.qSelFazenda.Eof do
  begin
    gridDados.Columns.Items[1].PickList.Add(DM.qSelFazendaNOME.AsString);
    DM.qSelFazenda.Next;
  end;
  DM.qSelFazenda.Close;

  btExcluir.Visible := True;
  btValidar.Visible := True;
  btAvancar.Visible := False;
  gridDados.Enabled := True;
end;

procedure TfrmCadAnimalLote.gridDadosKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := AnsiUpperCase(Key)[1];

  if gridDados.SelectedField.FieldName = 'IDENTIFICACAO' then
  begin
    if  not ( Key in ['0'..'9', Chr(8), Chr(9)] ) then
      Key := #0;
  end;

  if gridDados.SelectedField.FieldName = 'FAZENDA' then
  begin
    Key := #0;
  end;
end;

procedure TfrmCadAnimalLote.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action := caFree;
end;

procedure TfrmCadAnimalLote.FormDestroy(Sender: TObject);
begin
  frmCadAnimalLote := Nil;
end;

procedure TfrmCadAnimalLote.btValidarClick(Sender: TObject);
var
  RegErro: Boolean;
begin
  cdsDados.Filter := '';
  cdsDados.Filtered := False;
  cdsDados.DisableControls;

  if cdsDados.IsEmpty then
  begin
    ShowMessage('Não há dados para validar');
    Abort;
  end;

  cdsDados.First;
  while not cdsDados.Eof do
  begin
    RegErro := False;
    cdsDados.Edit;

    if not RegErro then
    begin
      if Trim(cdsDadosIDENTIFICACAO.AsString) = '' then
      begin
        cdsDadosSTATUS.AsString := 'Erro';
        cdsDadosDESCRICAOERRO.AsString := 'Campo "Identificação" deve ser informado';
        RegErro := True;
      end;
    end;

    if not RegErro then
    begin
      if Trim(cdsDadosFAZENDA.AsString) = '' then
      begin
        cdsDadosSTATUS.AsString := 'Erro';
        cdsDadosDESCRICAOERRO.AsString := 'Campo "Fazenda" deve ser informado';
        RegErro := True;
      end;
    end;

    if not RegErro then
    begin
      if fnIdentificacaoExiste(cdsDadosIDENTIFICACAO.AsString) then
      begin
        cdsDadosSTATUS.AsString := 'Erro';
        cdsDadosDESCRICAOERRO.AsString := 'Esta "Identificação" já existe';
        RegErro := True;
      end;
    end;

    if not RegErro then
    begin
      if not fnFazendaExiste(cdsDadosFAZENDA.AsString) then
      begin
        cdsDadosSTATUS.AsString := 'Erro';
        cdsDadosDESCRICAOERRO.AsString := 'Esta "Fazenda" não existe';
        RegErro := True;
      end;
    end;

    if not RegErro then
    begin
      cdsDadosSTATUS.AsString := 'Ok';
      cdsDadosDESCRICAOERRO.AsString := '';
    end;

    cdsDados.Post;
    cdsDados.Next;
  end;
  cdsDados.First;

  cdsDados.Filtered := False;
  cdsDados.Filter := 'STATUS = ' + QuotedStr('Erro');
  cdsDados.Filtered := True;
  cdsDados.EnableControls;

  if cdsDados.RecordCount > 0 then
  begin
    Application.MessageBox(pchar('Existem registros com erros de validação!' + #13 + 'Corrija os erros ou exclua os registros para continuar.'),
                           pchar('Aviso'), MB_ICONINFORMATION + MB_OK);
  end
  else
  begin
    Application.MessageBox(pchar('Registros validados com sucesso!'),
                           pchar('Aviso'), MB_ICONINFORMATION + MB_OK);

    cdsDados.DisableControls;
    cdsDados.Filtered := False;
    cdsDados.Filter := '';
    cdsDados.EnableControls;

    btExcluir.Visible := False;
    btValidar.Visible := False;
    btAvancar.Visible := True;
    gridDados.Enabled := False;
  end;
end;

procedure TfrmCadAnimalLote.btExcluirClick(Sender: TObject);
begin
  if not cdsDados.IsEmpty then
  begin
    if Application.MessageBox(pchar('Confirma a exclusão do registro selecionado?'),
                              pchar('Confirmação'), MB_ICONQUESTION + MB_YESNO) = idYes then
      cdsDados.Delete;
  end;
end;

procedure TfrmCadAnimalLote.gridDadosExit(Sender: TObject);
begin
  if cdsDados.State in [dsInsert, dsEdit] then
    cdsDados.Post;
end;

procedure TfrmCadAnimalLote.btAvancarClick(Sender: TObject);
var
  CodFazenda: Integer;
  comandoSQL: String;
begin
  if Application.MessageBox(pchar('Confirma a gravação dos dados?'),
                            pchar('Confirmação'), MB_ICONQUESTION + MB_YESNO) = idYes then
  begin
    cdsDados.DisableControls;
    cdsDados.First;
    while not cdsDados.Eof do
    begin
      comandoSQL := 'select idFazenda from Fazenda where nome = ' + QuotedStr(cdsDadosFAZENDA.AsString);
      CodFazenda := ExecutaCountSQL(comandoSQL);
      comandoSQL := 'insert into Animal (Identificacao, CodFazenda) ' +
                    'values (' + QuotedStr(cdsDadosIDENTIFICACAO.AsString) + ',' + IntToStr(CodFazenda) + ')';
      ExecutaSQL(comandoSQL);
      cdsDados.Next;
    end;
    cdsDados.EmptyDataSet;
    cdsDados.EnableControls;
    ShowMessage('Dados gravados com sucesso');
    Close;
  end
  else
  begin
    ShowMessage('Operação cancelada pelo usuário');
  end;
end;

end.
