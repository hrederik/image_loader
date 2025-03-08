import 'package:flutter/material.dart';

/// A widget that displays a popup menu with an offset.
///
/// This widget provides the user with a selection of actions,
/// presented as menu items.
class OffsetPopup extends StatelessWidget {
  /// Creates an instance of [OffsetPopup].
  ///
  /// Parameters:
  ///   * [clicked]:  A function to be called when the popup menu is opened.
  ///   * [selected]: A function to be called when a menu item is selected.  Takes the value of the selected item.
  ///   * [canceled]: A function to be called when the popup menu is canceled (e.g., by tapping outside the menu).
  const OffsetPopup({
    super.key,
    required VoidCallback clicked,
    required ValueChanged<int> selected,
    required VoidCallback canceled,
  })  : _clicked = clicked,
        _selected = selected,
        _canceled = canceled;

  /// Function to be called when the popup menu is opened.
  final VoidCallback _clicked;

  /// Function to be called when a menu item is selected.
  final ValueChanged<int> _selected;

  /// Function to be called when the popup menu is canceled.
  final VoidCallback _canceled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.0,
      width: 80.0,
      child: PopupMenuButton(
        // Called when the menu is opened.
        onOpened: _clicked,
        // Called when a menu item is selected.
        onSelected: _selected,
        // Called when the menu is canceled.
        onCanceled: _canceled,
        // Creates the list of menu items.
        itemBuilder: (context) => [
          const PopupMenuItem(
            value: 0,
            child: Text(
              "Enter fullscreen",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const PopupMenuItem(
            value: 1,
            child: Text(
              "Exit fullscreen",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
        // Widget displayed to open the menu.
        icon: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const ShapeDecoration(
            color: Colors.blue,
            shape: StadiumBorder(
              side: BorderSide(color: Colors.white, width: 2),
            ),
          ),
          child: const Icon(Icons.menu, color: Colors.white),
        ),
      ),
    );
  }
}