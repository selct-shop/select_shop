// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:select_shop/core/theme/colors.dart';
import 'package:select_shop/generated/l10n.dart';

TextEditingController phonNumber = TextEditingController();
TextEditingController name = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController titel = TextEditingController();

TextStyle _customLocalTextStyle = const TextStyle(
  color: AppColors.grey2Color,
  height: .8,
  fontSize: 16,
  fontWeight: FontWeight.w500,
);

class EditUserProfileScreen extends StatelessWidget {
  const EditUserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(
              S.of(context).phoneNum,
              style: TextStyle(
                color: AppColors.grey2Color,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              // email or phone number
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.grey.withOpacity(.5),
                      offset: Offset(0.0, 1.0),
                      blurRadius: 1.0,
                    ),
                  ],
                  color: Colors.white),
              child: TextFormField(
                // name: S.of(context).email,
                // validator: (value) {
                //   // context.read<AuthBloc>().validateEmail(value);
                //   context.read<AuthBloc>().customValidator(value);
                // },

                //                 validator: FormBuilderValidators.compose([
                //      /// Makes this field required
                //      FormBuilderValidators.required(),

                //     /// Ensures the value entered is numeric - with a custom error message
                //     FormBuilderValidators.numeric(errorText: 'La edad debe ser numérica.'),

                //     /// Sets a maximum value of 70
                //     FormBuilderValidators.max(70),

                //     /// Include your own custom `FormFieldValidator` function, if you want
                //     /// Ensures positive values only. We could also have used `FormBuilderValidators.min(0)` instead
                //     (value) {
                //          final number = int.tryParse(value!);
                //         if (number == null) return null;
                //         if (number < 0) return 'We cannot have a negative age';
                //         return null;
                //     },
                // ]),

                // validator: (emailOrPhoneNum) {
                // emailOrPhoneNum!.length < 5 ? 'falsssse' : null;
                // print(emailOrPhoneNum);
                // emailOrPhoneNum == null
                // },

                // #### fully working validator #### //
                // #### #### //
                validator: (value) {
                  final phoneExp = RegExp(r'^\+?1?\d{9,15}$');
                  // print("vvvvvvvvvvvvvvvvvvvvvvvv${value.runtimeType}");
                  if (value == null || value.isEmpty) {
                    return 'Please enter a phone number';
                  }

                  if (value.length < 9) {
                    return 'Password must be at least 9 characters long';
                  }

                  if (!phoneExp.hasMatch(value)) {
                    return 'Please enter a trueee phone number';
                  }
                  return null;
                },
                controller: phonNumber,
                decoration: InputDecoration(
                  // the hint text was S.email but i change it for S.phoneNumber
                  hintText: S.of(context).phoneNum,
                  hintStyle: _customLocalTextStyle,
                  border: InputBorder.none,
                  contentPadding: EdgeInsetsDirectional.symmetric(
                    horizontal: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              S.of(context).fullName,
              style: TextStyle(
                color: AppColors.grey2Color,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              // email or phone number
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.grey.withOpacity(.5),
                      offset: Offset(0.0, 1.0),
                      blurRadius: 1.0,
                    ),
                  ],
                  color: Colors.white),
              child: TextFormField(
                // name: S.of(context).email,
                // validator: (value) {
                //   // context.read<AuthBloc>().validateEmail(value);
                //   context.read<AuthBloc>().customValidator(value);
                // },

                //                 validator: FormBuilderValidators.compose([
                //      /// Makes this field required
                //      FormBuilderValidators.required(),

                //     /// Ensures the value entered is numeric - with a custom error message
                //     FormBuilderValidators.numeric(errorText: 'La edad debe ser numérica.'),

                //     /// Sets a maximum value of 70
                //     FormBuilderValidators.max(70),

                //     /// Include your own custom `FormFieldValidator` function, if you want
                //     /// Ensures positive values only. We could also have used `FormBuilderValidators.min(0)` instead
                //     (value) {
                //          final number = int.tryParse(value!);
                //         if (number == null) return null;
                //         if (number < 0) return 'We cannot have a negative age';
                //         return null;
                //     },
                // ]),

                // validator: (emailOrPhoneNum) {
                // emailOrPhoneNum!.length < 5 ? 'falsssse' : null;
                // print(emailOrPhoneNum);
                // emailOrPhoneNum == null
                // },

                // #### fully working validator #### //
                // #### #### //
                validator: (value) {
                  final phoneExp = RegExp(r'^\+?1?\d{9,15}$');
                  // print("vvvvvvvvvvvvvvvvvvvvvvvv${value.runtimeType}");
                  if (value == null || value.isEmpty) {
                    return 'Please enter a phone number';
                  }

                  if (value.length < 9) {
                    return 'Password must be at least 9 characters long';
                  }

                  if (!phoneExp.hasMatch(value)) {
                    return 'Please enter a trueee phone number';
                  }
                  return null;
                },
                controller: phonNumber,
                decoration: InputDecoration(
                  // the hint text was S.email but i change it for S.phoneNumber
                  hintText: S.of(context).fullName,
                  hintStyle: _customLocalTextStyle,
                  border: InputBorder.none,
                  contentPadding: EdgeInsetsDirectional.symmetric(
                    horizontal: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              S.of(context).email,
              style: TextStyle(
                color: AppColors.grey2Color,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              // email or phone number
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.grey.withOpacity(.5),
                      offset: Offset(0.0, 1.0),
                      blurRadius: 1.0,
                    ),
                  ],
                  color: Colors.white),
              child: TextFormField(
                // name: S.of(context).email,
                // validator: (value) {
                //   // context.read<AuthBloc>().validateEmail(value);
                //   context.read<AuthBloc>().customValidator(value);
                // },

                //                 validator: FormBuilderValidators.compose([
                //      /// Makes this field required
                //      FormBuilderValidators.required(),

                //     /// Ensures the value entered is numeric - with a custom error message
                //     FormBuilderValidators.numeric(errorText: 'La edad debe ser numérica.'),

                //     /// Sets a maximum value of 70
                //     FormBuilderValidators.max(70),

                //     /// Include your own custom `FormFieldValidator` function, if you want
                //     /// Ensures positive values only. We could also have used `FormBuilderValidators.min(0)` instead
                //     (value) {
                //          final number = int.tryParse(value!);
                //         if (number == null) return null;
                //         if (number < 0) return 'We cannot have a negative age';
                //         return null;
                //     },
                // ]),

                // validator: (emailOrPhoneNum) {
                // emailOrPhoneNum!.length < 5 ? 'falsssse' : null;
                // print(emailOrPhoneNum);
                // emailOrPhoneNum == null
                // },

                // #### fully working validator #### //
                // #### #### //
                validator: (value) {
                  final phoneExp = RegExp(r'^\+?1?\d{9,15}$');
                  // print("vvvvvvvvvvvvvvvvvvvvvvvv${value.runtimeType}");
                  if (value == null || value.isEmpty) {
                    return 'Please enter a phone number';
                  }

                  if (value.length < 9) {
                    return 'Password must be at least 9 characters long';
                  }

                  if (!phoneExp.hasMatch(value)) {
                    return 'Please enter a trueee phone number';
                  }
                  return null;
                },
                controller: email,
                decoration: InputDecoration(
                  // the hint text was S.email but i change it for S.phoneNumber
                  hintText: S.of(context).phoneNum,
                  hintStyle: _customLocalTextStyle,
                  border: InputBorder.none,
                  contentPadding: EdgeInsetsDirectional.symmetric(
                    horizontal: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              S.of(context).address,
              style: TextStyle(
                color: AppColors.grey2Color,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              // email or phone number
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.grey.withOpacity(.5),
                      offset: Offset(0.0, 1.0),
                      blurRadius: 1.0,
                    ),
                  ],
                  color: Colors.white),
              child: TextFormField(
                // name: S.of(context).email,
                // validator: (value) {
                //   // context.read<AuthBloc>().validateEmail(value);
                //   context.read<AuthBloc>().customValidator(value);
                // },

                //                 validator: FormBuilderValidators.compose([
                //      /// Makes this field required
                //      FormBuilderValidators.required(),

                //     /// Ensures the value entered is numeric - with a custom error message
                //     FormBuilderValidators.numeric(errorText: 'La edad debe ser numérica.'),

                //     /// Sets a maximum value of 70
                //     FormBuilderValidators.max(70),

                //     /// Include your own custom `FormFieldValidator` function, if you want
                //     /// Ensures positive values only. We could also have used `FormBuilderValidators.min(0)` instead
                //     (value) {
                //          final number = int.tryParse(value!);
                //         if (number == null) return null;
                //         if (number < 0) return 'We cannot have a negative age';
                //         return null;
                //     },
                // ]),

                // validator: (emailOrPhoneNum) {
                // emailOrPhoneNum!.length < 5 ? 'falsssse' : null;
                // print(emailOrPhoneNum);
                // emailOrPhoneNum == null
                // },

                // #### fully working validator #### //
                // #### #### //
                validator: (value) {
                  final phoneExp = RegExp(r'^\+?1?\d{9,15}$');
                  // print("vvvvvvvvvvvvvvvvvvvvvvvv${value.runtimeType}");
                  if (value == null || value.isEmpty) {
                    return 'Please enter a phone number';
                  }

                  if (value.length < 9) {
                    return 'Password must be at least 9 characters long';
                  }

                  if (!phoneExp.hasMatch(value)) {
                    return 'Please enter a trueee phone number';
                  }
                  return null;
                },
                controller: phonNumber,
                decoration: InputDecoration(
                  // the hint text was S.email but i change it for S.phoneNumber
                  hintText: S.of(context).address,
                  hintStyle: _customLocalTextStyle,
                  border: InputBorder.none,
                  contentPadding: EdgeInsetsDirectional.symmetric(
                    horizontal: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
