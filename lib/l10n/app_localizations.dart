import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @selectShop.
  ///
  /// In en, this message translates to:
  /// **'select shop'**
  String get selectShop;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'reset password'**
  String get resetPassword;

  /// No description provided for @enterEmailToResetOne.
  ///
  /// In en, this message translates to:
  /// **'enter your email to reset'**
  String get enterEmailToResetOne;

  /// No description provided for @enterEmailToResetTwo.
  ///
  /// In en, this message translates to:
  /// **'your password'**
  String get enterEmailToResetTwo;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'email'**
  String get email;

  /// No description provided for @phoneNum.
  ///
  /// In en, this message translates to:
  /// **'phone number'**
  String get phoneNum;

  /// No description provided for @sendCode.
  ///
  /// In en, this message translates to:
  /// **'send code'**
  String get sendCode;

  /// No description provided for @backToSignIn.
  ///
  /// In en, this message translates to:
  /// **'back to signin'**
  String get backToSignIn;

  /// No description provided for @otpCodeSended.
  ///
  /// In en, this message translates to:
  /// **'otp code is sended to'**
  String get otpCodeSended;

  /// No description provided for @newPassword.
  ///
  /// In en, this message translates to:
  /// **'new password'**
  String get newPassword;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'password'**
  String get password;

  /// No description provided for @confirmNewPassword.
  ///
  /// In en, this message translates to:
  /// **'confirm new password'**
  String get confirmNewPassword;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'confirm'**
  String get confirm;

  /// No description provided for @noDataLikeThis.
  ///
  /// In en, this message translates to:
  /// **'no data like this'**
  String get noDataLikeThis;

  /// No description provided for @userAgrement.
  ///
  /// In en, this message translates to:
  /// **'I agree to all terms, privacy policy and fees'**
  String get userAgrement;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'sign Up'**
  String get signUp;

  /// No description provided for @orByUsing.
  ///
  /// In en, this message translates to:
  /// **'or by using'**
  String get orByUsing;

  /// No description provided for @youHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'you have account? sign in'**
  String get youHaveAccount;

  /// No description provided for @welcomeToSelectShop.
  ///
  /// In en, this message translates to:
  /// **'welcome to select shop'**
  String get welcomeToSelectShop;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'forgot password?'**
  String get forgotPassword;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'sign In'**
  String get signIn;

  /// No description provided for @youDontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'you have don\'t have account? create one'**
  String get youDontHaveAccount;

  /// No description provided for @userName.
  ///
  /// In en, this message translates to:
  /// **'name'**
  String get userName;

  /// No description provided for @userEmail.
  ///
  /// In en, this message translates to:
  /// **'mhli.ouutlook.sa@gmail.com'**
  String get userEmail;

  /// No description provided for @homePage.
  ///
  /// In en, this message translates to:
  /// **'home'**
  String get homePage;

  /// No description provided for @products.
  ///
  /// In en, this message translates to:
  /// **'products'**
  String get products;

  /// No description provided for @tradeMark.
  ///
  /// In en, this message translates to:
  /// **'trad marks'**
  String get tradeMark;

  /// No description provided for @specialproducts.
  ///
  /// In en, this message translates to:
  /// **'special products'**
  String get specialproducts;

  /// No description provided for @favourts.
  ///
  /// In en, this message translates to:
  /// **'favourts'**
  String get favourts;

  /// No description provided for @mycart.
  ///
  /// In en, this message translates to:
  /// **'my cart'**
  String get mycart;

  /// No description provided for @orders.
  ///
  /// In en, this message translates to:
  /// **'orders'**
  String get orders;

  /// No description provided for @personalPage.
  ///
  /// In en, this message translates to:
  /// **'personal'**
  String get personalPage;

  /// No description provided for @suppourt.
  ///
  /// In en, this message translates to:
  /// **'suppourt'**
  String get suppourt;

  /// No description provided for @contactUs.
  ///
  /// In en, this message translates to:
  /// **'contact us'**
  String get contactUs;

  /// No description provided for @signInSuccess.
  ///
  /// In en, this message translates to:
  /// **'sign successfully'**
  String get signInSuccess;

  /// No description provided for @signInWelcome.
  ///
  /// In en, this message translates to:
  /// **'welcome back'**
  String get signInWelcome;

  /// No description provided for @signUpSuccess.
  ///
  /// In en, this message translates to:
  /// **'hopes you good experence'**
  String get signUpSuccess;

  /// No description provided for @signOut.
  ///
  /// In en, this message translates to:
  /// **'sign out'**
  String get signOut;

  /// No description provided for @show_all.
  ///
  /// In en, this message translates to:
  /// **'show all'**
  String get show_all;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'search'**
  String get search;

  /// No description provided for @theNew.
  ///
  /// In en, this message translates to:
  /// **'new'**
  String get theNew;

  /// No description provided for @thebestSeller.
  ///
  /// In en, this message translates to:
  /// **'best seller'**
  String get thebestSeller;

  /// No description provided for @theLakta.
  ///
  /// In en, this message translates to:
  /// **'lakta'**
  String get theLakta;

  /// No description provided for @theDiscaount.
  ///
  /// In en, this message translates to:
  /// **'discaount'**
  String get theDiscaount;

  /// No description provided for @most_wanted.
  ///
  /// In en, this message translates to:
  /// **'most wanted'**
  String get most_wanted;

  /// No description provided for @limitedOffers.
  ///
  /// In en, this message translates to:
  /// **'limited offers'**
  String get limitedOffers;

  /// No description provided for @lowToHighPrice.
  ///
  /// In en, this message translates to:
  /// **'low to hight price'**
  String get lowToHighPrice;

  /// No description provided for @allCategoris.
  ///
  /// In en, this message translates to:
  /// **'all catigory '**
  String get allCategoris;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'category'**
  String get category;

  /// No description provided for @categorys.
  ///
  /// In en, this message translates to:
  /// **'categorys'**
  String get categorys;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'description'**
  String get description;

  /// No description provided for @theColor.
  ///
  /// In en, this message translates to:
  /// **'color'**
  String get theColor;

  /// No description provided for @quantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get quantity;

  /// No description provided for @showAll.
  ///
  /// In en, this message translates to:
  /// **'show all'**
  String get showAll;

  /// No description provided for @searchYourProduct.
  ///
  /// In en, this message translates to:
  /// **'search your product'**
  String get searchYourProduct;

  /// No description provided for @aed.
  ///
  /// In en, this message translates to:
  /// **'AED'**
  String get aed;

  /// No description provided for @shopNow.
  ///
  /// In en, this message translates to:
  /// **'shop now'**
  String get shopNow;

  /// No description provided for @shipmentAllUAE.
  ///
  /// In en, this message translates to:
  /// **'Shipment for all UAE'**
  String get shipmentAllUAE;

  /// No description provided for @fastShipment.
  ///
  /// In en, this message translates to:
  /// **'fast shipment'**
  String get fastShipment;

  /// No description provided for @paymentOnRecive.
  ///
  /// In en, this message translates to:
  /// **'payment on recive'**
  String get paymentOnRecive;

  /// No description provided for @freeReturn.
  ///
  /// In en, this message translates to:
  /// **'free return'**
  String get freeReturn;

  /// No description provided for @earnFreePoints.
  ///
  /// In en, this message translates to:
  /// **'earn free ponints'**
  String get earnFreePoints;

  /// No description provided for @brand.
  ///
  /// In en, this message translates to:
  /// **'brand'**
  String get brand;

  /// No description provided for @brandDetails.
  ///
  /// In en, this message translates to:
  /// **'brnad details'**
  String get brandDetails;

  /// No description provided for @checkOut.
  ///
  /// In en, this message translates to:
  /// **'checkOut'**
  String get checkOut;

  /// No description provided for @comments.
  ///
  /// In en, this message translates to:
  /// **'comments'**
  String get comments;

  /// No description provided for @deliverTo.
  ///
  /// In en, this message translates to:
  /// **'delever to'**
  String get deliverTo;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'location'**
  String get location;

  /// No description provided for @paymentMethod.
  ///
  /// In en, this message translates to:
  /// **'payment method'**
  String get paymentMethod;

  /// No description provided for @doYouHaveCopons.
  ///
  /// In en, this message translates to:
  /// **'do you have copons'**
  String get doYouHaveCopons;

  /// No description provided for @enterCoponCode.
  ///
  /// In en, this message translates to:
  /// **'enter copon code'**
  String get enterCoponCode;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'price'**
  String get price;

  /// No description provided for @taxes.
  ///
  /// In en, this message translates to:
  /// **'taxes'**
  String get taxes;

  /// No description provided for @deliveryPrice.
  ///
  /// In en, this message translates to:
  /// **'delevery price'**
  String get deliveryPrice;

  /// No description provided for @totalPrice.
  ///
  /// In en, this message translates to:
  /// **'total price'**
  String get totalPrice;

  /// No description provided for @payWithCart.
  ///
  /// In en, this message translates to:
  /// **'Pay with Card'**
  String get payWithCart;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'error'**
  String get error;

  /// No description provided for @checkNetwork.
  ///
  /// In en, this message translates to:
  /// **'please check your network'**
  String get checkNetwork;

  /// No description provided for @editUser.
  ///
  /// In en, this message translates to:
  /// **'edit personal profile'**
  String get editUser;

  /// No description provided for @addLocation.
  ///
  /// In en, this message translates to:
  /// **'add location'**
  String get addLocation;

  /// No description provided for @changeLanguage.
  ///
  /// In en, this message translates to:
  /// **'change language'**
  String get changeLanguage;

  /// No description provided for @notificationSettings.
  ///
  /// In en, this message translates to:
  /// **'notifications settings'**
  String get notificationSettings;

  /// No description provided for @helpCenter.
  ///
  /// In en, this message translates to:
  /// **'help center'**
  String get helpCenter;

  /// No description provided for @accountSettings.
  ///
  /// In en, this message translates to:
  /// **'account settings'**
  String get accountSettings;

  /// No description provided for @unKnownError.
  ///
  /// In en, this message translates to:
  /// **'unKnown Error !!!'**
  String get unKnownError;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
