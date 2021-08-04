import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:wavr/features/transactions_screen/components/body.dart';
import 'package:wavr/features/transactions_screen/controller/transactions_controller.dart';

class TransactionsScreen extends GetView<TransactionsController>{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Body(),
   );
  }

}