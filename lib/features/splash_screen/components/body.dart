import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:wavr/config/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:wavr/config/pallate.dart';
import 'package:wavr/features/login/view/login_screen.dart';
import 'package:wavr/features/register/view/register_initial_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          SizedBox(height: 244.h,),
          SizedBox(
            width: 270.w,
            height: 123.h,
            child: Text(
              wSplashTextIntro,
              style: GoogleFonts.poppins(
                  fontSize: 27.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          ),
          SizedBox(height: 130.h,),
          Center(
            child: SizedBox(
              width: 314.w,
              height: 60.h,
              child: ElevatedButton(
                  onPressed: () {
                    Get.to(()=>RegisterInitialScreen());
                  },
                  style: ElevatedButton.styleFrom(
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
                    "Register",
                  )),
            ),
          ),
          SizedBox(height: 17.h,),
          Center(
            child: SizedBox(
              width: 314.w,
              height: 60.h,
              child: ElevatedButton(
                onPressed: (){
                  Get.to(()=>LoginScreen());
                },
                style: ElevatedButton.styleFrom(
                  primary: wPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r), // <-- Radius
                  ),
                  textStyle: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    color: wPrimaryColorDark,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                child: Text(
                  "Login",
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
