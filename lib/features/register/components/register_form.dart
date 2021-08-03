import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wavr/config/pallate.dart';
import 'package:get/get.dart';
import 'package:wavr/features/register/controller/register_controller.dart';
import 'package:wavr/features/register/view/register_final_screen.dart';

class RegisterForm extends StatefulWidget{
  @override
  _RegisterForm createState()=> _RegisterForm();

}
class _RegisterForm extends State<RegisterForm>{

  final _formKey = GlobalKey<FormState>();
  bool _btnEnabled = false;
  bool _autoValidate = false;
  final _controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
   return Form(
       key: _formKey,
       onChanged: () =>
           setState(() => _btnEnabled = _formKey.currentState!.validate()),
       autovalidateMode: _autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
       child: Column(
         children: <Widget>[
           buildFirstNameFormField(),
           SizedBox(height: 16.h,),
           buildLastNameFormField(),
           SizedBox(height: 16.h,),
           buildEmailFormField(),
           SizedBox(height: 16.h,),
           buildPhoneFormField(),
           SizedBox(height: 35.h,),
           Center(
             child: SizedBox(
               width: 314.w,
               height: 60.h,
               child: ElevatedButton(
                 onPressed: (){
                   Get.to(()=>RegisterFinalScreen());
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

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      //obscureText: true,
      style: GoogleFonts.poppins(color: wTextInputColor,
          fontWeight: FontWeight.w400,
          fontSize: 14.sp
      ),
      controller: _controller.firstNameController,
      onSaved: (value) {
         _controller.firstName = value!;
      },
      validator: (value) {
          return _controller.validatefirstName(value!);
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
        hintText: "First Name",
        hintStyle: GoogleFonts.poppins(color: wTextInputColor,
            fontWeight: FontWeight.w400,
            fontSize: 14.sp
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      //obscureText: true,
      style: GoogleFonts.poppins(color: wTextInputColor,
          fontWeight: FontWeight.w400,
          fontSize: 14.sp
      ),
      controller: _controller.lastNameController,
      onSaved: (value) {
         _controller.lastName = value!;
      },
      validator: (value) {
          return _controller.validatelastName(value!);
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide.none
        ),
        // labelText: "Confirm Password",
        filled: true,
        fillColor: Colors.white,
        hintText: "Last Name",
        hintStyle: GoogleFonts.poppins(color: wTextInputColor,
            fontWeight: FontWeight.w400,
            fontSize: 14.sp
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
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

  TextFormField buildPhoneFormField() {
    return TextFormField(
      //obscureText: true,
      keyboardType: TextInputType.phone,
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
        hintText: "Phone",
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

