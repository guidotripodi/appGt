part of swagger.api;



class CheckApi {
  final ApiClient apiClient;

  CheckApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  /// Checkin a locacion
  ///
  /// Registra la entrada de un usuario a una locacion
  Future userCheckinLocationIdPost(String locationId) async {
    Object postBody = null;

    // verify required params are set
    if(locationId == null) {
     throw new ApiException(400, "Missing required param: locationId");
    }

    // create path and map variables
    String path = "/user/checkin/{location_id}".replaceAll("{format}","json").replaceAll("{" + "location_id" + "}", locationId.toString());

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
  /// Hace checkout del usuario del ultimo lugar donde hizo checkin
  ///
  /// 
  Future userCheckoutPost() async {
    Object postBody = null;

    // verify required params are set

    // create path and map variables
    String path = "/user/checkout".replaceAll("{format}","json");

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
