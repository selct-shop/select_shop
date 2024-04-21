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
          AppConstants.emptySpaceTenPixl,

          _bottomNavBarIcon(
            title: "Home",
            svgImageName: AppImages.homeSvg,
            screenNumber: 1,
            // isActive: context.read<HomeBloc>().activePageNumber == ,
          ),
          Spacer(),

          _bottomNavBarIcon(
            title: "Categoris",
            svgImageName: AppImages.categorisSvg,
            screenNumber: 2,
          ),

          //////
          ///
          ///
          Spacer(),
          Spacer(),
          Spacer(),
          //////
          ///
          ///
          _bottomNavBarIcon(
            title: "Favourite",
            svgImageName: AppImages.favourtsStorkSvg,
            screenNumber: 3,
          ),
          Spacer(),

          _bottomNavBarIcon(
            title: "Personal",
            svgImageName: AppImages.personalPageSvg,
            screenNumber: 4,
          ),

          AppConstants.emptySpaceTenPixl,
        ],
      ),
    );
  }
}

class _bottomNavBarIcon extends StatelessWidget {
  final String svgImageName, title;
  final int screenNumber;
  // final bool isActive;
  _bottomNavBarIcon({
    super.key,
    required this.svgImageName,
    required this.title,
    required this.screenNumber,
    //  required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return InkWell(
          onTap: ()  {
             context
                .read<HomeBloc>()
                .add(BottomNavBarTapdedEvent(tappdedPageNumber: screenNumber));

            // context.read<HomeBloc>().add(BottomNavBarTapdedEvent(
            //     tappdedPageNumber: screenNumber
            //     ));
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                height: 30, width: 30,
                svgImageName,

                // color: isActive ? AppColors.mainColor: AppColors.grey2Color,

                color: context.read<HomeBloc>().activePageNumber == screenNumber
                    ? AppColors.mainColor
                    : AppColors.greyColor,
              ),
              Text(
                title,
                style: TextStyle(
                    color: context.read<HomeBloc>().activePageNumber ==
                            screenNumber
                        ? AppColors.mainColor
                        : AppColors.greyColor,
                    fontSize: 10),
              )
            ],
          ),
        );
      },
    );
  }
}
