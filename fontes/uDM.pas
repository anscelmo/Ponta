unit uDM;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBTable, IBDatabase, IBQuery;

type
  TDM = class(TDataModule)
    IBDatabase: TIBDatabase;
    IBTransaction: TIBTransaction;
    tbFazenda: TIBTable;
    tbAnimal: TIBTable;
    tbFazendaIDFAZENDA: TIntegerField;
    tbFazendaNOME: TIBStringField;
    tbAnimalIDANIMAL: TIntegerField;
    tbAnimalIDENTIFICACAO: TIBStringField;
    tbAnimalCODFAZENDA: TIntegerField;
    IBQuery: TIBQuery;
    qPesqFazenda: TIBQuery;
    qPesqFazendaIDFAZENDA: TIntegerField;
    qPesqFazendaNOME: TIBStringField;
    dsFazenda: TDataSource;
    qPesqAnimal: TIBQuery;
    dsAnimal: TDataSource;
    qPesqAnimalIDANIMAL: TIntegerField;
    qPesqAnimalIDENTIFICACAO: TIBStringField;
    qPesqAnimalCODFAZENDA: TIntegerField;
    qPesqAnimalNOME: TIBStringField;
    qSelFazenda: TIBQuery;
    dsSelFazenda: TDataSource;
    qRelatorio: TIBQuery;
    qRelatorioIDANIMAL: TIntegerField;
    qRelatorioIDENTIFICACAO: TIBStringField;
    qRelatorioNOME: TIBStringField;
    qSelFazendaIDFAZENDA: TIntegerField;
    qSelFazendaNOME: TIBStringField;
    procedure tbFazendaAfterPost(DataSet: TDataSet);
    procedure tbAnimalAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.tbFazendaAfterPost(DataSet: TDataSet);
begin
  IBTransaction.CommitRetaining;
  tbFazenda.ApplyUpdates;
  tbFazenda.Refresh;
end;

procedure TDM.tbAnimalAfterPost(DataSet: TDataSet);
begin
  IBTransaction.CommitRetaining;
  tbAnimal.ApplyUpdates;
  tbAnimal.Refresh;
end;

end.
