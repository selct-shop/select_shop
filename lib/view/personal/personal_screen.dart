import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:select_shop/core/Shared/loading_screen.dart';
import 'package:select_shop/core/Shared/under_develop_screen.dart';

class PersonalScreen extends StatefulWidget {
  const PersonalScreen({super.key});

  @override
  State<PersonalScreen> createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: UnderDevScreen(),
    );
  }
}
