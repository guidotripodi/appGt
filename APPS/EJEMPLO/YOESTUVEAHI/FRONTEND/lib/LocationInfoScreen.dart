import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:swagger/api.dart';
import 'Client.dart';
import 'StyleUtils.dart';

class LocationInfoScreen extends StatelessWidget {
  final Location location;

  LocationInfoScreen({Key key, @required this.location}) : super(key: key);

  Widget _buildQRImage() {
    return QrImage(
      data: location.id,
      padding: const EdgeInsets.all(10.0),
      size: 250,
      errorCorrectionLevel: QrErrorCorrectLevel.H,
      backgroundColor: Colors.white,
    );
  }

  Widget _buildLocationInfo(BuildContext context) {
    List<Widget> widgets = <Widget>[];

    widgets.add(Text(location.name, style: subtitleTextStyle));
    if (location.id != null) {
      widgets.add(SizedBox(height: 30.0));
      widgets.add(_buildQRImage());
    }
    widgets.add(SizedBox(height: 30.0));
    widgets.add(Text("Descripción: ${location.description}", style: subSubtitleTextStyle));
    widgets.add(Text("Dirección: ${location.address}", style: subSubtitleTextStyle));
    widgets.add(Text("Ocupación: ${location.occupation}/${location.maxCapacity}", style: subSubtitleTextStyle));

    if (location.images.isNotEmpty) {
      widgets.add(SizedBox(height: 30.0));
      widgets.add(Text("Imágenes", style: subSubtitleTextStyle));
      widgets.add(SizedBox(height: 30.0));
      for (String img in location.images) {
        widgets.add(Image.network(Client.getInstance().getBasePath() + img));
      }
      widgets.add(SizedBox(height: 30.0));
    }

    widgets.add(backButton(context));

    return Column(mainAxisAlignment: MainAxisAlignment.center, children: widgets);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackgroundFrame(
            child: _buildLocationInfo(context)
      )
    );
  }
}
