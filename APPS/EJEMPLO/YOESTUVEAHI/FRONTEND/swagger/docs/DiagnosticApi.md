# swagger.api.DiagnosticApi

## Load the API package
```dart
import 'package:swagger/api.dart';
```

All URIs are relative to *http://localhost:3000/*

Method | HTTP request | Description
------------- | ------------- | -------------
[**userDiagnosticDateDelete**](DiagnosticApi.md#userDiagnosticDateDelete) | **DELETE** /user/diagnostic/{date} | Le da el alta clinica a un usuario
[**userDiagnosticDatePost**](DiagnosticApi.md#userDiagnosticDatePost) | **POST** /user/diagnostic/{date} | Declara al usuario como infectado

# **userDiagnosticDateDelete**
> userDiagnosticDateDelete(date)

Le da el alta clinica a un usuario

### Example
```dart
import 'package:swagger/api.dart';
// TODO Configure HTTP basic authorization: basicAuth
//swagger.api.Configuration.username = 'YOUR_USERNAME';
//swagger.api.Configuration.password = 'YOUR_PASSWORD';

var api_instance = new DiagnosticApi();
var date = date_example; // String | Fecha de alta

try {
    api_instance.userDiagnosticDateDelete(date);
} catch (e) {
    print("Exception when calling DiagnosticApi->userDiagnosticDateDelete: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **date** | **String**| Fecha de alta | 

### Return type

void (empty response body)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **userDiagnosticDatePost**
> userDiagnosticDatePost(date)

Declara al usuario como infectado

### Example
```dart
import 'package:swagger/api.dart';
// TODO Configure HTTP basic authorization: basicAuth
//swagger.api.Configuration.username = 'YOUR_USERNAME';
//swagger.api.Configuration.password = 'YOUR_PASSWORD';

var api_instance = new DiagnosticApi();
var date = date_example; // String | Fecha de infeccion

try {
    api_instance.userDiagnosticDatePost(date);
} catch (e) {
    print("Exception when calling DiagnosticApi->userDiagnosticDatePost: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **date** | **String**| Fecha de infeccion | 

### Return type

void (empty response body)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

