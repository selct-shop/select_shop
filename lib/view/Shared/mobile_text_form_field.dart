// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:intl_phone_field/countries.dart';
// import 'package:intl_phone_field/country_picker_dialog.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
// import 'package:special_line_rider/shared/theme/colors.dart';

// class MobileNumberField extends StatelessWidget {
//   const MobileNumberField({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return IntlPhoneField(
//       dropdownIcon: Icon(null),
//       onTap: () {},
//       pickerDialogStyle: PickerDialogStyle(backgroundColor: AppColors.bgColor),
//       decoration: InputDecoration(
//         filled: true,
//         //suffixIcon: suffixIcon,
//         // prefixIcon: Icon(
//         //   prefixIcon,
//         //   color: AppColors.greyColor,
//         // ),
//         fillColor: AppColors.bgColor,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(
//             16.r,
//           ),
//           borderSide: const BorderSide(color: AppColors.greyColor),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(
//             16.r,
//           ),
//           borderSide: const BorderSide(color: AppColors.greyColor),
//         ),
//         errorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(
//             16.r,
//           ),
//           borderSide: const BorderSide(color: AppColors.redColor),
//         ),
//         contentPadding: EdgeInsets.symmetric(
//           horizontal: 16.w,
//           vertical: 16.h,
//         ),
//         // hintText: label,
//         hintStyle: TextStyle(
//           color: AppColors.greyColor,
//         ),
//         errorStyle: TextStyle(
//           color: AppColors.redColor,
//           fontSize: 12.sp,
//           fontWeight: FontWeight.w500,
//         ),
//       ),
//       initialCountryCode: 'AE',
//       countries: const [
//         Country(
//           code: 'AE',
//           dialCode: "971",
//           name: 'UAE',
//           flag: '',
//           nameTranslations: {},
//           minLength: 0,
//           maxLength: 9,
//         ),
//       ],
//       onChanged: (phone) {
//         print(phone.completeNumber);
//       },
//     );
//   }
// }
