import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wavr/features/transfers_screen/controller/transfers_controller.dart';
import 'package:wavr/features/transfers_screen/components/body.dart';

class TransfersScreen extends GetView<TransfersController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }

}