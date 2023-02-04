import 'package:appoiment_docter/core/colors/colors.dart';
import 'package:appoiment_docter/presantation/User%20pages/Screen%20home/screen_home.dart';
import 'package:appoiment_docter/presantation/User%20pages/screen%20profile/screen_profile.dart';
import 'package:appoiment_docter/presantation/User%20pages/secreen%20appoiments/screen_appoiment.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'Widgets/bottom_navigation bar.dart';

class ScreenMain extends StatelessWidget {
  ScreenMain({super.key});

  final _pages = [
    const ScreenHome(),
    ScreenAppoiments(),
    ScreenProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    IndexValueNotifier.value = 0;
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: IndexValueNotifier,
          builder: (context, int index, _) {
            return _pages[index];
          },
        ),
      ),
      bottomNavigationBar: BottomNavigatonBar(),
    );
  }
}
