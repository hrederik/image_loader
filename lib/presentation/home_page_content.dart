import 'package:flutter/material.dart';

import '../core/services/js_bridge.dart';

/// [Widget] that provides the content of the Home page,
/// consisting of an image display and a URL input field.
class HomePageContent extends StatefulWidget {
  /// Creates a [HomePageContent].
  const HomePageContent({
    super.key,
    required JsBridge jsBridge,
  }) : _jsBridge = jsBridge;

  final JsBridge _jsBridge;

  @override
  State<HomePageContent> createState() => _HomePageContentState();
}

/// State of the [HomePageContent] widget.
class _HomePageContentState extends State<HomePageContent> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: GestureDetector(
                onDoubleTap: _onImageDoubleTap,
                child: const HtmlElementView(
                  viewType: 'html_image_element',
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 55),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(hintText: 'Image URL'),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => _setImageUrl(),
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
                    child: Icon(Icons.arrow_forward),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 64),
        ],
      ),
    );
  }

  /// Sets the image URL using the text entered in the text field.
  void _setImageUrl() {
    widget._jsBridge.updateImageUrl(_controller.text);
  }

  /// Toggles the browser to fullscreen mode when the image is double-tapped.
  void _onImageDoubleTap() {
    widget._jsBridge.toggleBrowserFullscreen();
  }
}