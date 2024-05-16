// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:select_shop/core/helpers/user_experience_helper.dart';
import 'package:select_shop/core/theme/colors.dart';
import 'package:select_shop/models/Location%20models/getAllEmaritesModle.dart';
import 'package:select_shop/view/Shared/custom_dialog.dart';
import 'package:select_shop/view/Shared/loading_screen.dart';
import 'package:select_shop/view/user%20location/bloc/user_location_bloc.dart';

// GlobalKey<FormState> createNewLocationKey = new GlobalKey<FormState>();
TextEditingController emirateTextEditingController = TextEditingController();
TextEditingController areaTextEditingController = TextEditingController();
TextEditingController streetTextEditingController = TextEditingController();
TextEditingController buildingTextEditingController = TextEditingController();
TextEditingController apartmentTextEditingController = TextEditingController();
TextEditingController zipTextEditingController = TextEditingController();
TextEditingController locationTageTextEditingController =
    TextEditingController();

class CreateNewLocationScreen extends StatefulWidget {
  const CreateNewLocationScreen({super.key});

  @override
  State<CreateNewLocationScreen> createState() =>
      _CreateNewLocationScreenState();
}

class _CreateNewLocationScreenState extends State<CreateNewLocationScreen> {
  final GlobalKey<FormState> createNewLocationKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    context.read<UserLocationBloc>().add(GetAllEmirateEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BlocConsumer<UserLocationBloc, UserLocationState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Form(
            key: createNewLocationKey,
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(
                horizontal: 15,
              ),
              children: [
                const SizedBox(
                  height: 24,
                ),
                Text(
                  "Location : ",
                  style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    height: .8,

                    // overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Expanded(
                      // child: _CustomTextFormField(
                      //   // emirate form field
                      //   theTitle: "Emirate",
                      //   hintText: "enter the mirate",
                      //   controller: emirateTextEditingController,
                      //   validate: true,
                      // ),

                      child: _CustomSelectEmirate(
                        // height: 40,
                        hintText: "choose the emirate",
                        controller: emirateTextEditingController,
                        theTitle: "Emirate",
                        validate: true,
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: _CustomTextFormField(
                        // area form field
                        theTitle: "the area",
                        hintText: "enter the area",
                        controller: areaTextEditingController,
                        validate: true,
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  width: 24,
                  height: 24,
                ),

                ///
                ///
                ///
                ///

                Row(
                  children: [
                    Expanded(
                      child: _CustomTextFormField(
                        // street form field
                        theTitle: "the Street",
                        hintText: "enter the street",
                        controller: streetTextEditingController,
                        validate: false,
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: _CustomTextFormField(
                        // building form field
                        theTitle: "Building",
                        hintText: "enter the building name",
                        controller: buildingTextEditingController,
                        validate: false,
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  width: 24,
                  height: 24,
                ),

                ///
                ///
                ///
                ///

                Row(
                  children: [
                    Expanded(
                      child: _CustomTextFormField(
                        // apartment form field
                        theTitle: "Apartment",
                        hintText: "enter the apartment",
                        controller: apartmentTextEditingController,
                        validate: false,
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: _CustomTextFormField(
                        // post code form field
                        theTitle: "POST code",
                        hintText: "enter the zip code",
                        controller: zipTextEditingController,
                        validate: false,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),

                ///
                ///
                ///

                Divider(
                  color: AppColors.grey2Color.withOpacity(.2),
                ),

                ///
                ///
                ///
                ///

                const SizedBox(
                  height: 24,
                ),

                ///
                ///
                ///
                ///

                Text(
                  "save the location as: ",
                  style: TextStyle(
                    color: AppColors.mainColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    height: .8,
                  ),
                ),

                const SizedBox(
                  height: 24,
                ),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _LocationTagController(
                        theLocationTitel: "Home",
                        isActive: true,
                      ),
                      _LocationTagController(
                        theLocationTitel: "work",
                        isActive: false,
                      ),
                      _AddNewLocationTage(),
                    ],
                  ),
                ),

                ///
                ///
                ///
                ///

                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: ElevatedButton(
                    // #### save location button #### //
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        AppColors.mainColor,
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      elevation: MaterialStateProperty.all(2),
                    ),
                    onPressed: () {
                      // validate and save location
                      // if (createNewLocationKey.currentState!.validate()) {
                      //   // save the new location
                      // }
                    },
                    child: const Text(
                      'Save Location',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        height: .8,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const SizedBox(
                  height: 24,
                ),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
          );
        },
      )),
    );
  }
}

class _AddNewLocationTage extends StatelessWidget {
  const _AddNewLocationTage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 55,
      // width: 100,

      height: 45,
      padding: EdgeInsets.symmetric(
        // horizontal: 12.5,
        horizontal: 15,
      ),
      margin: EdgeInsets.only(
        right: 10,
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.grey2Color.withOpacity(.4),
        ),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .5,
        child: Row(
          children: [
            Text(
              "Other",
              style: TextStyle(
                color: AppColors.mainColor,
                fontWeight: FontWeight.bold,
                fontSize: 15,
                height: .8,
              ),
            ),
            VerticalDivider(
              color: AppColors.mainColor,
              indent: 10,
              endIndent: 10,
            ),
            Expanded(
              child: TextFormField(
                controller: locationTageTextEditingController,
                // autofillHints: {"write your name"},
                decoration: InputDecoration(
                  border: InputBorder.none,
                  // focusedBorder: InputBorder.none,

                  hintText: "enter name",

                  hintStyle: TextStyle(
                    color: AppColors.grey2Color.withOpacity(.2),
                  ),
                  // labelText: AppStrings.email,
                ),

                maxLines: 1,

                // style: TextStyle(
                //   color: AppColors.grey2Color.withOpacity(
                //     .2,
                //   ),
                // ),
                // validator: validate
                //     ? (value) {
                //         if (value == null || value.isEmpty) {
                //           return 'this field is required';
                //         }
                //         return null;
                //       }
                //     : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LocationTagController extends StatelessWidget {
  final bool isActive;
  final String theLocationTitel;
  const _LocationTagController({
    super.key,
    required this.isActive,
    required this.theLocationTitel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 55,
      // width: 100,

      height: 45,
      padding: EdgeInsets.symmetric(
        // horizontal: 12.5,
        horizontal: 15,
      ),
      margin: EdgeInsets.only(
        right: 10,
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          color: isActive
              ? AppColors.mainColor
              : AppColors.grey2Color.withOpacity(.4),
        ),
        borderRadius: BorderRadius.circular(10),
        color: isActive ? AppColors.mainColor : Colors.white,
      ),

      child: Text(
        theLocationTitel,
        style: TextStyle(
          color: isActive ? Colors.white : AppColors.mainColor,
          fontWeight: FontWeight.bold,
          fontSize: 15,
          height: .8,
        ),
      ),
    );
  }
}

class _CustomTextFormField extends StatelessWidget {
  final double? height, width;
  final String hintText, theTitle;
  final TextEditingController controller;
  final bool validate;

  const _CustomTextFormField({
    super.key,
    this.height,
    this.width,
    required this.hintText,
    required this.controller,
    required this.validate,
    required this.theTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Text(
            theTitle,
            style: TextStyle(
              color: AppColors.mainColor,
              fontSize: 15,
              fontWeight: FontWeight.w500,
              height: .8,
              // overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: height,
          width: width ?? double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 15,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.grey2Color.withOpacity(.4),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            controller: controller,
            // autofillHints: {"write your name"},
            decoration: InputDecoration(
              border: InputBorder.none,
              // focusedBorder: InputBorder.none,

              hintText: hintText,

              hintStyle: TextStyle(
                color: AppColors.grey2Color.withOpacity(.2),
              ),
              // labelText: AppStrings.email,
            ),

            // maxLines: 1 ,

            // style: TextStyle(
            //   color: AppColors.grey2Color.withOpacity(
            //     .2,
            //   ),
            // ),
            validator: validate
                ? (value) {
                    if (value == null || value.isEmpty) {
                      return 'this field is required';
                    }
                    return null;
                  }
                : null,
          ),
        ),
      ],
    );
  }
}

class _CustomSelectEmirate extends StatelessWidget {
  final double? height, width;
  final String hintText, theTitle;
  final TextEditingController controller;
  final bool validate;

  const _CustomSelectEmirate({
    super.key,
    this.height,
    this.width,
    required this.hintText,
    required this.controller,
    required this.validate,
    required this.theTitle,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserLocationBloc, UserLocationState>(
      builder: (context, state) {
        if (state is LoadingAllEmiratesState) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.mainColor,
            ),
          );
        } else if (state is AllEmiratesLoadedState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Text(
                  theTitle,
                  style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    height: .8,
                    // overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: height,
                // height: 40,
                width: width ?? double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                // alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.grey2Color.withOpacity(.4),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),

                child: Center(
                  child: CustomDropdown<String>(
                    // hintText:  context.read<UserLocationBloc>().listOfEmirtates[0].nameEn,
                    hintBuilder: (context, hint) => Text(
                      "Emairate",
                      style: TextStyle(
                          color: AppColors.grey2Color.withOpacity(.2),
                          height: .8),
                    ),
                    items:
                        context.read<UserLocationBloc>().listOfEmirtatesNames,
                    // initialItem:
                    //     context.read<UserLocationBloc>().listOfEmirtatesNames [0],
                    closedHeaderPadding: EdgeInsets.only(
                      bottom: 5,
                    ),

                    maxlines: 1,
                    decoration: CustomDropdownDecoration(
                      listItemStyle:
                          TextStyle(color: AppColors.grey2Color, height: .8),
                      closedSuffixIcon: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: AppColors.mainColor,
                        size: 20,
                      ),
                      expandedSuffixIcon: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: AppColors.mainColor,
                        size: 20,
                      ),
                    ),
                    onChanged: (value) {
                      // log('changing value to: $value');
                    },
                  ),
                ),
              ),
            ],
          );
        } else
          return const SizedBox();
      },
    );
  }
}

// const SizedBox(
//   height: 10,
// ),
//             Container(
//                height:  40 ,
//                width:  double.infinity ,
//                decoration: BoxDecoration(
//             border: Border.all(color: AppColors.grey2Color.withOpacity(.2 ) ,

//             ) ,
//             borderRadius: BorderRadius.circular(10 ) ,
//                ),

//               //  child:  Expanded (

//             //  child:    TextFormField(
//  // i should see videos for flutte forms and flutter formfeilds and textfeilds, which one is better than the others

//             //  ),

//             //    ),
//             ),

///
///
///
///
///
///
///
///
///
///

// child: TextFormField(
                //   controller: controller,
                //   // autofillHints: {"write your name"},
                //   decoration: InputDecoration(
                //     border: InputBorder.none,
                //     // focusedBorder: InputBorder.none,

                //     hintText: hintText,

                //     hintStyle: TextStyle(
                //       color: AppColors.grey2Color.withOpacity(.2),
                //     ),
                //     // labelText: AppStrings.email,
                //   ),

                //   // maxLines: 1 ,

                //   // style: TextStyle(
                //   //   color: AppColors.grey2Color.withOpacity(
                //   //     .2,
                //   //   ),
                //   // ),
                //   validator: val
                //
                //       ? (value) {
                //           if (value == null || value.isEmpty) {
                //             return 'this field is required';
                //           }
                //           return null;
                //         }
                //       : null,
                // ),