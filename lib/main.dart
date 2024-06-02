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
import 'package:select_shop/view/choose%20pament%20method/choose_payment_method_screen.dart';
import 'package:select_shop/view/home/widgets/bottom%20nav%20bar/bloc/bottom_nav_bloc.dart';
import 'package:select_shop/view/home/widgets/drawer/bloc/drawer_bloc.dart';
import 'package:select_shop/view/home/widgets/prodcts%20best%20seller/bloc/product_bestseller_bloc.dart';
import 'package:select_shop/view/home/widgets/products%20discounts/bloc/products_discounts_bloc.dart';
import 'package:select_shop/view/home/widgets/products%20laktah/bloc/products_laktah_bloc.dart';
import 'package:select_shop/view/home/widgets/products%20new/bloc/products_new_bloc.dart';
import 'package:select_shop/view/home/bloc/home_bloc.dart';
import 'package:select_shop/view/home/home_screen.dart';
import 'package:select_shop/view/language/bloc/localization_bloc.dart';
import 'package:select_shop/view/language/chose_language_screen.dart';
import 'package:select_shop/view/product%20details%20genral/product_details_genral_screen.dart';
import 'package:select_shop/view/products%20of%20category/pro%20of%20cat%20bloc/pro_of_cat_bloc.dart';
import 'package:select_shop/view/products%20of%20category/product%20of%20main%20cate%20bloc/product_of_main_category_bloc.dart';
import 'package:select_shop/view/products%20of%20category/products_main_of_categorys_screen.dart';
import 'package:select_shop/view/products%20of%20category/sub%20cate%20bloc/sup_categories_of_main_category_bloc.dart';
import 'package:select_shop/view/products/products_screen.dart';
import 'package:select_shop/view/track%20order/track_order_screen.dart';
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

  // Set the status bar to be transparent
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // Transparent status bar
    statusBarIconBrightness:
        Brightness.dark, // For dark icons on a light background
  ));

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
          BlocProvider<DrawerBloc>(create: (context) => DrawerBloc()),
          BlocProvider<BottomNavBloc>(create: (context) => BottomNavBloc()),

          // BlocProvider<GetNewProductsBloc>(
          //     create: (context) => GetNewProductsBloc()),

          BlocProvider<ProductBestsellerBloc>(
              create: (context) => ProductBestsellerBloc()),
          BlocProvider<ProductsDiscountsBloc>(
              create: (context) => ProductsDiscountsBloc()),
          BlocProvider<ProductsLaktahBloc>(
              create: (context) => ProductsLaktahBloc()),
          BlocProvider<ProductsNewBloc>(create: (context) => ProductsNewBloc()),
          // BlocProvider(create:(context) => HomeBloc()..add(HomeGetItemsEvent( ))),
          BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
          BlocProvider<CategoriesBloc>(create: (context) => CategoriesBloc()),
          BlocProvider<UserLocationBloc>(
              create: (context) => UserLocationBloc()),
          BlocProvider<ProductOfMainCategoryBloc>(
              create: (context) => ProductOfMainCategoryBloc()),

          
          BlocProvider<SupCategoriesOfMainCategoryBloc>(
              create: (context) => SupCategoriesOfMainCategoryBloc()),

              
          BlocProvider<ProOfCatBloc>(
              create: (context) => ProOfCatBloc()),
              
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
    // return const Scaffold(body: SafeArea(child: ChoosePaymentMethodScreen()));
    // return const Scaffold(body: SafeArea(child: TrackOrderScreen()));

    // return const Scaffold(
    //     body: SafeArea(
    //         child: ProductsOfCategoryScreen(
    //   mainCategoryId: 1,
    // )));

    // return const Scaffold(body: SafeArea(child: SearchScreen()));
    // return const Scaffold(body: SafeArea(child: UserLocationsScreen()));
    // return const Scaffold(body: SafeArea(child: CreateNewLocationScreen()));
    // return const Scaffold(body: SafeArea(child: CategoriesScreen()));
  }
}
