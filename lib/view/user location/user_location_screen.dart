// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:select_shop/core/constants/app_images.dart';
import 'package:select_shop/core/functions/nav_func.dart';
import 'package:select_shop/core/theme/colors.dart';
import 'package:select_shop/models/Location%20models/getAllEmaritesModle.dart';
import 'package:select_shop/view/Shared/app_button.dart';
import 'package:select_shop/view/user%20location/bloc/user_location_bloc.dart';
import 'package:select_shop/view/user%20location/create_new_location.dart';
import 'package:select_shop/view/user%20location/models/local_location_model.dart';

// enum SavedUserLocations<String> {  onn "Ajman", "Ajman", "Ajman" , "Ajman" }
class UserLocationsScreen extends StatefulWidget {
  const UserLocationsScreen({super.key});

  @override
  State<UserLocationsScreen> createState() => _UserLocationsScreenState();
}

class _UserLocationsScreenState extends State<UserLocationsScreen> {
  @override
  void initState() {
    context.read<UserLocationBloc>().add(GetLocalLocationsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AddressCityModle newAddressCityModel = AddressCityModle(
      id: 2,
      nameEn: "Dubai",
      nameAr: "دبي",
      createdAt: DateTime(
        2024,
      ),
      updatedAt: DateTime(2024),
      isDeleted: false,
    );
    LocalLocationModel newLocationModel = LocalLocationModel(
      addressCityModle: newAddressCityModel,
      locationTag: "ttest",
      theAppartment: "ttest",
      theArea: "ttest",
      theBuilding: "ttest",
      thePost: "ttest",
      theStreet: "ttest",
    );
    return Scaffold(
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(
            horizontal: 15,
          ),
          children: [
            ListView.separated(
              shrinkWrap: true,
              itemCount: 4,
              separatorBuilder: (context, index) {
                // <-- SEE HERE
                return Divider(
                  color: AppColors.grey2Color.withOpacity(.2),
                  height: 0,
                  // endIndent: 0,
                  // indent: 0,
                  thickness: 1,
                );
              },
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    // chose this location
                  },
                  contentPadding: EdgeInsets.all(0),
                  leading: Container(
                    height: 33,
                    width: 33,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: SvgPicture.asset(
                      height: 22,
                      width: 22,
                      // alignment: Alignment.center,
                      colorFilter:
                          ColorFilter.mode(Colors.white, BlendMode.srcIn),
                      AppImagesSvg.homeSvg,
                    ),
                  ),
                  title: SizedBox(
                    width: double.infinity,
                    child: Text(
                      "home location",
                      // style: TextStyle(),
                    ),
                  ),
                  titleTextStyle: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    height: .8,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: SizedBox(
                      width: double.infinity,
                      child: Text("Ajman, Al rumela villa No 5")),
                  subtitleTextStyle: TextStyle(
                    color: AppColors.grey2Color,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    height: .8,
                    overflow: TextOverflow.ellipsis,
                  ),
                  // trailing: Radio(
                  //   // value: "user location",
                  //   value: SingingCharacter.values[index],
                  //   // groupValue: "list of user locations",
                  //   groupValue: SingingCharacter,
                  //   onChanged: (final theNewUserLocation ) {
                  //     // controller change the delivery location with the new passed location
                  //   },
                  //   activeColor: AppColors.mainColor,

                  //   // fillColor: ,

                  // ),
                );
              },
            ),
            const SizedBox(
              height: 24,
            ),
            InkWell(
              onTap: () {
                // navigate to add new location
                navigateTo(context, CreateNewLocationScreen());
              },
              child: Container(
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 2),
                      blurRadius: 2,
                      spreadRadius: 2,
                      color: Colors.black12,
                    ),
                  ],
                ),

                child: Row(
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    const Icon(
                      Icons.add_circle_outline_rounded,
                      size: 24,
                      color: AppColors.mainColor,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      "add location",
                      style: TextStyle(
                        color: AppColors.mainColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        height: .8,

                        // overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 24,
                      color: AppColors.mainColor,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                  ],
                ),
                // child: ListTile(
                //   titleAlignment: ListTileTitleAlignment.center,
                //   leading: Icon(
                //     Icons.add_circle_outline_rounded,
                //     size: 24,
                //     color: AppColors.mainColor,
                //   ),
                //   title: Text(
                //     "add location",
                //   ),
                //   titleTextStyle: TextStyle(
                //     color: AppColors.mainColor,
                //     fontSize: 15,
                //     fontWeight: FontWeight.bold,
                //     height: .8,
                //     // overflow: TextOverflow.ellipsis,
                //   ),
                // ),
              ),
            ),
            AppButton(
              title: "add new location",
              backgroundColor: Colors.yellow,
              onTap: () {
                context.read<UserLocationBloc>().add(
                    AddUserLocationEvent(localLocationModel: newLocationModel));
              },
            ),
            const SizedBox(
              height: 24,
            ),
            AppButton(
              title: "add new location",
              backgroundColor: Colors.yellow,
              onTap: () {
                context.read<UserLocationBloc>().add(GetLocalLocationsEvent(
                  
                ));
              },
            ),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
