import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wavr/features/settings/components/body.dart';
import 'package:wavr/features/settings/controller/settings_controller.dart';

class SettingsScreen extends GetView<SettingsController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Body(),);
  }

}