import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'StyleUtils.dart';

class PickLocationScreen extends StatefulWidget {
  @override
  _PickLocationScreenState createState() => _PickLocationScreenState();
}

class _PickLocationScreenState extends State<PickLocationScreen> {
  static const LatLng _defaultPosition = LatLng(-34.6021521, -58.4345179);

  Completer<GoogleMapController> _controller = Completer();

  Set<Marker> _markers = Set.of(<Marker>[
    Marker(
        markerId: MarkerId(_defaultPosition.toString()),
        position: _defaultPosition,
        infoWindow: InfoWindow(title: 'Locación elegida'))
  ]);

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: _defaultPosition,
    zoom: 12.0,
  );

  Widget _buildMap() {
    return Container(
        width: double.infinity,
        height: 500,
        child: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          onTap: (LatLng pos) {
            setState(() {
              _markers.clear();
              _markers.add(Marker(
                  markerId: MarkerId(pos.toString()),
                  position: pos,
                  infoWindow: InfoWindow(title: 'Locación elegida')));
            });
          },
          markers: _markers,
        ));
  }

  Widget _buildAcceptBtn() {
    return button(
        text: 'ACEPTAR',
        onPressed: () {
          Navigator.pop(context, _markers.first.position);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackgroundFrame(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Elige tu ubicación', style: subtitleTextStyle),
                SizedBox(height: 30.0),
                _buildMap(),
                _buildAcceptBtn()
              ],
            )
        )
    );
  }
}
