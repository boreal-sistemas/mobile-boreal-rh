unit uUsuario;

interface

type
tUsuario = class
  private
    FusuLogin: String;
    FusuSenha: String;
    FusuNome: String;
    FusuBancoDeDados: String;
    FfunCod: Integer;
    FjorDataHora: TDateTime;
    FejoCod: Integer;
    FejoPernoite: Integer;
    procedure SetusuLogin(const Value: String);
    procedure SetusuSenha(const Value: String);
    procedure SetusuNome(const Value: String);
    procedure SetusuBancoDeDados(const Value: String);
    procedure SetFunCod(const Value: Integer);
    procedure SetJorDataHora(const Value: TDateTime);
    procedure SetEjoCod(const Value: Integer);
    procedure SetejoPernoite(const Value: Integer);
  public
    property usuLogin: String read FusuLogin write SetusuLogin;
    property usuSenha: String read FusuSenha write SetusuSenha;
    property usuNome: String read FusuNome write SetusuNome;
    property usuBancoDeDados: String read FusuBancoDeDados write SetusuBancoDeDados;
    property funCod: Integer read FfunCod write SetFunCod;
    property jorDataHora: TDateTime read FjorDataHora write SetJorDataHora;
    property ejoCod: Integer read FejoCod write SetEjoCod;
    property ejoPernoite: Integer read FejoPernoite write SetejoPernoite;
end;

Var
  Usuario: TUsuario;

implementation

{ TUsuario }

procedure tUsuario.SetEjoCod(const Value: Integer);
begin
  FejoCod := Value;
end;

procedure tUsuario.SetJorDataHora(const Value: TDateTime);
begin
  FjorDataHora := Value;
end;

procedure tUsuario.SetusuBancoDeDados(const Value: String);
begin
  FusuBancoDeDados := Value;
end;

procedure tUsuario.SetejoPernoite(const Value: Integer);
begin
  FejoPernoite := Value;
end;

procedure tUsuario.SetFunCod(const Value: Integer);
begin
  FfunCod := Value;
end;

procedure tUsuario.SetusuLogin(const Value: String);
begin
  FusuLogin := Value;
end;

procedure tUsuario.SetusuNome(const Value: String);
begin
  FusuNome := Value;
end;

procedure tUsuario.SetusuSenha(const Value: String);
begin
  FusuSenha := Value;
end;
end.
