import 'package:flutter/material.dart';

enum FieldType { email, password, username, name }

class Text_Field extends StatelessWidget {
  final TextEditingController controller;
  final IconData icon;
  final String label;
  final FieldType fieldType;

  Text_Field({
    super.key,
    required this.controller,
    required this.icon,
    required this.label,
    this.fieldType = FieldType.email,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(color: Color(0xFFA8A8A8)),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "This field is required";
        }

        switch (fieldType) {
          case FieldType.email:
            final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
            if (!emailRegex.hasMatch(value)) {
              return "Enter a valid email";
            }
            break;

          case FieldType.password:
            final valueTrimmed = value.trim();
            print('Password typed: "$value"');

            // طول الباسورد 8 على الأقل
            if (valueTrimmed.length < 8) {
              return "Password must be at least 8 characters";
            }

            // تحقق من حرف صغير + حرف كبير + رقم
            final regex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$');

            if (!regex.hasMatch(valueTrimmed)) {
              return "Password must contain at least one uppercase, one lowercase and one number";
            }
            break;
          case FieldType.username:
            final usernameRegex = RegExp(r'^[a-zA-Z0-9_]{3,30}$');
            if (!usernameRegex.hasMatch(value)) {
              return "Username must be 3-30 chars, letters, numbers or _ only";
            }
            break;

          case FieldType.name:
            if (value.length < 3) {
              return "name must be at least 3 characters";
            }
            break;
        }

        return null;
      },

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
