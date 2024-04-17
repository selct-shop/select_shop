import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:select_shop/core/Shared/error_screen.dart';
import 'package:select_shop/core/Shared/loading_screen.dart';
import 'package:select_shop/core/constans/app_images.dart';
import 'package:select_shop/core/helpers/cache_helper.dart';
import 'package:select_shop/core/helpers/dio_helper.dart';
import 'package:select_shop/core/theme/light.dart';
import 'package:select_shop/test.dart';
import 'package:select_shop/view/Auth/bloc/auth_bloc.dart';
import 'package:select_shop/view/Auth/login_screen.dart';
import 'package:select_shop/view/Auth/signup_screen.dart';
import 'package:select_shop/view/home/bloc/home_bloc.dart';
import 'package:select_shop/view/home/home_screen.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';

void main() async {
  // runApp(const MyApp());

  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await DioHelper.init();

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
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: customLightTheme,
          // home: const MyHomePage(title: 'Flutter Demo Home Page'),

          home: FlutterSplashScreen.fadeIn(
            backgroundColor: Colors.white,
            onInit: () {
              debugPrint("On Init");
            },
            onEnd: () {
              debugPrint("On End");
            },
            childWidget: SizedBox(
              height: 200,
              width: 200,
              child: Image.asset(
                AppImages.logo,
              ),
            ),
            onAnimationEnd: () => debugPrint("On Fade In End"),
            nextScreen: const MyHomePage(title: 'Flutter Demo Home Page'),
          ),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: LogInScreen()));
    // return  Scaffold(body: SafeArea(child:  CustomLoadingScreen()));
    // return Scaffold(body: SafeArea(child: ErrorScreen(errorMessage: 'test')));
    // return Scaffold(body: SafeArea(child: HomeScreen()));
  }
}
