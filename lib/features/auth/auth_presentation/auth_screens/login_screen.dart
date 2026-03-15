import 'package:flutter/material.dart';
import 'package:simple_social_media_app/features/auth/auth_presentation/auth_widgets/text_field.dart';

import '../../../home/home_presentation/home_widgets/app_background.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isPasswordHidden = true;
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            children: [
              SizedBox(height: 32),
              Center(
                child: Image.asset("images/logo.png", height: 220, width: 220),
              ),
              SizedBox(height: 20),
              Text(
                "Enter your login information",
                style: TextStyle(
                  color: Color(0xFFC9B59C),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 31),
              // Email Text Field
              Text_Field(
                controller: emailController,
                icon: Icons.email_outlined,
                label: "Email",
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: passwordController,
                style: TextStyle(color: Color(0xFFA8A8A8)),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: Color(0xFFB0B0B0),
                  ),
                  labelText: "Password",
                  labelStyle: TextStyle(color: Color(0xFFC9B59C)),

                  hintText: "Enter Your Password",
                  hintStyle: TextStyle(color: Color(0xFFB0B0B0)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    gapPadding: 26,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFC9B59C), width: 2),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isPasswordHidden = !_isPasswordHidden;
                      });
                    },
                    icon: Icon(
                      _isPasswordHidden
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: Color(0xFFB0B0B0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 32),
              // isLoading
              //     ? CircularProgressIndicator(color: Color(0xFFCAAF2D))
              //     :
              MaterialButton(
                color: Color(0xFFC9B59C),
                minWidth: 377,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, "/homeLayout");
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Color(0xFF6B6B6B),
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 28),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(color: Color(0xFFB0B0B0), fontSize: 16),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/signup");
                    },
                    child: Text(
                      "SignUp",
                      style: TextStyle(color: Color(0xFF6B6B6B), fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
