// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:select_shop/core/constants/app_constants.dart';
import 'package:select_shop/core/theme/colors.dart';
import 'package:select_shop/generated/l10n.dart';

TextStyle _customLocalTextStyle = TextStyle(
  color: AppColors.mainGreyColor,
);

class StoresListScreen extends StatelessWidget {
  const StoresListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Column(
            children: [
              AppConstants.emptySpaceTenPixl,
              AppConstants.emptySpaceTenPixl,
              AppConstants.emptySpaceTenPixl,
              _CustomSearchContainer(),
              AppConstants.emptySpaceTenPixl,
              AppConstants.emptySpaceTenPixl,
              AppConstants.emptySpaceTenPixl,
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomSearchContainer extends StatelessWidget {
  _CustomSearchContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 1,
              offset: Offset(1, 1),
              color: AppColors.grey2Color.withOpacity(.1),
            ),
          ],
          borderRadius: BorderRadius.circular(6)),
      child: Row(
        children: [
          InkWell(
            // onTap: () {
            //   Navigator.push(context, MaterialPageRoute(builder: (context) {
            //     return UnderDevScreen();
            //   }));
            // },
            child: Container(
              width: 130,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(6),
                    topRight: Radius.circular(6),
                    bottomLeft: Radius.circular(6),
                  )),
              child: Text(
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                S.of(context).categorys,
              ),
            ),
          ),

          // ##### this FormBuilder is casuing problems ##### //

          // FormBuilder(
          //   child: FormBuilderTextField(
          //     name: "Search",
          //     // style: _customLocalTextStyle,

          //     // controller: TextEditingController?,

          //     decoration: InputDecoration(
          //       hintText: "Search...",
          //       // hintStyle: _customLocalTextStyle,
          //       border: InputBorder.none,
          //       contentPadding: EdgeInsetsDirectional.symmetric(
          //         horizontal: 20,
          //       ),
          //     ),
          //   ),
          // )

          // #####  ##### //

          //                       SearchBar(
          //                         hintText: "Search...",

          // // textStyle: TextStyle(color: ),
          //                       ),

          // AnimSearchBar(
          //   width: 400,
          //   textController: _searchTextEditingController,
          //   onSuffixTap: () {
          //     setState(() {
          //       _searchTextEditingController.clear();
          //     });
          //   },
          //   onSubmitted: (value) {},
          // ),

          // FormField(builder: (context) {
          //   return Text('search');
          // },
          // ),
          //
          //

          const SizedBox(
            width: 10,
          ),
          Icon(
            Icons.search,
            color: AppColors.mainGreyColor.withOpacity(.3),
            size: 26,
          ),

          Text(
              style: _customLocalTextStyle.copyWith(
                  fontSize: 18,
                  color: AppColors.mainGreyColor.withOpacity(.3),
                  backgroundColor: Colors.white),
              S.of(context).search),
        ],
      ),
    );
  }
}

class _StorListTiel extends StatelessWidget {
  const _StorListTiel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: AppColors.grey2Color.withOpacity(.2),
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: AppConstants.theBoxShdow,
      ),
      child: Row(
        children: [],
      ),
    );
  }
}
