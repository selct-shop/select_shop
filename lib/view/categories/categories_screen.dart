import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:select_shop/core/theme/colors.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return  
    Text("comming soon".toUpperCase(), style: TextStyle(color: AppColors.mainColor, fontWeight: FontWeight.bold, fontSize: 22, ),);
  }
}