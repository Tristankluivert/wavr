import 'package:get/get.dart';
import 'package:wavr/features/home/controller/home_controller.dart';
import 'package:wavr/features/settings/controller/settings_controller.dart';
import 'package:wavr/features/transactions_screen/controller/transactions_controller.dart';
import 'package:wavr/features/transfers_screen/controller/transfers_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => TransfersController());
    Get.lazyPut(() => TransactionsController());
    Get.lazyPut(() => SettingsController());
  }

}