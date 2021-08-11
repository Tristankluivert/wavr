
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wavr/config/pallate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wavr/core/model/score.dart';
import 'package:wavr/features/dashboard/components/chart_page.dart';
import 'package:wavr/features/dashboard/components/weekly_chart.dart';

import 'bar_chart.dart';


class Body extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                Container(
                  color: wPrimaryColor,
                  height: 445.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 37.h),
                      child: CircleAvatar(
                        radius: 20.r,
                        backgroundColor: Color(0xFF97D7BA),
                        child: SvgPicture.asset('assets/icons/semi_wave.svg',
                      width: 8.w,
                      height: 20.h,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 35.h),
                      child: CircleAvatar(
                        radius: 20.r,
                        backgroundColor: Colors.white,
                        child: SvgPicture.asset('assets/icons/user_icon.svg',
                        width: 8.w,
                          height: 20.h,
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 97.h,
                  right: 114.w,
                  left: 114.w,
                  child: Text("Current Balance",
                  style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF00203F)
                  ),
                ),),

                Positioned(
                    top: 118.h,
                    left: 100.w,
                    //right: 112.w,
                    child: SizedBox(
                      width: 131.w,
                      child: Text("\$18,372",style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 36.sp,
                        color: Color(0xFF00203F),
                ),),
                    )),
                Positioned(
                  top: 191.h,
                  left: 65.w,
                  right: 64.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100.w,
                      height: 34.h,
                        decoration: BoxDecoration(
                      color: Color(0xFF9CD6BB),
                      borderRadius: BorderRadius.circular(20.r),

                        ),
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                         SvgPicture.asset('assets/icons/income.svg'),
                         SizedBox(width: 6.w,),
                         Text("Income",style: GoogleFonts.poppins(
                           fontSize: 12.sp,
                           fontWeight: FontWeight.w500
                         ),),
                        ],),
                      ),
                      SizedBox(width: 14.w,),
                      Container(
                      width: 100.w,
                      height: 34.h,
                      decoration: BoxDecoration(
                        color: Color(0xFF9CD6BB),
                        borderRadius: BorderRadius.circular(20.r),

                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SvgPicture.asset('assets/icons/expense.svg'),
                          SizedBox(width: 6.w,),
                          Text("Expense",style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500
                          ),),
                        ],),
                      )
                    ],
                  ),
                ),
                Positioned(
                    top: 260.h,
                    right: 0,
                    left: 0,
                    child: Container(
                      height: 160.h,
                      width: 400.w,
                      child: BarChartSample2(),
                    ))
              ],
            ),
          )
        ],
      ),
    ));
  }



}