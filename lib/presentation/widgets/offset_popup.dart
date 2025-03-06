import 'package:flutter/material.dart';

class OffsetPopup extends StatelessWidget {
  const OffsetPopup({
    super.key,
    required VoidCallback clicked,
    required ValueChanged<int> selected,
    required VoidCallback canceled,
  }) : _clicked = clicked, _selected = selected, _canceled = canceled;

  final VoidCallback _clicked;
  final ValueChanged<int> _selected;
  final VoidCallback _canceled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.0,
      width: 80.0,
      child: PopupMenuButton<int>(
        onOpened: _clicked,
        onSelected: _selected,
        onCanceled: _canceled,
        itemBuilder: (context) => [
          const PopupMenuItem(
            value: 0,
            child: Text(
              "Enter fullscreen",
              style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w700),
            ),
          ),
          const PopupMenuItem(
            value: 1,
            child: Text(
              "Exit fullscreen",
              style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w700),
            ),
          ),
        ],
        icon: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const ShapeDecoration(
              color: Colors.blue,
              shape: StadiumBorder(
                side: BorderSide(color: Colors.white, width: 2),
              )
          ),
          child: const Icon(Icons.menu, color: Colors.white),
        )
      ),
    );
  }
}
