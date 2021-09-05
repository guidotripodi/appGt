library swagger.api;

import 'dart:async';
import 'dart:convert';
import 'package:http/browser_client.dart';
import 'package:http/http.dart';

part 'api_client.dart';
part 'api_helper.dart';
part 'api_exception.dart';
part 'auth/authentication.dart';
part 'auth/api_key_auth.dart';
part 'auth/oauth.dart';
part 'auth/http_basic_auth.dart';

part 'api/admin_api.dart';
part 'api/check_api.dart';
part 'api/diagnostic_api.dart';
part 'api/location_api.dart';
part 'api/user_api.dart';
part 'model/history.dart';
part 'model/location.dart';
part 'model/new_location.dart';
part 'model/new_user.dart';
part 'model/statistics.dart';
part 'model/user.dart';

ApiClient defaultApiClient = new ApiClient();