unit uFmrLogin;

interface

uses
  //ANDROID
  {$IFDEF Android}
    FMX.Helpers.Android, Androidapi.JNI.JavaTypes, Androidapi.Helpers, Androidapi.JNI.Location, Androidapi.JNI.Provider,
    Androidapi.JNI.App, Androidapi.JNI.GraphicsContentViewText,  Androidapi.JNIBridge,  Androidapi.JNI.Os, Androidapi.JNI.Net,
  {$ENDIF}
  //FMX
    FMX.Types, FMX.Forms, FMX.Controls, FMX.Graphics, FMX.Objects,
    FMX.Layouts, FMX.Edit, FMX.StdCtrls, FMX.Controls.Presentation, System.Permissions,
  //SYSTEM
    System.Types, System.UITypes, System.Classes, System.Variants, System.JSON,
    System.SysUtils, System.Sensors, System.Sensors.Components, System.Threading,
  //FIREDAC
    FireDAC.Stan.Param, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
    FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
    FireDAC.DApt, FireDAC.Comp.Client, FireDAC.Comp.DataSet,
  //DATA
    Data.DB, Data.Bind.Components, Data.Bind.ObjectScope,
  //REST
    REST.Types, REST.Client, REST.Authenticator.Basic, System.DateUtils,
  //BOREAL
    uframeDialog, FMX.Effects, FMX.BiometricAuth;
type
  TfmrLogin = class(TForm)
  imgLogo: TImage;
  layUsuario: TLayout;
  rreUsuario: TRoundRect;
  edtUsuario: TEdit;
  styBook: TStyleBook;
  laySenha: TLayout;
  rreSenha: TRoundRect;
  edtSenha: TEdit;
  layConectar: TLayout;
  rreConectar: TRoundRect;
  labConectar: TLabel;
  imgUsuario: TImage;
  imgSenha: TImage;
  recRodape: TRectangle;
  labBorealDesenvolvimentos: TLabel;
  RESTClientLogin: TRESTClient;
  reqLogin: TRESTRequest;
  imgExibirSenha: TImage;
  rreSenhaVisivel: TRoundRect;
  layCamposLogin: TLayout;
  labVersao: TLabel;
    imgCaminhao: TImage;
  qry: TFDQuery;
  imgLoading: TImage;
  Animacao: TAniIndicator;
  Rectangle1: TRectangle;
  Label1: TLabel;
  labAguarde: TLabel;
  RESTClientSQL: TRESTClient;
  RESTRequestSQL: TRESTRequest;
  recLigarGPS: TRectangle;
  Label2: TLabel;
  Button1: TButton;
  msg: Tmsg;
  Button2: TButton;
    recRedefinirSenha: TRectangle;
    rreConfirmar: TRoundRect;
    labConfirmarNovaSenha: TLabel;
    edtNovaSenha: TEdit;
    rreNovaSenha: TRoundRect;
    imgVisualizarNovaSenha: TImage;
    rreConfirmarNovaSenha: TRoundRect;
    imgVisualizarConfirmacao: TImage;
    edtConfirmarSenha: TEdit;
    RoundRect5: TRoundRect;
    RoundRect2: TRoundRect;
    Label3: TLabel;
    bauLogin: TBiometricAuth;
  procedure SetStatusBarColorBoreal;
  procedure imgExibirSenhaClick(Sender: TObject);
  procedure rreConectarMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
  procedure rreConectarClick(Sender: TObject);
  procedure rreConectarMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
  procedure rreConectarMouseLeave(Sender: TObject);
  procedure FormVirtualKeyboardShown(Sender: TObject; KeyboardVisible: Boolean; const Bounds: TRect);
  procedure FormVirtualKeyboardHidden(Sender: TObject; KeyboardVisible: Boolean; const Bounds: TRect);
  procedure Carregar(Sim: Boolean);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  procedure Button1Click(Sender: TObject);
  procedure Button2Click(Sender: TObject);
  procedure imgVisualizarConfirmacaoClick(Sender: TObject);
  procedure imgVisualizarNovaSenhaClick(Sender: TObject);
  procedure rreConfirmarMouseDown(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Single);
  procedure rreConfirmarMouseLeave(Sender: TObject);
  procedure rreConfirmarMouseUp(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Single);
  procedure rreConfirmarClick(Sender: TObject);
  procedure bauLoginAuthenticateFail(Sender: TObject;
    const FailReason: TBiometricFailReason; const ResultMessage: string);
  procedure bauLoginAuthenticateSuccess(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
private
  procedure ValidarLogin(UsuarioValido: Boolean);
end;

var

  fmrLogin: TfmrLogin;

implementation

  {$R *.fmx}
  {$R *.XLgXhdpiTb.fmx ANDROID}
  {$R *.SmXhdpiPh.fmx ANDROID}
  {$R *.NmXhdpiPh.fmx ANDROID}
  {$R *.LgXhdpiPh.fmx ANDROID}
  {$R *.LgXhdpiTb.fmx ANDROID}
  {$R *.iPad.fmx IOS}
  {$R *.iPhone.fmx IOS}
  {$R *.iPhone4in.fmx IOS}
  {$R *.iPhone47in.fmx IOS}
  {$R *.iPhone55in.fmx IOS}

uses uFmrPrincipal, uFmrDM;

function SenhaSegura(const cSenha:String):Boolean;
function SoLetras(s:string):boolean;
const
 c :Array [1..10]  of char  = ('0','1','2','3','4','5','6','7','8','9');
var
 idx:integer;
begin    //tem letras
result:=true;
for idx:=1 to length(c) do
  if pos(c[idx],s)>0 then
     begin
       result:=false;
       Break;
     end;
 end;
Const
cCharMin=6;
var
n:Int64;
begin
result:=(length(cSenha) = cCharMin)and(not TryStrToInt64(cSenha,n))and(not SoLetras(cSenha));
end;

procedure TfmrLogin.bauLoginAuthenticateFail(Sender: TObject;
  const FailReason: TBiometricFailReason; const ResultMessage: string);
begin
  Carregar(False);
  msg.Aviso('Falha ao autenticar', 'Tente novamente')
end;

procedure TfmrLogin.bauLoginAuthenticateSuccess(Sender: TObject);
begin
  ValidarLogin(true);
end;

procedure TfmrLogin.Button1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfmrLogin.Button2Click(Sender: TObject);
  {$IFDEF Android}
  var
    URL: string;
    Intent: JIntent;
  {$ENDIF}
begin
  {$IFDEF Android}
    URL := 'https://youtu.be/WRI193jIkKg';
    Intent := TJIntent.JavaClass.init(TJIntent.JavaClass.ACTION_VIEW,
        TJnet_Uri.JavaClass.parse(StringToJString(URL)));
    SharedActivity.startActivity(Intent);
  {$ENDIF}
end;

procedure TfmrLogin.Carregar(Sim: Boolean);
begin
  if Sim then
  begin
    layCamposLogin.Visible:= False;
    Animacao.Visible:= True;
    Animacao.Enabled:= True;
  end
  else
  begin
    layCamposLogin.Visible:= True;
    Animacao.Visible:= False;
    Animacao.Enabled:= False;
    rreConectar.Tag:= 1;
  end;
end;

procedure TfmrLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= TCloseAction.caFree;
end;

procedure TfmrLogin.FormCreate(Sender: TObject);
{$IFDEF Android}
  var
    Versao: JPackageInfo;
{$ENDIF}
begin
  Carregar(False);
  try
    recRedefinirSenha.Visible := False;
    dmoAPP.Logado := False;

  if fmrLogin.Tag <> 99 then
  begin
    TTask.Run(procedure
    begin
      try
        dmoApp.Conn.Connected := True;
        with qry do
        begin
          try
            Close;
            SQL.Text := 'SELECT veiPlaca FROM Veiculo LIMIT 1';
            Open;
          except
            Close;
            SQL.Text := 'CREATE TABLE Veiculo (veiPlaca VARCHAR(32))';
            ExecSQL;
          end;

          try
            Close;
            SQL.Text := 'SELECT ejoBatePonto FROM EventosJornada LIMIT 1';
            Open;
          except
            Close;
            SQL.Text := 'ALTER TABLE EventosJornada ADD ejoBatePonto BOOLEAN';
            ExecSQL;
            SQL.Text := 'ALTER TABLE EventosJornada ADD ejoAplicativo BOOLEAN';
            ExecSQL;
          end;

          try
            Close;
            SQL.Text := 'SELECT jorObs FROM Jornada LIMIT 1';
            Open;
          except
            Close;
            SQL.Text := 'ALTER TABLE Jornada ADD jorObs BOOLEAN';
            ExecSQL;
            SQL.Text := 'ALTER TABLE Jornada ADD jorObservacao2 VARCHAR(356)';
            ExecSQL;
            SQL.Text := 'UPDATE Jornada SET jorObservacao2 = jorObservacao';
            ExecSQL;
            SQL.Text := 'ALTER TABLE Jornada DROP jorObservacao';
            ExecSQL;
            SQL.Text := 'ALTER TABLE Jornada ADD jorObservacao VARCHAR(356)';
            ExecSQL;
            SQL.Text := 'UPDATE Jornada SET jorObservacao = jorObservacao2';
            ExecSQL;
            SQL.Text := 'ALTER TABLE Jornada DROP jorObservacao2';
            ExecSQL;
          end;

          Close;
          SQL.Text := 'SELECT * FROM Usuario LIMIT 1';
          Open;

          if RecordCount > 0 then
          begin
            TThread.Queue(nil, procedure
            begin
              edtUsuario.Text := FieldByName('usuLogin').AsString;
              edtSenha.Text := FieldByName('usuSenha').AsString;
              dmoApp.usuLogin := FieldByName('usuLogin').AsString;
              dmoApp.usuSenha := FieldByName('usuSenha').AsString;
              dmoAPP.usuSenhaAnt := dmoAPP.usuSenha;
              dmoApp.usuNome := FieldByName('usuNome').AsString;
              dmoApp.usuBancoDeDados := FieldByName('usuBancoDeDados').AsString;
              dmoApp.funCod := FieldByName('usuFuncionario').Value;
            end);
          end;
        end;
      except
      end;
    end);
  end;
  finally
  end;

  {$IFDEF Android}
    TTask.Run(procedure
    begin
      Versao := SharedActivity.getPackageManager.getPackageInfo(SharedActivity.getPackageName, 0);
      TThread.Queue(nil, procedure
      begin
        labVersao.Text := 'Versão ' + JStringToString(Versao.versionName);
        dmoAPP.VersaoAPP := JStringToString(Versao.versionName);
      end);
    end);
  {$ENDIF}
  {$IFDEF IOS}
    labVersao.Text := '532';
    dmoAPP.VersaoAPP := labVersao.Text;
  {$ENDIF}
end;

procedure TfmrLogin.FormShow(Sender: TObject);
begin
  SetStatusBarColorBoreal;
end;

procedure TfmrLogin.FormVirtualKeyboardHidden(Sender: TObject;
  KeyboardVisible: Boolean; const Bounds: TRect);
begin
  //REPOSICIONAR CAMPOS NO CENTRO DA TELA AO ESCONDER O TECLADO
  layCamposLogin.Align:= TalignLayout.Fit;
end;

procedure TfmrLogin.FormVirtualKeyboardShown(Sender: TObject;
  KeyboardVisible: Boolean; const Bounds: TRect);
begin
  //POSICIONAR CAMPOS NO TOPO DA TELA AO EXIBIR O TECLADO
  layCamposLogin.Align := TalignLayout.Top;
end;

procedure TfmrLogin.imgExibirSenhaClick(Sender: TObject);
begin
  //ESCONDER OU EXIBIR A SENHA
  edtSenha.Password:= not edtSenha.Password;
end;

procedure TfmrLogin.imgVisualizarConfirmacaoClick(Sender: TObject);
begin
  //ESCONDER OU EXIBIR A SENHA
  edtConfirmarSenha.Password:= not edtConfirmarSenha.Password;
end;

procedure TfmrLogin.imgVisualizarNovaSenhaClick(Sender: TObject);
begin
  //ESCONDER OU EXIBIR A SENHA
  edtNovaSenha.Password:= not edtNovaSenha.Password;
end;

procedure TfmrLogin.rreConectarMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  TRoundRect(Sender).Opacity:= 0.3;
end;

procedure TfmrLogin.rreConectarMouseLeave(Sender: TObject);
begin
  TRoundRect(Sender).Opacity:= 0.6;
end;

procedure TfmrLogin.rreConectarClick(Sender: TObject);
begin
  if rreConectar.Tag <> 2 then
  begin
    dmoAPP.vPrimeiroLogin:= False;
    rreConectar.Tag:= 2;
    Carregar(True);
    //Gravar usuário e senha na classe <Usuario> (Sem espaços)
    dmoApp.usuLogin:= StringReplace(edtUsuario.Text, ' ', '', [rfReplaceAll]);
    dmoApp.usuSenha:= StringReplace(edtSenha.Text, ' ', '', [rfReplaceAll]);
    dmoAPP.usuSenhaAnt:= dmoAPP.usuSenha;
    //Validar login e senha
    with qry do
    begin
      //Verificar se usuário e senha estão salvos no telefone
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM Usuario');
      SQL.Add('WHERE usuLogin = :pUsuLogin');
      SQL.Add('AND usuSenha = :pUsuSenha');
      ParamByName('pUsuLogin').Text:= trim(dmoApp.usuLogin);
      ParamByName('pUsuSenha').Text:= trim(dmoApp.usuSenha);
      Open;
      if RecordCount > 0 then
        ValidarLogin(True)
      else
        ValidarLogin(False);
    end;
  end;
end;

procedure TfmrLogin.rreConectarMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  TRoundRect(Sender).Opacity:= 0.6;
end;

procedure TfmrLogin.rreConfirmarClick(Sender: TObject);
begin
  if not SenhaSegura(edtNovaSenha.Text) then
  begin
    msg.Aviso('Senha inválida', 'A sua nova senha precisa conter 6 caracteres, com letras e numeros.');
  end
  else if edtNovaSenha.Text <> edtConfirmarSenha.Text then
  begin
    msg.Aviso('Senha inválida', 'As senhas tem que ser iguais');
  end
  else
  begin
    // Enviar senha apenas uma vez para bancos específicos
    try
      ReqLogin.Resource := 'EnviarSenha';
      ReqLogin.Params.Clear;
      ReqLogin.AddParameter('usuBancoDeDados', dmoAPP.usuBancoDeDados);
      ReqLogin.AddParameter('funCod', IntToStr(dmoAPP.funCod));
      ReqLogin.AddParameter('usuSenha', edtNovaSenha.Text);
      ReqLogin.Execute;
      qry.Close;
      qry.SQL.Clear;
      qry.SQL.Add('UPDATE Usuario SET usuSenha = :pUsuSenha, usuNovaSenhaDefinida = TRUE');
      qry.ParamByName('pUsuSenha').Text:= edtNovaSenha.Text;
      qry.ExecSQL;
    except
      msg.Aviso('Aviso', 'Não conseguimos redefinir sua senha por falta de conexão com a internet. Mas fique tranquilo: na próxima vez que você acessar o app, vamos tentar novamente.')
    end;
    dmoApp.usuSenha:= edtNovaSenha.Text;
    layCamposLogin.Visible:= True;
    recRedefinirSenha.Visible:= False;
    edtSenha.Text:= edtNovaSenha.Text;
    edtNovaSenha.Text:= '';
    edtConfirmarSenha.Text:= '';
    fmrPrincipal:= TfmrPrincipal.Create(Application);
    Application.MainForm:= fmrPrincipal;
    fmrPrincipal.Show;
    self.Close;
  end;
end;

procedure TfmrLogin.rreConfirmarMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  TRoundRect(Sender).Opacity:= 0.3;
end;

procedure TfmrLogin.rreConfirmarMouseLeave(Sender: TObject);
begin
  TRoundRect(Sender).Opacity:= 0.6;
end;

procedure TfmrLogin.rreConfirmarMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  TRoundRect(Sender).Opacity:= 0.6;
end;

procedure TfmrLogin.SetStatusBarColorBoreal;
{$IFDEF ANDROID}
var
  Window: JWindow;
  AndroidColor: Integer;
{$ENDIF}
begin
  {$IFDEF ANDROID}
  // Cor #FF150B36 em formato ARGB Integer
  AndroidColor := $FF150B36;

  // Configurações obrigatórias
  Window := TAndroidHelper.Activity.getWindow;
  Window.clearFlags(TJWindowManager_LayoutParams.JavaClass.FLAG_TRANSLUCENT_STATUS);
  Window.addFlags(TJWindowManager_LayoutParams.JavaClass.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
  Window.setStatusBarColor(AndroidColor);
  {$ENDIF}
end;

//PRIVATE
procedure TfmrLogin.ValidarLogin(UsuarioValido: Boolean);
begin
  TThread.CreateAnonymousThread(
  procedure()
  var
    JsonObjUsuario, jsonObj, jsonRecord: TJsonObject;
    jsonUsuario, CodigoUsuario, json: String;
    jsonArray: TJSONArray;
    i: Integer;
  begin
    //Validar se usuário digitou o usuário
    if trim(dmoApp.usuLogin) = '' then
    begin
      TThread.Synchronize(TThread.CurrentThread,
      procedure()
      begin
        msg.Aviso('Usuário inválido', 'Informe seu usuário.');
        Carregar(False);
      end);
      exit;
    end;
    //Validar se usuário digitou a senha
    if trim(dmoApp.usuSenha) = '' then
    begin
      TThread.Synchronize(TThread.CurrentThread,
      procedure()
      begin
        msg.Aviso('Senha inválida', 'Informe sua senha.');
        Carregar(False);
      end);
      exit;
    end;
    with qry do
    begin
      //PRIMEIRO ACESSO OU TROCA DE USUÁRIO OU SENHA
      if not UsuarioValido then
      begin
        dmoAPP.vPrimeiroLogin:= True;
        //VALIDAR CONEXÃO COM A INTERNET
        if not dmoAPP.ChecarConexao then
        begin
          TThread.Synchronize(TThread.CurrentThread,
          procedure()
          begin
            msg.Aviso('Falha de Conexão', 'No primeiro acesso e ao trocar de senha, você deve estar conectado à internet.');
            Carregar(False);
          end);
          Exit;
        end;
        //ENVIAR USUÁRIO E SENHA PARA A API DA BOREAL
        try
          reqLogin.Params.Clear;
          reqLogin.AddParameter('usuLogin', dmoApp.usuLogin);
          reqLogin.AddParameter('usuSenha', dmoApp.usuSenha);
          reqLogin.Execute;
        except
          TThread.Synchronize(TThread.CurrentThread,
          procedure()
          begin
            msg.Aviso('Falha de Conexão', 'Verifique sua conexão com a internet e tente novamente.');
            Carregar(False);
          end);
          Exit;
        end;
        jsonUsuario:= reqLogin.Response.JSONValue.ToString;
        jsonObjUsuario:= TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(jsonUsuario),0) as TJsonObject;
        CodigoUsuario:= copy(jsonUsuario, 12, 1);
        //CASO USUÁRIO SEJA VALIDADO PELA API
        if CodigoUsuario = '1' then
        begin
          try
            //LIMPAR TODAS AS TABELAS
            Close;
            SQL.Clear;
            SQL.Add('DELETE FROM Usuario');
            ExecSQL;
            try
              Close;
              SQL.Clear;
              SQL.Add('SELECT 1 FROM sqlite_master WHERE type = ''table'' AND name = ''Veiculo''');
              Open;
              if not Eof then
              begin
                Close;
                SQL.Clear;
                SQL.Add('DELETE FROM Veiculo');
                ExecSQL;
              end;
            except
            end;
            Close;
            SQL.Clear;
            SQL.Add('DELETE FROM Jornada WHERE jorSincronizado');
            ExecSQL;
            Close;
            SQL.Clear;
            SQL.Add('DELETE FROM EventosJornada');
            ExecSQL;
            Close;
            SQL.Clear;
            SQL.Add('DELETE FROM Funcionario');
            ExecSQL;
            Close;
            SQL.Clear;
            SQL.Add('DELETE FROM Chat');
            ExecSQL;
            //POPULAR TABELAS COM NOVOS DADOS
            Close;
            SQL.Clear;
            SQL.Add('INSERT INTO USUARIO');
            SQL.Add('(usuLogin, usuSenha, usuNome, usuBancoDeDados, usuFuncionario)');
            SQL.Add('VALUES(:PusuLogin, :PusuSenha, :PusuNome , :PusuBancoDeDados, :PusuFuncionario)');
            ParamByName('PusuLogin').Text:= jsonObjUsuario.GetValue('usuLogin').Value;
            ParamByName('PusuSenha').Text:= jsonObjUsuario.GetValue('usuSenha').Value;
            ParamByName('PusuNome').Text:= jsonObjUsuario.GetValue('usuNome').Value;
            ParamByName('PusuBancoDeDados').Text:= jsonObjUsuario.GetValue('usuBancoDeDados').Value;
            ParamByName('PusuFuncionario').Text:= jsonObjUsuario.GetValue('usuFuncionario').Value;
            ExecSQL;
            Close;
            SQL.Clear;
            SQL.Add('INSERT INTO Funcionario');
            SQL.Add('(funCod, funNome, funCPF, funAtivo, carDescricao, filDescricao, filRazaoSocial, filCNPJ, filInscricaoEstadual)');
            SQL.Add('VALUES(:PfunCod, :PfunNome, :PfunCPF, :PfunAtivo, :PcarDescricao, :PfilDescricao, :PfilRazaoSocial, :PfilCNPJ, :PfilInscricaoEstadual)');
            ParamByName('PfunCod').Value:= StrToInt(jsonObjUsuario.GetValue('funCod').Value);
            ParamByName('PfunNome').Text:= jsonObjUsuario.GetValue('funNome').Value;
            ParamByName('PfunCPF').Text:= jsonObjUsuario.GetValue('funCPF').Value;
            ParamByName('PfunAtivo').Value:= StrToBool(jsonObjUsuario.GetValue('funAtivo').Value);
            ParamByName('PcarDescricao').Text:= jsonObjUsuario.GetValue('carDescricao').Value;
            ParamByName('PfilDescricao').Text:= jsonObjUsuario.GetValue('filDescricao').Value;
            ParamByName('PfilRazaoSocial').Text:= jsonObjUsuario.GetValue('filRazaoSocial').Value;
            ParamByName('PfilCNPJ').Text:= jsonObjUsuario.GetValue('filCNPJ').Value;
            ParamByName('PfilInscricaoEstadual').Text:= jsonObjUsuario.GetValue('filInscricaoEstadual').Value;
            execSQL;
            dmoApp.usuLogin:= jsonObjUsuario.GetValue('usuLogin').Value;
            dmoApp.usuSenha:= jsonObjUsuario.GetValue('usuSenha').Value;
            dmoAPP.usuSenhaAnt:= dmoAPP.usuSenha;
            dmoApp.usuNome:= jsonObjUsuario.GetValue('usuNome').Value;
            dmoApp.usuBancoDeDados:= jsonObjUsuario.GetValue('usuBancoDeDados').Value;
            dmoApp.funCod:= StrToInt(jsonObjUsuario.GetValue('usuFuncionario').Value);
            dmoApp.usuCPF:= jsonObjUsuario.GetValue('funCPF').Value;
            dmoAPP.carDescricao:= jsonObjUsuario.GetValue('carDescricao').Value;
            dmoAPP.filDescricao:= jsonObjUsuario.GetValue('filDescricao').Value;
            dmoAPP.filRazaoSocial:= jsonObjUsuario.GetValue('filRazaoSocial').Value;
            dmoAPP.filCNPJ:= jsonObjUsuario.GetValue('filCNPJ').Value;
            dmoAPP.filInscricaoEstadual:= jsonObjUsuario.GetValue('filInscricaoEstadual').Value;
            dmoAPP.DeviceID:= dmoAPP.getDeviceID;
          finally
            try
              //CRIANDO O CAMPO usuNovaSenhaDefinida CASO AINDA NÃO EXISTA
              Close;
              SQL.Clear;
              SQL.Add('SELECT chaDataHora FROM Chat LIMIT 1');
              Open;
            except
              Close;
              SQL.Clear;
              SQL.Add('ALTER TABLE Chat ADD chaDataHora TIMESTAMP');
              ExecSQL;
            end;
            // AQUI DESENVOLVER CONFIGURAÇÕES DO APP
            //******************************
            //******************************
            //******************************
            if (dmoAPP.usuBancoDeDados = 'transpanorama') or
               (dmoAPP.usuBancoDeDados = 'transccema') or
               (dmoAPP.usuBancoDeDados = 'soldaterra') or
               (dmoAPP.usuBancoDeDados = 'gasometromadeiras') or
               (dmoAPP.usuBancoDeDados = 'WebDesenvolvimento') and not (dmoAPP.usuLogin = 'google') then
            begin
              try
                //CRIANDO O CAMPO usuNovaSenhaDefinida CASO AINDA NÃO EXISTA
                Close;
                SQL.Clear;
                SQL.Add('SELECT usuNovaSenhaDefinida FROM Usuario LIMIT 1');
                Open;
              except
                Close;
                SQL.Clear;
                SQL.Add('ALTER TABLE Usuario ADD usuNovaSenhaDefinida BOOLEAN DEFAULT FALSE');
                ExecSQL;
                Close;
                SQL.Clear;
                SQL.Add('ALTER TABLE Usuario ADD usuSenhaEnviada BOOLEAN DEFAULT FALSE');
                ExecSQL;
              end;
              TThread.Synchronize(TThread.CurrentThread,
              procedure
              begin
                recRedefinirSenha.Visible:= True;
                Carregar(False);
              end);
            end
            else
            begin
              TThread.Synchronize(TThread.CurrentThread,
              procedure()
              begin
                fmrPrincipal:= TfmrPrincipal.Create(Application);
                Application.MainForm:= fmrPrincipal;
                fmrPrincipal.Show;
                self.Close;
              end);
            end;
          end;
        end
        else
        begin
          TThread.Synchronize(TThread.CurrentThread,
          procedure()
          begin
            msg.Aviso('', 'Usuário e(ou) senha incorretos.');
            Carregar(False);
          end);
          exit;
        end;
      end
      //Usuário já cadastrado no telefone
      else
      begin
        try
          //Gravar dados na classe <Usuario>
          dmoApp.usuLogin:= FieldByName('usuLogin').Text;
          dmoApp.usuSenha:= FieldByName('usuSenha').Text;
          dmoAPP.usuSenhaAnt:= dmoAPP.usuSenha;
          dmoApp.usuNome:= FieldByName('usuNome').Text;
          dmoApp.usuBancoDeDados:= FieldByName('usuBancoDeDados').Text;
          dmoApp.funCod:= FieldByName('usuFuncionario').Value;
          Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM Funcionario');
          Open;
          if RecordCount > 0 then
          begin
            dmoAPP.usuCPF:= FieldByName('funCPF').Text;
            dmoAPP.carDescricao:= FieldByName('carDescricao').Text;
            dmoAPP.filDescricao:= FieldByName('filDescricao').Text;
            dmoAPP.filRazaoSocial:= FieldByName('filRazaoSocial').Text;
            dmoAPP.filCNPJ:= FieldByName('filCNPJ').Text;
            dmoAPP.filInscricaoEstadual:= FieldByName('filInscricaoEstadual').Text;
            dmoAPP.DeviceID:= dmoAPP.getDeviceID;
          end;
          //BUSCANDO ÚLTIMA MARCAÇÃO REALIZADA
          Close;
          SQL.Clear;
          SQL.Text:=
            'SELECT '+
                'jor.jorDataHora, '+
                'jor.ejoCod '+
            'FROM Jornada jor '+
            'WHERE '+
            ' NOT SUBSTR(jor.jorObservacao, 1, 5) LIKE '+ QuotedStr('placa') +
            ' AND funCod = :pFunCod OR '+
            ' jor.jorObservacao IS NULL ' +
            ' AND funCod = :pFunCod '+
            ' ORDER BY jor.jorDataHora DESC LIMIT 1';
          ParamByName('pFunCod').Value:= dmoApp.funCod;
          Open;
          if RecordCount > 0 then
          begin
            dmoApp.jorDataHora:= FieldByName('jorDataHora').Value;
            dmoApp.EjoCod:= FieldByName('ejoCod').Value;
            Close;
            SQL.Clear;
            SQL.Add('DELETE FROM Jornada WHERE jorSincronizado AND DATE(jorDataHora) <= DATE(''now'', ''-7 days'')');
            ExecSQL;
            if (dmoAPP.usuBancoDeDados = 'grupolta') then
            begin
              Close;
              SQL.Clear;
              SQL.Add('DELETE FROM Chat');
              ExecSQL;
            end
            else
            begin
              Close;
              SQL.Clear;
              SQL.Add('DELETE FROM Chat WHERE DATE(chaDataHora) <= DATE(''now'', ''-3 days'')');
              ExecSQL;
            end;
          end;
        finally
          try
            Close;
            SQL.Clear;
            SQL.Add('SELECT 1 FROM pragma_table_info(''Chat'') WHERE name = ''chaDataHora''');
            Open;
            if Eof then
            begin
              Close;
              SQL.Clear;
              SQL.Add('ALTER TABLE Chat ADD COLUMN chaDataHora TIMESTAMP');
              ExecSQL;
            end;
          except
          end;
          if (dmoAPP.usuBancoDeDados = 'transpanorama') or
             (dmoAPP.usuBancoDeDados = 'transccema') or
             (dmoAPP.usuBancoDeDados = 'soldaterra') or
             (dmoAPP.usuBancoDeDados = 'gasometromadeiras') or
             (dmoAPP.usuBancoDeDados = 'WebDesenvolvimento') and not (dmoAPP.usuLogin = 'google') then
          begin
            try
              // Verifica e adiciona o campo usuNovaSenhaDefinida
              Close;
              SQL.Clear;
              SQL.Add('SELECT 1 FROM pragma_table_info(''Usuario'') WHERE name = ''usuNovaSenhaDefinida''');
              Open;
              if Eof then
              begin
                Close;
                SQL.Clear;
                SQL.Add('ALTER TABLE Usuario ADD COLUMN usuNovaSenhaDefinida BOOLEAN DEFAULT FALSE');
                ExecSQL;
              end;
              // Verifica e adiciona o campo usuSenhaEnviada
              Close;
              SQL.Clear;
              SQL.Add('SELECT 1 FROM pragma_table_info(''Usuario'') WHERE name = ''usuSenhaEnviada''');
              Open;
              if Eof then
              begin
                Close;
                SQL.Clear;
                SQL.Add('ALTER TABLE Usuario ADD COLUMN usuSenhaEnviada BOOLEAN DEFAULT FALSE');
                ExecSQL;
              end;
              //CRIANDO O CAMPO usuNovaSenhaDefinida CASO AINDA NÃO EXISTA
              Close;
              SQL.Clear;
              SQL.Add('SELECT usuNovaSenhaDefinida FROM Usuario LIMIT 1');
              Open;
              if not FieldByName('usuNovaSenhaDefinida').Value then
              begin
                TThread.Synchronize(TThread.CurrentThread,
                procedure
                begin
                  recRedefinirSenha.Visible:= True;
                  Carregar(False);
                end);
              end
              else
              begin
                TThread.Synchronize(TThread.CurrentThread,
                procedure()
                begin
                  fmrPrincipal:= TfmrPrincipal.Create(Application);
                  Application.MainForm:= fmrPrincipal;
                  fmrPrincipal.Show;
                  self.Close;
                end);
              end;
            except
              TThread.Synchronize(TThread.CurrentThread,
              procedure
              begin
                recRedefinirSenha.Visible:= True;
                Carregar(False);
              end);
            end;
          end
          else
          begin
            TThread.Synchronize(TThread.CurrentThread,
            procedure()
            begin
              fmrPrincipal:= TfmrPrincipal.Create(Application);
              Application.MainForm:= fmrPrincipal;
              fmrPrincipal.Show;
              self.Close;
            end);
          end;
        end;
      end;
    end;
  end).Start;
end;

end.

