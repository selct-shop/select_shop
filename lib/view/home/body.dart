part of 'home_screen.dart';

class _HomeBody extends StatefulWidget {
  const _HomeBody({
    super.key,
  });

  @override
  State<_HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<_HomeBody> {
  //  @override

  @override
  void initState() {
    print("hoooooooooooooooomememem init state");

    context.read<HomeBloc>().add(HomeGetHomeCategoEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            _CustomCarsoulSlider(),
            const SizedBox(
              height: 20,
            ),
            InkWell(
                onTap: () {
                  // navigateTo(context, SearchScreen());
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return SearchScreen();
                  }));
                },
                child: SearchContainer()),
    
            ////////////////////////////////
            ///
            ///
            ///
            ////////////////////////////////
    
            const SizedBox(
              height: 20,
            ),
    
            _HomeCategoriesRow(),
    
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

class _HomeCategoriesRow extends StatelessWidget {
  const _HomeCategoriesRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              style: _customTitleTextStyle,
              "${S.of(context).categorys}: ",
            ),
            Spacer(),
            InkWell(
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return UnderDevScreen();
                // }));

                // context
                //     .read<HomeBloc>()
                //     .add(DrawerTapdedEvent(tappdedDrawerItemNumber: 5));

                context
                    .read<HomeBloc>()
                    .add(BottomNavBarTapdedEvent(tappdedPageNumber: 2));
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
            height: 165,
            width: double.infinity,
            clipBehavior: Clip.hardEdge,
            padding: EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
              color: AppColors.mainColor.withOpacity(.15),
              borderRadius: BorderRadius.circular(6),
            ),
            child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
              if (state is HomeGetHomeCatiegorLoadingState) {
                return Center(
                  child: LoadingAnimationWidget.discreteCircle(
                    // leftDotColor: const Color(0xFF1A1A3F),
                    // rightDotColor: const Color(0xFFEA3799),

                    // color: AppColors.mainColor,
                    color: AppColors.mainColor,
                    secondRingColor: AppColors.mainGreyColor,
                    thirdRingColor: AppColors.mainColor,

                    size: 100,
                  ),
                );
              } else if (state is HomeGetHomeCatiegorErrorState) {
                return ErrorScreen(errorMessage: state.errorMessage.toString());
              } else if (state is HomeGetHomeCatiegorsucseesState) {
                return ListView.builder(
                    itemCount: context
                        .read<HomeBloc>()
                        .categoresListForHomeScreen
                        .length,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
                      return Column(
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
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            // S.of(context).categorys,
                            // AppLocalizations.of(context)!.localeName
                            globalCachedUserLang == "ar"
                                ? context
                                    .read<HomeBloc>()
                                    .categoresListForHomeScreen[index]!
                                    .nameAr!
                                : context
                                    .read<HomeBloc>()
                                    .categoresListForHomeScreen[index]!
                                    .nameEn!,
                            // ?? S.of(context) ,
                            style: _customTitleTextStyle.copyWith(
                                fontWeight: FontWeight.bold, height: .8),
                          ),
                        ],
                      );
                    }));
              } else
                return const SizedBox();
            })),
      ],
    );
  }
}

// the categoreis list view
// ListView(
//             padding: EdgeInsets.symmetric(horizontal: 15),
//             scrollDirection: Axis.horizontal,
//             children: [
//               for (int i = 0; i < 10; i++)
//                 Column(
//                   children: [
//                     Container(
//                       width: 100,
//                       height: 100,
//                       margin: EdgeInsets.symmetric(horizontal: 8),
//                       decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           boxShadow: [
//                             BoxShadow(
//                               color: AppColors.mainGreyColor.withOpacity(.3),
//                               blurRadius: 3,
//                               offset: Offset(3, 3),
//                             ),
//                           ],
//                           image: DecorationImage(
//                             fit: BoxFit.cover,
//                             image: AssetImage(
//                               AppImages.mainCarouselSlider,
//                             ),
//                           )),
//                     ),
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     Text(
//                       style: _customTitleTextStyle.copyWith(
//                           fontWeight: FontWeight.bold, height: .8),
//                       S.of(context).categorys,
//                     ),
//                   ],
//                 ),
//             ],
//           );

class _CustomCarsoulSlider extends StatelessWidget {
  const _CustomCarsoulSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 170,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
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
                      color:
                          context.read<HomeBloc>().currentCarouselSliderIndex ==
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
    );
  }
}
