import 'dart:ui_web' as ui_web;
import 'package:web/web.dart' as web;

class HtmlElementFactory {
  void registerHtmlElementsFactory() {
    ui_web.platformViewRegistry.registerViewFactory(
      'html_image_element',
          (int viewId) {
        final imgElement = web.HTMLImageElement()
          ..src = '';
        return imgElement;
      },
    );
  }
}