# swagger.api.AdminApi

## Load the API package
```dart
import 'package:swagger/api.dart';
```

All URIs are relative to *http://localhost:3000/*

Method | HTTP request | Description
------------- | ------------- | -------------
[**historyGet**](AdminApi.md#historyGet) | **GET** /history | Devuelve los contagios por fecha
[**statisticsGet**](AdminApi.md#statisticsGet) | **GET** /statistics | Devuelve las estadisticas del sistema

# **historyGet**
> History historyGet()

Devuelve los contagios por fecha

### Example
```dart
import 'package:swagger/api.dart';
// TODO Configure HTTP basic authorization: basicAuth
//swagger.api.Configuration.username = 'YOUR_USERNAME';
//swagger.api.Configuration.password = 'YOUR_PASSWORD';

var api_instance = new AdminApi();

try {
    var result = api_instance.historyGet();
    print(result);
} catch (e) {
    print("Exception when calling AdminApi->historyGet: $e\n");
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**History**](History.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **statisticsGet**
> Statistics statisticsGet()

Devuelve las estadisticas del sistema

### Example
```dart
import 'package:swagger/api.dart';
// TODO Configure HTTP basic authorization: basicAuth
//swagger.api.Configuration.username = 'YOUR_USERNAME';
//swagger.api.Configuration.password = 'YOUR_PASSWORD';

var api_instance = new AdminApi();

try {
    var result = api_instance.statisticsGet();
    print(result);
} catch (e) {
    print("Exception when calling AdminApi->statisticsGet: $e\n");
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**Statistics**](Statistics.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

