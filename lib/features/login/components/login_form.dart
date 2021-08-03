import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wavr/config/pallate.dart';
import 'package:wavr/features/login/controller/login_controller.dart';

class LoginForm extends StatefulWidget{

  _LoginForm createState()=>_LoginForm();


  }

  class _LoginForm extends State<LoginForm> {

    final _formKey = GlobalKey<FormState>();
    bool _btnEnabled = false;
    bool _autoValidate = false;
    final _controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: SingleChildScrollView(
      child: Form(
        key: _formKey,
        onChanged: () =>
            setState(() => _btnEnabled = _formKey.currentState!.validate()),
        autovalidateMode: _autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
        child: Column(
          children: <Widget>[
            buildEmailFormField(),
            SizedBox(height: 16.h,),
            buildPasswordFormField(),
            SizedBox(height: 35.h,),
            Center(
              child: SizedBox(
                width: 314.w,
                height: 60.h,
                child: ElevatedButton(
                  onPressed: (){
                    //Get.to(()=>RegisterFinalScreen());
                  },
                  style:  ElevatedButton.styleFrom(
                    elevation: 10,
                    shadowColor: wPrimaryColorDark,
                    primary: wPrimaryColorDark,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r), // <-- Radius
                    ),
                    textStyle: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      color: wPrimaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  child: Text(
                    "Continue",
                  ),
                ),
              ),
            ),
            SizedBox(height: 41.h,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                Text("Are you new here?",
                  style: GoogleFonts.poppins(
                      fontSize: 14.sp,
                      color: Color(0xFF6F6F6F),
                      fontWeight: FontWeight.w600),
                ),
                Text("Create an account",
                  style: GoogleFonts.poppins(
                      color: wPrimaryColorDark,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600),
                ),

              ],
            )
          ],
        ),
      ),
    ));
  }


  TextFormField buildEmailFormField() {
    return TextFormField(
      //obscureText: true,
      keyboardType: TextInputType.emailAddress,
      style: GoogleFonts.poppins(color: wTextInputColor,
          fontWeight: FontWeight.w400,
          fontSize: 14.sp
      ),
      controller: _controller.emailController,
      onSaved: (value) {
        _controller.email = value!;
      },
      validator: (value) {
        return _controller.validateEmail(value!);
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide.none

        ),
        // labelText: "Confirm Password",
        filled: true,
        fillColor: Colors.white,
        hintText: "Email",
        hintStyle: GoogleFonts.poppins(color: wTextInputColor,
            fontWeight: FontWeight.w400,
            fontSize: 14.sp
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      keyboardType: TextInputType.phone,
      style: GoogleFonts.poppins(color: wTextInputColor,
          fontWeight: FontWeight.w400,
          fontSize: 14.sp
      ),
      controller: _controller.passwordController,
      onSaved: (value) {
        _controller.password = value!;
      },
      validator: (value) {
        return _controller.validatePassword(value!);
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide.none

        ),
        // labelText: "Confirm Password",
        filled: true,
        fillColor: Colors.white,
        hintText: "Password",
        hintStyle: GoogleFonts.poppins(color: wTextInputColor,
            fontWeight: FontWeight.w400,
            fontSize: 14.sp
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }


  }





