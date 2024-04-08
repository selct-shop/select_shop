import 'package:flutter/material.dart';
import 'package:select_shop/core/theme/light.dart';
import 'package:select_shop/test.dart';
import 'package:select_shop/view/Auth/login_screen.dart';
import 'package:select_shop/view/Auth/signup_screen.dart';
import 'package:select_shop/view/home/home_screen.dart';

void main() {
  runApp(const MyApp());

  int activeScreenNumber = 1;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: customLightTheme,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // return const LogInScreen();
    // return const SignupScreen();
    return const HomeScreen();
    // return CarouselWithIndicator();
  }
}
