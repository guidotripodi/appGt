import 'package:swagger/api.dart';

class Client {

  static Client _instance;

  ApiClient _apiClient;

  UserApi _userApi;
  UserApi get userApi => _userApi;

  AdminApi _adminApi;
  AdminApi get adminApi => _adminApi;

  LocationApi _locationApi;
  LocationApi get locationApi => _locationApi;

  DiagnosticApi _diagnosticApi;
  DiagnosticApi get diagnosticApi => _diagnosticApi;

  CheckApi _checkApi;
  CheckApi get checkApi => _checkApi;

  Client._internal() {
    //Colocar aquí la dirección del servidor
    _apiClient = ApiClient(basePath: "https://yoestuveahi.herokuapp.com");

    _userApi = UserApi(_apiClient);
    _adminApi = AdminApi(_apiClient);
    _locationApi = LocationApi(_apiClient);
    _diagnosticApi = DiagnosticApi(_apiClient);
    _checkApi = CheckApi(_apiClient);
  }

  static Client getInstance() {
    if(_instance == null) {
      _instance = Client._internal();
    }
    return _instance;
  }

  String getBasePath() {
    return _apiClient.basePath;
  }

  void setAuthorization(String username, String password) {
    _apiClient.setAuthorization(username, password);
  }

}