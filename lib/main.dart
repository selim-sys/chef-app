import 'package:chefapp/view/constants/assets.dart';
import 'package:chefapp/view/constants/colors.dart';
import 'package:chefapp/view/screens/choose_language_screen.dart';
import 'package:chefapp/view_model/cubits/login-cubit/login_cubit.dart';
import 'package:chefapp/view_model/cubits/register-cubit/register_cubit.dart';
import 'package:chefapp/view/screens/auth/login-screen.dart';
import 'package:chefapp/view/screens/splash-screen.dart';
import 'package:chefapp/view_model/network/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  DioHelper.init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit(),),
        BlocProvider(create: (context) => RegisterCubit(),)
      ],
      child: ChefApp(),
    ),
  );
}

class ChefApp extends StatelessWidget {
  const ChefApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: MyColors.mainColor),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
