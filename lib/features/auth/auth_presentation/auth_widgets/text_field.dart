import 'package:flutter/material.dart';

class Text_Field extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  IconData icon;
  String label;

  Text_Field({
    super.key,
    required this.controller,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(color: Color(0xFFA8A8A8)),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Color(0xFFB0B0B0)),
        labelText: label,
        labelStyle: TextStyle(color: Color(0xFFC9B59C)),

        hintText: "Enter Your $label",
        hintStyle: TextStyle(color: Color(0xFFB0B0B0)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          gapPadding: 26,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFC9B59C), width: 2),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
    );
  }
}
