import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:wavr/config/thema.dart';

import 'package:wavr/features/splash_screen/view/splash_screen.dart';


import 'features/register/bindings/register_bindings.dart';
import 'features/register/view/register_initial_screen.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      //systemNavigationBarColor: Colors.blue, // navigation bar color
      statusBarColor: Colors.white, // status bar color
      statusBarBrightness: Brightness.dark,//status bar brightness
      statusBarIconBrightness:Brightness.dark , //status barIcon Brightness
      // systemNavigationBarDividerColor: Colors.greenAccent,//Navigation bar divider color
      // systemNavigationBarIconBrightness: Brightness.light, //navigation bar icon
    ));

    return ScreenUtilInit(
      builder : ()=> GetMaterialApp(
        title: 'Flutter Demo',
        theme: theme(),
        home: SplashScreen() ,
        debugShowCheckedModeBanner: false,
        //initialRoute: "/",
        getPages: [
          GetPage(name:'/register', page: ()=> RegisterInitialScreen(),
          transition: Transition.leftToRight, binding: RegisterBindings()
          ),
          GetPage(name: '/splash_screen', page: ()=> SplashScreen(),
          transition: Transition.leftToRight
          )

        ],
      ),
      designSize: const Size(343, 749),
    );
  }
}