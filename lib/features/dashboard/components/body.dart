import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wavr/config/pallate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Body extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                color: wPrimaryColor,
                height: 445.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Positioned(
                      top: 33.h,
                      left: 30.w,
                      child: CircleAvatar(
                        radius: 30.h,
                    backgroundColor: Color(0xFF97D7BA),
                    child: SvgPicture.asset('assets/icons/semi_wave.svg'),
                  )),
                  Positioned(
                      top: 35.h,
                      left: 30.w,
                      child: CircleAvatar(
                        radius: 30.h,
                        backgroundColor: Colors.white,
                        child: SvgPicture.asset('assets/icons/semi_wave.svg'),
                      )),
                ],
              ),
              Positioned(
                top: 67.h,
                right: 114.w,
                left: 114.w,
                child: Text("Current Balance",
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500
                ),
              ),),
              Positioned(
                  top: 118.h,
                  left: 100.w,
                  right: 112.w,
                  child: Text("\$18,372",style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 36.sp
              ),)),
              Positioned(
                   top: 191.h,
                  left: 65.w,
                  right: 178.w,
                  child: Container(
                    width: 100.w,
                  height: 34.h,
                decoration: BoxDecoration(
                  color: Color(0xFF9CD6BBC),
                  borderRadius: BorderRadius.circular(20.r),

                ),
                child: Row(children: <Widget>[
                     SvgPicture.asset('assets/icons/income.svg'),
                     Text("Income",style: GoogleFonts.poppins(
                       fontSize: 12.sp,
                       fontWeight: FontWeight.w500
                     ),),
                ],),
              )),

            ],
          )
        ],
      ),
    ));
  }

}