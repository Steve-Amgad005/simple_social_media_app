import 'package:flutter/material.dart';

import '../../../home/home_presentation/home_widgets/app_background.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Image.asset("images/logo.png")),
            SizedBox(height: 20),
            //Login Button
            MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, "/login");
              },
              color: Color(0xFFC9B59C),
              minWidth: 223,
              height: 59,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text(
                "Login",
                style: TextStyle(color: Color(0xFF6B6B6B), fontSize: 36,fontWeight: FontWeight.bold),
              ),
            ), SizedBox(height: 24,),
            //Sign Up Button
            MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, "/signup");
              },
              color: Color(0xFFC9B59C),
              minWidth: 223,
              height: 59,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text(
                "Sign Up",
                style: TextStyle(color: Color(0xFF6B6B6B), fontSize: 36,fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
