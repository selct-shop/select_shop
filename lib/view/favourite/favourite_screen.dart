import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:select_shop/view/Shared/loading_screen.dart';
import 'package:select_shop/view/Shared/under_develop_screen.dart';

class FavoureitesScreen extends StatefulWidget {
  const FavoureitesScreen({super.key});

  @override
  State<FavoureitesScreen> createState() => _FavoureitesScreenState();
}

class _FavoureitesScreenState extends State<FavoureitesScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: UnderDevScreen(),
    );
  }
}