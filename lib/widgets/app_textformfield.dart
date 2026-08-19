import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  MyTextFormField({
    super.key,
    required TextEditingController controller,
    this.maxline,
    required this.validator,
    this.labelText,
    this.hintText,
  }) : _controller = controller;

  final TextEditingController _controller;
  int? maxline = 0;
  String? Function(String?)? validator;
String? labelText;
String? hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      maxLines: maxline,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText ?? 'e.g. Phone, Laptop',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
