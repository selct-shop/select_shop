import 'package:fluttertoast/fluttertoast.dart';
import 'package:select_shop/core/theme/colors.dart';

showToast({required String message}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 3,
    backgroundColor: AppColors.mainGreyColor,
    textColor: AppColors.bgColor,
    fontSize: 12,
  );
}
