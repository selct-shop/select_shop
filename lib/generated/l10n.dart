// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `select shop`
  String get selectShop {
    return Intl.message(
      'select shop',
      name: 'selectShop',
      desc: '',
      args: [],
    );
  }

  /// `reset password`
  String get resetPassword {
    return Intl.message(
      'reset password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `enter your email to reset`
  String get enterEmailToResetOne {
    return Intl.message(
      'enter your email to reset',
      name: 'enterEmailToResetOne',
      desc: '',
      args: [],
    );
  }

  /// `your password`
  String get enterEmailToResetTwo {
    return Intl.message(
      'your password',
      name: 'enterEmailToResetTwo',
      desc: '',
      args: [],
    );
  }

  /// `email`
  String get email {
    return Intl.message(
      'email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `send code`
  String get sendCode {
    return Intl.message(
      'send code',
      name: 'sendCode',
      desc: '',
      args: [],
    );
  }

  /// `back to signin`
  String get backToSignIn {
    return Intl.message(
      'back to signin',
      name: 'backToSignIn',
      desc: '',
      args: [],
    );
  }

  /// `otp code is sended to`
  String get otpCodeSended {
    return Intl.message(
      'otp code is sended to',
      name: 'otpCodeSended',
      desc: '',
      args: [],
    );
  }

  /// `new password`
  String get newPassword {
    return Intl.message(
      'new password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `password`
  String get password {
    return Intl.message(
      'password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `confirm new password`
  String get confirmNewPassword {
    return Intl.message(
      'confirm new password',
      name: 'confirmNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `confirm`
  String get confirm {
    return Intl.message(
      'confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `no data like this`
  String get noDataLikeThis {
    return Intl.message(
      'no data like this',
      name: 'noDataLikeThis',
      desc: '',
      args: [],
    );
  }

  /// `I agree to all terms, privacy policy and fees`
  String get userAgrement {
    return Intl.message(
      'I agree to all terms, privacy policy and fees',
      name: 'userAgrement',
      desc: '',
      args: [],
    );
  }

  /// `sign Up`
  String get signUp {
    return Intl.message(
      'sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `or by using`
  String get orByUsing {
    return Intl.message(
      'or by using',
      name: 'orByUsing',
      desc: '',
      args: [],
    );
  }

  /// `you have account? sign in`
  String get youHaveAccount {
    return Intl.message(
      'you have account? sign in',
      name: 'youHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `welcome to select shop`
  String get welcomeToSelectShop {
    return Intl.message(
      'welcome to select shop',
      name: 'welcomeToSelectShop',
      desc: '',
      args: [],
    );
  }

  /// `forgot password?`
  String get forgotPassword {
    return Intl.message(
      'forgot password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `sign In`
  String get signIn {
    return Intl.message(
      'sign In',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `you have don't have account? create one`
  String get youDontHaveAccount {
    return Intl.message(
      'you have don\'t have account? create one',
      name: 'youDontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `user name`
  String get userName {
    return Intl.message(
      'user name',
      name: 'userName',
      desc: '',
      args: [],
    );
  }

  /// `mhli.ouutlook.sa@gmail.com`
  String get userEmail {
    return Intl.message(
      'mhli.ouutlook.sa@gmail.com',
      name: 'userEmail',
      desc: '',
      args: [],
    );
  }

  /// `home Page`
  String get homePage {
    return Intl.message(
      'home Page',
      name: 'homePage',
      desc: '',
      args: [],
    );
  }

  /// `products`
  String get products {
    return Intl.message(
      'products',
      name: 'products',
      desc: '',
      args: [],
    );
  }

  /// `trad marks`
  String get tradeMark {
    return Intl.message(
      'trad marks',
      name: 'tradeMark',
      desc: '',
      args: [],
    );
  }

  /// `special products`
  String get specialproducts {
    return Intl.message(
      'special products',
      name: 'specialproducts',
      desc: '',
      args: [],
    );
  }

  /// `favourts`
  String get favourts {
    return Intl.message(
      'favourts',
      name: 'favourts',
      desc: '',
      args: [],
    );
  }

  /// `my cart`
  String get mycart {
    return Intl.message(
      'my cart',
      name: 'mycart',
      desc: '',
      args: [],
    );
  }

  /// `orders`
  String get orders {
    return Intl.message(
      'orders',
      name: 'orders',
      desc: '',
      args: [],
    );
  }

  /// `personal page`
  String get personalPage {
    return Intl.message(
      'personal page',
      name: 'personalPage',
      desc: '',
      args: [],
    );
  }

  /// `suppourt`
  String get suppourt {
    return Intl.message(
      'suppourt',
      name: 'suppourt',
      desc: '',
      args: [],
    );
  }

  /// `contact us`
  String get contactUs {
    return Intl.message(
      'contact us',
      name: 'contactUs',
      desc: '',
      args: [],
    );
  }

  /// `sign out`
  String get signOut {
    return Intl.message(
      'sign out',
      name: 'signOut',
      desc: '',
      args: [],
    );
  }

  /// `most wanted`
  String get most_wanted {
    return Intl.message(
      'most wanted',
      name: 'most_wanted',
      desc: '',
      args: [],
    );
  }

  /// `show all`
  String get show_all {
    return Intl.message(
      'show all',
      name: 'show_all',
      desc: '',
      args: [],
    );
  }

  /// `search`
  String get search {
    return Intl.message(
      'search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `new`
  String get theNew {
    return Intl.message(
      'new',
      name: 'theNew',
      desc: '',
      args: [],
    );
  }

  /// `discaount`
  String get discaount {
    return Intl.message(
      'discaount',
      name: 'discaount',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get helloWorld {
    return Intl.message(
      '',
      name: 'helloWorld',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
