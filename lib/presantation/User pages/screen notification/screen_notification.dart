import 'package:appoiment_docter/core/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../core/constands.dart';

class ScreenNotification extends StatelessWidget {
  const ScreenNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text(
                'Notifications',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: radius10,
                    color: mgreya,
                  ),
                  height: 40,
                  width: 40,
                  child: const Icon(
                    size: 15,
                    Icons.arrow_back_ios_new_sharp,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('11 March 2022'),
            ),
            const Alarm(),
            hsizedbox15,
            const Conform(),
            Padding(
              padding: EdgeInsets.only(top: 50, bottom: 10),
              child: Text('11 March 2022'),
            ),
            Alarm(),
            hsizedbox15,
            Conform(),
          ]),
        ),
      ),
    );
  }
}

class Conform extends StatelessWidget {
  const Conform({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        wsizedbox10,
        const Padding(
          padding: EdgeInsets.only(right: 18),
          child: Icon(
            Icons.call_to_action_rounded,
            color: Colors.red,
            size: 38,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Appointment confirmed',
                style: TextStyle(
                    fontSize: 17, fontWeight: FontWeight.w500, color: mGrey),
              ),
              hsizedbox10,
              SizedBox(
                child: Text(
                  textAlign: TextAlign.start,
                  "Your serial is successfully added in appointment listSerial number is 45. Doctor  ",
                  style: TextStyle(color: cmain),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class Alarm extends StatelessWidget {
  const Alarm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        wsizedbox10,
        const Padding(
          padding: EdgeInsets.only(right: 18),
          child: Icon(
            Icons.timer,
            color: mBlue,
            size: 38,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Appoiment Alarm',
                style: TextStyle(
                    fontSize: 17, fontWeight: FontWeight.w500, color: mGrey),
              ),
              hsizedbox10,
              SizedBox(
                child: Text(
                  textAlign: TextAlign.start,
                  "Your serial is successfully added in appointment listSerial number is 45. Doctor ",
                  style: TextStyle(color: cmain),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
