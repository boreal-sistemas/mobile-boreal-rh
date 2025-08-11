unit uFmrDM;

interface

uses
  {$IFDEF Android}
    Androidapi.JNI.Media, Androidapi.JNI.JavaTypes, Androidapi.Helpers, Androidapi.JNIBridge,
    Androidapi.JNI.Os, System.Permissions, FMX.DialogService, Androidapi.Jni,
  {$ENDIF}
//SYSTEM
  System.Classes, System.IOUtils,
  System.SysUtils, System.Net.URLClient, System.Net.HttpClientComponent,
  System.Net.HttpClient, System.JSON, System.NetEncoding,
//FIREDAC
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.FMXUI.Wait,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet,
//DATA
  Data.DB, Data.Bind.Components, Data.Bind.ObjectScope,
//REST
  REST.Types, REST.Client, REST.Authenticator.Basic, System.Sensors,
  System.Sensors.Components, System.DateUtils, FMX.Graphics, System.StrUtils;
type
  TdmoApp = class(TDataModule)
  LocationSensor: TLocationSensor;
  qry: TFDQuery;
  Conn: TFDConnection;
  HTTPBasicAuthenticator: THTTPBasicAuthenticator;
  RESTClient: TRESTClient;
  RESTRequest: TRESTRequest;
  HTTP: TNetHTTPClient;
    qryJ: TFDQuery;
  procedure ConnBeforeConnect(Sender: TObject);
  procedure LocationSensorLocationChanged(Sender: TObject; const OldLocation,
    NewLocation: TLocationCoord2D);
Public
  ThreadEmExecucao: boolean;
  EnviarSenha: Boolean;
  AtualizaHistorico: Boolean;
  BaixarEventosNovamente: Boolean;
  Posy: Integer;
  usuLogin: String;
  usuSenha: String;
  usuSenhaAnt: String;
  Logado, SenhaAtualizada: Boolean;
  usuNome: String;
  usuCPF: String;
  VersaoAPP: String;
  usuBancoDeDados: String;
  funCod: Integer;
  jorDataHora: TDateTime;
  ejoCod: Integer;
  vPrimeiroLogin: Boolean;
  ejoAbastecimento: Integer;
  ejoRefeicao: Integer;
  ejoDirecao: Integer;
  ejoPernoite: Integer;
  ejoPernoite2: Integer;
  DispositivoNaoAutorizado: Boolean;
  CienteJornada: Boolean;
  MensagemCienteJornada: String;
  filDescricao: String;
  filRazaoSocial: String;
  filCNPJ: String;
  filInscricaoEstadual: String;
  DeviceId: String;
  carDescricao: String;
  vJorTipo: Integer; //1 Jornada - 2 Não Jornada - 3 Pernoite;
  DataHoraInicioJornada: TDateTime;
  EstaEmJornada: Boolean;
  Latitude, Longitude: Double;
  revJorDataHora, revEjoCod, revJorObservacao: String;
  function ChecarConexao: Boolean;
  procedure Sincronizar;
  function GetDeviceID: String;
  function BytesToHex(const ABytes: TBytes): string;
  procedure LigarGPS;
end;

var
  dmoApp: TdmoApp;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

procedure TdmoApp.ConnBeforeConnect(Sender: TObject);
begin
  with conn do
  begin
    Params.Values['DriverID'] := 'SQLite';
    Params.Values['Database'] := TPath.Combine(TPath.GetDocumentsPath, 'AppBoreal.db');
    Params.Values['Server']:= '';
  end;
end;

function TdmoApp.GetDeviceID: String;
  {$IFDEF Android}
var
    wvDrm: JMediaDrm;
    str:String;
    UUID:JUUID;
    data: TJavaArray<Byte>;
    datab: TBytes;
    i:integer;
  {$ENDIF}

begin
  {$IFDEF Android}
  UUID:=TJUUID.JavaClass.fromString(stringtojstring('edef8ba9-79d6-4ace-a3c8-27dcd51d21ed'));
  wvDrm:= tJMediaDrm.JavaClass.init(UUID);
  try
    data:= wvDrm.getPropertyByteArray(TJMediaDrm.JavaClass.PROPERTY_DEVICE_UNIQUE_ID);
    if data <> nil then
    begin
      SetLength(datab, data.Length);
      for I := 0 to data.Length - 1 do
        datab[I] := data.Items[I];
      str:= BytesToHex(datab);
    end;
    result:=str;//length of str:64byte
  finally
    wvDrm.release;
  end;
  {$ENDIF}
  {$IFDEF IOS}
    result:= 'iPhone de ' + dmoApp.usuNome;
  {$ENDIF}
end;

procedure TdmoApp.LigarGPS;
  {$IFDEF Android}
    var
      FPermissGPS1,
      FPermissGPS2: String;
  {$ENDIF}
begin
  //GEOLOCALIZAÇÃO
  {$IFDEF Android}
    FPermissGPS1:= JStringToString(TJManifest_permission.JavaClass.ACCESS_FINE_LOCATION);
    FPermissGPS2:= JStringToString(TJManifest_permission.JavaClass.ACCESS_COARSE_LOCATION);
    PermissionsService.RequestPermissions([FPermissGPS1, FPermissGPS2], Nil, Nil);
  {$ENDIF}
  try
    LocationSensor.Active:= True;
  except
  end;
end;

procedure TdmoApp.LocationSensorLocationChanged(Sender: TObject;
  const OldLocation, NewLocation: TLocationCoord2D);
begin
  try
    {$IFDEF Android}
      Latitude:= LocationSensor.Sensor.Latitude;
      Longitude:= LocationSensor.Sensor.Longitude;
    {$ENDIF}
  except
    Latitude:= 0;
    Longitude:= 0;
  end;
end;

function TdmoApp.BytesToHex(const ABytes: TBytes): string;
var
  i: Integer;
begin
  Result:= '';
  for i:= Low(ABytes) to High(ABytes) do
    Result:= Result + IntToHex(ABytes[I], 2);
end;

function TdmoApp.ChecarConexao: Boolean;
begin
  try
    Result := (HTTP.Head('https://www.gstatic.com/generate_204').StatusCode < 400);
  except
    Result := False;
  end;
end;

procedure TdmoApp.Sincronizar;
begin
  TThread.CreateAnonymousThread(
    procedure()
    var
      json, Codigo: String;
    begin
      while true do
      begin
        Sleep(500);
        if DispositivoNaoAutorizado then
          Exit;

        ThreadEmExecucao:= False;
        qryJ.Close;
        qryJ.SQL.Text := 'SELECT * FROM Jornada WHERE NOT jorSincronizado ORDER BY jorDataHora';
        qryJ.Open;

        while not qryJ.eof do
        try
          ThreadEmExecucao:= True;
          RestRequest.Resource := 'EnviarJornada';
          RestRequest.Params.Clear;
          RestRequest.AddParameter('usuBancoDeDados', usuBancoDeDados);
          RestRequest.AddParameter('funCod', IntToStr(funCod));
          RestRequest.AddParameter('jorDataHora', FormatDateTime('yyyy-mm-dd hh:mm', qryJ.FieldByName('jorDataHora').AsDateTime));
          RestRequest.AddParameter('ejoCod', qryJ.FieldByName('ejoCod').AsString);
          RestRequest.AddParameter('jorObservacao', qryJ.FieldByName('jorObservacao').Text);
          RestRequest.AddParameter('jorLatitude', qryJ.FieldByName('jorLatitude').Text);
          RestRequest.AddParameter('jorLongitude', qryJ.FieldByName('jorLongitude').Text);
          RestRequest.Execute;

          json := RestRequest.Response.JSONValue.ToString;
          Codigo := Copy(json, 12, 1);

          if (Codigo = '1') or (Codigo = '3') then
          begin
            dmoApp.Conn.ExecSQL(
              'UPDATE Jornada SET jorSincronizado = TRUE WHERE funCod = :fun AND jorDataHora = :dt',
              [funCod, qryJ.FieldByName('jorDataHora').AsDateTime]);
            AtualizaHistorico := True;
            Break; // sucesso
          end
          else if (Codigo = '4') or (Codigo = '5') then
          begin
            DispositivoNaoAutorizado := True;
            Exit;
          end;
          qryJ.Next;
        except
          Sleep(1000); // espera entre tentativas
          qryJ.Next;
        end;
      end;
    end).Start;
end;

end.

