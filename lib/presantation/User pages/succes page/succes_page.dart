import 'package:appoiment_docter/core/colors/colors.dart';
import 'package:appoiment_docter/presantation/User%20pages/screen%20main/screen_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SuccesPage extends StatelessWidget {
  SuccesPage({
    Key? key,
  }) : super(key: key);

  double screenWidth = 600;

  double screenHeight = 400;

  Color textColor = const Color(0xFF32567A);
  Future gotonext(context) async {
    await Future.delayed(const Duration(seconds: 4));
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
      builder: (context) {
        return ScreenMain();
      },
    ), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    gotonext(context);

    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                height: 170,
                padding: const EdgeInsets.all(35),
                decoration: BoxDecoration(
                  color: themeColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.card_giftcard_sharp,
                  color: mWhite,
                  size: 72,
                )),
            SizedBox(height: screenHeight * 0.02),
            Text(
              "Thank You!",
              style: TextStyle(
                color: themeColor,
                fontWeight: FontWeight.w600,
                fontSize: 36,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            const Text(
              "Appoinment done Successfully",
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w400,
                fontSize: 17,
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            SizedBox(height: screenHeight * 0.06),
          ],
        ),
      ),
    );
  }
}

Color themeColor = const Color(0xFF43D19E);
