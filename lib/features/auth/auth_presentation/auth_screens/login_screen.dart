import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_social_media_app/features/auth/auth_presentation/auth_widgets/text_field.dart';

import '../../../home/home_presentation/home_widgets/app_background.dart';
import '../auth_cubit/auth_cubit.dart';
import '../auth_cubit/auth_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> frmKey = GlobalKey();
  bool _isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 32),
                    Center(
                      child: Image.asset(
                        "images/logo.png",
                        height: 220,
                        width: 220,
                      ),
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
                    Form(
                      key: frmKey,
                      child: Column(
                        children: [
                          Text_Field(
                            controller: emailController,
                            icon: Icons.email_outlined,
                            label: "Email",
                            fieldType: FieldType.email,
                          ),
                          SizedBox(height: 15),
                          TextFormField(
                            controller: passwordController,
                            obscureText: _isPasswordHidden,
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
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFC9B59C),
                                  width: 2,
                                ),
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
                          BlocConsumer<AuthCubit, AuthState>(
                            listener: (context, state) {
                              if (state is AuthSuccess) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(state.message)),
                                );
                              }
                              if (state is AuthError) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(state.message)),
                                );
                              }
                            },
                            builder: (context, state) {
                              return state is AuthLoading
                                  ? Center(child: CircularProgressIndicator())
                                  : MaterialButton(
                                    color: Color(0xFFC9B59C),
                                    minWidth: double.infinity,
                                    height: 50,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                        color: Color(0xFF6B6B6B),
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    onPressed: () {
                                      if (frmKey.currentState!.validate()) {
                                        context.read<AuthCubit>().login(
                                          emailController.text,
                                          passwordController.text,
                                        );
                                      }
                                    },
                                  );
                            },
                          ),
                          SizedBox(height: 28),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account? ",
                                style: TextStyle(
                                  color: Color(0xFFB0B0B0),
                                  fontSize: 16,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, "/signup");
                                },
                                child: Text(
                                  "SignUp",
                                  style: TextStyle(
                                    color: Color(0xFF6B6B6B),
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
