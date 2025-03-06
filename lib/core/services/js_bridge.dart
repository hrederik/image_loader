import 'package:js/js.dart';

@JS('JsBridge')
class JsBridge {
  external JsBridge();

  external void updateImageUrl(String url);
  external void toggleBrowserFullscreen();
}