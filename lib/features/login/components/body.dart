import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wavr/config/app_strings.dart';
import 'package:wavr/config/pallate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wavr/features/login/components/login_form.dart';

class Body extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            // color: wPrimaryColor,
            //width: double.infinity,
            height: 276.h,
            child: Padding(
              padding: EdgeInsets.only(bottom: 172.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.asset('assets/icons/waves.svg'),
                  SizedBox(width: 7.w,),
                  Text(wAppName,
                    style: GoogleFonts.poppins(color: wPrimaryColorDark,
                        fontWeight: FontWeight.w700,
                        fontSize: 18.sp
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 473.h,
            child: Stack(
              children: <Widget>[
                Container(
                  color: wPrimaryColor,
                ),
                Positioned(
                  top: 30.h,
                  left: 87.w,
                  right: 88.w,
                  child: Center(
                    child: Text("Welcome back",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: wPrimaryColorDark,
                          fontSize: 16.sp
                      ),
                    ),
                  ),),
                Positioned(
                  top: 133.h,
                  left: 0,
                  right: 0,
                  child: Padding(padding: EdgeInsets.only(left: 29.w, right: 28.w,),
                    child: LoginForm(),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }

}