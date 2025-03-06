import 'package:flutter/material.dart';
import 'package:image_loader/core/services/html_elements_factory.dart';

import 'app.dart';

/// Entrypoint of the application.
void main() {
  HtmlElementFactory().registerHtmlElementsFactory();
  runApp(const ImageLoaderApp());
}