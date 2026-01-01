import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  final double size;
  final TextOverflow? overflow;
  const BigText({
    super.key,
    this.overflow = TextOverflow.visible,
    required this.text,
    this.color = Colors.black,
    this.size = 18.0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: size,
          fontWeight: FontWeight.bold,
          overflow: overflow,
          color: color,
        ),
      ),
    );
  }
}
