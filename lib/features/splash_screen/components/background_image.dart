import 'package:flutter/material.dart';


class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/splash_bg.jpg'),
        fit: BoxFit.cover,
       // colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
      ),
    ),
     );
  }
}
