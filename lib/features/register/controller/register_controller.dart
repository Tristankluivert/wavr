import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController{

  //final _formKey = GlobalKey<FormState>();


  late TextEditingController emailController, passwordController,
      confirmPassController, firstNameController, phoneController,
      referralController, lastNameController;
  var email = '';
  var password = '';
  var firstName = '';
  var phone = '';
  var lastName = '';
  var confirm_pass = '';
  var referral = '';



  @override
  void onInit() {

    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    phoneController = TextEditingController();
    referralController = TextEditingController();
    confirmPassController = TextEditingController();


  }


  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPassController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide valid Email";
    }
    return null;
  }

  String? validatefirstName(String value){
    if(value.isEmpty){
      return "Enter your first name";
    }
    return null;
  }
  String? validatelastName(String value){
    if(value.isEmpty){
      return "Enter your last name";
    }
    return null;
  }

  String? validatePhone(String value){
    if(value.isEmpty){
      return "Enter your Phone Number";
    }
    return null;
  }

  String? validateConfirmPassword(String value){
    if(value.isEmpty){
      return "Confirm password";
    }else if(value != passwordController.text){
      return "Password does not match";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 6) {
      return "Password must be of 6 characters";
    }
    return null;
  }

}