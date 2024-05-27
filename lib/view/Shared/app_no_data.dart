import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:select_shop/core/constants/app_images.dart';
import 'package:select_shop/core/theme/colors.dart';
import 'package:select_shop/generated/l10n.dart';
import 'package:select_shop/l10n/app_localizations.dart';

class AppNoData extends StatelessWidget {
  const AppNoData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Image(
          image: AssetImage(
            AppImages.noDataPng,
          ),
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
        // SizedBox(
        //   child: Center(
        //     child: SvgPicture.asset(
        //       width: 300,
        //       height: 300,
        //       alignment: Alignment.center,
        //       fit: BoxFit.cover,
        //       placeholderBuilder: (context) {
        //         return Center(
        //           child: Icon(
        //             Icons.error_outline_rounded,
        //           ),
        //         );
        //       },
        //       color: AppColors.mainColor,
        //       AppImagesSvg.noDataSvg,
        //     ),
        //   ),
        // ),
        Text(
          // S.of(context).shipment_no_data,
          S.of(context).noDataLikeThis,
          style: const TextStyle(
            color: AppColors.mainColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
