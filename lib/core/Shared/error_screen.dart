import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:select_shop/core/theme/colors.dart';

class ErrorScreen extends StatefulWidget {
  final String errorMessage;
  ErrorScreen({super.key, required this.errorMessage});

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(size: 150, color: AppColors.mainColor, Icons.error_rounded),
            Text(
              // errorMessage == null ? 'unknown error !!!' : errorMessage!,

              widget.errorMessage,
              style: TextStyle(
                color: AppColors.mainColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
