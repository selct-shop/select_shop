part of 'home_screen.dart';

class _HomeBody extends StatelessWidget {
  const _HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 170,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  clipBehavior: Clip.hardEdge,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      viewportFraction: 1,
                      // height: 75,

                      scrollDirection: Axis.vertical,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),

                      onPageChanged: (index, reason) {
                        context
                            .read<HomeBloc>()
                            .onCarouselSliderPageChanged(index: index);
                      },
                    ),
                    items: [1, 2, 3].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Image(
                              height: 170,
                              width: double.infinity,
                              fit: BoxFit.fill,
                              image: AssetImage(
                                AppImages.mainCarouselSlider,
                              ));
                        },
                      );
                    }).toList(),
                  ),
                ),
                Positioned(
                  left: 10,
                  top: 46,
                  child: SizedBox(
                    height: 80,
                    // width: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (int i = 0; i < 3; i++)
                          AnimatedContainer(
                            duration: Duration(seconds: 1),
                            // width: _currentIndex == i ? 20 : 8.0,
                            width: 5,
                            height: 20,
                            margin: EdgeInsets.symmetric(horizontal: 2.0),
                            decoration: BoxDecoration(
                              // shape: BoxShape.circle,
                              color: context
                                          .read<HomeBloc>()
                                          .currentCarouselSliderIndex ==
                                      i
                                  ? AppColors.mainColor
                                  : Colors.grey,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
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
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return UnderDevScreen();
                      }));
                    },
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
            ),

            ////////////////////////////////
            ///
            ///
            ///
            ////////////////////////////////

            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  style: _customTitleTextStyle,
                  "${S.of(context).categorys}: ",
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return UnderDevScreen();
                    }));

                    // context
                    //     .read<HomeBloc>()
                    //     .add(DrawerTapdedEvent(tappdedDrawerItemNumber: 5));
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
            Container(
              // height: 140,
              height: 165,

              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                color: AppColors.mainColor.withOpacity(.15),
                borderRadius: BorderRadius.circular(6),
              ),
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 15),
                scrollDirection: Axis.horizontal,
                children: [
                  for (int i = 0; i < 10; i++)
                    Column(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      AppColors.mainGreyColor.withOpacity(.3),
                                  blurRadius: 3,
                                  offset: Offset(3, 3),
                                ),
                              ],
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  AppImages.mainCarouselSlider,
                                ),
                              )),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          style: _customTitleTextStyle.copyWith(
                              fontWeight: FontWeight.bold, height: .8),
                          S.of(context).categorys,
                        ),
                      ],
                    ),
                ],
              ),
            ),

            ////////////////////////////
            ///
            ///
            ///////////////////////////

            _CustomBanar(),

            ////////////////////////////
            ///
            ///
            ///////////////////////////
            _CustomBanar(),

            ////////////////////////////
            ///
            ///
            ///////////////////////////
            _CustomBanar(),

            ////////////////////////////
            ///
            ///
            ///////////////////////////
            _CustomBanar(),

            ////////////////////////////
            ///
            ///
            ///////////////////////////
          ],
        ),
      ),
    );
  }
}
