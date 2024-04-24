import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:select_shop/core/functions/localization.dart';
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
import 'package:select_shop/view/home/bloc/home_bloc.dart';
import 'package:select_shop/view/home/home_screen.dart';
import 'package:select_shop/view/language/chose_language_screen.dart';

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

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<HomeBloc>(create: (context) => HomeBloc()),
          // BlocProvider(create:(context) => HomeBloc()..add(HomeGetItemsEvent( ))),

          BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
        ],
        child: MaterialApp(
            // ...
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            // locale: Locale('en'),
            // locale: context.read<HomeBloc>().initalLang  ,
            locale: CacheHelper.getData(key: 'lang') == 'en'
                ? Locale('en')
                : Locale('ar'),
            // ...
            debugShowCheckedModeBanner: false,
            title: 'Select Shop',
            theme: customLightTheme,
            home: const MyHomePage(
                // title: 'Select Shop'
                )));
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

    // return Scaffold(body: SafeArea(child: LogInScreen()));
    // return const Scaffold(body: SafeArea(child: NewPasswordScreen()));
    return const Scaffold(body: SafeArea(child: ChoseLanguageScreen()));
    // return Scaffold(body: SafeArea(child: ErrorScreen(errorMessage: 'test')));
    // return const Scaffold(body: SafeArea(child: HomeScreen()));
  }
}
