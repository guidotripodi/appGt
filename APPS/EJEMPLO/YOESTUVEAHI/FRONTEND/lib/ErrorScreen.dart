import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:swagger/api.dart';
import 'StyleUtils.dart';

class ErrorScreen extends StatelessWidget {
  final ApiException apiException;

  ErrorScreen({Key key, @required this.apiException}) : super(key: key);

  String _formatMessage(String message) {
    String formattedMessage;
    try {
      var decodedJson = json.decode(message) as Map<String, dynamic>;
      formattedMessage = decodedJson['message'];
    } on FormatException catch (e) {
      formattedMessage = message;
    }
    return formattedMessage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackgroundFrame(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('ERROR!', style: subtitleTextStyle),
                SizedBox(height: 30.0),
                Text(_formatMessage(apiException.message), style: subtitleTextStyle),
                backButton(context)
              ],
    )));
  }
}
