import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wavr/features/splash_screen/components/background_image.dart';
import 'package:wavr/features/splash_screen/components/body.dart';

class SplashScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Stack(
     children: [
       BackgroundImage(),
       Scaffold(
         backgroundColor: Colors.transparent,
         body: Body(),
       ),
     ],
    );
  }

}