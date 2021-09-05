part of swagger.api;



class LocationApi {
  final ApiClient apiClient;

  LocationApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  /// Devuelve un listado de las locaciones del usuario / del sistema si el usuario es el admin
  ///
  /// 
  Future<List<Location>> locationGet() async {
    Object postBody = null;

    // verify required params are set

    // create path and map variables
    String path = "/location".replaceAll("{format}","json");

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
                                             'GET',
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
          apiClient.deserialize(response.body, 'LocationList') as List<Location> ;
    } else {
      return null;
    }
  }
  /// Devuelve una locacion en su estado actual
  ///
  /// 
  Future<Location> locationLocationIdGet(String locationId) async {
    Object postBody = null;

    // verify required params are set
    if(locationId == null) {
     throw new ApiException(400, "Missing required param: locationId");
    }

    // create path and map variables
    String path = "/location/{location_id}".replaceAll("{format}","json").replaceAll("{" + "location_id" + "}", locationId.toString());

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
                                             'GET',
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
          apiClient.deserialize(response.body, 'Location') as Location;
    } else {
      return null;
    }
  }
  /// Edita una locacion
  ///
  /// 
  Future locationLocationIdPut(NewLocation body, String locationId) async {
    Object postBody = body;

    // verify required params are set
    if(body == null) {
     throw new ApiException(400, "Missing required param: body");
    }
    if(locationId == null) {
     throw new ApiException(400, "Missing required param: locationId");
    }

    // create path and map variables
    String path = "/location/{location_id}".replaceAll("{format}","json").replaceAll("{" + "location_id" + "}", locationId.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    
    List<String> contentTypes = ["application/form-data"];

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
                                             'PUT',
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
  /// Crea una locacion
  ///
  /// Da de alta una locacion
  Future locationPost(NewLocation body) async {
    Object postBody = null;

    // verify required params are set
    if(body.name == null) {
     throw new ApiException(400, "Missing required param: name");
    }
    if(body.description == null) {
     throw new ApiException(400, "Missing required param: description");
    }
    if(body.maxCapacity == null) {
     throw new ApiException(400, "Missing required param: maxCapacity");
    }
    if(body.address == null) {
     throw new ApiException(400, "Missing required param: address");
    }
    if(body.latitude == null) {
     throw new ApiException(400, "Missing required param: latitude");
    }
    if(body.longitude == null) {
     throw new ApiException(400, "Missing required param: longitude");
    }
    /*if(body.images == null) {
     throw new ApiException(400, "Missing required param: images");
    }*/

    // create path and map variables
    String path = "/location".replaceAll("{format}","json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    
    List<String> contentTypes = ["multipart/form-data"];

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = ["basicAuth"];

    if(contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      MultipartRequest mp = new MultipartRequest(null, null);
      if (body.name != null) {
        hasFields = true;
        mp.fields['name'] = parameterToString(body.name);
      }
      if (body.description != null) {
        hasFields = true;
        mp.fields['description'] = parameterToString(body.description);
      }
      if (body.maxCapacity != null) {
        hasFields = true;
        mp.fields['maxCapacity'] = parameterToString(body.maxCapacity);
      }
      if (body.address != null) {
        hasFields = true;
        mp.fields['address'] = parameterToString(body.address);
      }
      if (body.latitude != null) {
        hasFields = true;
        mp.fields['latitude'] = parameterToString(body.latitude);
      }
      if (body.longitude != null) {
        hasFields = true;
        mp.fields['longitude'] = parameterToString(body.longitude);
      }
      if (body.images != null) {
        hasFields = true;
        mp.files.add(MultipartFile.fromBytes('images', body.imageFileBytes, filename: body.images));
      }
      if(hasFields)
        postBody = mp;
    }
    else {
      if (body.name != null)
        formParams['name'] = parameterToString(body.name);
if (body.description != null)
        formParams['description'] = parameterToString(body.description);
if (body.maxCapacity != null)
        formParams['maxCapacity'] = parameterToString(body.maxCapacity);
if (body.address != null)
        formParams['address'] = parameterToString(body.address);
if (body.latitude != null)
        formParams['latitude'] = parameterToString(body.latitude);
if (body.longitude != null)
        formParams['longitude'] = parameterToString(body.longitude);

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
          apiClient.deserialize(response.body, 'Location') as Location ;
    } else {
      return null;
    }
  }
}
