import 'package:flutter/material.dart';

class HeaderCell extends StatelessWidget {
  final String text;
  final Alignment alignment;

  const HeaderCell({
    super.key,
    required this.text,
    this.alignment = Alignment.centerLeft,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Colors.blue,
        border: Border(right: BorderSide(color: Colors.white, width: 1)),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
