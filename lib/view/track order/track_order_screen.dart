// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:another_stepper/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter/widgets.dart';
import 'package:select_shop/core/theme/colors.dart';
import 'package:select_shop/generated/l10n.dart';
import 'package:select_shop/main.dart';
import 'package:select_shop/view/Shared/app_no_data.dart';
import 'package:select_shop/view/Shared/error_screen.dart';
import 'package:select_shop/view/Shared/loading_screen.dart';
// import 'package:select_shop/view/Shared/app_button.dart';
import 'package:select_shop/view/Shared/product_container.dart';
import 'package:select_shop/view/check%20out/models/post_order_response_model.dart';
import 'package:select_shop/view/track%20order/bloc/track_order_bloc.dart';

// Key _titleKey = Key();
TextStyle _customTitleTextStyle = TextStyle(
  color: AppColors.grey2Color,
  height: .7,
  fontWeight: FontWeight.bold,
  fontSize: 16,
);
TextStyle _customBodyTextStyle = TextStyle(
  color: AppColors.grey2Color,
  height: .8,
  // fontWeight: FontWeight.bold,
  fontSize: 16,
);

class TrackOrderScreen extends StatefulWidget {
  const TrackOrderScreen({super.key});

  @override
  State<TrackOrderScreen> createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {
  @override
  void initState() {
    // TODO: implement initState
    // print(globalCachedUserToken);
    context.read<TrackOrderBloc>().add(TrackOrderInitalEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Scaffold(
        body: BlocBuilder<TrackOrderBloc, TrackOrderState>(
          builder: (context, state) {
            if (state is TrackOrderLoadingState) {
              return CustomLoadingScreen();
            }

            if (state is TrackOrderEmptygState) {
              return AppNoData();
            }

            if (state is TrackOrderErrorState) {
              return Center(
                child: ErrorScreen(errorMessage: state.errorMessage!),
              );
            }

            if (state is TrackOrderSucsessState) {
              return Column(
                children: [
                  ///
                  ///
                  ///
                  ///
                  ///
                  ///
                  const SizedBox(
                    height: 30,
                    width: 30,
                  ),
                  Text(
                    S.of(context).trackOrder,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.mainColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      height: .8,
                    ),
                  ),

                  ///
                  ///
                  ///
                  ///

                  ///
                  const SizedBox(
                    height: 30,
                    width: 30,
                  ),
                  // ListView(
                  //     padding: EdgeInsets.symmetric(
                  //       horizontal: 15,
                  //     ),
                  //     shrinkWrap: true,
                  //     children: [
                  //     ],
                  //   ),

                  ListView.builder(
                      itemCount: state.ordersList.length,
                      itemBuilder: (context, index) {
                        //  Order order = state.ordersList[index];

                        return Container(
                          // height: 520,
                          width: double.infinity,
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: AppColors.grey2Color.withOpacity(.03),
                            borderRadius: BorderRadius.circular(10),
                          ),

                          child: Column(
                            children: [
                              _InfoWidget(
                                infoTitle: "${S.of(context).created_at} :",
                                infoDesc:
                                    "${state.ordersList[index].createdAt}",
                              ),
                              _InfoWidget(
                                infoTitle: "${S.of(context).name} :",
                                infoDesc: state.ordersList[index].customer.name,
                              ),
                              _InfoWidget(
                                infoTitle: "${S.of(context).phoneNum} :",
                                infoDesc: state
                                    .ordersList[index].customer.phoneNumber,
                              ),
                              _InfoWidget(
                                infoTitle: "${S.of(context).stats} :",
                                infoDesc: Localizations.localeOf(context)
                                            .languageCode ==
                                        "ar"
                                    ? state.ordersList[index].orderTrack.last
                                        .status.nameAr
                                    : state.ordersList[index].orderTrack.last
                                        .status.nameEn,
                              ),
                              _InfoWidget(
                                infoTitle: "${S.of(context).total} :",
                                infoDesc: state.ordersList[index].total,
                              ),
                            ],
                          ),
                        );

                        ///
                        ///
                        ///
                        ///
                        ///
                      })
                ],
              );
            } else {
              return Center(
                child: Text("unknnnown...."),
              );
            }
          },
        ),
      )),
    );
  }
}

class _InfoWidget extends StatelessWidget {
  final String? infoTitle, infoDesc;
  const _InfoWidget({
    required this.infoTitle,
    required this.infoDesc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: double.infinity,
      child: Row(
        children: [
          Text(
            // "${S.of(context).} :",
            infoTitle ?? "UK",

            overflow: TextOverflow.ellipsis,
            style: _customTitleTextStyle,
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Text(
              infoDesc ?? "UK",
              overflow: TextOverflow.ellipsis,
              style: _customBodyTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
