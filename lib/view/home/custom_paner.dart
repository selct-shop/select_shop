part of 'home_screen.dart';

class _CustomBanar extends StatelessWidget {
  const _CustomBanar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Text(
              style: _customTitleTextStyle,
              "${S.of(context).most_wanted} :",
            ),
            Spacer(),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return UnderDevScreen();
                }));
              },
              child: Text(
                style: _customTitleTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.mainColor),
                "${S.of(context).showAll}:",
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return UnderDevScreen();
            }));
          },
          child: Container(
            // height: 140,
            height: 280,
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.mainGreyColor.withOpacity(.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 15),
              scrollDirection: Axis.horizontal,
              children: [
                for (int i = 0; i < 10; i++)
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return UnderDevScreen();
                      }));
                    },
                    child: Container(
                      width: 180,
                      height: 170,
                      margin: EdgeInsets.only(right: 10),
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            8,
                          )),
                      child: Column(
                        children: [
                          Flexible(
                            flex: 3,
                            child: Stack(
                              children: [
                                Container(
                                  // margin: EdgeInsets.symmetric(horizontal: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      // fit: BoxFit.none,
                                      image: AssetImage(
                                        AppImages.mainCarouselSlider,
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 45,
                                      height: 25,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(8),
                                        ),
                                        color: Colors.yellow,
                                      ),
                                      child: Text(
                                        S.of(context).theNew,
                                        style: _customTitleTextStyle.copyWith(
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(
                                5,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                          style: TextStyle(fontSize: 10),
                                          "${S.of(context).category}:"),
                                      Text(
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: AppColors.mainColor),
                                        S.of(context).homePage,
                                      ),
                                      Spacer(),
                                      Row(
                                        children: [
                                          for (int i = 1; i <= 5; i++)
                                            Icon(
                                              size: 12,
                                              color: AppColors.mainColor,
                                              Icons.star_rounded,
                                            )
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          "women sport shose"),
                                      Spacer(),
                                      Text(
                                        "chanel".toUpperCase(),
                                        style: _customTitleTextStyle.copyWith(
                                          fontSize: 10,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      Image.asset(
                                        AppImages.chanelLogoJfif,
                                        width: 12,
                                        height: 12,
                                      )
                                    ],
                                  ),

                                  ///
                                  ///
                                  ///
                                  ///

                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: AppColors.mainColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          "${S.of(context).aed} 350"),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                        "${S.of(context).aed} 266"
                                            .toUpperCase(),
                                        style: _customTitleTextStyle.copyWith(
                                          fontSize: 8,
                                          color: Colors.black,
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        width: 38,
                                        height: 15,
                                        decoration: BoxDecoration(
                                          color: AppColors.mainColor
                                              .withOpacity(.1),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Image.asset(
                                          height: 10,
                                          width: 510,
                                          AppImages.cartSmall,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
