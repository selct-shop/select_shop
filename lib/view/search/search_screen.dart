import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:select_shop/view/Shared/search_container.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "search",
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [SearchContainer()],
          ),
        ),
      ),
    );
  }
}
