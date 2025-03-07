import 'package:flutter/material.dart';
import 'package:image_loader/core/services/js_bridge.dart';
import 'package:image_loader/presentation/home_page_content.dart';
import 'package:image_loader/presentation/widgets/offset_popup.dart';

/// [Widget] displaying the home page consisting of an image the the buttons.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

/// State of a [HomePage].
class _HomePageState extends State<HomePage> {
  final JsBridge _jsBridge = JsBridge();
  bool _isBackgroundActive = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(),
          body: HomePageContent(jsBridge: _jsBridge,),
          floatingActionButton: OffsetPopup(
            clicked: _enableBackground,
            selected: _onOptionSelected,
            canceled: _disableBackground,
          ),
        ),
        if (_isBackgroundActive)
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: _disableBackground,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black.withAlpha(150),
            ),
          ),
      ],
    );
  }

  void _onOptionSelected(int index) {
    _disableBackground();

    if (index == 0) {
      _jsBridge.enableFullscreen();
      return;
    }

    if (index == 1) {
      _jsBridge.disableFullscreen();
      return;
    }
  }

  void _enableBackground() {
    setState(() {
      _isBackgroundActive = true;
    });
  }

  void _disableBackground() {
    setState(() {
      _isBackgroundActive = false;
    });
  }
}