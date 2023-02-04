import 'package:appoiment_docter/core/colors/colors.dart';
import 'package:appoiment_docter/presantation/intro%20and%20log%20in%20page/screen%20firstlog/screen_firstlog.dart';
import 'package:appoiment_docter/presantation/intro%20and%20log%20in%20page/screen%20intro/screen_scnd_splash.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const kayname = 'loginkey';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

  @override
  Widget build(BuildContext context) {
    checklogin(context);

    return Scaffold(
        body: SafeArea(
            child: Container(
      height: double.infinity,
      width: double.infinity,
      color: cmain,
    )));
  }

  Future gotonext(context) async {
    await Future.delayed(const Duration(microseconds: 4));
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return const ScreenIntro();
      },
    ));
  }

  Future checklogin(context) async {
    final _sharepreferances = await SharedPreferences.getInstance();

    final userlogin = _sharepreferances.getBool(kayname);

    if (userlogin == null || userlogin == false) {
      gotonext(context);
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return const AuthScreen();
        },
      ));
    }
    
  }
}
