import 'package:flutter/material.dart';
import 'package:product_application/widgets/app_textstyle.dart';

class MyAppButton extends StatelessWidget {
  const MyAppButton({super.key, required this.text, required this.onTap});

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
        onPressed: onTap,
        child: Text(
          text,
          style: AppTextStyle.basic.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
