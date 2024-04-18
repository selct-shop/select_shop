// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';


// class AppTextFormField extends StatelessWidget {
//   final void Function(String)? onChanged;
//   final String? label;
//   //final String? labelEn;
//   final bool isPassword;
//   final String? Function(String?)? validator;
//   final TextEditingController? controller;
//   final IconData? prefixIcon;
//   final Widget? suffixIcon;
//   final TextInputType? keyboardType;
//   final List<TextInputFormatter>? inputFormatters;
//   final int? maxLines;
//   final void Function(String)? onFieldSubmitted;
//   const AppTextFormField({
//     Key? key,
//     required this.onChanged,
//     this.isPassword = false,
//     required this.validator,
//     required this.controller,
//     this.prefixIcon,
//     this.label,
//     this.suffixIcon,
//     this.keyboardType,
//     this.inputFormatters,
//     this.maxLines = 1,
//     this.onFieldSubmitted,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<AppCubit, AppState>(
//       listener: (context, state) {
//         // TODO: implement listener
//       },
//       builder: (context, state) {
//         AppCubit cubit = AppCubit.get(context);
//         return Padding(
//           padding: EdgeInsets.symmetric(
//             horizontal: 0.w,
//           ),
//           child: TextFormField(
//             controller: controller,
//             validator: validator,
//             keyboardType: keyboardType,
//             inputFormatters: [],
            
//             cursorColor: cubit.isDark ? AppColors.bgColor : AppColors.greyColor,
//             obscureText: isPassword,
//             maxLines: maxLines,
//             obscuringCharacter: '*',
//             decoration: InputDecoration(
//               filled: true,
//               suffixIcon: suffixIcon,
//               prefixIcon: Icon(
//                 prefixIcon,
//                 color: cubit.isDark ? AppColors.bgColor : AppColors.greyColor,
//               ),
//               fillColor:
//                   cubit.isDark ? AppColors.darkGreyColor : AppColors.bgColor,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(
//                   16.r,
//                 ),
//                 borderSide: BorderSide(
//                     color:
//                         cubit.isDark ? AppColors.bgColor : AppColors.greyColor),
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(
//                   16.r,
//                 ),
//                 borderSide: BorderSide(
//                     color:
//                         cubit.isDark ? AppColors.bgColor : AppColors.greyColor),
//               ),
//               errorBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(
//                   16.r,
//                 ),
//                 borderSide: const BorderSide(color: AppColors.redColor),
//               ),
//               contentPadding: EdgeInsets.symmetric(
//                 horizontal: 16.w,
//                 vertical: 16.h,
//               ),
//               hintText: label,
              
//               hintStyle: TextStyle(
//                 color: cubit.isDark ? AppColors.bgColor : AppColors.greyColor,
//               ),
//               errorStyle: TextStyle(
//                 color: AppColors.redColor,
//                 fontSize: 12.sp,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//             cursorHeight: 16.h,
//             onChanged: onChanged,
//             onFieldSubmitted: onFieldSubmitted,
//           ),
//         );
//       },
//     );
//   }
// }
