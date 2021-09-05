# swagger.api.LocationApi

## Load the API package
```dart
import 'package:swagger/api.dart';
```

All URIs are relative to *http://localhost:3000/*

Method | HTTP request | Description
------------- | ------------- | -------------
[**locationGet**](LocationApi.md#locationGet) | **GET** /location | Devuelve un listado de las locaciones del usuario / del sistema si el usuario es el admin
[**locationLocationIdGet**](LocationApi.md#locationLocationIdGet) | **GET** /location/{location_id} | Devuelve una locacion en su estado actual
[**locationLocationIdPut**](LocationApi.md#locationLocationIdPut) | **PUT** /location/{location_id} | Edita una locacion
[**locationPost**](LocationApi.md#locationPost) | **POST** /location | Crea una locacion

# **locationGet**
> LocationList locationGet()

Devuelve un listado de las locaciones del usuario / del sistema si el usuario es el admin

### Example
```dart
import 'package:swagger/api.dart';
// TODO Configure HTTP basic authorization: basicAuth
//swagger.api.Configuration.username = 'YOUR_USERNAME';
//swagger.api.Configuration.password = 'YOUR_PASSWORD';

var api_instance = new LocationApi();

try {
    var result = api_instance.locationGet();
    print(result);
} catch (e) {
    print("Exception when calling LocationApi->locationGet: $e\n");
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**LocationList**](LocationList.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **locationLocationIdGet**
> LocationList locationLocationIdGet(locationId)

Devuelve una locacion en su estado actual

### Example
```dart
import 'package:swagger/api.dart';
// TODO Configure HTTP basic authorization: basicAuth
//swagger.api.Configuration.username = 'YOUR_USERNAME';
//swagger.api.Configuration.password = 'YOUR_PASSWORD';

var api_instance = new LocationApi();
var locationId = locationId_example; // String | Lower range date value

try {
    var result = api_instance.locationLocationIdGet(locationId);
    print(result);
} catch (e) {
    print("Exception when calling LocationApi->locationLocationIdGet: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **locationId** | **String**| Lower range date value | 

### Return type

[**LocationList**](LocationList.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **locationLocationIdPut**
> locationLocationIdPut(body, locationId)

Edita una locacion

### Example
```dart
import 'package:swagger/api.dart';
// TODO Configure HTTP basic authorization: basicAuth
//swagger.api.Configuration.username = 'YOUR_USERNAME';
//swagger.api.Configuration.password = 'YOUR_PASSWORD';

var api_instance = new LocationApi();
var body = new NewLocation(); // NewLocation | 
var locationId = locationId_example; // String | Lower range date value

try {
    api_instance.locationLocationIdPut(body, locationId);
} catch (e) {
    print("Exception when calling LocationApi->locationLocationIdPut: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**NewLocation**](NewLocation.md)|  | 
 **locationId** | **String**| Lower range date value | 

### Return type

void (empty response body)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: application/form-data
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **locationPost**
> Location locationPost(name, description, maxCapacity, address, latitude, longitude, images)

Crea una locacion

Da de alta una locacion

### Example
```dart
import 'package:swagger/api.dart';
// TODO Configure HTTP basic authorization: basicAuth
//swagger.api.Configuration.username = 'YOUR_USERNAME';
//swagger.api.Configuration.password = 'YOUR_PASSWORD';

var api_instance = new LocationApi();
var name = name_example; // String | 
var description = description_example; // String | 
var maxCapacity = 1.2; // double | 
var address = address_example; // String | 
var latitude = latitude_example; // String | 
var longitude = longitude_example; // String | 
var images = images_example; // String | 

try {
    var result = api_instance.locationPost(name, description, maxCapacity, address, latitude, longitude, images);
    print(result);
} catch (e) {
    print("Exception when calling LocationApi->locationPost: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String**|  | 
 **description** | **String**|  | 
 **maxCapacity** | **double**|  | 
 **address** | **String**|  | 
 **latitude** | **String**|  | 
 **longitude** | **String**|  | 
 **images** | **String****String**|  | 

### Return type

[**Location**](Location.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

