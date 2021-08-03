import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultButton extends StatelessWidget {

  const DefaultButton({
    Key? key,
    required this.text,
    required this.press,
    required this.btnColor,
    required this.txtColor
  }) : super(key: key);
  final String text;
  final Function press;
  final Color btnColor;
  final Color txtColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 314.w,
      height: 60.h ,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
           primary: btnColor,
            textStyle: GoogleFonts.poppins(
                fontSize: 16.sp,
                color: txtColor,
                fontWeight: FontWeight.w500
            ),
        ),
        onPressed: press(),
        child: Text(
          text,
        ),
      ),
    );
  }
}