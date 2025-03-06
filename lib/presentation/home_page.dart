import 'package:flutter/material.dart';
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
  bool _isMenuOpen = false;

  void _toggleMenu() {
    setState(() {
      _isMenuOpen = !_isMenuOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(),
          body: const HomePageContent(),
          floatingActionButton: OffsetPopup(
            clicked: _toggleMenu,
            selected: (i) => _toggleMenu(),
            canceled: _toggleMenu,
          ),
        ),
        if (_isMenuOpen)
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: _toggleMenu,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black.withAlpha(150),
            ),
          ),
      ],
    );
  }
}