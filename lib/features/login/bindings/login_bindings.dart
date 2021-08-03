import 'package:get/get.dart';
import 'package:wavr/features/login/controller/login_controller.dart';

class LoginBindings extends Bindings{
  @override
  void dependencies() {
   Get.put(LoginController());
  }

}