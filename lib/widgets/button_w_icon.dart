import 'package:desktop_test/widgets/big_text.dart';
import 'package:flutter/material.dart';

class ButtonWIcon extends StatelessWidget {
  final IconData icon;
  final String name;
  final VoidCallback? onPressed;
  final Color? color;
  const ButtonWIcon({
    super.key,
    required this.icon,
    required this.name,
    this.onPressed,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          elevation: 2,
          minimumSize: const Size(0, 55), // Set button height here
        ),
        onPressed: onPressed,
        icon: Icon(icon, size: 24, color: Colors.white),
        label: BigText(text: name, size: 17, color: Colors.white),
      ),
    );
  }
}
