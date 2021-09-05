# swagger.api.CheckApi

## Load the API package
```dart
import 'package:swagger/api.dart';
```

All URIs are relative to *http://localhost:3000/*

Method | HTTP request | Description
------------- | ------------- | -------------
[**userCheckinLocationIdPost**](CheckApi.md#userCheckinLocationIdPost) | **POST** /user/checkin/{location_id} | Checkin a locacion
[**userCheckoutPost**](CheckApi.md#userCheckoutPost) | **POST** /user/checkout | Hace checkout del usuario del ultimo lugar donde hizo checkin

# **userCheckinLocationIdPost**
> userCheckinLocationIdPost(locationId)

Checkin a locacion

Registra la entrada de un usuario a una locacion

### Example
```dart
import 'package:swagger/api.dart';
// TODO Configure HTTP basic authorization: basicAuth
//swagger.api.Configuration.username = 'YOUR_USERNAME';
//swagger.api.Configuration.password = 'YOUR_PASSWORD';

var api_instance = new CheckApi();
var locationId = locationId_example; // String | Lower range date value

try {
    api_instance.userCheckinLocationIdPost(locationId);
} catch (e) {
    print("Exception when calling CheckApi->userCheckinLocationIdPost: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **locationId** | **String**| Lower range date value | 

### Return type

void (empty response body)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **userCheckoutPost**
> userCheckoutPost()

Hace checkout del usuario del ultimo lugar donde hizo checkin

### Example
```dart
import 'package:swagger/api.dart';
// TODO Configure HTTP basic authorization: basicAuth
//swagger.api.Configuration.username = 'YOUR_USERNAME';
//swagger.api.Configuration.password = 'YOUR_PASSWORD';

var api_instance = new CheckApi();

try {
    api_instance.userCheckoutPost();
} catch (e) {
    print("Exception when calling CheckApi->userCheckoutPost: $e\n");
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

void (empty response body)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

