import 'package:appoiment_docter/presantation/User%20pages/Screen%20home/screen_home.dart';
import 'package:appoiment_docter/presantation/User%20pages/screen%20profile/screen_profile.dart';
import 'package:appoiment_docter/presantation/User%20pages/secreen%20appoiments/screen_appoiment.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../conform appoiment/conform_appoiment.dart';
import '../screen appoiments/Screen_Admin_appoinment.dart';
import '../screen home/Screen_admin_home.dart';
import 'widgets/navogationbar.dart';

final List<String> showcatetories = [];

class adminScreenMain extends StatelessWidget {
  adminScreenMain({super.key});

  final _pages = [
    AdminHome(),
    AdminAppoinment(),
    ConformAppoinment(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: IndexValueNotifier,
          builder: (context, int index, _) {
            return _pages[index];
          },
        ),
      ),
      bottomNavigationBar: AdminBottomNavigatonBar(),
    );
  }
}
