unit Q2.View.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  Vcl.Controls, Vcl.Forms, Q2.Model.Factory, Vcl.StdCtrls, System.Classes;

type
  TForm1 = class(TForm)
    memoColunas: TMemo;
    memoTabelas: TMemo;
    memoCondicoes: TMemo;
    memoSQL: TMemo;
    btnGerarSql: TButton;
    procedure btnGerarSqlClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnGerarSqlClick(Sender: TObject);
var
  Campos, Tabelas, Condicoes: String;
begin
  Campos    := EmptyStr;
  Tabelas   := EmptyStr;
  Condicoes := EmptyStr;

  Campos := TFactory.New
    .Colunas
      .ListaAdd(memoColunas.Lines)
      .GerarSql;

  Tabelas := TFactory.New
    .Tabelas
      .ListaAdd(memoTabelas.Lines)
      .GerarSql;

  Condicoes := TFactory.New
    .Condicoes
      .ListaAdd(memoCondicoes.Lines)
      .GerarSql;

  memoSQL.Text := ' SELECT ' + Campos + ' FROM ' + Tabelas + ' WHERE ' + Condicoes;
end;

end.
