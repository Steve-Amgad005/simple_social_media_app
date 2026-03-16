import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_social_media_app/features/home/home_presentation/home_layout.dart';
import 'package:simple_social_media_app/features/posts/posts_presentation/posts_screens/home_screen.dart';

import 'features/auth/auth_data/auth_data_datasources/auth_remote_datasource.dart';
import 'features/auth/auth_data/auth_data_repositories/auth_repo_implement.dart';
import 'features/auth/auth_presentation/auth_cubit/auth_cubit.dart';
import 'features/auth/auth_presentation/auth_screens/login_screen.dart';
import 'features/auth/auth_presentation/auth_screens/signUp_screen.dart';
import 'features/auth/auth_presentation/auth_screens/splash_screen.dart';
import 'features/comments/comments_presentation/comments_screens/comments.dart';
import 'features/posts/posts_presentation/posts_screens/add_post.dart';

void main() {
  final dio = Dio();
  final remoteDataSource = AuthRemoteDataSource(dio: dio);
  final repository = AuthRepositoryImpl(remoteDataSource);
  runApp(
    BlocProvider(create: (context) => AuthCubit(repository), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: SplashScreen(),
      home: SplashScreen(),
      routes: {
        "/login": (context) => LoginScreen(),
        "/signup": (context) => SignupScreen(),
        "/addPost": (context) => AddPost(),
        "/home": (context) => HomeScreen(),
        "/homeLayout": (context) => HomeLayout(),
        "/splash": (context) => SplashScreen(),
        "/comments": (context) => CommentsScreen(),
      },
    );
  }
}
