unit uFmrPrincipal;

interface

uses
  //Proprietarias
    uNotificacao, FMX.DialogService,
  //iOS
  {$IFDEF IOS}
    Macapi.Helpers, iOSapi.Foundation, FMX.Helpers.iOS, IdURI,
  {$ENDIF}
  //ANDROID
  {$IFDEF Android}
    FMX.Helpers.Android, Androidapi.JNI.GraphicsContentViewText, Androidapi.Helpers,
    Androidapi.JNI.Telephony, Androidapi.JNI.JavaTypes,FMX.Platform.Android,
    Androidapi.JNI.Os, Androidapi.JNI.App, Androidapi.JNI.Net,
    Androidapi.JNI.Media, Androidapi.JNIBridge, Androidapi.JNI.Support, Androidapi.JNI.Provider, Androidapi.JNI.FileProvider,
  {$ENDIF}
  //FMX
    FMX.Platform,FMX.VirtualKeyboard, FMX.Types, FMX.Controls, FMX.Forms,
    FMX.Graphics, FMX.Objects, FMX.Layouts, FMX.Controls.Presentation,
    FMX.StdCtrls, FMX.TabControl, FMX.Edit, FMX.DateTimeCtrls,
  //SYSTEM
    System.IOUtils, System.SysUtils, System.Types, System.UITypes,  System.Classes,
    System.Variants, System.Sensors, System.Permissions, System.json, System.Sensors.Components,
    System.DateUtils, System.StrUtils, System.NetEncoding, System.Messaging, System.Generics.Collections, System.Hash,
  //FIREDAC
    FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.Comp.DataSet, FireDAC.Stan.Intf,
    FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
    FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  //DATA
    Data.DB, Data.Bind.Components, Data.Bind.ObjectScope,
  //REST
    REST.Types, REST.Client, REST.Authenticator.Basic, FMX.ListBox,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.TextLayout, uframeDialog, FMX.SearchBox, FMX.MediaLibrary,
  FMX.Media, System.Actions, FMX.ActnList, FMX.StdActns,
  FMX.MediaLibrary.Actions, UnicodeEmoji, FMX.Surfaces, DelphiZXingQRCode, IdUDPClient, IdGlobal;

type
  TfmrPrincipal = class(TForm)
  styBook: TStyleBook;
  Timer: TTimer;
  imgChat: TImage;
  recFooter: TRectangle;
  recHome: TRectangle;
  recHistorico: TRectangle;
  recDados: TRectangle;
  recChat: TRectangle;
  imgHome: TImage;
  imgHistorico: TImage;
  imgDados: TImage;
  recAguarde: TRectangle;
  qryJornada: TFDQuery;
  qryJornadajorSincronizado: TWideStringField;
  qryJornadajorDataHora: TWideStringField;
  qryJornadajorDiaSemana: TWideStringField;
  qryJornadaejoDescricao: TStringField;
  qryJornadajorTotal: TWideStringField;
  Animacao: TAniIndicator;
  recAjuste: TRectangle;
  imgAjuste: TImage;
  qryJornadajorObservacao: TStringField;
  recPrincipal: TRectangle;
  recData: TRectangle;
  labDataPorExtenso: TLabel;
  imgPlaca: TImage;
  recCabecalho: TRectangle;
  boreal1: TBrushObject;
  labOlaPessoa: TLabel;
    imgFundo: TImage;
  recConfirmar: TRectangle;
    imgConfirmar: TImage;
  TimerConfirmar: TTimer;
  qry: TFDQuery;
  RESTClientE: TRESTClient;
  RESTRequestE: TRESTRequest;
  tcoPrincipal: TTabControl;
  titHome: TTabItem;
  recEventosJornada: TRectangle;
  recPlaca: TRectangle;
  rreEditPlaca: TRoundRect;
  cboVeiPlaca: TEdit;
  rreCancelar: TRoundRect;
  labCancelar: TLabel;
  rrePlaca: TRoundRect;
  labPlaca: TLabel;
    labVerificar: TLabel;
  titHistorico: TTabItem;
  labHistoricoTitulo: TLabel;
  titDados: TTabItem;
  vsbMeusDados: TVertScrollBox;
  recFuncionario: TRectangle;
  recCarDescricao: TRectangle;
  labTitCargo: TLabel;
  labCarDescricao: TLabel;
  recFilCNPJ: TRectangle;
  labTitCNPJ: TLabel;
  labFilCNPJ: TLabel;
  recFilDescricao: TRectangle;
  labTitEmpresa: TLabel;
  labFilDescricao: TLabel;
  recFilInscricaoEstadual: TRectangle;
  labTitIncricaoEstadual: TLabel;
  labFilInscricaoEstadual: TLabel;
  recFilRazaoSocial: TRectangle;
  labTitRazaoSocial: TLabel;
  labFilRazaoSocial: TLabel;
  recFunCPF: TRectangle;
  labTitCPF: TLabel;
  labFunCPF: TLabel;
  recFunNome: TRectangle;
  labTitNome: TLabel;
  labFunNome: TLabel;
  titChat: TTabItem;
  labAdvertencia: TLabel;
  titAjuste: TTabItem;
  panDataHora: TRectangle;
  dedData: TDateEdit;
    labSelecionarData: TLabel;
    labSelecionarHora: TLabel;
  labEvento: TLabel;
  tedHora: TTimeEdit;
  btnCancelar: TRoundRect;
    labCancelarAjuste: TLabel;
  btnAjuste: TRoundRect;
  labBtnEnviarAjuste: TLabel;
  RESTClientM: TRESTClient;
  RESTRequestM: TRESTRequest;
    labConfirmar: TLabel;
  recFilIdentificao: TRectangle;
  labIdentificacaoTitulo: TLabel;
  labIdentificacao: TLabel;
  labEquipamento: TLabel;
  recLigarGPS: TRectangle;
    labGPSDesligado: TLabel;
    btnGPSLigado: TButton;
  lviHistorico: TListView;
  imghAjuste: TImage;
  imghEvento: TImage;
  imghPlaca: TImage;
  cboEquipamento: TComboBox;
  msg1: Tmsg;
    btnNaoSeiLigar: TButton;
  recAguardeReenviar: TRectangle;
  aniAguardeReenviar: TAniIndicator;
  labAguardeReenviar: TLabel;
  labVersao: TLabel;
  lviMensagem: TListView;
  Image1: TImage;
  Image2: TImage;
  Image4: TImage;
  imgMensagem: TImage;
    labContador: TLabel;
    recJornadaAjuste: TRectangle;
    rreAtualizarPlaca: TRoundRect;
    labAtualizarPlaca: TLabel;
    RESTRequestV: TRESTRequest;
    RESTClientV: TRESTClient;
    qryJornadajorDataHoraInicio: TDateTimeField;
    labSolicitarAjuste: TLabel;
    qryJornadaejoCod: TIntegerField;
    reAtualizarEventos: TRectangle;
    recAtualizarEventos: TRoundRect;
    labAtualizarLayout: TLabel;
    labMeusDados: TLabel;
    imgFoto: TImage;
    qryAuxiliar: TFDQuery;
    Label1: TLabel;
    ActionList: TActionList;
    ssaCompartilhar: TShowShareSheetAction;
    recSair: TRectangle;
    labSair: TLabel;
    labTextoSair: TLabel;
    recLimparCache: TRectangle;
    labLimparCache: TLabel;
    labTextoLimparCache: TLabel;
    recReenviarTodos: TRectangle;
    labReenviarTodosTitulo: TLabel;
    labReenviarTodosEventos: TLabel;
    rreSincronizar: TRoundRect;
    labSincronizar: TLabel;
  procedure FormCreate(Sender: TObject);
  procedure TimerTimer(Sender: TObject);
  procedure Clicar(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
  procedure EnviarEvento(Sender: TObject);
  procedure EnviarAjuste(Sender: TObject);
  procedure Soltar(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
  procedure SoltarMouseLeave(Sender: TObject);
  procedure FormResize(Sender: TObject);
  procedure btnCancelarClick(Sender: TObject);
  procedure imgPlacaMouseDown(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Single);
  procedure imgPlacaMouseLeave(Sender: TObject);
  procedure imgPlacaMouseUp(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Single);
  procedure rreCancelarClick(Sender: TObject);
  procedure rrePlacaClick(Sender: TObject);
  procedure TimerConfirmarTimer(Sender: TObject);
  procedure imgConfirmarClick(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  procedure btnGPSLigadoClick(Sender: TObject);
  procedure AddClienteListview(pEvento, pLinha1, pLinha2: string; imgH: TBitmap; tag1, tag2, tag3, tag4: String; Reenviar: Boolean);
  procedure AddMensagemListview(pEvento, pLinha1, pLinha2: string; imgH: TBitmap);
  procedure btnNaoSeiLigarClick(Sender: TObject);
  procedure tcoPrincipalChange(Sender: TObject);
  procedure btnAjusteClick(Sender: TObject);
    procedure sboPlacaFilter(Sender: TObject; const AFilter, AValue: string;
      var Accept: Boolean);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: WideChar;
      Shift: TShiftState);
    procedure lviHistoricoItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure lviHistoricoItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure recAtualizarEventosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lviHistoricoPullRefresh(Sender: TObject);
    procedure recSairClick(Sender: TObject);
    procedure recSairMouseLeave(Sender: TObject);
    procedure recSairMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure recSairMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure imgPlacaClick(Sender: TObject);
    procedure recHomeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure recHistoricoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure recDadosMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure recAjusteMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure recChatMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure recLimparCacheClick(Sender: TObject);
    procedure rreAtualizarPlacaClick(Sender: TObject);
    procedure recReenviarTodosClick(Sender: TObject);
    procedure rreSincronizarClick(Sender: TObject);
private
  PerguntarPlaca: Boolean;
  JaCarregouMensagens: Boolean;
  TimeOut: Integer;
  ThreadDuracaoRodando: Boolean;
  UltimaDuracaoTick: TDateTime;
  Evento, Linha1, Linha2, AbastecimentoViagem: String;
  ejoCod, ejoCodTemp: Integer;
  Cor: TAlphaColor;
  incAguardeReenviar: Integer;
  Duracao: Real;
  function ValidarGPSLigado: Boolean;
  function ValidarIntervaloEntreCliques: Boolean;
  function ValidarDuplicidadeEvento: Boolean;
  procedure PrepararLatitudeLongitude;
  function ValidarAplicativoPermitido(aCod: Integer): Boolean;
  function ValidarPlacaAntesDirecaoSerpa(aCod: Integer): Boolean;
  procedure ExecutarLogicaTranspanorama(aCod: Integer; aStr: String);
  procedure ExecutarLogicaRodobelo(aCod: Integer; aStr: String);
  procedure ExecutarLogicaOutrasEmpresas(aCod: Integer; aStr: String);
  procedure MarcarRegistroForcado(aTag: Integer; aTagString, msgChat: String);
  function MensagemConscientizacao(const detalhe: string): string;
  procedure ProcessarMarcacao;
  procedure SetStatusBarColorBoreal;
  procedure Carregar(Visivel: Boolean);
  procedure CarregarHistorico;
  procedure CarregarMensagens;
  function DataPorExtenso(dt: TDateTime): string;
  procedure ContarHorasJornada;
  procedure MarcarPonto(ejoDescricao: String); //MARCA O PONTO DIRETO, SEM MENSAGEM DE CONFIRMAÇÃO. (USAR PARA INCORFORMIDADES QUE JÁ POSSUEM MENSAGEM DE CONFIRMAÇÃO)
  procedure MarcarPlaca(Equipamento, Placa: String);
  procedure ListarEventos;
  procedure MensagemNova;
  function DuracaoJornada: Real;
  function EncodeBase64(Bitmap: TBitmap): string;
  procedure UltimoEvento;
  procedure ExportarComprovanteDeItemComoImagem(AItem: TListViewItem);
  function ObterHoraNTP(const Servidor: string = 'a.ntp.br'): TDateTime;
  function EnvioAutomaticoDePlaca: Boolean;
PUBLIC
  aTag: Integer;
  aTagString: String;
  qtdClique: Integer;
  ejoCodAnt: Integer;
  textoLegal: String;
  Obs: String;
  Pernoite, Refeicao, Direcao: Boolean;
end;

var
  fmrPrincipal: TfmrPrincipal;

implementation

{$R *.fmx}

uses uFmrDM, uFmrLogin;

procedure TfmrPrincipal.ProcessarMarcacao;
begin
  if (aTag = 5) or (aTag = 6) then
  begin
    with qry do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO Jornada');
      SQL.Add('(funCod, jorDataHora, ejoCod, jorObservacao, jorLatitude, jorLongitude, jorSincronizado)');
      SQL.Add('VALUES(:PfunCod, :PjorDataHora, :PejoCod, :PjorObservacao, :PjorLatitude, :PjorLongitude, :PjorSincronizado)');
      ParamByName('PfunCod').Value := dmoApp.funCod;
      ParamByName('PjorDataHora').Value := Now;
      ParamByName('PejoCod').Value := 1;
      ParamByName('PjorObservacao').Text := 'placa' + 'SEMPLAC';
      ParamByName('PjorLatitude').Text := 'n.a.';
      ParamByName('PjorLongitude').Text := 'n.a.';
      ParamByName('PjorSincronizado').Value := False;
      ExecSQL;
    end;
  end;

  if (aTag = 1) then
  begin
    msg1.Aviso('Aviso', 'Para marcar a Inicio de Jornada, você deve informar a placa do veículo.');
    qtdClique := 0;
    recPlaca.Visible := True;
    recEventosJornada.Visible := False;
    Exit;
  end;

  dmoApp.jorDataHora := Now;
  dmoApp.EjoCod := aTag;
  MarcarPonto(aTagString);
end;


function TfmrPrincipal.MensagemConscientizacao(const detalhe: string): string;
begin
  Result :=
    'Prezado ' + dmoAPP.usuNome + ',' + #13#10 +
    'Gostaríamos de chamar sua atenção para a importância do cumprimento das normas estabelecidas pela Lei 13.103/2015, artigo 235 A, B, C, D e seus respectivos parágrafos, que regula a jornada de trabalho dos motoristas profissionais. É fundamental que todos nós estejamos alinhados com essas diretrizes para garantir a segurança e o bem-estar de todos.' + #13#10 +
    'Contamos com sua colaboração para que possamos manter um ambiente de trabalho seguro e em conformidade com a legislação vigente. Se houver dúvidas ou se precisar de esclarecimentos adicionais, estamos à disposição para ajudar.' + #13#10 +
    'Detalhe da Ocorrencia:' + #13#10 +
    detalhe + #13#10 +
    'Na hipótese de Vossa Senhoria ter lançado uma informação errada, ou ter esquecido de efetuar algum lançamento, pedimos que faça imediatamente as retificações e lançamentos dentro do seu aplicativo.' + #13#10 +
    'Agradecemos sua compreensão e empenho.' + #13#10 +
    'Atenciosamente,' + #13#10 +
    '' + #13#10 +
    'Transpanorama Transporte S.A';
end;

procedure TfmrPrincipal.MarcarRegistroForcado(aTag: Integer; aTagString, msgChat: String);
begin
 if ((SameText(dmoAPP.usuBancoDeDados, 'serpa')) or
    (SameText(dmoAPP.usuBancoDeDados, 'transpanorama'))) and
    (aTag = 6) then
  begin
    with qry do
    begin
      Close;
      SQL.Text := 'INSERT INTO Jornada(funCod, jorDataHora, ejoCod, jorObservacao, jorLatitude, jorLongitude, jorSincronizado)' +
                  ' VALUES(:PfunCod, :PjorDataHora, :PejoCod, :PjorObservacao, :PjorLatitude, :PjorLongitude, :PjorSincronizado)';
      ParamByName('PfunCod').Value := dmoApp.funCod;
      ParamByName('PjorDataHora').Value := Now;
      ParamByName('PejoCod').Value := 1;
      ParamByName('PjorObservacao').Text := 'placaSEMPLAC';
      ParamByName('PjorLatitude').Text := 'n.a.';
      ParamByName('PjorLongitude').Text := 'n.a.';
      ParamByName('PjorSincronizado').Value := False;
      ExecSQL;
    end;
  end;

  dmoApp.jorDataHora := Now;
  dmoApp.EjoCod := aTag;
  MarcarPonto(aTagString);

  if msgChat <> '' then
  begin
    with qry do
    begin
      Close;
      SQL.Text := 'INSERT INTO Chat(chaMensagem, chaGestor, chaSincronizado, chaDataHora)' +
                  ' VALUES(:PchaMensagem, :PchaGestor, :PchaSincronizado, :PchaDataHora)';
      ParamByName('PchaMensagem').Text := msgChat;
      ParamByName('PchaGestor').Text := FormatDateTime('dd/mm/yyyy hh:nn:ss', Now) + ' - msg do sistema';
      ParamByName('PchaSincronizado').AsBoolean := True;
      ParamByName('PchaDataHora').Value := Now;
      ExecSQL;
    end;
  end;
end;


procedure TfmrPrincipal.ExecutarLogicaTranspanorama(aCod: Integer; aStr: String);
begin
  if (dmoAPP.usuBancoDeDados = 'transpanorama') or (dmoAPP.usuBancoDeDados = 'transpanoramahomologacao') then
  begin
    if Pernoite and ((now - dmoApp.jorDataHora) < StrToTime('11:00:00')) then
      msg1.AdvertenciaOpcaoTPComImput('Notificação de Conscientização', MensagemConscientizacao('INTERJORNADA MENOR QUE 11 HORAS'),
      procedure begin ProcessarMarcacao end)

    else if Direcao and ((now - dmoApp.jorDataHora) > StrToTime('05:30:00')) then
      msg1.AdvertenciaOpcaoTPComImput('Notificação de Conscientização', MensagemConscientizacao('DIREÇÃO ININTERRUPTA MAIOR QUE 5H30'),
      procedure begin ProcessarMarcacao end)

    else if (DuracaoJornada > 0.5) then
      msg1.AdvertenciaOpcaoTPComImput('Notificação de Conscientização', MensagemConscientizacao('JORNADA MAIOR QUE 12 HORAS'),
      procedure begin ProcessarMarcacao end)

    else if Refeicao and ((now - dmoApp.jorDataHora) < StrToTime('01:00')) then
      msg1.AdvertenciaOpcaoTPComImput('Notificação de Conscientização', MensagemConscientizacao('REFEIÇÃO MENOR QUE 1 HORA'),
      procedure begin ProcessarMarcacao end)

    else
      msg1.PerguntaComImput(aTagString, 'O registro fidedígno da jornada de trabalho é de sua responsabilidade ' + textoLegal + 'Você confirma a alteração do seu status atual para: ' + aTagString,
      procedure begin ProcessarMarcacao end);
  end;

end;

procedure TfmrPrincipal.ExecutarLogicaRodobelo(aCod: Integer; aStr: String);
begin
  if Pernoite and ((TDateTime(TTimeZone.Local.ToUniversalTime(Now) - StrToTime('04:00:00')) - dmoApp.jorDataHora) < StrToTime('11:00:00')) and not (UPPERCASE(TRIM(aTagString)) = 'ENTRADA') then
  begin
    msg1.AdvertenciaOpcaoComImput('Pernoite menor que 11 horas', 'Você não cumpriu 11 horas de pernoite. Para ignorar este aviso, clique em "Ciente", ou aguarde até às: ' +
      TimeToStr((StrToTime('11:00') - (Now - dmoApp.jorDataHora)) + TimeOf(Now)) + '?',
    procedure
    begin
      dmoApp.jorDataHora := TDateTime(TTimeZone.Local.ToUniversalTime(Now) - StrToTime('04:00:00'));
      dmoApp.EjoCod := aTag;
      MarcarPonto(aTagString);
      with qry do
      begin
        Close;
        SQL.Clear;
        SQL.Add('INSERT INTO Chat (chaMensagem, chaGestor, chaSincronizado, chaDataHora)');
        SQL.Add('VALUES(:PchaMensagem, :PchaGestor, :PchaSincronizado, :PchaDataHora)');
        ParamByName('PchaMensagem').Text := 'LEMBRETE - Pernoite menor que 11 horas';
        ParamByName('PchaGestor').Text := DateTimeToStr(Now) + ' - msg do sistema';
        ParamByName('PchaSincronizado').Value := True;
        ParamByName('PchaDataHora').Value := Now;
        ExecSQL;
      end;
    end);
  end
  else if Direcao and ((TDateTime(TTimeZone.Local.ToUniversalTime(Now) - StrToTime('04:00:00')) - dmoApp.jorDataHora) > StrToTime('05:30:00')) then
  begin
    msg1.AdvertenciaOpcaoComImput('Direção ininterrupta', 'Você ultrapassou o limite de 5h30 de direção. Caso tenha se esquecido de enviar alguma marcação de ponto, envie uma solicitação de ajuste',
    procedure
    begin
      dmoApp.jorDataHora := TDateTime(TTimeZone.Local.ToUniversalTime(Now) - StrToTime('04:00:00'));
      dmoApp.EjoCod := aTag;
      MarcarPonto(aTagString);
      with qry do
      begin
        Close;
        SQL.Clear;
        SQL.Add('INSERT INTO Chat (chaMensagem, chaGestor, chaSincronizado, chaDataHora)');
        SQL.Add('VALUES(:PchaMensagem, :PchaGestor, :PchaSincronizado, :PchaDataHora)');
        ParamByName('PchaMensagem').Text := 'LEMBRETE - Direção ininterrupta maior que 5h30';
        ParamByName('PchaGestor').Text := DateTimeToStr(Now) + ' - msg do sistema';
        ParamByName('PchaSincronizado').Value := True;
        ParamByName('PchaDataHora').Value := Now;
        ExecSQL;
      end;
    end);
  end
  else if Refeicao and ((TDateTime(TTimeZone.Local.ToUniversalTime(Now) - StrToTime('04:00:00')) - dmoApp.jorDataHora) < StrToTime('01:00')) then
  begin
    msg1.AdvertenciaOpcaoComImput('Refeição menor que 1 hora', 'Você não cumpriu 1 hora de refeição. Para ignorar este aviso, clique em "Ciente", ou aguarde até às: ' +
      TimeToStr((StrToTime('1:00') - (Now - dmoApp.jorDataHora)) + TimeOf(Now)) + '?',
    procedure
    begin
      dmoApp.jorDataHora := TDateTime(TTimeZone.Local.ToUniversalTime(Now) - StrToTime('04:00:00'));
      dmoApp.EjoCod := aTag;
      MarcarPonto(aTagString);
      with qry do
      begin
        Close;
        SQL.Clear;
        SQL.Add('INSERT INTO Chat (chaMensagem, chaGestor, chaSincronizado, chaDataHora)');
        SQL.Add('VALUES(:PchaMensagem, :PchaGestor, :PchaSincronizado, :PchaDataHora)');
        ParamByName('PchaMensagem').Text := 'LEMBRETE - Refeição menor que 1 hora';
        ParamByName('PchaGestor').Text := DateTimeToStr(Now) + ' - msg do sistema';
        ParamByName('PchaSincronizado').Value := True;
        ParamByName('PchaDataHora').Value := Now;
        ExecSQL;
      end;
    end);
  end
  else
  begin
    msg1.PerguntaComImput(aTagString, 'O registro fidedígno da jornada de trabalho é de sua responsabilidade ' +
      textoLegal + #13 +
      'Você confirma a alteração do seu status atual para: ' + aTagString,
    procedure
    begin
      dmoApp.jorDataHora := TDateTime(TTimeZone.Local.ToUniversalTime(Now) - StrToTime('04:00:00'));
      dmoApp.EjoCod := aTag;
      MarcarPonto(aTagString);
    end);
  end;
end;

procedure TfmrPrincipal.ExecutarLogicaOutrasEmpresas(aCod: Integer; aStr: String);
begin
  // PERNOITE MENOR QUE 11 HORAS
  if not (SameText(dmoAPP.usuBancoDeDados, 'transbirday') or
          SameText(dmoAPP.usuBancoDeDados, 'sigma') or
          SameText(dmoAPP.usuBancoDeDados, 'rmbtransportes')) and
     Pernoite and
     ((Now - dmoApp.jorDataHora) < StrToTime('11:00')) and
     not SameText(Trim(aTagString), 'ENTRADA') then
  begin
    msg1.AdvertenciaOpcaoComImput('Pernoite menor que 11 horas', 'Você não cumpriu 11 horas de pernoite. Para ignorar este aviso, clique em "Ciente", ou aguarde até às: ' +
      TimeToStr((StrToTime('11:00') - (Now - dmoApp.jorDataHora)) + TimeOf(Now)) + '?',
    procedure
    begin
      MarcarRegistroForcado(aTag, aTagString, 'LEMBRETE - Pernoite menor que 11 horas');
    end);
  end

  // DIREÇÃO ININTERRUPTA MAIOR QUE 5H30
  else if not (SameText(dmoAPP.usuBancoDeDados, 'sigma') or
               SameText(dmoAPP.usuBancoDeDados, 'rmbtransportes') or
               SameText(dmoAPP.usuBancoDeDados, 'gascidade')) and
          Direcao and
          ((Now - dmoApp.jorDataHora) > StrToTime('05:30')) then
  begin
    if SameText(dmoAPP.usuBancoDeDados, 'transkompa') then
      msg1.AdvertenciaOpcaoComImput('Alerta de Jornada', 'Você já está em jornada há mais de 6 horas sem marcar a refeição no app. Se ainda não parou pra comer, lembre-se de fazer isso assim que puder. Se já fez a parada, mas esqueceu de marcar, envie uma solicitação de ajuste.',
      procedure
      begin
        MarcarRegistroForcado(aTag, aTagString, 'LEMBRETE - Direção ininterrupta maior que 5h30');
      end)
    else
      msg1.AdvertenciaOpcaoComImput('Direção ininterrupta', 'Você ultrapassou o limite de 5h30 de direção. Caso tenha se esquecido de enviar alguma marcação de ponto, envie uma solicitação de ' +
        IfThen(SameText(dmoAPP.usuBancoDeDados, 'castelinho'), 'lançamento manual', 'Ajuste'),
      procedure
      begin
        MarcarRegistroForcado(aTag, aTagString, 'LEMBRETE - Direção ininterrupta maior que 5h30');
      end);
  end

  // JORNADA MAIOR QUE 12 HORAS
  else if not (SameText(dmoAPP.usuBancoDeDados, 'sigma') or
               SameText(dmoAPP.usuBancoDeDados, 'rmbtransportes')) and
          (DuracaoJornada > 0.5) then
  begin
    msg1.AdvertenciaOpcaoComImput('Jornada maior que 12 horas', 'Você ultrapassou o limite de 12h00 de jornada diária. Caso tenha se esquecido de enviar alguma marcação de ponto, envie uma solicitação de ' +
      IfThen(SameText(dmoAPP.usuBancoDeDados, 'castelinho'), 'lançamento manual', 'Ajuste'),
    procedure
    begin
      MarcarRegistroForcado(aTag, aTagString, 'LEMBRETE - Jornada maior que 12 horas');
    end);
  end

  // REFEIÇÃO MENOR QUE 1 HORA
  else if not (SameText(dmoAPP.usuBancoDeDados, 'sigma') or
               SameText(dmoAPP.usuBancoDeDados, 'rmbtransportes')) and
          Refeicao and
          ((Now - dmoApp.jorDataHora) < StrToTime('01:00')) then
  begin
    msg1.AdvertenciaOpcaoComImput('Refeição menor que 1 hora', 'Você não cumpriu 1 hora de refeição. Para ignorar este aviso, clique em "Ciente", ou aguarde até às: ' +
      TimeToStr((StrToTime('1:00') - (Now - dmoApp.jorDataHora)) + TimeOf(Now)) + '?',
    procedure
    begin
      MarcarRegistroForcado(aTag, aTagString, 'LEMBRETE - Refeição menor que 1 hora');
    end);
  end

  // NORMAL
  else
  begin
    if SameText(dmoAPP.usuBancoDeDados, 'sigma') then
      msg1.PerguntaComImput(aTagString, 'NÃO SE ESQUEÇA DE FAZER O SEU CHECKLIST. ' + #13 +
        '________________________________' + #13 +
        'O registro fidedígno da jornada de trabalho é de sua responsabilidade ' + textoLegal + #13 +
        'Você confirma a alteração do seu status atual para: ' + aTagString,
      procedure
      begin
        MarcarRegistroForcado(aTag, aTagString, '');
      end)
    else
      msg1.PerguntaComImput(aTagString, 'O registro fidedígno da jornada de trabalho é de sua responsabilidade ' + textoLegal + #13 +
        'Você confirma a alteração do seu status atual para: ' + aTagString,
      procedure
      begin
        MarcarRegistroForcado(aTag, aTagString, '');
      end);
  end;
end;


function TfmrPrincipal.ValidarGPSLigado: Boolean;
begin
  Result := True;
  try
    if (UpperCase(dmoAPP.LocationSensor.Sensor.Latitude.ToString) = 'NAN') and
       (dmoAPP.usuBancoDeDados = 'gasometromadeiras') then
    begin
      recLigarGPS.Visible := True;
      Result := False;
    end;
  except
    Result := True;
  end;
end;

function TfmrPrincipal.ValidarIntervaloEntreCliques: Boolean;
begin
  Result := True;
  if qtdClique < 2 then
  begin
    if (Now - dmoApp.jorDataHora <= StrToTime('00:01:00')) and (Now - dmoApp.jorDataHora > 0) then
    begin
      msg1.Aviso('Aguarde', 'Você deve esperar ao menos 1 minuto entre um status e outro');
      qtdClique := 0;
      Result := False;
    end
    else if (Trim(dmoAPP.usuBancoDeDados) = 'rodobelo') and
            ((TDateTime(TTimeZone.Local.ToUniversalTime(Now) - StrToTime('04:00:00')) - dmoApp.jorDataHora <= StrToTime('00:01:00'))) then
    begin
      msg1.Aviso('Aguarde', 'Você deve esperar ao menos 1 minuto entre um status e outro');
      qtdClique := 0;
      Result := False;
    end;
  end;
end;

function TfmrPrincipal.ValidarDuplicidadeEvento: Boolean;
begin
  Result := True;
  if aTag = dmoApp.ejoCod then
  begin
    if dmoAPP.usuBancoDeDados = 'castelinho' then
      msg1.Aviso('Duplicidade', 'Você já está em "' + aTagString + '". Se esqueceu de algum status anterior, utilize a tela de lançamento manual para solicitar a correção.')
    else
      msg1.Aviso('Duplicidade', 'Você já está em "' + aTagString + '". Se esqueceu de algum status anterior, utilize a tela de ajustes.');
    qtdClique := 0;
    Result := False;
  end;
end;

procedure TfmrPrincipal.PrepararLatitudeLongitude;
begin
  try
    if dmoAPP.LocationSensor.Active then
    begin
      dmoAPP.Latitude := dmoApp.LocationSensor.Sensor.Latitude;
      dmoAPP.Longitude := dmoApp.LocationSensor.Sensor.Longitude;
    end;
  except
    dmoAPP.Latitude := 0;
    dmoAPP.Longitude := 0;
  end;
end;

function TfmrPrincipal.ValidarAplicativoPermitido(aCod: Integer): Boolean;
begin
  Result := True;
  if dmoAPP.usuBancoDeDados = 'sigma' then
  begin
    with qry do
    begin
      Close;
      SQL.Text := 'SELECT ejoAplicativo FROM EventosJornada WHERE ejoCod = :pEjoCod LIMIT 1';
      ParamByName('pEjoCod').Value := aCod;
      Open;
      if not FieldByName('ejoAplicativo').AsBoolean then
      begin
        msg1.Aviso('Marque no Tablet', 'Esse evento está configurado para ser marcado apenas pelo tablet Bate Ponto');
        qtdClique := 0;
        Result := False;
      end;
    end;
  end;
end;

function TfmrPrincipal.ValidarPlacaAntesDirecaoSerpa(aCod: Integer): Boolean;
begin
  Result := True;
  if (dmoAPP.usuBancoDeDados = 'serpa') and (aCod = 1) then
  begin
    if Refeicao and ((Now - dmoApp.jorDataHora) < StrToTime('01:00')) then
    begin
      msg1.AdvertenciaOpcaoComImput('Refeição menor que 1 hora', 'Você não cumpriu 1 hora de refeição...',
        procedure
        begin
          msg1.Aviso('Aviso', 'Para marcar a direção, você deve informar a placa do veículo.');
          qtdClique := 0;
          recPlaca.Visible := True;
          recEventosJornada.Visible := False;
        end);
      Result := False;
    end
    else if Pernoite and ((Now - dmoApp.jorDataHora) < StrToTime('11:00:00')) then
    begin
      msg1.AdvertenciaOpcaoComImput('Pernoite menor que 11 horas', 'Você não cumpriu 11 horas de pernoite...',
        procedure
        begin
          msg1.Aviso('Aviso', 'Para marcar a direção, você deve informar a placa do veículo.');
          qtdClique := 0;
          recPlaca.Visible := True;
          recEventosJornada.Visible := False;
        end);
      Result := False;
    end
    else
    begin
      msg1.Aviso('Aviso', 'Para marcar a direção, você deve informar a placa do veículo.');
      qtdClique := 0;
      recPlaca.Visible := True;
      recEventosJornada.Visible := False;
      Result := False;
    end;
  end;
end;

function TfmrPrincipal.ObterHoraNTP(const Servidor: string = 'a.ntp.br'): TDateTime;
var
  UDP: TIdUDPClient;
  Enviado, Recebido: TIdBytes;
  SecondsSince1900, TimeUnix: Int64;
  HoraUTC: TDateTime;
begin
  Result := 0;
  UDP := TIdUDPClient.Create(nil);
  try
    UDP.Host := Servidor;
    UDP.Port := 123;
    UDP.ReceiveTimeout := 3000;

    SetLength(Enviado, 48);
    Enviado[0] := $1B; // pacote padrão NTP

    UDP.SendBuffer(Enviado);
    SetLength(Recebido, 48);
    UDP.ReceiveBuffer(Recebido, 48); // aqui está o segredo: especifica o tamanho esperado

    // Decodifica os segundos desde 1900
    SecondsSince1900 := (Int64(Recebido[40]) shl 24) +
                        (Int64(Recebido[41]) shl 16) +
                        (Int64(Recebido[42]) shl 8) +
                        Int64(Recebido[43]);

    TimeUnix := SecondsSince1900 - 2208988800; // de 1900 pra 1970

    HoraUTC := UnixToDateTime(TimeUnix, True); // True = UTC
    Result := HoraUTC - EncodeTime(3, 0, 0, 0); // Ajuste pra horário de Brasília (UTC-3)
  finally
    UDP.Free;
  end;
end;

function TfmrPrincipal.EncodeBase64(Bitmap: TBitmap): string;
var
  Input: TBytesStream;
  Output: TStringStream;
  Encoding: TBase64Encoding;
begin
  Input := TBytesStream.Create;
  try
    Bitmap.SaveToStream(Input);
    Input.Position := 0;
    Output := TStringStream.Create('', TEncoding.ASCII);
    try
      Encoding:= TBase64Encoding.Create(10,'');
      Encoding.Encode(Input, Output);
      Result:= Output.DataString;
    finally
      Encoding.Free;
      Output.Free;
    end;
  finally
    Input.Free;
  end;
end;

procedure TfmrPrincipal.Carregar(Visivel: Boolean);
begin
  recAguarde.Visible:= Visivel;
  Animacao.Enabled:= Visivel;
end;

function FormatarMoeda(valor: string): string;
var
  decimais, centena, milhar, milhoes, bilhoes, trilhoes, quadrilhoes: string;
  i: Integer;
begin
  Result := EmptyStr;

  for i := 0 to Length(valor) - 1 do
    if not(valor[i] in ['0' .. '9']) then
      delete(valor, i, 1);

  if copy(valor, 1, 1) = '0' then
    valor := copy(valor, 2, Length(valor));

  decimais := RightStr(valor, 2);
  centena := copy(RightStr(valor, 5), 1, 3);
  milhar := copy(RightStr(valor, 8), 1, 3);
  milhoes := copy(RightStr(valor, 11), 1, 3);
  bilhoes := copy(RightStr(valor, 14), 1, 3);
  trilhoes := copy(RightStr(valor, 17), 1, 3);
  quadrilhoes := LeftStr(valor, Length(valor) - 17);

  case Length(valor) of
    1:
      Result := '0,0' + valor;
    2:
      Result := '0,' + valor;
    6 .. 8:
      begin
        milhar := LeftStr(valor, Length(valor) - 5);
        Result := milhar + '.' + centena + ',' + decimais;
      end;
    9 .. 11:
      begin
        milhoes := LeftStr(valor, Length(valor) - 8);
        Result := milhoes + '.' + milhar + '.' + centena + ',' + decimais;
      end;
    12 .. 14:
      begin
        bilhoes := LeftStr(valor, Length(valor) - 11);
        Result := bilhoes + '.' + milhoes + '.' + milhar + '.' + centena + ',' + decimais;
      end;
    15 .. 17:
      begin
        trilhoes := LeftStr(valor, Length(valor) - 14);
        Result := trilhoes + '.' + bilhoes + '.' + milhoes + '.' + milhar + '.' + centena + ','
          + decimais;
      end;
    18 .. 20:
      begin
        quadrilhoes := LeftStr(valor, Length(valor) - 17);
        Result := quadrilhoes + '.' + trilhoes + '.' + bilhoes + '.' + milhoes + '.' + milhar + '.'
          + centena + ',' + decimais;
      end
  else
    Result := LeftStr(valor, Length(valor) - 2) + ',' + decimais;
  end;
end;

procedure TfmrPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= TCloseAction.caFree;
end;

procedure TfmrPrincipal.FormCreate(Sender: TObject);
Begin
  JaCarregouMensagens:= False;
  recLigarGPS.Visible:= False;
  if dmoAPP.usuBancoDeDados = 'castelinho' then
  begin
    labSolicitarAjuste.Text:= 'Solicitar Lançamento Manual';
    labBtnEnviarAjuste.Text:= 'Enviar Lançamento Manual'
  end;
  imgPlaca.Visible:= not EnvioAutomaticoDePlaca;
  rreAtualizarPlaca.Visible:= EnvioAutomaticoDePlaca;
  labEquipamento.Visible:= False;
  cboEquipamento.Visible:= False;
  labEquipamento.Position.Y:= 200;
  cboEquipamento.Position.Y:= 400;
  labEquipamento.Visible:= (dmoAPP.usuBancoDeDados = 'sigma');
  cboEquipamento.Visible:= (dmoAPP.usuBancoDeDados = 'sigma');
  rreSincronizar.Visible:= (dmoAPP.usuBancoDeDados = 'sigma');
  recAguarde.Visible:= True;
  Animacao.Enabled:= True;
  //CONFIGURANDO CONPONENTES VISIVEIS NA TELA
  qtdClique:= 0;
  tcoPrincipal.ActiveTab:= titHome;
  recConfirmar.Visible:= False;
  TimerConfirmar.Enabled:= False;
  recPlaca.Visible:= False;
  panDataHora.Visible:= False;
end;

procedure TfmrPrincipal.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: WideChar; Shift: TShiftState);
var
  FService : IFMXVirtualKeyboardService;
begin
  if not (tcoPrincipal.ActiveTab = titHome) and (Key = vkHardwareBack) then
  begin
    TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService, IInterface(FService));
    if (FService <> nil) and (TVirtualKeyboardState.Visible in FService.VirtualKeyBoardState) then
    begin
      //Fechar o teclado
    end
    else
    begin
      Key := 0;
      //Voltar para a tela inicial
      if recPlaca.Visible = True then
        recPlaca.Visible:= False;
      if recEventosJornada.Visible = False then
        recEventosJornada.Visible:= True;
      If not (tcoPrincipal.ActiveTab = titHome) then
      begin
        tcoPrincipal.ActiveTab:= titHome;
        recFooter.Visible:= True;
        recHome.Fill.Color:= $FF251264;
        recHistorico.Fill.Color:= $FF150B36;
        recDados.Fill.Color:= $FF150B36;
        recChat.Fill.Color:= $FF150B36;
        recAjuste.Fill.Color:= $FF150B36;
      end;
    end;
  end;
end;


procedure TfmrPrincipal.ContarHorasJornada;
begin
  TThread.CreateAnonymousThread(
  procedure()
  var
    DataHoraBanco, DataHoraBancoP, DataHoraP, AnoP, MesP, DiaP, HoraP: String;
  begin
    try
      Duracao:= 0;
      with qry do
      begin
        Close;
        SQL.Clear;
        SQL.Text:=
          'SELECT '+
          'jor.*, '+
          'COALESCE((SELECT MIN(sub.jorDataHora) FROM Jornada sub WHERE sub.funCod '+
          '= jor.funCod AND sub.jorDataHora > jor.jorDataHora AND not SUBSTR(sub.jorObservacao, 1, 5) like ' + QuotedStr('placa') + '), datetime(''now'', ''-3 hours'')) '+
          'AS jorDataHoraProximo, '+
          'ejo.ejoJornada, '+
          'ejo.ejoPernoite '+
          'FROM Jornada jor '+
          'INNER JOIN EventosJornada ejo ON (ejo.ejoCod = jor.ejoCod) '+
          'WHERE jor.jorDataHora > COALESCE((SELECT '+
          'MAX(sub.jorDataHora) '+
          'FROM Jornada sub '+
          'INNER JOIN EventosJornada ejo ON (ejo.ejoCod = sub.ejoCod) '+
          'WHERE sub.funCod = '+ IntToStr(dmoApp.funCod) + ' AND ejo.ejoPernoite), (SELECT DATE(''now'', ''-9 days''))) '+
          'AND not SUBSTR(jor.jorObservacao, 1, 5) like ' + QuotedStr('placa') + ' ' +
          'AND not SUBSTR(jor.jorObservacao, 1, 7) like ' + QuotedStr('#ajuste') + ' ' +
          'AND jor.funCod = '+ IntToStr(dmoApp.funCod);
        Open;
        First;
        while not eof do
        begin
          DataHoraBanco:= FieldByName('jorDataHora').Text;       //yyyy-mm-dd hh:mm:ss
          DataHoraBancoP:= FieldByName('jorDataHoraProximo').Text;       //yyyy-mm-dd hh:mm:ss
          AnoP:= copy(DataHoraBancoP, 1, 4);
          MesP:= copy(DataHoraBancoP, 6, 2);
          DiaP:= copy(DatahoraBancoP, 9, 2);
          HoraP:= copy(DataHoraBancoP, 12, 8);
          DataHoraP:= DiaP + '/' + MesP + '/' + AnoP + ' ' + HoraP;
          if FieldByName('ejoJornada').Value then
          begin
            Duracao:= Duracao + StrToDateTime(DataHoraP) - StrToDateTime(DataHoraBanco);
            dmoAPP.vJorTipo:= 1;
          end;
          if not FieldByName('ejoJornada').Value then
          begin
            dmoAPP.vJorTipo:= 2;
          end;
          if FieldByName('ejoPernoite').Value then
          begin
            dmoAPP.vJorTipo:= 3;
          end;
          next;
        end;
        Close;
      end;
    finally
      Timer.Enabled:= True;
    end;
  end).Start;
end;

procedure TfmrPrincipal.FormResize(Sender: TObject);
begin
  recHome.Width:= Round(recFooter.Width / 5);
  recHistorico.Width:= recHome.Width;
  recDados.Width:= recHome.Width;
  recChat.Width:= recHome.Width;
  recAjuste.Width:= recHome.Width;
end;

procedure TfmrPrincipal.FormShow(Sender: TObject);
begin
  try
    SetStatusBarColorBoreal;
    dmoAPP.Logado:= True;
    dmoAPP.AtualizaHistorico:= False;
    labDataPorExtenso.Text:= DataPorExtenso(Now);
    labVersao.Text:= dmoAPP.VersaoAPP;
    labOlaPessoa.Text:= dmoApp.usuNome;
    dmoAPP.DispositivoNaoAutorizado:= False;
  finally
    ListarEventos;
  end;
end;

procedure TfmrPrincipal.imgConfirmarClick(Sender: TObject);
begin
  TimerConfirmar.Tag:= 0;
  recConfirmar.Visible:= False;
  TimerConfirmar.Enabled:= False;
end;

procedure TfmrPrincipal.imgPlacaClick(Sender: TObject);
begin
  tcoPrincipal.ActiveTab:= titHome;
  recPlaca.Visible:= True;
  recEventosJornada.Visible:= False;
end;

procedure TfmrPrincipal.imgPlacaMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  imgPlaca.Opacity:= 0.6;
end;

procedure TfmrPrincipal.imgPlacaMouseLeave(Sender: TObject);
begin
  imgPlaca.Opacity:= 1;
end;

procedure TfmrPrincipal.imgPlacaMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
 imgPlaca.Opacity:= 1;
end;

procedure TfmrPrincipal.TimerConfirmarTimer(Sender: TObject);
Var
  Pernoite: Boolean;
begin
  Pernoite:= (dmoApp.ejoPernoite = ejoCodAnt) or (dmoApp.ejoPernoite2 = ejoCodAnt) ;
  TimerConfirmar.Tag:= TimerConfirmar.Tag + 1;
  labConfirmar.Text:= 'Ponto registrado!' + #13 +
    'Sincronizando com a empresa... Aguarde ' + IntToStr(8 - TimerConfirmar.Tag) + ' segundos';
  if TimerConfirmar.Tag = 8 then
  begin
    TimerConfirmar.Tag:= 0;
    recConfirmar.Visible:= False;
    TimerConfirmar.Enabled:= False;
    if
    Pernoite and
    not (dmoAPP.usuBancoDeDados = 'sigmaadm') and
    not (dmoAPP.usuBancoDeDados = 'transccema') and
    not (dmoAPP.usuBancoDeDados = 'serpa') and
    not (dmoAPP.usuBancoDeDados = 'transpanorama') and
    not (dmoAPP.usuBancoDeDados = 'transpanoramahomologacao') then
    if Pernoite and PerguntarPlaca and not (dmoAPP.usuBancoDeDados = 'sigmaadm') and not (dmoAPP.usuBancoDeDados = 'transccema') and not (dmoAPP.usuBancoDeDados = 'serpa') then
    begin
      if (dmoAPP.usuBancoDeDados = 'mrexpress') and (ejoCod >= 17) or not (dmoAPP.usuBancoDeDados = 'mrexpress') then
      begin
        msg1.Pergunta('Você trocou de veículo?', 'Informe a placa do seu veículo.',
        procedure
        begin
          imgPlaca.OnClick(imgPlaca) ;
        end);
      end;
    end;
  end;
end;

procedure TfmrPrincipal.TimerTimer(Sender: TObject);
var
  i: Integer;
  DataHora: TDateTime;
  Duracao: Real;
begin
  labDataPorExtenso.Text := DataPorExtenso(Now);

  if not recPlaca.Visible then
    dmoAPP.LigarGPS;

  Inc(TimeOut);
  if TimeOut >= 7200 then // A cada 4h
  begin
    Application.Terminate;
    Exit;
  end;

  if dmoAPP.ThreadEmExecucao then
    labVersao.Text:= '***' + dmoAPP.VersaoAPP
  else
    labVersao.Text:= dmoAPP.VersaoAPP;

  if dmoAPP.DispositivoNaoAutorizado then
  begin
    Timer.Enabled := False;
    msg1.AdvertenciaCiente('Dispositivo não autorizado', 'Trocou de aparelho? Solicite a liberação ao seu empregador para continuar usando o aplicativo.',
      procedure
      begin
        dmoAPP.DispositivoNaoAutorizado := False;
        dmoApp.jorDataHora := 0;
        dmoApp.EjoCod := 0;
        with qry do
        begin
          ExecSQL('DELETE FROM Usuario');
          ExecSQL('DELETE FROM Jornada WHERE jorSincronizado');
        end;
        fmrLogin := TfmrLogin.Create(Application);
        Application.MainForm := fmrLogin;
        fmrLogin.Tag := 99;
        dmoAPP.Tag := 99;
        fmrLogin.Show;
      end);
    Exit;
  end;

  // Atualiza histórico só se marcado
  if (tcoPrincipal.ActiveTab = titHistorico) and dmoAPP.AtualizaHistorico then
  begin
    dmoAPP.AtualizaHistorico := False;
    CarregarHistorico;
  end;

  // Diferença de tempo para pintar botões
  if trim(dmoAPP.usuBancoDeDados) = 'rodobelo' then
    DataHora := TDateTime(TTimeZone.Local.ToUniversalTime(Now) - StrToTime('04:00:00')) - dmoApp.jorDataHora
  else
    DataHora := Now - dmoApp.jorDataHora;

  for i := 0 to Pred(recEventosJornada.ControlsCount) do
  begin
    if recEventosJornada.Controls[i] is TRectangle then
    begin
      var rect := TRectangle(recEventosJornada.Controls[i]);
      try
        if rect.Tag = dmoApp.ejoCod then
        begin
          rect.Fill.Color := $FFAAB4D0;
          if (DataHora > 0) then
          begin
            var lbl := TLabel(rect.Controls[1]);
            lbl.Text := rect.TagString + #13 +
              FormatFloat('#00', Trunc(DataHora) * 24 + HourOf(DataHora)) + ':' +
              FormatFloat('00', MinuteOf(DataHora)) + ':' +
              FormatFloat('00', SecondOf(DataHora));
          end;
        end
        else
        begin
          rect.Fill.Color := $FFFFFFFF;
          TLabel(rect.Controls[1]).Text := rect.TagString;
        end;
      except end;
    end;
  end;

  if (trim(dmoAPP.usuBancoDeDados) = 'rodobelo') or (trim(dmoAPP.usuBancoDeDados) = 'jctransportes') then
  begin
    // Rodar thread de duração a cada 1 minuto apenas se não estiver rodando
    if (not ThreadDuracaoRodando) and
       ((Now - UltimaDuracaoTick > 1/1440) or (UltimaDuracaoTick = 0)) then
    begin
      ThreadDuracaoRodando := True;
      UltimaDuracaoTick := Now;

      TThread.CreateAnonymousThread(
      procedure
      var
        DuracaoInterna: Double;
        DataHoraBanco, DataHoraBancoP, DataHoraP, AnoP, MesP, DiaP, HoraP: String;
      begin
        try
          DuracaoInterna := 0;
          with qry do
          begin
            Close;
            SQL.Clear;
            SQL.Text:=
              'SELECT '+
              'jor.*, '+
              'COALESCE((SELECT MIN(sub.jorDataHora) FROM Jornada sub WHERE sub.funCod '+
              '= jor.funCod AND sub.jorDataHora > jor.jorDataHora AND not SUBSTR(sub.jorObservacao, 1, 5) like ' + QuotedStr('placa') + '), :pNow) '+
              'AS jorDataHoraProximo, '+
              'ejo.ejoJornada, '+
              'ejo.ejoPernoite '+
              'FROM Jornada jor '+
              'INNER JOIN EventosJornada ejo ON (ejo.ejoCod = jor.ejoCod) '+
              'WHERE jor.jorDataHora > COALESCE((SELECT '+
              'MAX(sub.jorDataHora) '+
              'FROM Jornada sub '+
              'INNER JOIN EventosJornada ejo ON (ejo.ejoCod = sub.ejoCod) '+
              'WHERE sub.funCod = '+ IntToStr(dmoApp.funCod) + ' AND ejo.ejoPernoite), (SELECT DATE(''now'', ''-15 days''))) '+
              'AND not SUBSTR(jor.jorObservacao, 1, 5) like ' + QuotedStr('placa') + ' ' +
              'AND jor.funCod = '+ IntToStr(dmoApp.funCod);
            if (trim(dmoAPP.usuBancoDeDados) = 'rodobelo') then
              ParamByName('pNow').Value:= TDateTime(TTimeZone.Local.ToUniversalTime(Now) - StrToTime('04:00:00'))
            else
              ParamByName('pNow').Value:= TDateTime(TTimeZone.Local.ToUniversalTime(Now) - StrToTime('03:00:00'));
            Open;
            if dmoAPP.usuBancoDeDados = 'rodobelo' then
              ParamByName('pNow').Value := TTimeZone.Local.ToUniversalTime(Now) - StrToTime('04:00:00')
            else
              ParamByName('pNow').Value := TTimeZone.Local.ToUniversalTime(Now) - StrToTime('03:00:00');
            Open;
            while not Eof do
            begin
              DataHoraBanco := FieldByName('jorDataHora').Text;
              DataHoraBancoP := FieldByName('jorDataHoraProximo').Text;
              AnoP := Copy(DataHoraBancoP, 1, 4);
              MesP := Copy(DataHoraBancoP, 6, 2);
              DiaP := Copy(DataHoraBancoP, 9, 2);
              HoraP := Copy(DataHoraBancoP, 12, 8);
              DataHoraP := DiaP + '/' + MesP + '/' + AnoP + ' ' + HoraP;
              if FieldByName('ejoJornada').AsBoolean then
                DuracaoInterna := DuracaoInterna + StrToDateTime(DataHoraP) - StrToDateTime(DataHoraBanco);
              if FieldByName('ejoJornada').AsBoolean then dmoAPP.vJorTipo := 1
              else if FieldByName('ejoPernoite').AsBoolean then dmoAPP.vJorTipo := 3
              else dmoAPP.vJorTipo := 2;
              Next;
            end;
            Close;
          end;

          TThread.Synchronize(nil,
            procedure
            var
              h, m, s, ms: Word;
              txtHoras, txtMinutos: String;
            begin
              DecodeTime(DuracaoInterna, h, m, s, ms);

              if h = 1 then
                txtHoras := '1 Hora'
              else
                txtHoras := IntToStr(h) + ' Horas';

              if m = 1 then
                txtMinutos := '1 Minuto'
              else
                txtMinutos := IntToStr(m) + ' Minutos';

              labContador.Visible := True;
              labContador.Text := 'Jornada: ' + txtHoras + ' e ' + txtMinutos;
            end);
        except end;
        ThreadDuracaoRodando := False;
      end).Start;
    end;
  end;

  // Atualizar apenas se visível
  if recAguarde.Visible then
    Carregar(False);
end;

procedure TfmrPrincipal.UltimoEvento;
begin
  TThread.CreateAnonymousThread(
  procedure()
  begin
    with qry do
    begin
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
      end;
      Close;
    end;
  end).Start;
end;

procedure TfmrPrincipal.AddClienteListview(pEvento, pLinha1, pLinha2: string;
  imgH: TBitmap; tag1, tag2, tag3, tag4: String; Reenviar: Boolean);
var
  item: TListViewItem;
  btnExportar: TListItemTextButton;
begin
  lviHistorico.BeginUpdate;
  item := lviHistorico.Items.Add;
  with item do
  begin
    Height := 120;
    TListItemImage(Objects.FindDrawable('imgVendedor')).Bitmap := imgH;
    TListItemImage(Objects.FindDrawable('imgVendedor')).TagString := Tag1;

    TListItemText(Objects.FindDrawable('txtNome')).Text := pEvento;
    TListItemText(Objects.FindDrawable('txtNome')).TagString := Tag2;
    TListItemText(Objects.FindDrawable('txtNome')).Width := lviHistorico.Width - 160;

    TListItemText(Objects.FindDrawable('txtEmail')).Text := pLinha1;
    TListItemText(Objects.FindDrawable('txtEmail')).TagString := Tag3;
    TListItemText(Objects.FindDrawable('txtEmail')).Width := lviHistorico.Width - 160;

    TListItemText(Objects.FindDrawable('txtEndereco')).Text := pLinha2;
    TListItemText(Objects.FindDrawable('txtEndereco')).Width := lviHistorico.Width - 160;
    TListItemText(Objects.FindDrawable('txtEndereco')).Height := 60;
    TListItemText(Objects.FindDrawable('txtEndereco')).TagString := Tag4;
    TListItemTextButton(Objects.FindDrawable('btnReenviar')).Visible := Reenviar;

    // ✅ Correto: pega o botão desenhado no estilo e define o TagObject com o item correspondente
    btnExportar := TListItemTextButton(Objects.FindDrawable('btnExportar'));
    if Assigned(btnExportar) then
      btnExportar.TagObject := item;
  end;
  lviHistorico.EndUpdate;
end;

procedure TfmrPrincipal.AddMensagemListview(pEvento, pLinha1, pLinha2: string;
  imgH: TBitmap);
var
  item: TListViewItem;
begin
  lviMensagem.BeginUpdate;
  item := lviMensagem.Items.Add;
  with item do
  begin
    Height := 120;
    TListItemImage(Objects.FindDrawable('imgVendedor')).Bitmap:= imgH;
    TListItemText(Objects.FindDrawable('txtNome')).Text := pEvento;
    // Email
    TListItemText(Objects.FindDrawable('txtEmail')).Text := pLinha1;
    // Endereco
    TListItemText(Objects.FindDrawable('txtEndereco')).Text := pLinha2;
    TListItemText(Objects.FindDrawable('txtEndereco')).Width:= lviMensagem.Width - 75;
    TListItemText(Objects.FindDrawable('txtEndereco')).Height:= 120;
  end;
  lviMensagem.EndUpdate;
end;

procedure TfmrPrincipal.btnAjusteClick(Sender: TObject);
begin
  if tedHora.Text = '' then
  begin
    if dmoAPP.usuBancoDeDados = 'castelinho' then
      msg1.Aviso('Hora inválida', 'Você deve inserir o horário do seu lançamento manual.')
    else
      msg1.Aviso('Hora inválida', 'Você deve inserir o horário do seu ajuste.');
    exit;
  end;
  //Validar data e hora futuros
  if dedData.Date + tedHora.Time > Now then
  begin
    if dmoAPP.usuBancoDeDados = 'castelinho' then
      msg1.Aviso('Data inválida', 'Você não pode enviar um lançamento manual com data futura')
    else
      msg1.Aviso('Data inválida', 'Você não pode enviar um ajuste com data futura');
    exit;
  end;
  //Validar data e hora futuros
  if dedData.Date + tedHora.Time < (Now - 90) then
  begin
    if dmoAPP.usuBancoDeDados = 'castelinho' then
      msg1.Aviso('Data inválida', 'Você não pode enviar lançamentos manuais com data inferior a 90 dias atrás')
    else
      msg1.Aviso('Data inválida', 'Você não pode enviar ajustes com data inferior a 90 dias atrás');
    exit;
  end;
  try
    recConfirmar.Visible:= True;
    labConfirmar.Text:= 'Ponto registrado!' + #13 +
      'Sincronizando com a empresa... Aguarde 8 segundos';
    TimerConfirmar.Enabled:= True;
    Inc(qtdClique);
    if qtdClique < 2 then
    begin
      //Advertir
      if dmoApp.usuBancoDeDados = 'castelinho' then
      msg1.Pergunta(TButton(Sender).TagString,
        'Esse status só será computado na sua jornada de trabalho quando aprovado pelo seu empregador.'+ #13#10 +
        'Você confirma o envio dessa solicitação de lançamento manual com o seguinte status: ' + TButton(Sender).TagString + '?',
      procedure
      begin
        TThread.CreateAnonymousThread(
        procedure()
        begin
          //Salvar no SQLite
          with qry do
          begin
            Close;
            SQL.Clear;
            SQL.Add('INSERT INTO Jornada');
            SQL.Add('(funCod, jorDataHora, ejoCod, jorObservacao, jorLatitude, jorLongitude, jorSincronizado)');
            SQL.Add('VALUES(:PfunCod, :PjorDataHora, :PejoCod, :PjorObservacao, :PjorLatitude, :PjorLongitude, :PjorSincronizado)');
            ParamByName('PfunCod').Value:= dmoApp.funCod;
            ParamByName('PjorDataHora').Value:= TDateTime(dedData.Date + tedHora.Time);
            ParamByName('PejoCod').Value:= TButton(Sender).Tag;
            {$IFDEF Android}
              ParamByName('PjorObservacao').Text:= '#ajuste <ID>' + dmoAPP.getDeviceID + '</ID>';
            {$ENDIF}
            {$IFDEF iOS}
              ParamByName('PjorObservacao').Text:= '#ajuste';
            {$ENDIF}
            try
              ParamByName('PjorLatitude').Text:= StringReplace(FloatToStr(dmoAPP.Latitude), ',', '.', [rfReplaceAll]);
              ParamByName('PjorLongitude').Text:= StringReplace(FloatToStr(dmoAPP.Longitude), ',', '.', [rfReplaceAll]);
            except
              ParamByName('PjorLatitude').Text:= 'NaN';
              ParamByName('PjorLongitude').Text:= 'NaN';
            end;
            ParamByName('PjorSincronizado').Value:= False;
            ExecSQL;
            if dmoApp.jorDataHora < TDateTime(dedData.Date + tedHora.Time) then
            begin
              dmoApp.jorDataHora:= TDateTime(dedData.Date + tedHora.Time);
              dmoApp.ejoCod:= TButton(Sender).Tag;
            end;
          end;
          UltimoEvento;
          TThread.Synchronize(TThread.CurrentThread,
          procedure()
          begin
            recPlaca.Visible:= False;
            recEventosJornada.Visible:= True;
            tcoPrincipal.ActiveTab:= titHome;
            recHome.Fill.Color:= $FF251264;
            recHistorico.Fill.Color:= $FF150B36;
            recDados.Fill.Color:= $FF150B36;
            recChat.Fill.Color:= $FF150B36;
            recAjuste.Fill.Color:= $FF150B36;
            recPlaca.Visible:= False;
          end);
        end).Start;
      end)
      else
      msg1.Pergunta(TButton(Sender).TagString,
        'Esse status só será computado na sua jornada de trabalho quando aprovado pelo seu empregador.'+ #13#10 +
        'Você confirma o envio dessa solicitação de ajuste com o seguinte status: ' + TButton(Sender).TagString + '?',
      procedure
      begin
        TThread.CreateAnonymousThread(
        procedure()
        begin
          //Salvar no SQLite
          with qry do
          begin
            Close;
            SQL.Clear;
            SQL.Add('INSERT INTO Jornada');
            SQL.Add('(funCod, jorDataHora, ejoCod, jorObservacao, jorLatitude, jorLongitude, jorSincronizado)');
            SQL.Add('VALUES(:PfunCod, :PjorDataHora, :PejoCod, :PjorObservacao, :PjorLatitude, :PjorLongitude, :PjorSincronizado)');
            ParamByName('PfunCod').Value:= dmoApp.funCod;
            ParamByName('PjorDataHora').Value:= TDateTime(dedData.Date + tedHora.Time);
            ParamByName('PejoCod').Value:= TButton(Sender).Tag;
            {$IFDEF Android}
              ParamByName('PjorObservacao').Text:= '#ajuste <ID>' + dmoAPP.getDeviceID + '</ID>';
            {$ENDIF}
            {$IFDEF iOS}
              ParamByName('PjorObservacao').Text:= '#ajuste';
            {$ENDIF}
            try
              ParamByName('PjorLatitude').Text:= StringReplace(FloatToStr(dmoAPP.Latitude), ',', '.', [rfReplaceAll]);
              ParamByName('PjorLongitude').Text:= StringReplace(FloatToStr(dmoAPP.Longitude), ',', '.', [rfReplaceAll]);
            except
              ParamByName('PjorLatitude').Text:= 'NaN';
              ParamByName('PjorLongitude').Text:= 'NaN';
            end;
            ParamByName('PjorSincronizado').Value:= False;
            ExecSQL;
            if dmoApp.jorDataHora < TDateTime(dedData.Date + tedHora.Time) then
            begin
              dmoApp.jorDataHora:= TDateTime(dedData.Date + tedHora.Time);
              dmoApp.ejoCod:= TButton(Sender).Tag;
            end;
          end;
          UltimoEvento;
          TThread.Synchronize(TThread.CurrentThread,
          procedure()
          begin
            recPlaca.Visible:= False;
            recEventosJornada.Visible:= True;
            tcoPrincipal.ActiveTab:= titHome;
            recHome.Fill.Color:= $FF251264;
            recHistorico.Fill.Color:= $FF150B36;
            recDados.Fill.Color:= $FF150B36;
            recChat.Fill.Color:= $FF150B36;
            recAjuste.Fill.Color:= $FF150B36;
            recPlaca.Visible:= False;
          end);
        end).Start;
      end);
    end;
    qtdClique:= 0;
  finally
    qtdClique:= 0;
    panDataHora.Visible:= False;
    recJornadaAjuste.Visible:= True;
  end;
end;

procedure TfmrPrincipal.btnCancelarClick(Sender: TObject);
begin
  panDataHora.Visible:= False;
  recJornadaAjuste.Visible:= True;
end;

procedure TfmrPrincipal.btnGPSLigadoClick(Sender: TObject);
begin
  recLigarGPS.Visible:= False;
end;

procedure TfmrPrincipal.btnNaoSeiLigarClick(Sender: TObject);
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

procedure TfmrPrincipal.CarregarHistorico;
begin
  TThread.CreateAnonymousThread(
  procedure()
  Var
    btnReenviar: Boolean;
    qryJ: TFDQuery;
    Botao: TButton;
  begin
    qryj:= TFDQuery.Create(nil);
    try
      qryJ.Connection:= dmoAPP.Conn;
      qryJ.Close;
      qryJ.SQL.Clear;
      qryJ.SQL.Text:=
        'SELECT '+
        'ejoCod, '+
        'jorDataHoraInicio, '+
        'jorObservacao, '+
        'CASE WHEN jorSincronizado THEN '+
        '''Sim'' '+
        'ELSE '+
        '''Não'' '+
        'END AS jorSincronizado, '+
        'jorData || '' - '' || jorHora AS jorDataHora, '+
        'jorDiaSemana, '+
        'ejoDescricao, '+
        'CAST((julianday(jorDataHoraFim) - julianday(jorDataHoraInicio)) * 24 AS INTEGER) || '':'' || '+
        'SUBSTR(''00''||CAST(((JulianDay(jorDataHoraFim) - JulianDay(jorDataHoraInicio)) * 24 * 60) % 60 As Integer), -2) '+
        'AS jorTotal '+
        'FROM '+
        '(SELECT '+
        'jor.ejoCod, '+
        'jor.jorDataHora AS jorDataHoraInicio, '+
        'COALESCE((SELECT '+
        'MIN(jorDataHora) '+
        'FROM Jornada sub '+
        'WHERE (sub.funCod = jor.funCod AND sub.jorDataHora > jor.jorDataHora '+
        'AND SUBSTR(sub.jorObservacao, 1, 5) <> ''placa'') OR '+
        '(sub.funCod = jor.funCod AND sub.jorDataHora > jor.jorDataHora '+
        'AND sub.jorObservacao IS NULL)), CURRENT_TIMESTAMP) AS jorDataHoraFim, '+
        'strftime(''%d/%m'', jor.jorDataHora) AS jorData, '+
        'strftime(''%H:%M'', jor.jorDataHora) AS jorHora, '+
        'CASE '+
        'WHEN strftime(''%w'', jor.jorDataHora) = ''0'' THEN '+
        '''Dom'' '+
        'WHEN strftime(''%w'', jor.jorDataHora) = ''1'' THEN '+
        '''Seg'' '+
        'WHEN strftime(''%w'', jor.jorDataHora) = ''2'' THEN '+
        '''Ter'' '+
        'WHEN strftime(''%w'', jor.jorDataHora) = ''3'' THEN '+
        '''Qua'' '+
        'WHEN strftime(''%w'', jor.jorDataHora) = ''4'' THEN '+
        '''Qui'' '+
        'WHEN strftime(''%w'', jor.jorDataHora) = ''5'' THEN '+
        '''Sex'' '+
        'WHEN strftime(''%w'', jor.jorDataHora) = ''6'' THEN '+
        '''Sab'' '+
        'END AS jorDiaSemana, '+
        'ejo.ejoDescricao, '+
        'jor.jorSincronizado, '+
        'jor.jorObservacao '+
        'FROM Jornada jor '+
        'INNER JOIN EventosJornada ejo ON (ejo.ejoCod = jor.ejoCod) '+
        'WHERE funCod = :pFuncod '+
        'ORDER BY jor.jorDataHora DESC) sel ';
      qryJ.ParamByName('PfunCod').Value:= dmoApp.funCod;
      qryJ.Open;
      qryJ.First;
      TThread.Synchronize(TThread.CurrentThread,
      procedure()
      begin
        try
          lviHistorico.BeginUpdate;
          lviHistorico.Items.Clear;
          while not qryJ.Eof do
          begin
            try
              Evento:= qryJ.FieldByName('ejoDescricao').Text;
              if Copy(qryJ.FieldByName('jorObservacao').Text, 1, 7) = '#ajuste' then
              begin
                if SameText(dmoAPP.usuBancoDeDados, 'jctransportes') then
                begin
                  qryJ.Next;
                  Continue;  // pula só este registro
                end;
                if dmoAPP.usuBancoDeDados = 'castelinho' then
                  Linha1:= 'LANÇAMENTO MANUAL'
                else
                  Linha1:= 'AJUSTE';
                Linha2:= qryJ.FieldByName('jorDiaSemana').Text + ' - ' + qryJ.FieldByName('jorDataHora').Text;
                if UPPERCASE(TRIM(qryJ.FieldByName('jorSincronizado').Text)) = 'SIM' then
                begin
                  Linha2:= Linha2 + #13 + 'Sincronizado';
                  btnReenviar:= False;
                end
                else
                begin
                  Linha2:= Linha2 + ' Offline';
                  btnReenviar:= True;
                end;
                AddClienteListview(Evento, Linha1, Linha2, imghAjuste.Bitmap, qryJ.FieldByName('ejoCod').Text,
                                                                              FormatDateTime('YYYY-MM-DD HH:MM', qryJ.FieldByName('jorDataHoraInicio').Value),
                                                                              qryJ.FieldByName('jorObservacao').Text, //REENVIÁVEL
                                                                              qryJ.FieldByName('jorObservacao').Text, btnReenviar);
              end
              else if SameText(Copy(Trim(qryJ.FieldByName('jorObservacao').Text), 1, 5), 'placa') then
              begin
                Evento:= Copy(qryJ.FieldByName('jorObservacao').Text, 6, 7);
                Linha1:= 'PLACA';
                Linha2:= qryJ.FieldByName('jorDiaSemana').Text + ' - ' + qryJ.FieldByName('jorDataHora').Text ;
                if UPPERCASE(TRIM(qryJ.FieldByName('jorSincronizado').Text)) = 'SIM' then
                begin
                  Linha2:= Linha2 + #13 + 'Sincronizado';
                  btnReenviar:= False;
                end
                else
                begin
                  Linha2:= Linha2 + #13 + 'Offline';
                  btnReenviar:= False;
                end;
                AddClienteListview(Evento, Linha1, Linha2, imghPlaca.Bitmap, qryJ.FieldByName('ejoCod').Text,
                                                                              FormatDateTime('YYYY-MM-DD HH:MM', qryJ.FieldByName('jorDataHoraInicio').Value),
                                                                              qryJ.FieldByName('jorObservacao').Text, //NÃO REENVIÁVEL
                                                                              qryJ.FieldByName('jorObservacao').Text, btnReenviar);
              end
              else
              begin
                Linha1:= 'REGISTRO';
                Linha2:= qryJ.FieldByName('jorDiaSemana').Text + ' - ' + qryJ.FieldByName('jorDataHora').Text;
                if UPPERCASE(TRIM(qryJ.FieldByName('jorSincronizado').Text)) = 'SIM' then
                begin
                  Linha2:= Linha2 + #13 + 'Sincronizado' + #13 + 'Duração: ' + qryJ.FieldByName('jorTotal').Text;
                  btnReenviar:= False;
                end
                else
                begin
                  Linha2:= Linha2 + #13 + 'Offline' + #13 + 'Duração: ' + qryJ.FieldByName('jorTotal').Text;
                  btnReenviar:= True;
                end;
                AddClienteListview(Evento, Linha1, Linha2, imghEvento.Bitmap, qryJ.FieldByName('ejoCod').Text,
                                                                              FormatDateTime('YYYY-MM-DD HH:MM', qryJ.FieldByName('jorDataHoraInicio').Value),
                                                                              qryJ.FieldByName('jorObservacao').Text, //REENVIÁVEL
                                                                              qryJ.FieldByName('jorObservacao').Text, btnReenviar);
              end;
              qryJ.Next;
            except
              qryJ.Next;
            end;
          end;
        finally
          lviHistorico.EndUpdate;
        end;
      end);
    finally
      qryJ.Close;
      qryJ.Free;
    end;
  end).Start;
end;

procedure TfmrPrincipal.CarregarMensagens;
var
  qryMensagem: TFDQuery;
begin
  try
    qryMensagem:= TFDQuery.Create(nil);
    qryMensagem.Connection:= dmoAPP.Conn;
    recAguarde.Visible:= True;
    Animacao.Enabled:= True;
    lviMensagem.BeginUpdate;
    lviMensagem.Items.Clear;
    with qryMensagem do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT chaGestor, chaMensagem FROM Chat ORDER BY chaDataHora DESC');
      Open;
      First;
      while not Eof do
      begin
        if copy(FieldByName('chaMensagem').Text, 1, 17) = 'MENSAGEM IGNORADA' then
        begin
          Evento:= TEmojiConstants.Warning + ' Em ' + SplitString(FieldByName('chaGestor').Text, '-') [0];
          Linha1:= 'MENSAGEM IGNORADA';
          Linha2:= FieldByName('chaMensagem').Text;
          AddMensagemListview(Evento, Linha1, Linha2, imgMensagem.Bitmap);
        end
        else
        begin
          Evento:= 'Em ' + SplitString(FieldByName('chaGestor').Text, '-') [0] + ' Seu empregador disse:';
          Linha1:= 'Mensagem';
          Linha2:= FieldByName('chaMensagem').Text;
          AddMensagemListview(Evento, Linha1, Linha2, imgMensagem.Bitmap);
        end;
        Next;
      end;
      recAguarde.Visible:= False;
      Animacao.Enabled:= False;
      Close;
    end;
  finally
    lviMensagem.EndUpdate;
    qryMensagem.DisposeOf;
  end;
end;

procedure TfmrPrincipal.Clicar(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  try
    //Realçar a cor do retangulo clicado
    ejoCod:= TRectangle(Sender).Tag;
    Cor:= TRectangle(Sender).Fill.Color;
    TRectangle(Sender).Fill.Color:= $FFC5CCDF;
    btnAjuste.TagString:= TRectangle(Sender).TagString;
  except
  end;
end;

procedure TfmrPrincipal.EnviarAjuste(Sender: TObject);
begin
  {$IFDEF Android}
    if (UPPERCASE(dmoAPP.LocationSensor.Sensor.Latitude.ToString) = 'NAN') and (dmoAPP.usuBancoDeDados = 'gasometromadeiras') or
       (UPPERCASE(dmoAPP.LocationSensor.Sensor.Latitude.ToString) = 'NAN') and (dmoAPP.usuBancoDeDados = 'WebDesenvolvimento') then
    begin
      recLigarGPS.Visible:= True;
      Exit;
    end;
  {$ENDIF}
  panDataHora.Visible:= True;
  tedHora.Text:= '';
  recJornadaAjuste.Visible:= False;
  labEvento.Text:= TRectangle(Sender).TagString;
  btnAjuste.Tag:= TRectangle(Sender).Tag;
  if dmoAPP.LocationSensor.Active then
  begin
    dmoAPP.Latitude:= dmoApp.LocationSensor.Sensor.Latitude;
    dmoAPP.Longitude:= dmoApp.LocationSensor.Sensor.Longitude;
  end;
  PerguntarPlaca:= False;
end;

procedure TfmrPrincipal.MarcarPlaca(Equipamento, Placa: String);
begin
  TThread.CreateAnonymousThread(
  procedure()
  var
    qryMarcarPonto: TFDQuery;
  begin
    //SALVAR MARCAÇÃO NO SQLITE
    try
      qryMarcarPonto:= TFDQuery.Create(nil);
      qryMarcarPonto.Connection:= dmoAPP.Conn;
      with qryMarcarPonto do
      begin
        Close;
        SQL.Clear;
        SQL.Add('INSERT INTO Jornada');
        SQL.Add('(funCod, jorDataHora, ejoCod, jorObservacao, jorLatitude, jorLongitude, jorSincronizado)');
        SQL.Add('VALUES(:PfunCod, :PjorDataHora, :PejoCod, :PjorObservacao, :PjorLatitude, :PjorLongitude, :PjorSincronizado)');
        ParamByName('PfunCod').Value:= dmoApp.funCod;
        if trim(dmoAPP.usuBancoDeDados) = 'rodobelo' then
          ParamByName('PjorDataHora').Value:= TDateTime(TTimeZone.Local.ToUniversalTime(Now) - StrToTime('04:00:00'))
        else
          ParamByName('PjorDataHora').Value:= Now;
        ParamByName('PejoCod').Value:= 1;
        ParamByName('PjorObservacao').Text:= 'placa' + cboVeiPlaca.Text + Equipamento;;
        ParamByName('PjorLatitude').Text:= 'NaN';
        ParamByName('PjorLongitude').Text:= 'NaN';
        ParamByName('PjorSincronizado').Value:= False;
        ExecSQL;
      end;
    finally
      qryMarcarPonto.DisposeOf;
    end;
  end).Start;
end;

procedure TfmrPrincipal.MarcarPonto(ejoDescricao: String);
begin
  recConfirmar.Visible:= True;
  labConfirmar.Text:= 'Ponto registrado!' + #13 +
    'Sincronizando com a empresa... Aguarde 8 segundos';
  TimerConfirmar.Enabled:= True;
  TThread.CreateAnonymousThread(
  procedure()
  var
    qryMarcarPonto: TFDQuery;
  begin
    dmoAPP.vPrimeiroLogin:= False;
    //SALVAR MARCAÇÃO NO SQLITE
    try
      qryMarcarPonto:= TFDQuery.Create(nil);
      qryMarcarPonto.Connection:= dmoAPP.Conn;
      with qryMarcarPonto do
      begin
        Close;
        SQL.Clear;
        SQL.Add('INSERT INTO Jornada');
        SQL.Add('(funCod, jorDataHora, ejoCod, jorObservacao, jorLatitude, jorLongitude, jorSincronizado)');
        SQL.Add('VALUES(:PfunCod, :PjorDataHora, :PejoCod, :PjorObservacao, :PjorLatitude, :PjorLongitude, :PjorSincronizado)');
        ParamByName('PfunCod').Value:= dmoApp.funCod;
        if trim(dmoAPP.usuBancoDeDados) = 'rodobelo' then
          ParamByName('PjorDataHora').Value:= TDateTime(TTimeZone.Local.ToUniversalTime(Now) - StrToTime('04:00:00'))
        else
          ParamByName('PjorDataHora').Value:= Now;
        ParamByName('PejoCod').Value:= aTag;
        ParamByName('PjorObservacao').Text:= '<ID>' + dmoAPP.getDeviceID + '</ID>' + ' ' + msg1.edtImput.Text;
        try
          if not (dmoAPP.Latitude = 0) then
          begin
            ParamByName('PjorLatitude').Text:= StringReplace(FloatToStr(dmoAPP.Latitude), ',', '.', [rfReplaceAll]);
            ParamByName('PjorLongitude').Text:= StringReplace(FloatToStr(dmoAPP.Longitude), ',', '.', [rfReplaceAll]);
          end
          else
          begin
            ParamByName('PjorLatitude').Text:= 'NaN';
            ParamByName('PjorLongitude').Text:= 'NaN';
          end;
        except
          ParamByName('PjorLatitude').Text:= 'NaN';
          ParamByName('PjorLongitude').Text:= 'NaN';
        end;
        ParamByName('PjorSincronizado').Value:= False;
        ExecSQL;
        PerguntarPlaca:= True;
      end;
    finally
      qryMarcarPonto.DisposeOf;
    end;
  end).Start;
end;

procedure TfmrPrincipal.MensagemNova;
begin
  TThread.CreateAnonymousThread(
  procedure()
  var
    jsonObj, jsonObjRecord: TJsonObject;
    jsonArray: TJSONArray;
    json, Codigo: String;
    i: Integer;
  begin
    //Verificar conexão como o servidor da Boreal
    if dmoApp.ChecarConexao then
    begin
      RestRequestM.Resource:= 'ReceberMensagem';
      //Receber mensagens
      try
        RestRequestM.Params.Clear;
        RestRequestM.AddParameter('usuBancoDeDados', dmoAPP.usuBancoDeDados);
        RestRequestM.AddParameter('funCod', IntToStr(dmoAPP.funCod));
        RestRequestM.Execute;
      except
        Exit;
      end;
      json:= RestRequestM.Response.JSONValue.ToString;
      jsonObj:= TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(json),0) as TJsonObject;
      jsonArray:= TJSONArray(jsonObj.Values['Chat']);
      Codigo:= copy(json, 21, 1);
      if Codigo = '1' then
      begin
        for i:= 0 to Pred(jsonArray.Count) do
        begin
          jsonObjRecord:= TJSONObject(jsonArray.Items[i]);
          //Gravar mensagens recebidas no SQLite
          with qry do
          begin
            Close;
            SQL.Clear;
            SQL.Add('INSERT INTO Chat');
            SQL.Add('(chaMensagem, chaGestor, chaSincronizado, chaDataHora)');
            SQL.Add('VALUES(:PchaMensagem, :PchaGestor, :PchaSincronizado, :PchaDataHora)');
            ParamByName('PchaMensagem').Text:= jsonObjRecord.GetValue('chaMensagem').Value;
            ParamByName('PchaGestor').Text:= jsonObjRecord.GetValue('chaGestor').Value;
            ParamByName('PchaSincronizado').Value:= False;
            ParamByName('PchaDataHora').Value:= Now;
            ExecSQL;
          end;
        end;
        jsonObj.Free;
      end;
    end;
    TThread.Synchronize(TThread.CurrentThread,
    procedure()
    var
      json, Codigo: String;
    begin
      qry.Close;
      qry.SQL.Clear;
      qry.SQL.Add('SELECT chaSincronizado FROM Chat WHERE NOT chaSincronizado AND NOT chaGestor = ''ND'' AND NOT chaGestor = ''Empresa'' LIMIT 1');
      qry.Open;
      if qry.RecordCount > 0 then
      begin
        msg1.Pergunta('Nova mensagem', 'Você tem uma nova mensagem do seu empregador. Deseja ler agora?',
        procedure
        begin
          tcoPrincipal.ActiveTab:= titChat;
          CarregarMensagens;
          recHome.Fill.Color:= $FF150B36;
          recHistorico.Fill.Color:= $FF150B36;
          recDados.Fill.Color:= $FF150B36;
          recChat.Fill.Color:= $FF251264;
          recAjuste.Fill.Color:= $FF150B36;
          //**********************************************************************
          //ENVIAR CONFIRMAÇÃO DE LEITURA
          try
            //ENVIAR MARCAÇÕES PARA O SERVIDOR
            dmoAPP.RestRequest.Resource:= 'EnviarMensagem';
            dmoAPP.RestRequest.Params.Clear;
            dmoAPP.RestRequest.AddParameter('usuBancoDeDados', dmoAPP.usuBancoDeDados);
            dmoAPP.RestRequest.AddParameter('funCod', IntToStr(dmoAPP.funCod));
            dmoAPP.RestRequest.AddParameter('chaMensagem', 'Leitura confirmada em: ' + DateTimeToStr(Now) + ' Dispositivo: ' + dmoAPP.GetDeviceID);
            dmoAPP.RestRequest.Execute;
            json:= dmoAPP.RestRequest.Response.JSONValue.ToString;
            Codigo:= copy(json, 12, 1);
            if (Codigo = '1') then
            begin
              qry.Close;
              qry.SQL.Clear;
              qry.SQL.Add('UPDATE Chat SET chaSincronizado = TRUE');
              qry.ExecSQL;
            end;
          except
          end;
        end,
        procedure
        begin
          recEventosJornada.Visible:= True;
          try
          //Gravar mensagens recebidas no SQLite
            qryAuxiliar.Close;
            qryAuxiliar.SQL.Clear;
            qryAuxiliar.SQL.Add('INSERT INTO Chat');
            qryAuxiliar.SQL.Add('(chaMensagem, chaGestor, chaSincronizado, chaDataHora)');
            qryAuxiliar.SQL.Add('VALUES(:PchaMensagem, :PchaGestor, :PchaSincronizado, :PchaDataHora)');
            qryAuxiliar.ParamByName('PchaMensagem').Text:= 'MENSAGEM IGNORADA';
            qryAuxiliar.ParamByName('PchaGestor').Text:= DateTimeToStr(Now);
            qryAuxiliar.ParamByName('PchaSincronizado').Value:= True;
            qryAuxiliar.ParamByName('PchaDataHora').Value:= Now;
            qryAuxiliar.ExecSQL;
            //ENVIAR MARCAÇÕES PARA O SERVIDOR
            dmoAPP.RestRequest.Resource:= 'EnviarMensagem';
            dmoAPP.RestRequest.Params.Clear;
            dmoAPP.RestRequest.AddParameter('usuBancoDeDados', dmoAPP.usuBancoDeDados);
            dmoAPP.RestRequest.AddParameter('funCod', IntToStr(dmoAPP.funCod));
            dmoAPP.RestRequest.AddParameter('chaMensagem', 'Mensagem ignorada em: ' + DateTimeToStr(Now) + ' Dispositivo: ' + dmoAPP.GetDeviceID);
            dmoAPP.RestRequest.Execute;
          except
            //EM CASO DE ERRO, SAIR DO LOOP E CONTINUAR TENTANDO.
            //Break;
          end;
        end);
      end;
    end);
  end).Start;
  {$IFDEF iOS}
    Timer.Enabled:= True;
  {$ENDIF}
  {$IFDEF Android}
    try
      ContarHorasJornada;
    except
      Timer.Enabled:= True;
    end;
  {$ENDIF}
end;

procedure TfmrPrincipal.EnviarEvento(Sender: TObject);
begin
  {$IFDEF Android}
  if not ValidarGPSLigado then Exit;
  {$ENDIF}

  aTag := TControl(Sender).Tag;
  aTagString := TControl(Sender).TagString;
  Inc(qtdClique);

  if dmoApp.usuBancoDeDados <> 'rmbtransportes' then
    textoLegal := 'conforme as leis trabalhistas vigentes' else textoLegal := '';

  if not ValidarIntervaloEntreCliques then Exit;
  if not ValidarDuplicidadeEvento then Exit;
  PrepararLatitudeLongitude;

  Pernoite := (dmoApp.ejoPernoite = dmoApp.ejoCod) or (dmoApp.ejoPernoite2 = dmoApp.ejoCod);
  Refeicao := (dmoApp.ejoRefeicao = dmoApp.ejoCod);
  Direcao := (dmoApp.ejoDirecao = dmoApp.ejoCod);
  ejoCodAnt := dmoAPP.ejoCod;

  if not ValidarAplicativoPermitido(aTag) then Exit;

  if dmoAPP.usuBancoDeDados = 'serpa' then
    if not ValidarPlacaAntesDirecaoSerpa(aTag) then Exit;

  if SameText(dmoAPP.usuBancoDeDados, 'transpanorama') or
     SameText(dmoAPP.usuBancoDeDados, 'transpanoramahomologacao') then
    ExecutarLogicaTranspanorama(aTag, aTagString)
  else if SameText(dmoAPP.usuBancoDeDados, 'rodobelo') then
    ExecutarLogicaRodobelo(aTag, aTagString)
  else
  ExecutarLogicaOutrasEmpresas(aTag, aTagString);


  qtdClique := 0;
end;

function TfmrPrincipal.EnvioAutomaticoDePlaca: Boolean;
begin
  result:=
    (dmoAPP.usuBancoDeDados = 'serpa') or
    (dmoAPP.usuBancoDeDados = 'transpanorama') or
    (dmoAPP.usuBancoDeDados = 'transpanoramahomologacao');
end;

procedure TfmrPrincipal.ExportarComprovanteDeItemComoImagem(AItem: TListViewItem);
const
  LARGURA_IMG = 600;
  TAM_FONTE = 20;
  MARGEM = 20;
  {$IFDEF ANDROID}
var
  Bmp, qrBmp: TBitmap;
  Surf: TBitmapSurface;
  ImageStream: TFileStream;
  Canvas: TCanvas;
  y, qrTam, alturaTotal, alturaLinhaAtual, posY: Integer;
  evento, linha1, linha2, dataHoraStr, textoQR, hashMD5, caminhoArquivo: string;
  linhas: TList<string>;
  qrCode: TDelphiZXingQRCode;
  FileObj: JFile;
  Uri: Jnet_Uri;
  Intent: JIntent;
  {$ENDIF}
begin
  {$IFDEF ANDROID}
  linhas := TList<string>.Create;
  try
    // Cabeçalho fixo
    linhas.Add('══════════════════════════════════════════');
    linhas.Add('SISTEMA BOREAL RH');
    linhas.Add('CONTROLE DE JORNADA');
    linhas.Add('Registrado no INPI — Processo Nº:');
    linhas.Add('BR512022000138-1');
    linhas.Add('══════════════════════════════════════════');
    linhas.Add('COMPROVANTE DE REGISTRO DE PONTO');
    linhas.Add('                                          ');
    linhas.Add('Emitido conforme a Lei 13.103/2015,');
    linhas.Add('Portaria 671 do MTE e normas da CLT');
    linhas.Add('                                          ');
    linhas.Add('══════════════════════════════════════════');
    dataHoraStr := FormatDateTime('dd/MM/yyyy hh:nn:ss', Now);
    linhas.Add('EXPORTADO EM: ' + dataHoraStr);
    linhas.Add('');
    linhas.Add('DADOS DO EMPREGADOR:');
    linhas.Add(dmoAPP.filRazaoSocial);
    linhas.Add(dmoAPP.filCNPJ);
    linhas.Add('');
    linhas.Add('DADOS DO FUNCIONÁRIO:');
    linhas.Add(dmoAPP.usuNome);
    linhas.Add(dmoAPP.usuCPF);
    linhas.Add('');
    linhas.Add('MARCAÇÃO DE PONTO:');
    linhas.Add('--------------------------------');

    // Dados do item clicado
    evento := TListItemText(AItem.Objects.FindDrawable('txtNome')).Text.Trim;
    linha1 := TListItemText(AItem.Objects.FindDrawable('txtEmail')).Text.Trim;
    linha2 := TListItemText(AItem.Objects.FindDrawable('txtEndereco')).Text.Trim;

    // Adiciona as linhas
    linhas.Add('Evento: ' + evento);

    for var s in linha1.Split([sLineBreak, #13, #10], TStringSplitOptions.ExcludeEmpty) do
      linhas.Add(s);

    for var s in linha2.Split([sLineBreak, #13, #10], TStringSplitOptions.ExcludeEmpty) do
      linhas.Add(s);

    linhas.Add(StringOfChar('-', 56));

    // Gera texto para QR Code
    textoQR := string.Join(sLineBreak, linhas.ToArray);
    hashMD5 := THashMD5.GetHashString(textoQR);

    qrCode := TDelphiZXingQRCode.Create;
    try
      qrCode.Data := hashMD5;
      qrCode.Encoding := qrUTF8NoBOM;
      qrCode.QuietZone := 4;

      qrTam := 240;
      qrBmp := TBitmap.Create(qrTam, qrTam);
      qrBmp.Clear(TAlphaColors.White);
      qrBmp.Canvas.BeginScene;
      try
        qrBmp.Canvas.Fill.Color := TAlphaColors.Black;
        for y := 0 to qrCode.Rows - 1 do
          for var i := 0 to qrCode.Columns - 1 do
            if qrCode.IsBlack[i, y] then
              qrBmp.Canvas.FillRect(TRectF.Create(i * 4, y * 4, (i + 1) * 4, (y + 1) * 4), 0, 0, [], 1.0);
      finally
        qrBmp.Canvas.EndScene;
      end;
    finally
      qrCode.Free;
    end;

    // Altura total da imagem
    alturaTotal := linhas.Count * 35;

    Bmp := TBitmap.Create;
    try
      Bmp.SetSize(LARGURA_IMG, alturaTotal + 3 * 60 + qrTam);
      Canvas := Bmp.Canvas;
      Canvas.BeginScene;
      try
        Canvas.Clear(TAlphaColors.White);
        Canvas.Font.Size := TAM_FONTE;
        Canvas.Font.Family := 'monospace';
        Canvas.Fill.Color := TAlphaColors.Black;

        posY := 0;
        for var i := 0 to linhas.Count - 1 do
        begin
          alturaLinhaAtual := 35;

          // Proteção extra: força pelo menos um espaço se for vazio
          if linhas[i].Trim = '' then
            linhas[i] := ' ';

          Canvas.FillText(TRectF.Create(MARGEM, posY, LARGURA_IMG - MARGEM, posY + alturaLinhaAtual),
            linhas[i], False, 1.0, [], TTextAlign.Leading);
          posY := posY + alturaLinhaAtual;
        end;

        Canvas.FillText(
          TRectF.Create(0, posY + 10, LARGURA_IMG, posY + 60),
          'CÓDIGO DE AUTENTICAÇÃO QR',
          False, 1.0, [], TTextAlign.Center
        );

        Canvas.DrawBitmap(qrBmp,
          qrBmp.BoundsF,
          TRectF.Create((LARGURA_IMG - qrTam) / 2, posY + 60,
              (LARGURA_IMG + qrTam) / 2, posY + 60 + qrTam),
          1);
      finally
        Canvas.EndScene;
      end;

      caminhoArquivo := TPath.Combine(TPath.GetTempPath, 'Comprovante_' + FormatDateTime('yyyymmdd_hhnnss', Now) + '.png');

      Surf := TBitmapSurface.Create;
      try
        Surf.Assign(Bmp);
        ImageStream := TFileStream.Create(caminhoArquivo, fmCreate);
        try
          TBitmapCodecManager.SaveToStream(ImageStream, Surf, '.png');
        finally
          ImageStream.Free;
        end;
      finally
        Surf.Free;
      end;

      // Abre a imagem gerada
      FileObj := TJFile.JavaClass.init(StringToJString(caminhoArquivo));
      Uri := TJFileProvider.JavaClass.getUriForFile(
        TAndroidHelper.Context,
        StringToJString(JStringToString(TAndroidHelper.Context.getPackageName) + '.fileprovider'),
        FileObj
      );

      Intent := TJIntent.Create;
      Intent.setAction(TJIntent.JavaClass.ACTION_VIEW);
      Intent.setDataAndType(Uri, StringToJString('image/png'));
      Intent.addFlags(TJIntent.JavaClass.FLAG_GRANT_READ_URI_PERMISSION);
      TAndroidHelper.Context.startActivity(Intent);
    finally
      Bmp.Free;
      qrBmp.Free;
    end;
  finally
    linhas.Free;
  end;
  {$ENDIF}
end;




procedure TfmrPrincipal.SetStatusBarColorBoreal;
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

procedure TfmrPrincipal.Soltar(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  //Devolver cor anterior ai clique
  try
    if dmoApp.ejoCod = TRectangle(Sender).Tag  then
      TRectangle(Sender).Fill.Color:= $FFAAB4D0
    else
      TRectangle(Sender).Fill.Color:= $FFFFFFFF;
  except
  end;
end;

procedure TfmrPrincipal.SoltarMouseLeave(Sender: TObject);
begin
  //Devolver cor anterior ai clique
  try
    if ejoCod = TRectangle(Sender).Tag  then
      TRectangle(Sender).Fill.Color:= Cor;
  except
  end;
end;

procedure TfmrPrincipal.tcoPrincipalChange(Sender: TObject);
begin
if (dmoAPP.usuBancoDeDados = 'serpa') then
    imgPlaca.Visible:= (tcoPrincipal.ActiveTab = titHome);
end;

procedure TfmrPrincipal.ListarEventos;
begin
  TThread.CreateAnonymousThread(
  procedure()
  var
    jsonObj: TJsonObject;
    jsonRecord: TJsonObject;
    jsonArray: TJSONArray;
    json: String;
    recEvento, recEventoAjuste: TRectangle;
    txtEvento, txtEventoAjuste: TLabel;
    imgIcone, imgIconeAjuste: TImage;
    i: Integer;
  begin
    with qry do
    begin
      Close;
      SQL.Text := 'SELECT * FROM EventosJornada ORDER BY ejoCodigoDiario';
      Open;

      if (RecordCount = 0) or dmoAPP.BaixarEventosNovamente then
      begin
        dmoApp.Conn.StartTransaction;
        try
          Close;
          SQL.Text := 'DELETE FROM EventosJornada';
          ExecSQL;

          RESTRequestE.Resource := 'EventosJornadaAplicativo2';
          RESTRequestE.Params.Clear;
          RESTRequestE.AddParameter('usuBancoDeDados', dmoApp.usuBancoDeDados);
          RESTRequestE.AddParameter('funCod', IntToStr(dmoApp.funCod));
          RESTRequestE.Execute;

          json := RESTRequestE.Response.JSONValue.ToString;
          jsonObj := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(json), 0) as TJsonObject;
          try
            jsonArray := jsonObj.Values['EventosJornada'] as TJSONArray;
            for i := 0 to jsonArray.Count - 1 do
            begin
              jsonRecord := jsonArray.Items[i] as TJsonObject;
              Close;
              SQL.Text := 'INSERT INTO EventosJornada (ejoCod, ejoDescricao, ejoCodigoDiario, ejoJornada, ejoDirecao, ejoEspera, ejoPausa, ejoRefeicao, ejoPernoite, ejoBatePonto, ejoAplicativo) ' +
                          'VALUES(:PejoCod, :PejoDescricao, :PejoCodigoDiario, :PejoJornada, :PejoDirecao, :PejoEspera, :PejoPausa, :PejoRefeicao, :PejoPernoite, :PejoBatePonto, :PejoAplicativo)';
              ParamByName('PejoCod').AsInteger := StrToInt(jsonRecord.GetValue('ejoCod').Value);
              ParamByName('PejoDescricao').AsString := jsonRecord.GetValue('ejoDescricao').Value;
              ParamByName('PejoCodigoDiario').AsInteger := StrToInt(jsonRecord.GetValue('ejoCodigoDiario').Value);
              ParamByName('PejoJornada').AsBoolean := StrToBool(jsonRecord.GetValue('ejoJornada').Value);
              ParamByName('PejoDirecao').AsBoolean := StrToBool(jsonRecord.GetValue('ejoDirecao').Value);
              ParamByName('PejoEspera').AsBoolean := StrToBool(jsonRecord.GetValue('ejoEspera').Value);
              ParamByName('PejoPausa').AsBoolean := StrToBool(jsonRecord.GetValue('ejoPausa').Value);
              ParamByName('PejoRefeicao').AsBoolean := StrToBool(jsonRecord.GetValue('ejoRefeicao').Value);
              ParamByName('PejoPernoite').AsBoolean := StrToBool(jsonRecord.GetValue('ejoPernoite').Value);
              ParamByName('PejoBatePonto').AsBoolean := StrToBool(jsonRecord.GetValue('ejoBatePonto').Value);
              ParamByName('PejoAplicativo').AsBoolean := StrToBool(jsonRecord.GetValue('ejoAplicativo').Value);
              ExecSQL;
            end;
          finally
            jsonObj.Free;
          end;
          dmoApp.Conn.Commit;
        except
          dmoApp.Conn.Rollback;
          if not dmoAPP.BaixarEventosNovamente then
          begin
            TThread.Synchronize(TThread.CurrentThread,
            procedure
            begin
              msg1.Aviso('Falha de conexão', 'Verifique sua conexão e tente novamente mais tarde.');
            end);
          end;
          Exit;
        end;
      end;

      dmoApp.ejoPernoite := 999;
      dmoApp.ejoPernoite2 := 999;
      dmoApp.ejoAbastecimento := 999;
      dmoApp.ejoRefeicao := 999;
      dmoApp.ejoDirecao := 999;

      Close;
      SQL.Text := 'SELECT * FROM EventosJornada ORDER BY ejoCodigoDiario';
      Open;
      First;

      try
        TThread.Synchronize(TThread.CurrentThread,
        procedure
        begin
          recEventosJornada.Controls.Clear;
          recJornadaAjuste.Controls.Clear;
        end);

        dmoAPP.PosY := 0;
        while not Eof do
        begin
          TThread.Synchronize(TThread.CurrentThread,
          procedure()
          var
            ejoCod: Integer;
            ejoDesc: string;
            texto: string;
          begin
            ejoCod := FieldByName('ejoCod').AsInteger;
            ejoDesc := FieldByName('ejoDescricao').AsString;
            texto := ejoDesc;

            if FieldByName('ejoPernoite').AsBoolean and (dmoApp.ejoPernoite2 = 999) then
              dmoApp.ejoPernoite2 := ejoCod;
            if FieldByName('ejoPernoite').AsBoolean then
              dmoApp.ejoPernoite := ejoCod;
            if FieldByName('ejoRefeicao').AsBoolean then
              dmoApp.ejoRefeicao := ejoCod;
            if FieldByName('ejoDirecao').AsBoolean then
              dmoApp.ejoDirecao := ejoCod;

            recEvento := TRectangle.Create(recEventosJornada);
            recEvento.Parent := recEventosJornada;
            recEvento.XRadius := 30;
            recEvento.YRadius := 30;
            recEvento.Height := Round(recEventosJornada.Height / RecordCount);
            recEvento.Width := recEventosJornada.Width;
            recEvento.Position.Y := recEvento.Height * dmoAPP.PosY;
            recEvento.Margins.Top := -1;
            recEvento.Margins.Left := -1;
            recEvento.Margins.Right := -1;
            recEvento.Fill.Color := $FFFFFFFF;
            recEvento.Stroke.Color := $00EBEBEB;
            recEvento.Tag := ejoCod;
            recEvento.TagString := ejoDesc;

            imgIcone := TImage.Create(recEvento);
            imgIcone.Parent := recEvento;
            imgIcone.Align := TAlignLayout.Left;
            imgIcone.Width := 32;
            imgIcone.Margins.Left := 20;
            imgIcone.Margins.Right := 20;
            imgIcone.MarginWrapMode := TImageWrapMode.Center;
            imgIcone.HitTest := False;

            if FieldByName('ejoJornada').AsBoolean and not FieldByName('ejoDirecao').AsBoolean then
              imgIcone.Bitmap.LoadFromFile(TPath.Combine(TPath.GetDocumentsPath, 'trabalhoNN.png'));
            if FieldByName('ejoDirecao').AsBoolean then
              imgIcone.Bitmap.LoadFromFile(TPath.Combine(TPath.GetDocumentsPath, 'direcaoNN.png'));
            if FieldByName('ejoEspera').AsBoolean then
              imgIcone.Bitmap.LoadFromFile(TPath.Combine(TPath.GetDocumentsPath, 'esperaNN.png'));
            if FieldByName('ejoPausa').AsBoolean then
              imgIcone.Bitmap.LoadFromFile(TPath.Combine(TPath.GetDocumentsPath, 'pausaNN.png'));
            if FieldByName('ejoRefeicao').AsBoolean then
              imgIcone.Bitmap.LoadFromFile(TPath.Combine(TPath.GetDocumentsPath, 'refeicaoNN.png'));
            if FieldByName('ejoPernoite').AsBoolean then
              imgIcone.Bitmap.LoadFromFile(TPath.Combine(TPath.GetDocumentsPath, 'pernoiteNN.png'));

            txtEvento := TLabel.Create(recEvento);
            txtEvento.Parent := recEvento;
            txtEvento.Align := TAlignLayout.Client;
            txtEvento.AutoSize := False;
            txtEvento.Text := texto;
            txtEvento.TextSettings.HorzAlign := TTextAlign.Leading;
            txtEvento.TextSettings.VertAlign := TTextAlign.Center;
            txtEvento.HitTest := False;

            if Copy(txtEvento.Text, 1, 1) = '#' then
            begin
              txtEvento.Text := txtEvento.Text.Substring(1);
              imgIcone.Opacity := 0;
            end;

            recEvento.OnMouseDown := CLicar;
            recEvento.OnMouseUp := Soltar;
            recEvento.OnMouseLeave := SoltarMouseLeave;
            recEvento.OnClick := EnviarEvento;

            // Ajuste
            recEventoAjuste := TRectangle.Create(recJornadaAjuste);
            recEventoAjuste.Parent := recJornadaAjuste;
            recEventoAjuste.XRadius := 30;
            recEventoAjuste.YRadius := 30;
            recEventoAjuste.Height := Round(recJornadaAjuste.Height / RecordCount);
            recEventoAjuste.Width := recJornadaAjuste.Width;
            recEventoAjuste.Position.Y := recEventoAjuste.Height * dmoAPP.PosY;
            recEventoAjuste.Margins.Top := -1;
            recEventoAjuste.Margins.Left := -1;
            recEventoAjuste.Margins.Right := -1;
            recEventoAjuste.Fill.Color := $FFFFFFFF;
            recEventoAjuste.Stroke.Color := $00EBEBEB;
            recEventoAjuste.Tag := ejoCod;
            recEventoAjuste.TagString := ejoDesc;

            imgIconeAjuste := TImage.Create(recEventoAjuste);
            imgIconeAjuste.Parent := recEventoAjuste;
            imgIconeAjuste.Align := TAlignLayout.Left;
            imgIconeAjuste.Width := 32;
            imgIconeAjuste.Margins.Left := 20;
            imgIconeAjuste.Margins.Right := 20;
            imgIconeAjuste.MarginWrapMode := TImageWrapMode.Center;
            imgIconeAjuste.HitTest := False;

            if FieldByName('ejoJornada').AsBoolean and not FieldByName('ejoDirecao').AsBoolean then
              imgIconeAjuste.Bitmap.LoadFromFile(TPath.Combine(TPath.GetDocumentsPath, 'trabalhoNN.png'));
            if FieldByName('ejoDirecao').AsBoolean then
              imgIconeAjuste.Bitmap.LoadFromFile(TPath.Combine(TPath.GetDocumentsPath, 'direcaoNN.png'));
            if FieldByName('ejoEspera').AsBoolean then
              imgIconeAjuste.Bitmap.LoadFromFile(TPath.Combine(TPath.GetDocumentsPath, 'esperaNN.png'));
            if FieldByName('ejoPausa').AsBoolean then
              imgIconeAjuste.Bitmap.LoadFromFile(TPath.Combine(TPath.GetDocumentsPath, 'pausaNN.png'));
            if FieldByName('ejoRefeicao').AsBoolean then
              imgIconeAjuste.Bitmap.LoadFromFile(TPath.Combine(TPath.GetDocumentsPath, 'refeicaoNN.png'));
            if FieldByName('ejoPernoite').AsBoolean then
              imgIconeAjuste.Bitmap.LoadFromFile(TPath.Combine(TPath.GetDocumentsPath, 'pernoiteNN.png'));

            txtEventoAjuste := TLabel.Create(recEventoAjuste);
            txtEventoAjuste.Parent := recEventoAjuste;
            txtEventoAjuste.Align := TAlignLayout.Client;
            txtEventoAjuste.AutoSize := False;
            txtEventoAjuste.Text := texto;
            txtEventoAjuste.TextSettings.HorzAlign := TTextAlign.Leading;
            txtEventoAjuste.TextSettings.VertAlign := TTextAlign.Center;
            txtEventoAjuste.HitTest := False;

            if Copy(txtEventoAjuste.Text, 1, 1) = '#' then
            begin
              txtEventoAjuste.Text := txtEventoAjuste.Text.Substring(1);
              imgIconeAjuste.Opacity := 0;
            end;

            recEventoAjuste.OnMouseDown := CLicar;
            recEventoAjuste.OnMouseUp := Soltar;
            recEventoAjuste.OnMouseLeave := SoltarMouseLeave;
            recEventoAjuste.OnClick := EnviarAjuste;
          end);

          Inc(dmoAPP.PosY);
          Next;
        end;
      finally
        dmoAPP.Sincronizar;
        TThread.Synchronize(TThread.CurrentThread,
        procedure()
        begin
          if dmoAPP.BaixarEventosNovamente then
          begin
            Carregar(False);
            dmoAPP.BaixarEventosNovamente := False;
          end
          else
            MensagemNova;
        end);
      end;
    end;
  end).Start;
end;

procedure TfmrPrincipal.lviHistoricoItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  dmoApp.revEjoCod:= TListItemImage(AItem.Objects.FindDrawable('imgVendedor')).TagString;
  dmoApp.revJorDataHora:= TListItemText(AItem.Objects.FindDrawable('txtNome')).TagString;
  dmoApp.revJorObservacao:=  TListItemText(AItem.Objects.FindDrawable('txtEmail')).TagString;
end;

procedure TfmrPrincipal.lviHistoricoItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
  var
  AItem: TListViewItem;
begin
if (ItemObject <> nil) and ItemObject.Name.Equals('btnReenviar') then
begin
  Carregar(True);
  Timer.Enabled := False;

  TThread.CreateAnonymousThread(
    procedure()
    var
      json, Codigo, jorLat, jorLon: String;
      qryJ, qryBusca: TFDQuery;
      tentativas: Integer;
    begin
      try
        if dmoAPP.ChecarConexao then
        begin
          // retentativas para envio em internet fraca
          tentativas := 0;
          repeat
            try
              dmoAPP.RestRequest.Resource := 'EnviarJornada';
              dmoAPP.RestRequest.Params.Clear;
              dmoAPP.RestRequest.AddParameter('usuBancoDeDados', dmoAPP.usuBancoDeDados);
              dmoAPP.RestRequest.AddParameter('funCod', IntToStr(dmoAPP.funCod));
              dmoAPP.RestRequest.AddParameter('jorDataHora', dmoAPP.revJorDataHora);
              dmoAPP.RestRequest.AddParameter('ejoCod', dmoAPP.revEjoCod);
              dmoAPP.RestRequest.AddParameter('jorObservacao', dmoAPP.revJorObservacao);
              dmoAPP.RestRequest.AddParameter('jorLatitude', 'NaN');
              dmoAPP.RestRequest.AddParameter('jorLongitude', 'NaN');
              dmoAPP.RestRequest.Execute;

              json := dmoAPP.RestRequest.Response.JSONValue.ToString;
              Codigo := Copy(json, 12, 1);

              if (Codigo = '1') or (Codigo = '3') then
              begin
                qryJ := TFDQuery.Create(nil);
                try
                  qryJ.Connection := dmoAPP.Conn;
                  qryJ.SQL.Text :=
                    'UPDATE Jornada SET jorSincronizado = TRUE ' +
                    'WHERE TRIM(strftime(''%Y-%m-%d %H:%M'', jorDataHora)) = :pJorDataHora AND funCod = :pFunCod';
                  qryJ.ParamByName('pJorDataHora').AsString := Trim(dmoAPP.revJorDataHora);
                  qryJ.ParamByName('pFunCod').AsInteger := dmoAPP.funCod;
                  qryJ.ExecSQL;
                finally
                  qryJ.Free;
                end;

                TThread.Synchronize(nil,
                  procedure
                  begin
                    if Assigned(ItemObject) and (ItemObject.Name = 'btnReenviar') then
                    begin
                      var btn := TListItemTextButton(ItemObject);
                      btn.Visible := False;
                    end;
                  end);
              end
              else
              begin
                TThread.Synchronize(nil,
                  procedure
                  begin
                    msg1.Aviso('Atenção', 'Não foi possível enviar a marcação. Servidor respondeu: ' + json);
                    Carregar(False);
                  end);
              end;

              Break; // sucesso, sai do retry

            except
              on E: Exception do
              begin
                Inc(tentativas);
                if tentativas >= 3 then
                begin
                  TThread.Synchronize(nil,
                    procedure
                    begin
                      msg1.Aviso('Erro ao reenviar', 'Tentativas esgotadas. Erro: ' + E.Message);
                      Carregar(False);
                    end);
                  Break;
                end;
                Sleep(3000); // espera entre tentativas
              end;
            end;
          until tentativas >= 3;
        end
        else
        begin
          TThread.Synchronize(nil,
            procedure
            begin
              msg1.Aviso('Erro de conexão', 'Você pode estar sem conexão com a internet ou a conexão está muito fraca. Tente novamente mais tarde.');
              Carregar(False);
            end);
        end;
      finally
        TThread.Synchronize(nil,
          procedure
          begin
            Timer.Enabled := True;
          end);
      end;
    end).Start;
end;
  if (ItemObject <> nil) and ItemObject.Name.Equals('btnExportar') then
  begin
    var btn := TListItemTextButton(ItemObject);
    if Assigned(btn.TagObject) and (btn.TagObject is TListViewItem) then
    begin
      AItem := TListViewItem(btn.TagObject);
      msg1.Pergunta('Confirmação', 'Deseja exportar esse registro?',
        procedure
        begin
          ExportarComprovanteDeItemComoImagem(AItem);
        end);
    end;
  end;
end;

procedure TfmrPrincipal.lviHistoricoPullRefresh(Sender: TObject);
begin
  CarregarHistorico;
end;

procedure TfmrPrincipal.recAjusteMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  tcoPrincipal.ActiveTab:= titAjuste;
  recHome.Fill.Color:= $FF150B36;
  recHistorico.Fill.Color:= $FF150B36;
  recDados.Fill.Color:= $FF150B36;
  recChat.Fill.Color:= $FF150B36;
  recAjuste.Fill.Color:= $FF251264;
  panDataHora.Visible:= False;
  recJornadaAjuste.Visible:= True;
  tedHora.Time:= StrToTime('00:00');
end;

procedure TfmrPrincipal.recAtualizarEventosClick(Sender: TObject);
begin
  Carregar(True);
  recAtualizarEventos.Enabled:= False;
  TThread.CreateAnonymousThread(
  procedure()
  begin
    if dmoAPP.ChecarConexao then
    begin
      dmoAPP.BaixarEventosNovamente:= True;
      ListarEventos;
    end
    else
    begin
      TThread.Synchronize(TThread.CurrentThread,
      procedure()
      begin
        msg1.Aviso('Erro de conexão', 'Você precisa estar conectado a internet para atualizar o layout do aplicativo.');
      end);
    end;
  end).Start;
end;

procedure TfmrPrincipal.recChatMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  recChat.Tag:= 99;
  tcoPrincipal.ActiveTab:= titChat;
  recHome.Fill.Color:= $FF150B36;
  recHistorico.Fill.Color:= $FF150B36;
  recDados.Fill.Color:= $FF150B36;
  recChat.Fill.Color:= $FF251264;
  recAjuste.Fill.Color:= $FF150B36;
  if not JaCarregouMensagens then
  begin
    CarregarMensagens;
    JaCarregouMensagens:= False;
  end;
end;

procedure TfmrPrincipal.recDadosMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  labFunNome.Text:= dmoAPP.usuNome;
  labFunCPF.Text:= dmoAPP.usuCPF;
  labCarDescricao.Text:= dmoAPP.carDescricao;
  labFilDescricao.Text:= dmoAPP.filDescricao;
  labFilRazaoSocial.Text:= dmoAPP.filRazaoSocial;
  labFilCNPJ.Text:= dmoAPP.filCNPJ;
  labFilInscricaoEstadual.Text:= dmoAPP.filInscricaoEstadual;
  labIdentificacao.Text:= dmoAPP.DeviceID;
  tcoPrincipal.ActiveTab:= titDados;
  recHome.Fill.Color:= $FF150B36;
  recHistorico.Fill.Color:= $FF150B36;
  recDados.Fill.Color:= $FF251264;
  recChat.Fill.Color:= $FF150B36;
  recAjuste.Fill.Color:= $FF150B36;
end;

procedure TfmrPrincipal.recHistoricoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  tcoPrincipal.ActiveTab:= titHistorico;
  dmoAPP.AtualizaHistorico := False;
  recHome.Fill.Color:= $FF150B36;
  recHistorico.Fill.Color:= $FF251264;
  recDados.Fill.Color:= $FF150B36;
  recChat.Fill.Color:= $FF150B36;
  recAjuste.Fill.Color:= $FF150B36;
  CarregarHistorico;
end;

procedure TfmrPrincipal.recHomeMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  recPlaca.Visible:= False;
  recEventosJornada.Visible:= True;
  tcoPrincipal.ActiveTab:= titHome;
  recHome.Fill.Color:= $FF251264;
  recHistorico.Fill.Color:= $FF150B36;
  recDados.Fill.Color:= $FF150B36;
  recChat.Fill.Color:= $FF150B36;
  recAjuste.Fill.Color:= $FF150B36;
  recPlaca.Visible:= False;
end;

procedure TfmrPrincipal.recSairClick(Sender: TObject);
begin
  msg1.Pergunta('Sair do APP', 'Deseja sair do APP? Ao usar essa opção, todos os seus dados serão apagados deste telefone.',
  procedure
  begin
    with qry do
    begin
      Close;
      SQL.Clear;
      SQL.Add('DELETE FROM Usuario');
      ExecSQL;
    end;
    dmoAPP.Logado:= False;
    dmoAPP.SenhaAtualizada:= False;
    dmoApp.jorDataHora:= 0;
    dmoApp.EjoCod:= 0;
    fmrLogin:= TfmrLogin.Create(Application);
    Application.MainForm:= fmrLogin;
    fmrLogin.Tag:= 99;
    dmoAPP.Tag:=99;
    dmoAPP.DispositivoNaoAutorizado:= False;
    fmrLogin.Show;
  end);
end;

procedure TfmrPrincipal.recSairMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  TRectangle(Sender).Fill.Color := $FFE0E0E0;
end;

procedure TfmrPrincipal.recSairMouseLeave(Sender: TObject);
begin
  TRectangle(Sender).Fill.Color := $FFFFFFF;
end;

procedure TfmrPrincipal.recSairMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  TRectangle(Sender).Fill.Color := $FFFFFFF;
end;

procedure TfmrPrincipal.recLimparCacheClick(Sender: TObject);
begin
  {$IFDEF Android}
  msg1.Pergunta('Limpeza de cache', 'Use apenas se for solicitado pela sua empresa. Deseja continuar?',
  procedure
  var
    CacheDir: string;
  begin
    CacheDir := JStringToString(TJContextWrapper.Wrap(TAndroidHelper.Context).getCacheDir.getAbsolutePath);
    if TDirectory.Exists(CacheDir) then
      TDirectory.Delete(CacheDir, True); // True = recursivo
  end);
  {$ENDIF}
end;

procedure TfmrPrincipal.recReenviarTodosClick(Sender: TObject);
begin
  msg1.Pergunta('Reenviar todos os eventos', 'Use apenas se for solicitado pela sua empresa. Deseja continuar?',
  procedure
  begin
    with qry do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Jornada SET jorSincronizado = False');
      ExecSQL;
    end;
  end);
end;

procedure TfmrPrincipal.sboPlacaFilter(Sender: TObject; const AFilter,
  AValue: string; var Accept: Boolean);
begin
  Accept:= AValue.StartsWith(Afilter, true);
end;

procedure TfmrPrincipal.rreAtualizarPlacaClick(Sender: TObject);
begin
  msg1.Pergunta('Download do cadastro', 'Deseja realizar o download das placas do seu empregador? Você precisa estar conectado a internet',
  procedure
  begin
    Carregar(True);
    TThread.CreateAnonymousThread(
    procedure()
    var
      jsonObj, jsonRecord: TJsonObject;
      json: String;
      jsonArray: TJSONArray;
      i: Integer;
    begin
      with qry do
      begin
        if dmoAPP.ChecarConexao then
        begin
          Close;
          SQL.Clear;
          SQL.Add('DELETE FROM Veiculo');
          ExecSQL;
          try
            RESTRequestV.Resource:= 'ReceberPlaca';
            RESTRequestV.Params.Clear;
            RESTRequestV.AddParameter('usuBancoDeDados', dmoApp.usuBancoDeDados);
            RESTRequestV.Execute;
          except
            TThread.Synchronize(TThread.CurrentThread,
            procedure()
            begin
              msg1.Aviso('Erro de conexão', 'Verifique sua conexão com a internet e tente novamente mais tarde');
              Carregar(False);
            end);
            exit;
          end;
          json:= RESTRequestV.Response.JSONValue.ToString;
          jsonObj:= TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(json),0) as TJsonObject;
          jsonArray:= TJSONArray(jsonObj.Values['ReceberPlaca']);
          for i := 0 to Pred(jsonArray.Count) do
          begin
            jsonRecord:= TJSONObject(jsonArray.Items[i]);
            Close;
            SQL.Clear;
            SQL.Add('INSERT INTO Veiculo');
            SQL.Add('(veiPlaca)');
            SQL.Add('VALUES(:pVeiPlaca)');
            ParamByName('PveiPlaca').Text:= jsonRecord.GetValue('veiPlaca').Value;
            ExecSQL;
          end;
        end
        else
        begin
          TThread.Synchronize(TThread.CurrentThread,
          procedure()
          begin
            msg1.Aviso('Erro de conexão', 'Verifique sua conexão com a internet e tente novamente mais tarde');
            Carregar(False);
          end);
        end;
      end;
      TThread.Synchronize(TThread.CurrentThread,
      procedure()
      begin
        msg1.Sucesso('Sucesso', 'O cadastro de veículos foi atualizado com sucesso.');
        Carregar(False);
      end);
    end).Start;
  end);
end;

procedure TfmrPrincipal.rreCancelarClick(Sender: TObject);
begin
  recPlaca.Visible:= False;
  recEventosJornada.Visible:= True;
  cboVeiPlaca.Text:= '';
end;

procedure TfmrPrincipal.rrePlacaClick(Sender: TObject);
begin
  TThread.CreateAnonymousThread(
  procedure()
  Var
    Placa, Equipamento: string;
    qryPlaca: TFDQuery;
  begin
    //VALIDAR SE A PLACA É VÁLIDA
    Placa:= StringReplace(Trim(cboVeiPlaca.Text), ' ', '', [rfReplaceAll]);
    if placa = '' then
    begin
      TThread.Synchronize(TThread.CurrentThread,
      procedure()
      begin
        msg1.Aviso('Aviso', 'Você deve informar uma placa válida. Digite a placa do veículo com 7 caracteres sem espaços.');
      end);
      Exit;
    end;
    if Length(placa) <> 7 then
    begin
      TThread.Synchronize(TThread.CurrentThread,
      procedure()
      begin
        msg1.Aviso('Aviso', 'Placa inválida. Você deve informar uma placa válida. Digite a placa do veículo com 7 caracteres sem espaços.');
      end);
      Exit;
    end;
    if (dmoApp.usuBancoDeDados = 'serpa') then
    begin
      with qry do
      begin
        Close;
        SQL.Clear;
        SQL.Text:=
          'SELECT * FROM Veiculo';
        Open;
        if RecordCount = 0 then
        begin
          TThread.Synchronize(TThread.CurrentThread,
          procedure()
          begin
            msg1.Aviso('Aviso', 'Clique em "Atualizar placas", com acesso à internet, antes de inserir o veículo');
          end);
          Exit;
        end
      end;
      with qry do
      begin
        Close;
        SQL.Clear;
        SQL.Text:=
          'SELECT * FROM Veiculo WHERE veiPlaca LIKE ' + QuotedStr(placa);
        Open;
        if RecordCount = 0 then
        begin
          TThread.Synchronize(TThread.CurrentThread,
          procedure()
          begin
            msg1.Aviso('Aviso', 'Placa incorreta ou não encontrada. Digite a placa do veículo com 7 caracteres sem espaços.');
          end);
          Exit;
        end
        else
        //ENVIAR A PLACA
        try
          Inc(qtdClique);
          if qtdClique < 2 then
          begin
            //Advertir
            TThread.Synchronize(TThread.CurrentThread,
            procedure()
            begin
              msg1.Pergunta(cboVeiPlaca.Text, 'Você confirma que está assumindo o veículo: ' + cboVeiPlaca.Text +  '?',
              procedure
              begin
                TThread.CreateAnonymousThread(
                procedure()
                var
                  qryPlaca: TFDQuery;
                begin
                  qryPlaca:= TFDQuery.Create(nil);
                  qryPlaca.Connection:= dmoAPP.Conn;
                  try
                    //Salvar no SQLite
                    with qryPlaca do
                    begin
                      Close;
                      SQL.Clear;
                      SQL.Add('INSERT INTO Jornada');
                      SQL.Add('(funCod, jorDataHora, ejoCod, jorObservacao, jorLatitude, jorLongitude, jorSincronizado)');
                      SQL.Add('VALUES(:PfunCod, :PjorDataHora, (SELECT MIN(ejoCod) FROM EventosJornada), :PjorObservacao, :PjorLatitude, :PjorLongitude, :PjorSincronizado)');
                      ParamByName('PfunCod').Value:= dmoApp.funCod;
                      if trim(dmoAPP.usuBancoDeDados) = 'rodobelo' then
                        ParamByName('PjorDataHora').Value:= TDateTime(TTimeZone.Local.ToUniversalTime(Now) - StrToTime('04:00:00'))
                      else
                        ParamByName('PjorDataHora').Value:= Now;
                      if (dmoAPP.usuBancoDeDados = 'sigma') or (dmoAPP.usuBancoDeDados = 'WebDesenvolvimento') then
                         ParamByName('PjorObservacao').Text:= 'placa' + cboVeiPlaca.Text + Equipamento
                      else
                         ParamByName('PjorObservacao').Text:= 'placa' + cboVeiPlaca.Text;
                      ParamByName('PjorLatitude').Text:= 'n.a.';
                      ParamByName('PjorLongitude').Text:= 'n.a.';
                      ParamByName('PjorSincronizado').Value:= False;
                      ExecSQL;
                      TThread.Synchronize(TThread.CurrentThread,
                      procedure()
                      begin
                        //MARCAR O PONTO (SERPA)
                        if (dmoAPP.usuBancoDeDados = 'serpa') then
                        begin
                          recPlaca.Visible:= False;
                          recEventosJornada.Visible:= True;
                          tcoPrincipal.ActiveTab:= titHome;
                          recHome.Fill.Color:= $FF251264;
                          recHistorico.Fill.Color:= $FF150B36;
                          recDados.Fill.Color:= $FF150B36;
                          recChat.Fill.Color:= $FF150B36;
                          recAjuste.Fill.Color:= $FF150B36;
                          recPlaca.Visible:= False;
                          dmoApp.jorDataHora:= Now;
                          dmoApp.EjoCod:= aTag;
                          MarcarPonto('1');
                        end
                        else
                        begin
                          tcoPrincipal.ActiveTab:= titHistorico;
                          recHome.Fill.Color:= $FF150B36;
                          recHistorico.Fill.Color:= $FF251264;
                          recDados.Fill.Color:= $FF150B36;
                          recChat.Fill.Color:= $FF150B36;
                          recAjuste.Fill.Color:= $FF150B36;
                          CarregarHistorico;
                        end;
                      end);
                    end;
                  finally
                    qryPlaca.DisposeOf;
                  end;
                end).Start;
              end);
            end);
          end;
          qtdClique:= 0;
        finally
          TThread.Synchronize(TThread.CurrentThread,
          procedure()
          begin
            recPlaca.Visible:= False;
            recEventosJornada.Visible:= True;
          end);
        end;
      end;
      exit;
    end;
    //ENVIAR A PLACA
    try
      Inc(qtdClique);
      if qtdClique < 2 then
      begin
        //Advertir
        TThread.Synchronize(TThread.CurrentThread,
        procedure()
        begin
          msg1.Pergunta(cboVeiPlaca.Text, 'Você confirma que está assumindo o veículo: ' + cboVeiPlaca.Text +  '?',
          procedure
          begin
            TThread.CreateAnonymousThread(
            procedure()
            var
              qryPlaca: TFDQuery;
            begin
              qryPlaca:= TFDQuery.Create(nil);
              qryPlaca.Connection:= dmoAPP.Conn;
              try
                if (dmoAPP.usuBancoDeDados = 'sigma') or (dmoAPP.usuBancoDeDados = 'WebDesenvolvimento') then
                begin
                  try
                    if cboEquipamento.ItemIndex > -1 then
                      Equipamento:=' <EQ>' + cboEquipamento.Selected.Text + '</EQ>'
                    else
                      Equipamento:=' <EQ>N/D.</EQ>';
                  except
                    Equipamento:=' <EQ>N/D.</EQ>';
                  end;
                end;
                //Salvar no SQLite
                with qryPlaca do
                begin
                  Close;
                  SQL.Clear;
                  SQL.Add('INSERT INTO Jornada');
                  SQL.Add('(funCod, jorDataHora, ejoCod, jorObservacao, jorLatitude, jorLongitude, jorSincronizado)');
                  SQL.Add('VALUES(:PfunCod, :PjorDataHora, (SELECT MIN(ejoCod) FROM EventosJornada), :PjorObservacao, :PjorLatitude, :PjorLongitude, :PjorSincronizado)');
                  ParamByName('PfunCod').Value:= dmoApp.funCod;
                  if trim(dmoAPP.usuBancoDeDados) = 'rodobelo' then
                    ParamByName('PjorDataHora').Value:= TDateTime(TTimeZone.Local.ToUniversalTime(Now) - StrToTime('04:00:00'))
                  else
                    ParamByName('PjorDataHora').Value:= Now;
                  if (dmoAPP.usuBancoDeDados = 'sigma') or (dmoAPP.usuBancoDeDados = 'WebDesenvolvimento') then
                     ParamByName('PjorObservacao').Text:= 'placa' + cboVeiPlaca.Text + Equipamento
                  else
                     ParamByName('PjorObservacao').Text:= 'placa' + cboVeiPlaca.Text;
                  ParamByName('PjorLatitude').Text:= 'n.a.';
                  ParamByName('PjorLongitude').Text:= 'n.a.';
                  ParamByName('PjorSincronizado').Value:= False;
                  ExecSQL;
                  TThread.Synchronize(TThread.CurrentThread,
                  procedure()
                  begin
                    //MARCAR O PONTO (SERPA)
                    if (dmoAPP.usuBancoDeDados = 'transpanorama') or (dmoAPP.usuBancoDeDados = 'transpanoramahomologacao') then
                    begin
                      recPlaca.Visible:= False;
                      recEventosJornada.Visible:= True;
                      tcoPrincipal.ActiveTab:= titHome;
                      recHome.Fill.Color:= $FF251264;
                      recHistorico.Fill.Color:= $FF150B36;
                      recDados.Fill.Color:= $FF150B36;
                      recChat.Fill.Color:= $FF150B36;
                      recAjuste.Fill.Color:= $FF150B36;
                      recPlaca.Visible:= False;
                      dmoApp.jorDataHora:= Now;
                      dmoApp.EjoCod:= aTag;
                      MarcarPonto('1');
                    end
                    else
                    begin
                      tcoPrincipal.ActiveTab:= titHistorico;
                      recHome.Fill.Color:= $FF150B36;
                      recHistorico.Fill.Color:= $FF251264;
                      recDados.Fill.Color:= $FF150B36;
                      recChat.Fill.Color:= $FF150B36;
                      recAjuste.Fill.Color:= $FF150B36;
                      CarregarHistorico;
                    end;
                  end);
                end;
              finally
                qryPlaca.DisposeOf;
              end;
            end).Start;
          end);
        end);
      end;
      qtdClique:= 0;
    finally
      TThread.Synchronize(TThread.CurrentThread,
      procedure()
      begin
        recPlaca.Visible:= False;
        recEventosJornada.Visible:= True;
      end);
    end;
  end).Start;
end;

procedure TfmrPrincipal.rreSincronizarClick(Sender: TObject);
begin
  Carregar(True);
  TThread.CreateAnonymousThread(
  procedure()
  var
    jsonObj: TJsonObject;
    jsonRecord: TJsonObject;
    jsonArray: TJSONArray;
    json: String;
    i:Integer;
  begin
    if not dmoAPP.ChecarConexao then
    begin
      msg1.Aviso('Falha de conexão', 'Verifique a sua conexão com a internet e tente novamente mais tarde');
      TThread.Synchronize(TThread.CurrentThread,
      procedure()
      begin
        Carregar(False);
      end);
      Exit;
    end;
    //Listando os eventos
    with qry do
    begin
      //Criar os componentes de conexão com a API
      RESTRequestE.Resource:= 'ReceberJornada';
      //Receber eventos da API
      try
        RESTRequestE.Params.Clear;
        RESTRequestE.AddParameter('usuBancoDeDados', dmoApp.usuBancoDeDados);
        RESTRequestE.AddParameter('funCod', IntToStr(dmoApp.funCod));
        RESTRequestE.Execute;
      except
        TThread.Synchronize(TThread.CurrentThread,
        procedure()
        begin
          msg1.Aviso('Falha de conexão', 'Verifique sua conexão e tente novamente mais tarde.');
        end);
        Exit;
      end;
      json:= RESTRequestE.Response.JSONValue.ToString;
      jsonObj:= TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(json),0) as TJsonObject;
      jsonArray:= TJSONArray(jsonObj.Values['ReceberJornada']);
      //Gravar eventos no SQLite
      for i := 0 to Pred(jsonArray.Count) do
      begin
        jsonRecord:= TJSONObject(jsonArray.Items[i]);
        Close;
        SQL.Clear;
        SQL.Add('SELECT ejoCod FROM Jornada WHERE funCod = :pFunCod AND TRIM(strftime(''%Y'', jorDataHora) || ''-'' || strftime(''%m'', jorDataHora) || ''-'' || strftime(''%d'', jorDataHora) || '' '' || strftime(''%H'', jorDataHora) || '':'' || strftime(''%M'', jorDataHora)) LIKE :pJorDataHora');
        ParamByName('pFunCod').Value:= dmoAPP.funCod;
        ParamByName('pJorDataHora').Text:= FormatDateTime('YYYY-MM-DD HH:MM', StrToDateTime(Trim(jsonRecord.GetValue('jorDataHora').Value)));
        Open;
        if RecordCount = 0 then
        begin
          Close;
          SQL.Clear;
          SQL.Add('INSERT INTO Jornada');
          SQL.Add('(funCod, jorDataHora, ejoCod, jorSincronizado)');
          SQL.Add('VALUES(:PfunCod, :PjorDataHora, :PejoCod, :PjorSincronizado)');
          ParamByName('PfunCod').Value:= dmoAPP.funCod;
          ParamByName('PjorDataHora').Value:= StrToDateTime(jsonRecord.GetValue('jorDataHora').Value);
          ParamByName('PejoCod').Value:= StrToInt(jsonRecord.GetValue('ejoCod').Value);
          ParamByName('PjorSincronizado').Value:= True;
          ExecSQL;
        end;
      end;
    end;
    TThread.Synchronize(TThread.CurrentThread,
    procedure()
    begin
      CarregarHistorico;
      Carregar(False);
    end);
  end).Start;
end;

//PUBLIC
function TfmrPrincipal.DataPorExtenso(dt: TDateTime): string;
  function NomeDoMes(i: word; tipo: integer): string;
  const mes: array[1..12] of string = ('janeiro', 'fevereiro',
     'março', 'abril', 'maio', 'junho', 'julho', 'agosto',
     'setembro', 'outubro', 'novembro', 'dezembro');
  begin
    if (tipo = 0)
       then NomeDoMes := mes[i] // extenso
    else NomeDoMes := copy(mes[i], 1, 3); // abreviado
  end;
  function DiaDaSemana(i: word; tipo: integer): string;
  const diasem: array[0..6] of string = ('Domingo', 'Segunda-Feira',
    'Terça-feira', 'Quarta-Feira', 'Quinta-Feira', 'Sexta-Feira',
    'Sábado');
begin
  DiaDaSemana := diasem[i] // extenso
end;

var d, m, a, ds: word;
begin
  DecodeDate(dt, a, m, d);
  ds := DayOfWeek(dt) - 1;
  DataPorExtenso:= DiaDaSemana(ds, 0) + ', ' + IntToStr(d) + ' de ' + NomeDoMes(m, 0) + ' de ' + IntToStr(a);
end;

function TfmrPrincipal.DuracaoJornada: Real;
var
  BuscarDuracao: TThread;
begin
  BuscarDuracao:= TThread.CreateAnonymousThread(
  procedure()
  var
    DataHoraBanco, DataHoraBancoP, DataHoraP, AnoP, MesP, DiaP, HoraP: String;
  begin
    Duracao:= 0;
    with qry do
    begin
      Close;
      SQL.Clear;
      SQL.Text:=
        'SELECT '+
        'jor.*, '+
        'COALESCE((SELECT MIN(sub.jorDataHora) FROM Jornada sub WHERE sub.funCod '+
        '= jor.funCod AND sub.jorDataHora > jor.jorDataHora AND not SUBSTR(sub.jorObservacao, 1, 5) like ' + QuotedStr('placa') + '), datetime(''now'', ''-3 hours'')) '+
        'AS jorDataHoraProximo, '+
        'ejo.ejoJornada, '+
        'ejo.ejoPernoite '+
        'FROM Jornada jor '+
        'INNER JOIN EventosJornada ejo ON (ejo.ejoCod = jor.ejoCod) '+
        'WHERE jor.jorDataHora > COALESCE((SELECT '+
        'MAX(sub.jorDataHora) '+
        'FROM Jornada sub '+
        'INNER JOIN EventosJornada ejo ON (ejo.ejoCod = sub.ejoCod) '+
        'WHERE sub.funCod = '+ IntToStr(dmoApp.funCod) + ' AND ejo.ejoPernoite), (SELECT DATE(''now'', ''-9 days''))) '+
        'AND not SUBSTR(jor.jorObservacao, 1, 5) like ' + QuotedStr('placa') + ' ' +
        'AND not SUBSTR(jor.jorObservacao, 1, 7) like ' + QuotedStr('#ajuste') + ' ' +
        'AND jor.funCod = '+ IntToStr(dmoApp.funCod);
      Open;
      First;
      while not eof do
      begin
        DataHoraBanco:= FieldByName('jorDataHora').Text;       //yyyy-mm-dd hh:mm:ss
        DataHoraBancoP:= FieldByName('jorDataHoraProximo').Text;       //yyyy-mm-dd hh:mm:ss
        AnoP:= copy(DataHoraBancoP, 1, 4);
        MesP:= copy(DataHoraBancoP, 6, 2);
        DiaP:= copy(DatahoraBancoP, 9, 2);
        HoraP:= copy(DataHoraBancoP, 12, 8);
        DataHoraP:= DiaP + '/' + MesP + '/' + AnoP + ' ' + HoraP;
        if FieldByName('ejoJornada').Value then
          Duracao:= Duracao + StrToDateTime(DataHoraP) - StrToDateTime(DataHoraBanco);
        next;
      end;
      Close;
    end;
  end);
  BuscarDuracao.Start;
  while not BuscarDuracao.Finished do
  begin
    //Não faz nada até a Thread acabar.
  end;
  Result:= Duracao;
end;
end.

