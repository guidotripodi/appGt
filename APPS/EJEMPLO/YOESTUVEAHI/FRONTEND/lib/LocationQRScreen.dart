import 'package:flutter/material.dart';
import 'package:qr/qr.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'StyleUtils.dart';

class LocationQrScreen extends StatelessWidget {
  final String locationId;

  LocationQrScreen({Key key, @required this.locationId}) : super(key: key);

  Widget _buildQRImage() {
    return QrImage(
      data: locationId,
      padding: const EdgeInsets.all(10.0),
      size: 250,
      errorCorrectionLevel: QrErrorCorrectLevel.H,
      backgroundColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackgroundFrame(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Locación creada con éxito! guarda tu código QR', style: subtitleTextStyle),
                SizedBox(height: 30.0),
                _buildQRImage(),
                backButton(context)
              ],
    )));
  }
}
