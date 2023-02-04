import 'dart:developer';

import 'package:appoiment_docter/Domain/firebase%20functions/appoinment/read%20data/read_appoinment.dart';
import 'package:appoiment_docter/core/colors/colors.dart';
import 'package:appoiment_docter/core/constands.dart';
import 'package:appoiment_docter/presantation/User%20pages/secreen%20appoiments/widgets/date.dart';
import 'package:appoiment_docter/presantation/User%20pages/secreen%20appoiments/widgets/docter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:simple_shadow/simple_shadow.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../screens appoimentdetails/screen_details.dart';

class ScreenAppoiments extends StatelessWidget {
  ScreenAppoiments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          hsizedbox15,
          // SimpleShadow(
          //   opacity: 0.11, // Default: 0.5
          //   //color: mgreya, // Default: Black
          //   offset: const Offset(
          //     5,
          //     6,
          //   ), // Default: Offset(2, 2)
          //   sigma: 2,
          //   child: Padding(
          //     padding: const EdgeInsets.only(bottom: 15),
          //     child: ToggleSwitch(
          //       minWidth: double.infinity,
          //       cornerRadius: 15.0,
          //       activeBgColors: const [
          //         [cmain],
          //         [cmain]
          //       ],
          //       activeFgColor: Color.fromARGB(255, 233, 226, 226),
          //       inactiveBgColor: mWhite,
          //       inactiveFgColor: Color.fromARGB(255, 0, 0, 0),
          //       initialLabelIndex: 1,
          //       totalSwitches: 2,
          //       labels: const ['Appoiments', 'Requasets'],
          //       radiusStyle: true,
          //       onToggle: (index) {
          //         myPageController.jumpTo;
          //         log('sdwdd');
          //       },
          //     ),
          //   ),
          // ),
          Listviewdocter(),
          // Expanded(
          //   child: PageView(controller: myPageController, children: [

          //     Listviewdocter(),
          //   ]),
          // ),
        ],
      ),
    );
  }
}

class Listviewdocter extends StatelessWidget {
  const Listviewdocter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: readappoinmrnt(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          log(snapshot.error.toString());
          return Center(
            child: Text('someting went wrong '),
          );
        } else if (snapshot.hasData) {
          final data = snapshot.data!;
          return Expanded(
            child: ListView.builder(
                itemBuilder: (context, index) {
                  return SimpleShadow(
                    opacity: 0.11, // Default: 0.5
                    //color: mgreya, // Default: Black
                    offset: const Offset(
                      5,
                      6,
                    ), // Default: Offset(2, 2)
                    sigma: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 13, vertical: 10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return AppoimentDetails(
                                index: index,
                              );
                            },
                          ));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(7),
                          decoration: const BoxDecoration(
                            borderRadius: radius15,
                            color: mWhite,
                          ),
                          height: 100,
                          child: Row(children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: const BoxDecoration(
                                borderRadius: radius10,
                              ),
                              child: Image.network(
                                data[index].image,
                                alignment: Alignment.bottomCenter,
                              ),
                            ),
                            wsizedbox10,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Doctername(data: data, index: index),
                                Date(data: data, index: index),
                              ],
                            )
                          ]),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: data.length),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
