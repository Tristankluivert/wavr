import 'package:get/get.dart';
import 'package:wavr/features/dashboard/bindings/dashboard_binding.dart';
import 'package:wavr/features/dashboard/view/dashboard.dart';
import 'package:wavr/features/home/bindings/home_binding.dart';
import 'package:wavr/features/home/view/home_page.dart';
import 'package:wavr/features/login/bindings/login_bindings.dart';
import 'package:wavr/features/login/view/login_screen.dart';
import 'package:wavr/features/register/bindings/register_bindings.dart';
import 'package:wavr/features/register/view/register_initial_screen.dart';
import 'package:wavr/features/splash_screen/view/splash_screen.dart';

import 'app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(name:AppRoutes.REGISTER, page: ()=> RegisterInitialScreen(),
        transition: Transition.leftToRight, binding: RegisterBindings()
    ),
    GetPage(name: AppRoutes.LOGIN, page: ()=> LoginScreen(),
        transition: Transition.leftToRight, binding: LoginBindings()
    ),
    GetPage(name: AppRoutes.DASHBOARD, page: ()=> Dashboard(),
       binding: DashboardingBinding()
    ),

    GetPage(name: AppRoutes.SPLASH, page: ()=> SplashScreen(),

    )
  ];
}