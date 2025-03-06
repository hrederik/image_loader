import 'package:flutter/material.dart';

class OffsetPopup extends StatelessWidget {
  const OffsetPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 80.0,
        width: 80.0,
        child: PopupMenuButton<int>(
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
