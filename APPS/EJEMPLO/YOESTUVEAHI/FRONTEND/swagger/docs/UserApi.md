# swagger.api.UserApi

## Load the API package
```dart
import 'package:swagger/api.dart';
```

All URIs are relative to *http://localhost:3000/*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createUser**](UserApi.md#createUser) | **POST** /user | Crea usuario
[**getUSer**](UserApi.md#getUSer) | **GET** /user | Recupera perfil de usuario

# **createUser**
> createUser(body)

Crea usuario

### Example
```dart
import 'package:swagger/api.dart';

var api_instance = new UserApi();
var body = new NewUser(); // NewUser | 

try {
    api_instance.createUser(body);
} catch (e) {
    print("Exception when calling UserApi->createUser: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**NewUser**](NewUser.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getUSer**
> User getUSer()

Recupera perfil de usuario

### Example
```dart
import 'package:swagger/api.dart';
// TODO Configure HTTP basic authorization: basicAuth
//swagger.api.Configuration.username = 'YOUR_USERNAME';
//swagger.api.Configuration.password = 'YOUR_PASSWORD';

var api_instance = new UserApi();

try {
    var result = api_instance.getUSer();
    print(result);
} catch (e) {
    print("Exception when calling UserApi->getUSer: $e\n");
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**User**](User.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

