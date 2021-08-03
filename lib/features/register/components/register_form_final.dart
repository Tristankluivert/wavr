import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wavr/config/pallate.dart';
import 'package:wavr/features/register/controller/register_controller.dart';

class RegisterFinalForm extends StatefulWidget{
  @override
  _RegisterFinalForm createState()=> _RegisterFinalForm();

}
class _RegisterFinalForm extends State<RegisterFinalForm>{

  final _formKey = GlobalKey<FormState>();
  bool _btnEnabled = false;
  bool _autoValidate = false;
  final _controller = Get.find<RegisterController>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        onChanged: () =>
            setState(() => _btnEnabled = _formKey.currentState!.validate()),
        autovalidateMode: _autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
        child: Column(
          children: <Widget>[
            buildPasswordFormField(),
            SizedBox(height: 16.h,),
            buildConfirmPasswordFormField(),
            SizedBox(height: 16.h,),
            buildReferralFormField(),
            SizedBox(height: 111.h,),
            Center(
              child: SizedBox(
                width: 314.w,
                height: 60.h,
                child: ElevatedButton(
                  onPressed: (){
                    //Get.to(()=>RegisterScreen());
                  },
                  style:  ElevatedButton.styleFrom(
                    elevation: 15,
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
                Text("Already have an Account?",
                  style: GoogleFonts.poppins(
                      fontSize: 14.sp,
                      color: Color(0xFF6F6F6F),
                      fontWeight: FontWeight.w600),
                ),
                Text("Sign in",
                  style: GoogleFonts.poppins(
                      color: wPrimaryColorDark,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600),
                ),

              ],
            )
          ],
        ));
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
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
      autofocus: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide.none
        ),
        // labelText: "Confirm Password",

        filled: true,
        fillColor: Colors.white,
        hintText: "Choose password",
        hintStyle: GoogleFonts.poppins(color: wTextInputColor,
            fontWeight: FontWeight.w400,
            fontSize: 14.sp
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildConfirmPasswordFormField() {
    return TextFormField(
      obscureText: true,
      style: GoogleFonts.poppins(color: wTextInputColor,
          fontWeight: FontWeight.w400,
          fontSize: 14.sp
      ),
      controller: _controller.confirmPassController,
      onSaved: (value) {
        _controller.confirm_pass = value!;
      },
      validator: (value) {
        return _controller.validateConfirmPassword(value!);
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide.none
        ),
        // labelText: "Confirm Password",
        filled: true,
        fillColor: Colors.white,
        hintText: "Repeat password",
        hintStyle: GoogleFonts.poppins(color: wTextInputColor,
            fontWeight: FontWeight.w400,
            fontSize: 14.sp
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildReferralFormField() {
    return TextFormField(
      style: GoogleFonts.poppins(color: wTextInputColor,
          fontWeight: FontWeight.w400,
          fontSize: 14.sp
      ),
      controller: _controller.phoneController,
      onSaved: (value) {
        _controller.phone = value!;
      },
      validator: (value) {
        return _controller.validatePhone(value!);
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide.none

        ),
        // labelText: "Confirm Password",
        filled: true,
        fillColor: Colors.white,
        hintText: "Ref code (optional)",
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

