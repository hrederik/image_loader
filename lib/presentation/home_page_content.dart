import 'package:flutter/material.dart';

import '../core/services/js_bridge.dart';

class HomePageContent extends StatefulWidget {
  const HomePageContent({super.key});

  @override
  State<HomePageContent> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  final TextEditingController _controller = TextEditingController();
  final JsBridge _jsBridge = JsBridge();

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
          Row(
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
          const SizedBox(height: 64),
        ],
      ),
    );
  }

  void _setImageUrl() {
    _jsBridge.updateImageUrl(_controller.text);
  }

  void _onImageDoubleTap() {
    _jsBridge.toggleBrowserFullscreen();
  }
}
