// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:select_shop/view/Shared/search_container.dart';

// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

// part of "home_screen.dart"
part of 'package:select_shop/view/home/home_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Hero(
          tag: "search",
          child: Scaffold(
            drawer: CustomDrawer(
              theHomeBuildContext: context,
            ),
            appBar: CustomAppBar(),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: DefaultTabController(
                  length: 5,
                  child: Column(
                    children: [
                      const SizedBox(
                        // height: 45,
                        height: 20,
                      ),
                      SearchContainer(),
                      const SizedBox(
                        // height: 30,
                        height: 20,
                      ),
                      TabBar(
                        padding: EdgeInsets.zero,
                        isScrollable: true,
                        // indicatorSize: TabBarIndicatorSize.label,
                        indicator: BoxDecoration(),
                        labelPadding: EdgeInsets.zero,
                        enableFeedback: true,
                        // indicatorPadding: EdgeInsets.zero,
                        tabAlignment: TabAlignment.start,
                        // unselectedLabelColor: Colors.black,

                        tabs: [
                          Tab(
                            // iconMargin: EdgeInsets.zero,
                            icon: _TabTitle(
                              theTitle: "t-shirt",
                            ),

                            // child: _CustomTabChild(),
                          ),
                          Tab(
                            icon: _TabTitle(
                              theTitle: "womens",
                            ),
                          ),
                          Tab(
                            icon: _TabTitle(
                              theTitle: "t-aaaaa",
                            ),
                          ),
                          Tab(
                            icon: _TabTitle(
                              theTitle: "t-bbbbb",
                            ),
                          ),
                          Tab(
                            icon: _TabTitle(
                              theTitle: "t-ccccc",
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            Icon(Icons.directions_car),
                            Icon(Icons.directions_transit),
                            Icon(Icons.directions_bike),
                            _CustomTabChild(),
                            _CustomTabChild(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            // floatingActionButton: CustomFloatingAcctionButton(),
            // bottomNavigationBar: CustomBottomNavBar(),
            // resizeToAvoidBottomInset: false, // Set this to false
          ),
        ),
      ),
    );
  }
}

class _CustomTabChild extends StatelessWidget {
  const _CustomTabChild({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Text("childdddd"));
  }
}

class _TabTitle extends StatelessWidget {
  final String? theTitle;
  const _TabTitle({
    super.key,
    required this.theTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      alignment: Alignment.center,
      width: null,
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        // vertical: 0,
      ),
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: AppColors.grey2Color.withOpacity(.1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
          bottomLeft: Radius.circular(5),
        ),
        border: Border.all(
          color: AppColors.greyColor,
        ),
      ),
      child: Text(
        theTitle ?? "  ",
        style: TextStyle(
          color: AppColors.mainColor,
          fontWeight: FontWeight.w900,
          fontSize: 18,
          height: .8,
        ),
      ),
    );
  }
}
