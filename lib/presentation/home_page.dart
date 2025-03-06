import 'package:flutter/material.dart';
import 'package:image_loader/core/services/js_bridge.dart';
import 'package:image_loader/presentation/wdigets/offset_popup.dart';

/// [Widget] displaying the home page consisting of an image the the buttons.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

/// State of a [HomePage].
class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  final JsBridge _jsBridge = JsBridge();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
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
      ),
      floatingActionButton: const OffsetPopup(),
    );
  }

  void _setImageUrl() {
    _jsBridge.updateImageUrl(_controller.text);
  }

  void _onImageDoubleTap() {
    _jsBridge.toggleBrowserFullscreen();
  }
}