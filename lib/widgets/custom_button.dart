import 'package:desktop_test/widgets/big_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onPressed;
  const CustomButton({super.key, required this.buttonText, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width > 600 ? 24.0 : 12.0,
          vertical: 12.0,
        ),
        textStyle: const TextStyle(fontSize: 16.0),
        backgroundColor: const Color(0xff113c7c),
      ),
      child: BigText(color: Colors.white, size: 16.0, text: buttonText),
    );
  }
}
