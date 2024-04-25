import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:select_shop/core/helpers/cache_helper.dart';
import 'package:select_shop/core/helpers/dio_helper.dart';
import 'package:select_shop/models/auth/auth_modle.dart';
import 'package:select_shop/view/Auth/login_screen.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  // String? validateName(String? value) {
  //   if (value!.isEmpty) {
  //     return 'Name cannot be empty';
  //   }
  //   if (value.length < 3) {
  //     return 'Name must be more than 2 charater';
  //   } else {
  //     return null;
  //   }
  // }

  // String? validateMobile(String? value) {
  //   if (value!.isEmpty) {
  //     return 'Phone number cannot be empty';
  //   }
  //   if (value.length != 10) {
  //     return 'Mobile Number must be of 10 digit';
  //   } else {
  //     return null;
  //   }
  // }

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

  setToken() async {
    CacheHelper.setData(key: "userToken", value: 'value');
  }

  AuthBloc() : super(AuthInitialState()) {
    on<AuthEvent>((event, emit) async {
      // #### log in #### //
      if (event is AuthLogInEvent) {
// check for network

// form validation
        // if (signInFormKey.currentState!.validate()) {
        // signInFormKey.currentState!.save();
        // DioHelper.getData(url: DioHelper.baseUrl);
        emit(AuthLoadingState());
        // print("Auttttttttttttththththt Evnet");

        Response logInResponse = await DioHelper.login(
            // phoneNumber: phoneNumberTextEditingController.text,
            // password: passwordTextEditingController.text,
            phoneNumber: '1234',
            password: '1234');
        // await DioHelper.login(phoneNumber: '1234', password: '1234');
        if (logInResponse.statusCode == 200) {
          // save token
          // show toast
          // navigate to home screen
var test = jsonDecode(logInResponse.data);

          SignInModle responseData = SignInModle.fromJson(logInResponse.data);
          //  Data   useerData = Data.fromJson( jsonDecode(  responseData.data) );
          // print(
          //     "ruuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuun${responseData.runtimeType}");
          // print(
          //     "ruuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuun${responseData.userData!.name ?? 'tseeeeeeeett'}");
          // emit(AuthSuccessState());
          emit(AuthInitialState());
        } else {
          emit(AuthErrorState(
              errorMessage: logInResponse.statusMessage ?? "unknown Error"));
        }
        // } else {
        // setState(() {
        //   _autoValidate = AutovalidateMode.always;
        // });
        // }
      }

      if (event is AuthSignupEvet) {}
    });
  }
}
