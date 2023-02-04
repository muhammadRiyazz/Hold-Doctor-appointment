import 'package:appoiment_docter/core/colors/colors.dart';
import 'package:appoiment_docter/core/constands.dart';
import 'package:appoiment_docter/presantation/intro%20and%20log%20in%20page/screen%20intro/pages/firstpage.dart';
import 'package:appoiment_docter/presantation/intro%20and%20log%20in%20page/screen%20intro/pages/scndpage.dart';
import 'package:appoiment_docter/presantation/intro%20and%20log%20in%20page/screen%20intro/pages/therdpage.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screen firstlog/screen_firstlog.dart';
import '../screen splash/screen_splash.dart';

class ScreenIntro extends StatefulWidget {
  const ScreenIntro({super.key});

  @override
  State<ScreenIntro> createState() => _ScreenIntroState();
}

class _ScreenIntroState extends State<ScreenIntro> {
  Container buildDot(int index) {
    return Container(
      margin: const EdgeInsets.all(3),
      height: 10,
      width: currentIndex == index ? 25 : 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: cmain,
      ),
    );
  }

  int currentIndex = 0;

  PageController mycontroller = PageController();

  @override
  Widget build(BuildContext context) {
    setbool();
    Size mysize = MediaQuery.of(context).size;
    List pages = [
      PageviewFirst(mysize: mysize),
      PageviewScnd(mysize: mysize),
      Pageviewlast(mysize: mysize),
    ];
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
                controller: mycontroller,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return pages[index];
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => buildDot(index),
              ),
            ),
            hsizedbox10,
            TextButton(
                onPressed: () {
                  currentIndex == 2
                      ? Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return const AuthScreen();
                          },
                        ))
                      : setState(() {
                          mycontroller.nextPage(
                            duration: const Duration(microseconds: 100),
                            curve: Curves.bounceIn,
                          );
                        });
                },
                child: Container(
                  decoration:
                      const BoxDecoration(borderRadius: radius10, color: cmain),
                  width: double.infinity,
                  height: 50,
                  child: Center(
                      child: currentIndex == 2
                          ? const Text(
                              'Get Start',
                              style: TextStyle(color: mWhite),
                            )
                          : const Text(
                              'Next',
                              style: TextStyle(color: mWhite),
                            )),
                )),
            hsizedbox15
          ],
        ),
      )),
    );
  }

  Future setbool() async {
    final _sharepreferances = await SharedPreferences.getInstance();
    final userlogin = _sharepreferances.setBool(kayname, true);
  }
}
