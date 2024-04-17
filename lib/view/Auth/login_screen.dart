import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:select_shop/core/Shared/error_screen.dart';
import 'package:select_shop/core/Shared/loading_screen.dart';
import 'package:select_shop/core/Shared/under_develop_screen.dart';
import 'package:select_shop/core/constans/app_constants.dart';
import 'package:select_shop/core/constans/app_images.dart';
import 'package:select_shop/core/theme/colors.dart';
import 'package:select_shop/core/theme/light.dart';
import 'package:select_shop/view/Auth/bloc/auth_bloc.dart';
import 'package:select_shop/view/Auth/signup_screen.dart';
import 'package:select_shop/view/home/home_screen.dart';

TextStyle _customLocalTextStyle = TextStyle(
  color: AppColors.mainGreyColor,
);

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _AuthCustomIcon(size: size),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 35,
                ),
                child: BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    // TODO: implement listener
                    // if (state is AuthLoadingState) {
                    // context.loaderOverlay.show();
                    // }

                    // if (state is AuthSuccessState) {
                    //   context.loaderOverlay.hide();
                    //   showToast(message: S.of(context).login_toast_success_msg);
                    //   AppCubit.get(context).getUser();
                    //   navigateToWithReplacement(
                    //     context,
                    //     const AppLayout(),
                    //   );
                    // }

                    // if (state is AuthErrorState) {
                    //   context.loaderOverlay.hide();
                    //   showToast(message: S.of(context).login_toast_error_msg);
                    // }
                  },
                  builder: (context, state) {
                    if (state is AuthLoadingState) {
                      return const CustomLoadingScreen();
                    } else if (state is AuthErrorState) {
                      return ErrorScreen(errorMessage: 'errorMessage');
                    }

                    // else if (state is AuthInitialState )
                    // {return CustomLoadingScreen();}

                    // else if (state is AuthSuccessState )
                    // {return _LoginBody();}

                    else
                      return _LoginBody();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginBody extends StatelessWidget {
  const _LoginBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 50,
        ),
        const Text(
          style: TextStyle(
            color: AppColors.mainColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          // "مرحبا بك في متجر سيليكت شوب",
          "مرحباً بك في متجر سيليكت شوب",
        ),
        const SizedBox(
          height: 30,
        ),
        FormBuilder(
            child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    50,
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.grey.withOpacity(.5),
                      offset: Offset(0.0, 2.0),
                      blurRadius: 3.0,
                    ),
                  ],
                  color: Colors.white),
              child: FormBuilderTextField(
                name: "email",

                // controller: TextEditingController?,

                decoration: InputDecoration(
                  hintText: "البريد الإلكتروني",
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
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    50,
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.grey.withOpacity(.5),
                      offset: Offset(0.0, 2.0),
                      blurRadius: 3.0,
                    ),
                  ],
                  color: Colors.white),
              child: FormBuilderTextField(
                name: "password",

                // controller: TextEditingController?,

                decoration: InputDecoration(
                  hintText: "كلمة المرور",
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UnderDevScreen()));
                  },
                  child: const Text(
                    style: TextStyle(
                      color: AppColors.mainColor,
                      fontSize: 12,
                    ),
                    "نسيت كلمة المرور؟",
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UnderDevScreen()));
                  },
                  child: const Text(
                    style: TextStyle(
                      color: AppColors.mainColor,
                      fontSize: 12,
                    ),
                    "إعادة تعيين",
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              borderRadius: BorderRadius.circular(
                50,
              ),
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) =>
                //             const UnderDevScreen()));
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (context) {
                //   return HomeScreen();
                // }));

                context.read<AuthBloc>().add(AuthLogInEvent());
              },
              child: Container(
                height: 40,
                width: 200,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColors.mainGreyColor,
                    borderRadius: BorderRadius.circular(
                      50,
                    )),
                child: const Text(
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  "تسجيل دخول",
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UnderDevScreen()));
              },
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => SignupScreen()),
                      (route) => false);
                },
                child: const Text(
                  style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 12,
                  ),
                  "ليس لديك حساب؟إنشاء حساب ",
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Divider(
                    // thickness: 15,
                    // height: 30,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  style: TextStyle(
                    color: AppColors.mainGreyColor,
                    fontSize: 12,
                  ),
                  "أو بإستخدام",
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UnderDevScreen()));
                  },
                  child: const Image(
                      image: AssetImage(
                    AppImages.facebook,
                  )),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UnderDevScreen()));
                  },
                  child: const Image(
                      image: AssetImage(
                    AppImages.google,
                  )),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ))
      ],
    );
  }
}

class _AuthCustomIcon extends StatelessWidget {
  const _AuthCustomIcon({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.yellow,
      height: size.height * .5,
      width: size.width,
      child: Stack(
        children: [
          Positioned(
              top: 0,
              right: 0,
              child: Container(
                // width: size.width * .45,
                width: 200,
                height: size.height * .5,
                decoration: const BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(
                    60,
                  )),
                ),
              )),
          Positioned(
            width: size.width,
            height: size.height * .45,
            right: 0,
            bottom: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Stack(children: [
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 435,
                        height: 300,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            color: Colors.grey[350],
                            // borderRadius: const BorderRadius.only(
                            //   topRight: Radius.circular(50),
                            //   bottomRight: Radius.circular(50),
                            // ),

                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        // child: Image.asset(
                        //   AppImages.girlLoginScreen,
                        // ),
                      ),
                    ),
                    Center(child: Image.asset(AppImages.girlLoginScreen)),
                  ]),
                ),
                const SizedBox(
                  width: 15,
                ),
                const Image(
                  // width: 10,
                  // height: 10,
                  image: AssetImage(
                    AppImages.selShoHoriText,
                  ),
                ),
                const SizedBox(
                  width: AppConstants.theDefBadding,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
