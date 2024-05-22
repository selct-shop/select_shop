// import 'dart:js';
// import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:select_shop/core/functions/localization.dart';
import 'package:select_shop/generated/l10n.dart';
import 'package:select_shop/view/Auth/new_password_screen.dart';
import 'package:select_shop/view/Auth/otp_screen.dart';
import 'package:select_shop/view/Shared/error_screen.dart';
import 'package:select_shop/view/Shared/loading_screen.dart';
import 'package:select_shop/core/constants/app_images.dart';
import 'package:select_shop/core/helpers/cache_helper.dart';
import 'package:select_shop/core/helpers/dio_helper.dart';
import 'package:select_shop/core/theme/light.dart';
import 'package:select_shop/l10n/app_localizations.dart';
import 'package:select_shop/test.dart';
import 'package:select_shop/view/Auth/bloc/auth_bloc.dart';
import 'package:select_shop/view/Auth/forget_password_screen.dart';
import 'package:select_shop/view/Auth/login_screen.dart';
import 'package:select_shop/view/Auth/signup_screen.dart';
import 'package:select_shop/view/categories/bloc/categories_bloc.dart';
import 'package:select_shop/view/categories/categories_screen.dart';
import 'package:select_shop/view/check%20out/check_out.dart';
import 'package:select_shop/view/home/bloc/home_bloc.dart';
import 'package:select_shop/view/home/home_screen.dart';
import 'package:select_shop/view/language/bloc/localization_bloc.dart';
import 'package:select_shop/view/language/chose_language_screen.dart';
import 'package:select_shop/view/product%20details/product_details_screen.dart';
import 'package:select_shop/view/products%20of%20category/bloc/product_of_main_category_bloc.dart';
import 'package:select_shop/view/products%20of%20category/products_main_of_categorys_screen.dart';
import 'package:select_shop/view/product/products_screen.dart';
import 'package:select_shop/view/user%20location/bloc/user_location_bloc.dart';
import 'package:select_shop/view/user%20location/create_new_location.dart';
import 'package:select_shop/view/user%20location/user_location_screen.dart';

String? globalCachedUserToken;
String? globalCachedUserLang;
String? globalCachedUserName;
String? globalCachedUserID;
String? globalCachedUserPhoneNum;
//  const String globalDefaltCachedNetworkImage = "https://www.istockphoto.com/illustrations/green-shopping-cart-icon";
const String globalDefaltCachedNetworkImage =
    "https://cdn4.iconfinder.com/data/icons/social-media-2070/140/_shopify-512.png";

// final GlobalKey mainAppKey = GlobalKey();
void main() async {
  // runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top],
  );
  await CacheHelper.init();
  await DioHelper.init();
  // Locale myLocal = await getLocal();
  // HomeBloc;

  // await CacheHelper.get

  // token = CacheHelper.getData(key: 'token') ?? '';
  // String token = CacheHelper.getData(key: 'token') ?? '';

  // iniiiiiitalLoca = CacheHelper.getData(key: 'lang') == 'en' ? 'en' : 'ar';

  runApp(BlocProvider(
    create: (context) => LocalizationBloc()..add(LoadSavedLocalizationEvent()),
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<HomeBloc>(create: (context) => HomeBloc()),
          // BlocProvider(create:(context) => HomeBloc()..add(HomeGetItemsEvent( ))),
          BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
          BlocProvider<CategoriesBloc>(create: (context) => CategoriesBloc()),
          BlocProvider<UserLocationBloc>(
              create: (context) => UserLocationBloc()),
          BlocProvider<ProductOfMainCategoryBloc>(
              create: (context) => ProductOfMainCategoryBloc()),
        ],
        child: BlocBuilder<LocalizationBloc, LocalizationState>(
          builder: (context, state) {
            return MaterialApp(
                // ...
                // localizationsDelegates:
                // AppLocalizations.localizationsDelegates,

                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                // supportedLocales: AppLocalizations.supportedLocales,
                supportedLocales: S.delegate.supportedLocales,

                // locale: Locale('en'),
                // locale: Locale('ar'),
                // locale: context.read<HomeBloc>().initalLang  ,
                // locale: Locale(iniiiiiitalLoca ?? 'ar'),
                locale: state.locale,
                // locale: await  CacheHelper.getData(key: 'lang') == 'en'
                //     ? Locale('en')
                //     : Locale('ar'),
                // ...
                debugShowCheckedModeBanner: false,
                title: 'Select Shop',
                theme: customLightTheme,
                home: const MyHomePage(
                    // title: 'Select Shop'
                    ));
          },
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    //  required this.title
  });

  // final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
// AppLocalizations appLocalizationsOfContext =  AppLocalizations.of(context)!;

    return Scaffold(
        body: SafeArea(
            child: globalCachedUserToken == null || globalCachedUserToken == ""
                ? const LogInScreen()
                : const HomeScreen()));
    // return const Scaffold(body: SafeArea(child: SignupScreen()));
    // return const Scaffold(body: SafeArea(child: LogInScreen()));
    // return const Scaffold(
    // body: SafeArea(child: ChoseLanguageScreen(commingFromSettings: false)));
    // return Scaffold(body: SafeArea(child: ErrorScreen(errorMessage: 'test')));
    // return const Scaffold(body: SafeArea(child: HomeScreen()));
    // return const Scaffold(body: SafeArea(child: ProductDetailsScreen()));
    // return const Scaffold(body: SafeArea(child: ProductsScreen()));
    // return const Scaffold(body: SafeArea(child: CheckOutScreen()));
    // return const Scaffold(body: SafeArea(child: SearchScreen()));
    // return const Scaffold(body: SafeArea(child: UserLocationsScreen()));
    // return const Scaffold(body: SafeArea(child: CreateNewLocationScreen()));
    // return const Scaffold(body: SafeArea(child: CategoriesScreen()));
  }
}
