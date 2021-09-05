part of swagger.api;



class DiagnosticApi {
  final ApiClient apiClient;

  DiagnosticApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  /// Le da el alta clinica a un usuario
  ///
  /// 
  Future userDiagnosticDateDelete(String date) async {
    Object postBody = null;

    // verify required params are set
    if(date == null) {
     throw new ApiException(400, "Missing required param: date");
    }

    // create path and map variables
    String path = "/user/diagnostic/{date}".replaceAll("{format}","json").replaceAll("{" + "date" + "}", date.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    
    List<String> contentTypes = [];

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = ["basicAuth"];

    if(contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      MultipartRequest mp = new MultipartRequest(null, null);
      if(hasFields)
        postBody = mp;
    }
    else {
          }

    var response = await apiClient.invokeAPI(path,
                                             'DELETE',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             contentType,
                                             authNames);

    if(response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if(response.body != null) {
      return
          ;
    } else {
      return ;
    }
  }
  /// Declara al usuario como infectado
  ///
  /// 
  Future userDiagnosticDatePost(String date) async {
    Object postBody = null;

    // verify required params are set
    if(date == null) {
     throw new ApiException(400, "Missing required param: date");
    }

    // create path and map variables
    String path = "/user/diagnostic/{date}".replaceAll("{format}","json").replaceAll("{" + "date" + "}", date.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    
    List<String> contentTypes = [];

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = ["basicAuth"];

    if(contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      MultipartRequest mp = new MultipartRequest(null, null);
      if(hasFields)
        postBody = mp;
    }
    else {
          }

    var response = await apiClient.invokeAPI(path,
                                             'POST',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             contentType,
                                             authNames);

    if(response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if(response.body != null) {
      return
          ;
    } else {
      return ;
    }
  }
}
