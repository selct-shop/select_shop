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
        // const Image(
        //   image: AssetImage(
        //     AppImages.noData,
        //   ),
        //   width: 300,
        //   height: 300,
        //   fit: BoxFit.cover,
        // ),
        SizedBox(
          child: Center(
            child: SvgPicture.asset(
              AppImagesSvg.noDataSvg,
              width: 300,
              height: 300,
            ),
          ),
        ),
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
