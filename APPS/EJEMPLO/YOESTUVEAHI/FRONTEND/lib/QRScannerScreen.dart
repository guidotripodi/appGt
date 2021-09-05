import 'dart:async';

import 'package:flutter/material.dart';
import 'StyleUtils.dart';

// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import './UiFake.dart' if (dart.library.html) 'dart:ui' as ui;
import 'jsQR.dart';


class QRScannerScreen extends StatefulWidget {
  @override
  _QRScannerScreenState createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {

  static VideoElement _webcamVideoElement;
  Widget _webcamWidget;
  Timer _timer;

  void _readQR(Timer timer) {
    if (_webcamVideoElement != null && _webcamVideoElement.srcObject != null && _webcamVideoElement.srcObject.active) {
      CanvasElement canvas = CanvasElement(width: 500, height: 500);
      CanvasRenderingContext2D ctx = canvas.context2D;
      ctx.drawImage(_webcamVideoElement, 0, 0);
      ImageData imageData = ctx.getImageData(0, 0, 500, 500);
      var scan = scanQR(imageData.data, 500, 500);
      if (scan != null) {
        timer.cancel();
        Navigator.pop(context, scan.data);
        print('QR Scan: '+ scan.data);
      }
    }
  }

  @override
  void initState() {
    super.initState();

    if (_webcamVideoElement == null) {
      _webcamVideoElement = VideoElement();
      ui.platformViewRegistry.registerViewFactory(
          'webcamVideoElement',
              (int viewId) => _webcamVideoElement
      );
    }
    _webcamWidget = HtmlElementView(
        key: UniqueKey(),
        viewType: 'webcamVideoElement'
    );

    window.navigator.getUserMedia(video: true).then((MediaStream stream) {
      _webcamVideoElement.srcObject = stream;
      _webcamVideoElement.play();
    });

    _timer = Timer.periodic(Duration(seconds: 1), _readQR);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackgroundFrame(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Escanea el código QR', style: subtitleTextStyle),
                Container(width: 500, height: 500, child: _webcamWidget),
                backButton(context)
              ],
            )
        )
    );
  }

  @override
  void dispose() {
    super.dispose();
    _webcamVideoElement.pause();
    _webcamVideoElement.captureStream().getVideoTracks().forEach((track) { track.stop(); });
    _webcamVideoElement.captureStream().getAudioTracks().forEach((track) { track.stop(); });
    _webcamVideoElement.srcObject = null;
    if (_timer.isActive) {
      _timer.cancel();
    }
  }

}
