part of "home_screen.dart";

class _CustomDrawer extends StatelessWidget {
  const _CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 2,
                        color: AppColors.mainColor,
                      ),
                      // image: DecorationImage(image: CachedNetworkImage(imageUrl:"+" ,))
                      image: const DecorationImage(
                          image: AssetImage(AppImages.tempPerson)),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        style: _customTitleTextStyle,
                        AppLocalizations.of(context)!.userName,
                      ),
                      Text(
                          style: _customLocalTextStyle,
                          AppLocalizations.of(context)!.userEmail),
                      const SizedBox(
                        width: 5,
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            _CustomDrawerListTile(
              title: AppLocalizations.of(context)!.homePage,
              onTap: () {},
              isActive: true,
              leading: AppImages.homeSvg,
            ),
            _CustomDrawerListTile(
              title: AppLocalizations.of(context)!.products,
              onTap: () {},
              isActive: false,
              leading: AppImages.productsSvg,
            ),
            _CustomDrawerListTile(
              title: AppLocalizations.of(context)!.tradeMark,
              onTap: () {},
              isActive: false,
              leading: AppImages.tradeMarkSvg,
            ),
            _CustomDrawerListTile(
              title: AppLocalizations.of(context)!.specialproducts,
              onTap: () {},
              isActive: false,
              leading: AppImages.specialproductsSvg,
            ),

            _CustomDrawerListTile(
              title: AppLocalizations.of(context)!.favourts,
              onTap: () {},
              isActive: false,
              leading: AppImages.favourtsStorkSvg,
            ),
            _CustomDrawerListTile(
              title: AppLocalizations.of(context)!.mycart,
              onTap: () {},
              isActive: false,
              leading: AppImages.mycartSvg,
            ),
            _CustomDrawerListTile(
              title: AppLocalizations.of(context)!.orders,
              onTap: () {},
              isActive: false,
              leading: AppImages.ordersSvg,
            ),
            _CustomDrawerListTile(
              title: AppLocalizations.of(context)!.personalPage,
              onTap: () {},
              isActive: false,
              leading: AppImages.personalPageSvg,
            ),
            _CustomDrawerListTile(
              title: AppLocalizations.of(context)!.suppourt,
              onTap: () {},
              isActive: false,
              leading: AppImages.suppourtSvg,
            ),
            _CustomDrawerListTile(
              title: AppLocalizations.of(context)!.contactUs,
              onTap: () {},
              isActive: false,
              leading: AppImages.contactUsSvg,
            ),

            //
            //
            ListTile(
              // titleAlignment: ListTileTitleAlignment.center,
              // selected: true,
              // selectedColor: AppColors.mainColor,
              // selectedTileColor: AppColors.mainColor,
              leading: SvgPicture.asset(
                // color: isActive == true ? Colors.white : AppColors.mainColor,
                // leading,
                color: AppColors.mainColor,
                AppImages.signOutSvg,
              ),
              title: Text(
                AppLocalizations.of(context)!.signOut,
                style:
                    _customTitleTextStyle.copyWith(color: AppColors.greyColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomDrawerListTile extends StatelessWidget {
  final void Function()? onTap;
  final bool isActive;
  final String leading, title;
  _CustomDrawerListTile({
    //  @required this.onTap,
    super.key,
    required this.onTap,
    required this.isActive,
    required this.leading,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
// set the new is active
        // navigate to the selected screen
        onTap;
      },
      child: Container(
        height: 45,
        width: double.infinity,
        // constraints: ,
        margin: isActive
            ? EdgeInsets.only(
                bottom: 10,
              )
            : EdgeInsets.all(0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: isActive == true ? AppColors.mainColor : Colors.transparent,
          boxShadow: isActive == true
              ? [
                  BoxShadow(
                    color: AppColors.mainGreyColor.withOpacity(.2),
                    blurRadius: 5,
                    offset: const Offset(3, 5),
                  ),
                ]
              : [],
        ),
        child: Column(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppConstants.emptySpaceTenPixl,
                  SizedBox(
                    height: 22,
                    width: 22,
                    child: SvgPicture.asset(
                      color:
                          isActive == true ? Colors.white : AppColors.mainColor,
                      leading,
                    ),
                  ),
                  AppConstants.emptySpaceTenPixl,
                  Text(
                    title,
                    style: _customTitleTextStyle.copyWith(
                      height: .5,
                      color:
                          isActive == true ? Colors.white : AppColors.greyColor,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 22,
                    width: 22,
                    child: Icon(
                      color:
                          isActive == true ? Colors.white : AppColors.greyColor,
                      Icons.arrow_forward_ios,
                    ),
                  ),
                  AppConstants.emptySpaceTenPixl,
                ],
              ),
            ),

            isActive == true
                ? const SizedBox()
                : Divider(
                    endIndent: 10,
                    indent: 10,
                    color: AppColors.greyColor.withOpacity(.15),
                  ),
            // Divider(
            //   color: AppColors.greyColor,
            // ),
          ],
        ),
      ),
    );
  }
}







            // ///
            // ///
            // ///

            // Container(
            //   width: double.infinity,
            //   height: 45,
            //   margin: const EdgeInsets.only(
            //     bottom: 15,
            //   ),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(15),
            //     color: Colors.white,
            //     boxShadow: const [
            //       // BoxShadow(
            //       //   color: AppColors.mainGreyColor.withOpacity(.2),
            //       //   blurRadius: 5,
            //       //   offset: Offset(3, 5),
            //       // ),
            //     ],
            //   ),
            //   child: Row(
            //     children: [
            //       SizedBox(
            //         width: 20,
            //       ),
            //       SizedBox(
            //         width: 22,
            //         height: 22,
            //         // child: Image.asset(
            //         //   width: 22,
            //         //   height: 22,
            //         //   AppImages.home,
            //         // ),
            //       ),
            //       SizedBox(
            //         width: 10,
            //       ),
            //       Text(
            //         style:
            //             TextStyle(color: AppColors.mainGreyColor, fontSize: 18),
            //         AppLocalizations.of(context)!.backToSignIn,
            //       ),
            //       SizedBox(
            //         width: 20,
            //       ),
            //     ],
            //   ),
            // ),

            // ///
            // ///
            // ///

            // Container(
            //   width: double.infinity,
            //   height: 45,
            //   margin: const EdgeInsets.only(
            //     bottom: 15,
            //   ),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(15),
            //     color: Colors.white,
            //     boxShadow: const [
            //       // BoxShadow(
            //       //   color: AppColors.mainGreyColor.withOpacity(.2),
            //       //   blurRadius: 5,
            //       //   offset: Offset(3, 5),
            //       // ),
            //     ],
            //   ),
            //   child: const Row(
            //     children: [
            //       SizedBox(
            //         width: 20,
            //       ),
            //       SizedBox(
            //         width: 22,
            //         height: 22,
            //         // child: Image.asset(
            //         //   width: 22,
            //         //   height: 22,
            //         //   AppImages.home,
            //         // ),
            //       ),
            //       SizedBox(
            //         width: 10,
            //       ),
            //       Text(
            //           style: TextStyle(
            //               color: AppColors.mainGreyColor, fontSize: 18),
            //           "home page"),
            //       SizedBox(
            //         width: 20,
            //       ),
            //     ],
            //   ),
            // ),

            // ///
            // ///
            // ///






                //   ListTile(
                //   contentPadding:
                //       EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
                //   // minVerticalPadding: 1,
                //   titleAlignment: ListTileTitleAlignment.center,
                //   // selected: true,
                //   // selectedColor: AppColors.mainColor,
                //   // selectedTileColor: AppColors.mainColor,
                //   leading: SizedBox(
                //     height: 22,
                //     width: 22,
                //     child: SvgPicture.asset(
                //       color: isActive == true ? Colors.white : AppColors.mainColor,
                //       leading,
                //     ),
                //   ),
                //   title: Text(
                //     title,
                //     style: _customTitleTextStyle.copyWith(
                //       height: .5,
                //       color: isActive == true ? Colors.white : AppColors.greyColor,
                //     ),
                //   ),
                
                //   trailing: SizedBox(
                //     height: 22,
                //     width: 22,
                //     child: Icon(
                //       color: isActive == true ? Colors.white : AppColors.greyColor,
                //       Icons.arrow_forward_ios,
                //     ),
                //   ),
                // ),