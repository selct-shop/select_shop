
part of "home_screen.dart";

class _CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(
        55,
      );
  _CustomAppBar({
    Key? key,

    // this.height = kToolbarHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(155),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        // height: 55,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
              // color: Colors.grey.withOpacity(0.5),
              color: const Color(0xff000000).withOpacity(.16),
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: SvgPicture.asset(
                AppImages.menuSvg,
              ),
            ),
            const Row(
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
            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const UnderDevScreen();
                }));
              },
              icon: const Icon(
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
