import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:wavr/config/thema.dart';
import 'package:wavr/features/dashboard/bindings/dashboard_binding.dart';
import 'package:wavr/features/dashboard/view/dashboard.dart';
import 'package:wavr/features/login/bindings/login_bindings.dart';
import 'package:wavr/features/login/view/login_screen.dart';

import 'package:wavr/features/splash_screen/view/splash_screen.dart';
import 'package:wavr/routes/app_pages.dart';
import 'package:wavr/routes/app_routes.dart';


import 'features/home/view/home_page.dart';
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
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.HOME,
        getPages: AppPages.list,
        themeMode: ThemeMode.system,
      ),
      designSize: const Size(343, 749),
    );
  }
}