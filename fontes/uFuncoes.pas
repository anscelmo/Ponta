unit uFuncoes;

interface

uses
  SysUtils, Classes, Windows, Forms, DB, Graphics, IniFiles,
  SynPDF, Printers, uDM, QuickRpt, uRelatorio;

function SomenteNumero(S: String): Boolean;
procedure Conectar;
procedure Desconectar;
function fnIdentificacaoExiste(Identificacao: String): Boolean;
function fnFazendaExiste(NomeFazenda: String): Boolean;
procedure ExecutaSQL(comandoSQL: String);
function ExecutaCountSQL(comandoSQL: String): Integer;
procedure GerarPDF(QuickRep: TQuickRep; ANomeArq: String);

implementation

function SomenteNumero(S: String): Boolean;
var
  i: integer;
begin
  Result := True;

  if trim(s) = '' then
  begin
    Result := False;
    Exit;
  end;

  S := trim(S);
  for i := 1 to Length(S) do
  begin
    ;
    if not (S[i] in ['0'..'9']) then
    begin
      Result := False;
      Exit;
    end;
  end;
end;

procedure Conectar;
var
  Arqini: TIniFile;
  LocalBanco, NomeBanco, Usuario, Senha: String;
begin
  ArqIni := TIniFile.Create(ExtractFilePath(Application.ExeName) + '\config.ini');
  LocalBanco := ArqIni.ReadString('BANCO', 'Local', '#');
  NomeBanco := ArqIni.ReadString('BANCO', 'Nome', '#');
  Usuario := ArqIni.ReadString('BANCO', 'Usuario', '#');
  Senha := ArqIni.ReadString('BANCO', 'Senha', '#');
  ArqIni.Free;

  if (LocalBanco = '#') or (NomeBanco = '#') or
    (Usuario = '#') or (Senha = '#') then
  begin
    Application.MessageBox(pchar('Configuração de banco de dados incorreta no arquivo "config.ini"'),
                           pchar('Erro'), MB_ICONERROR + MB_OK);
    Application.Terminate;
  end;

  DM.IBDatabase.LoginPrompt := False;
  DM.IBDatabase.Params.Clear;
  DM.IBDatabase.Params.Add('user_name=' + Usuario);
  DM.IBDatabase.Params.Add('password=' + Senha);
  DM.IBDatabase.Connected := False;
  DM.IBDatabase.DatabaseName := LocalBanco + '\' + NomeBanco;;
  DM.IBDatabase.Connected := True;
end;

procedure Desconectar;
begin
  DM.IBDatabase.Connected := False;
end;

function fnIdentificacaoExiste(Identificacao: String): Boolean;
var
  comandoSQL: String;
  Cont: Integer;
begin
  comandoSQL := 'select count(*) from Animal where Identificacao = ' + QuotedStr(Identificacao);
  Cont := ExecutaCountSQL(comandoSQL);
  Result := (Cont > 0);
end;

function fnFazendaExiste(NomeFazenda: String): Boolean;
var
  comandoSQL: String;
  Cont: Integer;
begin
  comandoSQL := 'select count(*) from Fazenda where Nome = ' + QuotedStr(NomeFazenda);
  Cont := ExecutaCountSQL(comandoSQL);
  Result := (Cont > 0);
end;

procedure ExecutaSQL(comandoSQL: String);
begin
  DM.IBQuery.Active := False;
  DM.IBQuery.SQL.Clear;
  DM.IBQuery.SQL.Add(comandoSQL);
  DM.IBQuery.Active := True;
end;

function ExecutaCountSQL(comandoSQL: String): Integer;
begin
  DM.IBQuery.Active := False;
  DM.IBQuery.SQL.Clear;
  DM.IBQuery.SQL.Add(comandoSQL);
  DM.IBQuery.Active := True;
  Result := StrToIntDef(DM.IBQuery.Fields.Fields[0].AsString, -1);
end;

procedure GerarPDF(QuickRep: TQuickRep; ANomeArq: String);
var
  // variáveis necessárias para a geração do PDF
  lPDF: TPDFDocument;
  lMetaDados: TMetafile;
  lPosicionamento: TPDFCanvasRenderMetaFileTextPositioning;
  lPagina: integer;
begin
  // cria uma instância do documento PDF
  lPDF := TPDFDocument.Create(True, 0, False, nil);

  // inicializa a variável de metadados
  lMetaDados := nil;
  try
    // configura o tipo do papel
    lPDF.DefaultPaperSize := psA4;

    // configura o posicionamento dos caracteres
    lPosicionamento := tpKerningFromAveragePosition;

    // configura o layout de visualização do documento
    lPDF.Root.PageLayout := plOneColumn;

    // ajusta a orientação do documento, caso o relatório esteja em paisagem
    if QuickRep.Page.Orientation = poLandscape then
    begin
      lPDF.DefaultPageLandscape := True;
    end;

    // prepara o relatório
    QuickRep.Prepare;

    // carrega os metadados de cada página do relatório
    for lPagina := 1 to QuickRep.QRPrinter.PageCount do
    begin
      // adiciona uma nova página no documento
      lPDF.AddPage;

      // carrega os metadados da página
      lMetaDados := QuickRep.QRPrinter.PageList.GetPage(lPagina);

      // renderiza os metadados
      lPDF.Canvas.RenderMetaFile(lMetaDados, 1, 0, 0, 0, lPosicionamento);

      // limpa a variável de metadados
      lMetaDados := nil;
    end;

    // salva o arquivo
    lPDF.SaveToFile(ANomeArq);
  finally
    // libera as variáveis
    lMetaDados.Free;
    lPDF.Free;
  end;
end;

end.
