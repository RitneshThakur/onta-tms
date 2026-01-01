import 'package:desktop_test/widgets/big_text.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final String hintText;
  final int? maxLines;
  final TextEditingController? controller;
  final VoidCallback? onSuffixPressed;

  const CustomTextField({
    super.key,
    required this.title,
    required this.hintText,
    this.controller,
    this.onSuffixPressed,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigText(text: title),
          const SizedBox(height: 6),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueAccent),
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextField(
              controller: controller,
              maxLines: maxLines,
              readOnly: onSuffixPressed != null, // important
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 14,
                ),
                suffixIcon: onSuffixPressed == null
                    ? null
                    : IconButton(
                        icon: const Icon(Icons.calendar_today),
                        onPressed: onSuffixPressed,
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
