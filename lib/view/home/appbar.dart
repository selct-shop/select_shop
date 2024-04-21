part of 'home_screen.dart';
class _CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(
        55,
      );
  _CustomAppBar({
    Key? key,

    // this.height = kToolbarHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(155),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        // height: 55,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
              // color: Colors.grey.withOpacity(0.5),
              color: Color(0xff000000).withOpacity(.16),
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              // child: Image(
              //   image: AssetImage(
              //     AppImages.menu,
              //   ),
              // ),

              // child: Icon(
              //   color: AppColors.mainColor,
              //   size: 30,
              //   Icons.menu_rounded,
              // ),

              child: SvgPicture.asset(
                AppImages.menuSvg,
              ),
            ),
            Row(
              children: [
                Image(
                  height: 40,
                  width: 40,
                  image: AssetImage(
                    AppImages.logoSmall,
                  ),
                ),
                Image(
                  image: AssetImage(
                    AppImages.selectShopText,
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return UnderDevScreen();
                }));
              },
              // child: Image(
              //   image: AssetImage(
              //     AppImages.notification,
              //   ),
              // ),

              child: Icon(
                  color: AppColors.mainColor,
                  size: 30,
                  Icons.notifications_rounded),
            )
          ],
        ),
      ),
    );
  }
}
