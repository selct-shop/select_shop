part of 'home_screen.dart';

class _CustomBottomNavBar extends StatelessWidget {
  const _CustomBottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        // vertical: 10,
      ),
      width: double.infinity,
      height: 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: AppColors.mainGreyColor.withOpacity(.1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          )),
      child: Row(
        children: [
          InkWell(
            onTap: () async {
              await context.read<HomeBloc>().bottomNavBarTapded(1);

              context.read<HomeBloc>().add(BottomNavBarTapdedEvent(
                  // tappdedPageNumber: 1
                  ));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image(
                //   width: 34,
                //   height: 34,
                //   image: AssetImage(
                //     AppImages.home,
                //   ),
                // ),

                Icon(
                  color: AppColors.mainColor,
                  size: 35,
                  Icons.home_rounded,
                ),
                Text(
                  "Home",
                  style:
                      TextStyle(color: AppColors.mainGreyColor, fontSize: 10),
                )
              ],
            ),
          ),

          //////
          ///
          ///
          ///
          ///
          Spacer(),

          const SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () async {
              await context.read<HomeBloc>().bottomNavBarTapded(2);

              context.read<HomeBloc>().add(BottomNavBarTapdedEvent());
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image(
                //   width: 34,
                //   height: 34,
                //   image: AssetImage(
                //     AppImages.catigeores,
                //   ),
                // ),

                Icon(
                  color: AppColors.mainColor,
                  size: 35,
                  Icons.category_rounded,
                ),
                Text(
                  "categories",
                  style:
                      TextStyle(color: AppColors.mainGreyColor, fontSize: 10),
                )
              ],
            ),
          ),

          //////
          ///
          ///
          ///
          ///
          Spacer(),
          Spacer(),
          Spacer(),
          //////
          ///
          ///
          ///
          ///

          InkWell(
            onTap: () async {
              await context.read<HomeBloc>().bottomNavBarTapded(3);

              context.read<HomeBloc>().add(BottomNavBarTapdedEvent());
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image(
                //   width: 34,
                //   height: 34,
                //   image: AssetImage(
                //     AppImages.favFilled,
                //   ),
                // ),

                Icon(
                  color: AppColors.mainColor,
                  size: 35,
                  Icons.favorite_rounded,
                ),
                Text(
                  "favourite",
                  style:
                      TextStyle(color: AppColors.mainGreyColor, fontSize: 10),
                )
              ],
            ),
          ),

          //////
          ///
          ///
          ///
          ///
          Spacer(),
          const SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () async {
              await context.read<HomeBloc>().bottomNavBarTapded(4);

              context.read<HomeBloc>().add(BottomNavBarTapdedEvent());
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image(
                //   width: 34,
                //   height: 34,
                //   image: AssetImage(
                //     AppImages.person,
                //   ),
                // ),

                Icon(
                  color: AppColors.mainColor,
                  size: 35,
                  Icons.person_rounded,
                ),
                Text(
                  "personal",
                  style:
                      TextStyle(color: AppColors.mainGreyColor, fontSize: 10),
                )
              ],
            ),
          ),

          //////
          ///
          ///
          ///
          ///
        ],
      ),
    );
  }
}
