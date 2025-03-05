import 'package:flutter/material.dart';

import 'presentation/home_page.dart';

/// Application itself.
class ImageLoaderApp extends StatelessWidget {
  const ImageLoaderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', home: const HomePage());
  }
}