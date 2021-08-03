import 'package:get/get.dart';
import 'package:wavr/features/register/controller/register_controller.dart';


class RegisterBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
  }

}