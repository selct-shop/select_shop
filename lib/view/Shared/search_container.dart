import 'package:flutter/material.dart';
import 'package:select_shop/core/theme/colors.dart';
import 'package:select_shop/generated/l10n.dart';
import 'package:select_shop/view/Shared/under_develop_screen.dart';

TextStyle _customLocalTextStyle = TextStyle(
  color: AppColors.mainGreyColor,
);

class SearchContainer extends StatelessWidget {
  const SearchContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 5,
                offset: Offset(3, 4),
                color: AppColors.mainGreyColor.withOpacity(.2))
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
