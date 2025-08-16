object dmoApp: TdmoApp
  Height = 291
  Width = 222
  object LocationSensor: TLocationSensor
    LocationChange = lctLarge
    ActivityType = Navigation
    UsageAuthorization = WhenInUse
    OnLocationChanged = LocationSensorLocationChanged
    Left = 80
    Top = 8
  end
  object qry: TFDQuery
    Connection = Conn
    Left = 11
    Top = 190
  end
  object Conn: TFDConnection
    Params.Strings = (
      'LockingMode=Normal'
      'DriverID=SQLite')
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockPoint, uvLockWait, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.UpdateChangedFields = False
    UpdateOptions.LockWait = True
    UpdateOptions.RefreshMode = rmManual
    UpdateOptions.FetchGeneratorsPoint = gpNone
    UpdateOptions.CheckRequired = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    TxOptions.AutoStop = False
    LoginPrompt = False
    BeforeConnect = connBeforeConnect
    Left = 12
    Top = 128
  end
  object HTTPBasicAuthenticator: THTTPBasicAuthenticator
    Username = 'admin'
    Password = 'BorealBr@80217220'
    Left = 56
    Top = 64
  end
  object RESTClient: TRESTClient
    Authenticator = HTTPBasicAuthenticator
    BaseURL = 'http://sistemaboreal.com.br:8070'
    Params = <>
    ConnectTimeout = 60000
    SynchronizedEvents = False
    Left = 160
    Top = 8
  end
  object RESTRequest: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient
    Method = rmPOST
    Params = <>
    SynchronizedEvents = False
    Left = 160
    Top = 64
  end
  object HTTP: TNetHTTPClient
    ConnectionTimeout = 4000
    SendTimeout = 4000
    ResponseTimeout = 4000
    UserAgent = 'Embarcadero URI Client/1.0'
    Left = 16
    Top = 8
  end
  object qryJ: TFDQuery
    Connection = Conn
    Left = 155
    Top = 174
  end
end
