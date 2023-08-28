import 'package:flutter/material.dart';

class LanguageButton extends StatelessWidget {
  LanguageButton({
    super.key,
    required this.onTap,
    required this.text,
  });
  final void Function()? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Color(0XFF111111),
            borderRadius: BorderRadius.circular(8)),
        width: 140,
        height: 48,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}
