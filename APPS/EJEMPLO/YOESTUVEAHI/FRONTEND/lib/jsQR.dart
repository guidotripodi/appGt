@JS()
// ignore: library_names
library jsqr;

import 'package:js/js.dart';

@JS('jsQR')
external Code scanQR(image, width, height);

@JS()
class Code {
  external String get data;
}