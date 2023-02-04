import 'package:appoiment_docter/core/colors/colors.dart';
import 'package:appoiment_docter/core/constands.dart';
import 'package:appoiment_docter/presantation/Adminpages/screen%20main/widgets/navogationbar.dart';
import 'package:appoiment_docter/presantation/intro%20and%20log%20in%20page/screen%20firstlog/screen_firstlog.dart';
import 'package:appoiment_docter/presantation/User%20pages/screen%20main/screen_main.dart';
import 'package:appoiment_docter/presantation/User%20pages/screen%20userprofile/sceen_user_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../Screen setings/screen_setings.dart';

class ScreenProfile extends StatelessWidget {
  ScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
      child: Column(
        children: [
          hsizedbox10,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50,
                width: 60,
                decoration: const BoxDecoration(
                  borderRadius: radius10,
                ),
                child: Image.asset('lib/assets/hsptl.png'),
              ),
              wsizedbox10,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Aster Hospital',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  hsizedbox2,
                  Text(
                    'Palarivettam,Kochin',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: mGrey),
                  ),
                ],
              )
            ],
          ),
          hsizedbox10,
          const Divider(
            thickness: 1,
            // height: 50,
          ),
          Expanded(
            child: ListView(
              children: [
                Mainlistile(
                  mytext: 'Profile',
                  icon: const Icon(
                    Icons.account_circle_rounded,
                    size: 35,
                    color: cmain,
                  ),
                  navigation: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return ScreenUserprofile();
                      },
                    ));
                  },
                ),
                Mainlistile(
                    mytext: 'About',
                    icon: Icon(
                      Icons.attribution_outlined,
                      size: 35,
                      color: cmain,
                    ),
                    navigation: () {}),
                Mainlistile(
                  mytext: 'Share',
                  navigation: () {},
                  icon: Icon(
                    Icons.share_outlined,
                    size: 35,
                    color: cmain,
                  ),
                ),
                Mainlistile(
                  mytext: 'Help',
                  navigation: () {},
                  icon: Icon(
                    Icons.help_outline_sharp,
                    size: 35,
                    color: cmain,
                  ),
                ),
                Mainlistile(
                  mytext: 'Setings',
                  navigation: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return ScreeenSetings();
                      },
                    ));
                  },
                  icon: const Icon(
                    Icons.settings,
                    size: 35,
                    color: cmain,
                  ),
                ),
                Mainlistile(
                  mytext: 'Log Out',
                  navigation: () async {
                    await logout(context: context);
                  },
                  //  navigation: ScreeenSetings(),
                  icon: const Icon(
                    Icons.logout_outlined,
                    size: 35,
                    color: cmain,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Mainlistile extends StatelessWidget {
  const Mainlistile({
    required this.mytext,
    required this.navigation,
    required this.icon,
    Key? key,
  }) : super(key: key);
  final String mytext;
  final navigation;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: ListTile(
        trailing: InkWell(
          onTap: navigation,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: radius10,
              color: mgreya,
            ),
            height: 40,
            width: 40,
            child: const Icon(Icons.navigate_next_rounded),
          ),
        ),
        leading: icon,
        title: Text(
          mytext,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

logout({required BuildContext context}) {
  QuickAlert.show(
    context: context,
    type: QuickAlertType.confirm,
    text: 'Do you want to logout',
    confirmBtnText: 'Yes',
    cancelBtnText: 'No',
    confirmBtnColor: Colors.green,
    onConfirmBtnTap: () async {
      Navigator.pop(context);
      await FirebaseAuth.instance.signOut();
    },
  );
}
