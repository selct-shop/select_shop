import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:meta/meta.dart';
import 'package:select_shop/core/constants/app_constants.dart';
import 'package:select_shop/core/helpers/cache_helper.dart';
import 'package:select_shop/core/helpers/dio_helper.dart';
import 'package:select_shop/core/helpers/user_experience_helper.dart';
import 'package:select_shop/generated/l10n.dart';
import 'package:select_shop/main.dart';
import 'package:select_shop/models/auth/sign_in_modle.dart';
import 'package:select_shop/models/auth/sign_up_modle.dart';
import 'package:select_shop/view/Auth/login_screen.dart';
import 'package:select_shop/view/Auth/signup_screen.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  String? cashedUserName;
  String? cashedUserID;
  String? cashedUserEmail;
  String? cashedUserToken;
  String? cashedUserPhoneNum;
//
//
  _cashUserData({
    required String token,
    required String userName,
    required String userID,
    String? userPhoneNumber,
    String? userEmail,
  }) async {
    // userToken = token;
    // userName = userName;
    // userID = userID;
    // userPhoneNum = userPhoneNumber;
    // userEmail = userEmail;
//
//
//
//
    await CacheHelper.setData(key: AppConstants.cachedUserToken, value: token);
    await CacheHelper.setData(
        key: AppConstants.cachedUserName, value: userName);

    await CacheHelper.setData(key: AppConstants.cachedUserID, value: userID);
    await CacheHelper.setData(
        key: AppConstants.cachedUserPhonNum, value: userPhoneNumber);
    await CacheHelper.setData(
        key: AppConstants.cachedUserEmail, value: userEmail ?? "");

    cashedUserName = userName;
    cashedUserID = userID;
    cashedUserEmail = userEmail ?? "";
    cashedUserToken = token;
    cashedUserPhoneNum = userPhoneNumber ?? "";
  }

  String? validateName(String? value) {
    if (value!.isEmpty) {
      return 'Name cannot be empty';
    }
    if (value.length < 3) {
      return 'Name must be more than 2 charater';
    } else {
      return null;
    }
  }

  String? validateMobile(String? value) {
    if (value!.isEmpty) {
      return 'Phone number cannot be empty';
    }
    if (value.length != 10) {
      return 'Mobile Number must be of 10 digit';
    } else {
      return null;
    }
  }

  customValidator(text) {
    if (text == null || text.isEmpty) {
      return 'Can\'t be empty';
    }
    if (text.length < 4) {
      return 'Too short';
    }
    return null;
  }

  //   String? validatepassword(String? value) {
  //  if ( value != null ){

  //    if (value.isEmpty ) {
  //     return 'password cannot be empty';
  //   }
  //   if (value.length < 4) {
  //     return 'password must be longer than 4 digit';
  //   }
  //  }

  //  else {
  //     return 'password cannot be empty';

  //   }
  // }

  // String? validateEmail(String? value) {
  //   String pattern =
  //       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  //   RegExp regex = RegExp(pattern);

  //   if (value != null) {
  //     if (value.isEmpty) {
  //       return 'Email cannot be empty';
  //     }
  //     if (!regex.hasMatch(value)) {
  //       return 'Enter Valid Email';
  //     } else {
  //       return null;
  //     }
  //   } else {
  //     return 'Email cannot be empty';
  //   }
  // }

  AuthBloc() : super(AuthInitialState()) {
    on<AuthEvent>((event, emit) async {
      // #### log in #### //
      emit(AuthLoadingStateSignIn());

      if (event is AuthLogInEvent) {
// check for network
        bool result = await InternetConnectionChecker().hasConnection;
        if (result == true) {
// form validation
// print("tttttttttttttttttttttttttttttttttt${signInFormKey.currentState!.validate()}");
          // if (signInFormKey.currentState == null) {
          // if (signInFormKey.currentState!.validate() == true) {
          // signInFormKey.currentState!.save();

          // start sign in

          Response logInResponse = await DioHelper.login(
            phoneNumber: phoneNumberTextEditingController.text,
            password: passwordTextEditingController.text,
            // phoneNumber: '1234',
            // password: '1234',
          );

          print(logInResponse.statusCode);

          // await DioHelper.login(phoneNumber: '1234', password: '1234');
          if (logInResponse.statusCode == 200) {
            // save token
            // show toast
            // navigate to home screen
            //  var jsonMap = json.decode(logInResponse.data);
            // SignInModle responseData = SignInModle.fromJson(jsonMap);

            //
            //
            //
            print("ddddddddddddddddddddddd");

            SignInModle signnnnModle = SignInModle.fromJson(logInResponse.data);
            // Result userResult = signnnnModle.result!;
            // Customer customer = userResult.customer!;

            Customer? customer = signnnnModle.result?.customer;
            if (customer != null) {
              // caching the user info
              signnnnModle.result != null
                  ? await _cashUserData(
                      token: signnnnModle.result!.accessToken!,
                      userName: customer.name!,
                      userID: customer.id.toString(),
                      userEmail: customer.email,
                      userPhoneNumber: customer.phoneNumber,
                    )
                  : emit(
                      AuthErrorStateSignIn(errorMessage: 'user not founded'));
            } else {
              // if the response is != ok
              emit(AuthErrorStateSignIn(
                  errorMessage:
                      "${logInResponse.statusCode} \n ${logInResponse.statusMessage}"));
            }

            // Map<String, dynamic> customerMap =
            // Result customerData = Result.fromJson(responseData.result)
            //  Result   useerData = Result.fromJson(   responseData.   );
            // print(
            //     "ruuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuun${responseData.runtimeType}");
            // print(
            //     "ruuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuun${responseData.userData!.name ?? 'tseeeeeeeett'}");
            emit(AuthSuccessStateSignIn());
            // emit(AuthInitialState());
          } else {
            print("ooooooooooooooooooooooooo");

            emit(AuthErrorStateSignIn(
                errorMessage: logInResponse.statusMessage ?? "unknown Error"));
          }

          // } else {
          // setState(() {
          //   _autoValidate = AutovalidateMode.always;
          // });
          // }
        } else {
          emit(AuthSuccessStateSignIn());

          UserExperinceHelper()
              .showNetorkCheckerDialog(theContext: event.theContext);
        }

        //
        //
        //
      }

      if (event is AuthSignupEvet) {
// #### sign up #### //
        emit(AuthLoadingStateSignUp());

// check for network
        bool result = await InternetConnectionChecker().hasConnection;
        if (result == true) {
          Response signupResponse = await DioHelper.signUp(
            name: signUPUserNameTextEditingContorller.text,
            email: signUpUserEmailTextEditingController.text,
            phoneNumber: signUpUserPhonNumTextEditingController.text,
            password: signUpPasswordTextEditingController.text,
          );

          if (signupResponse.statusCode == 200) {
            // save token
            // show toast
            // navigate to home screen

            //
            //
            //
            print("ddddddddddddddddddddddd");

            SignUpModle signUpModle = SignUpModle.fromJson(signupResponse.data);
            // Result userResult = signnnnModle.result!;
            // Customer customer = userResult.customer!;

            // ResultSignup? resultSignup = signUpModle.result?.customer;
            if (signUpModle.resultSignUp != null) {
              // caching the user info
              await _cashUserData(
                token: signUpModle.resultSignUp!.accessToken!,
                userName: signUpModle.resultSignUp!.customerSignUp!.name!,
                userID:
                    signUpModle.resultSignUp!.customerSignUp!.id!.toString(),
                userEmail: signUpModle.resultSignUp!.customerSignUp!.email,
                userPhoneNumber:
                    signUpModle.resultSignUp!.customerSignUp!.phoneNumber,
              );
            } else {
              // if the response is != ok
              emit(AuthErrorStateSignUp(
                  errorMessage:
                      "${signupResponse.statusCode} \n ${signupResponse.statusMessage}"));
            }

            // Map<String, dynamic> customerMap =
            // Result customerData = Result.fromJson(responseData.result)
            //  Result   useerData = Result.fromJson(   responseData.   );
            // print(
            //     "ruuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuun${responseData.runtimeType}");
            // print(
            //     "ruuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuun${responseData.userData!.name ?? 'tseeeeeeeett'}");
            emit(AuthSuccessStateSignUp());
            // emit(AuthInitialState());
          } else {
            print("ooooooooooooooooooooooooo ${signupResponse.statusMessage}");

            emit(AuthErrorStateSignUp(
                errorMessage: signupResponse.statusMessage ?? "unknown Error"));
          }

          // } else {
          // setState(() {
          //   _autoValidate = AutovalidateMode.always;
          // });
          // }
        } else {
          emit(AuthSuccessStateSignUp());
          UserExperinceHelper()
              .showNetorkCheckerDialog(theContext: event.theContext);
        }
        //
        //
        //
      }

// #### sign up #### //
    });
  }
}
