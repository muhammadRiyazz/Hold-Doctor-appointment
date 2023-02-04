import 'package:appoiment_docter/core/colors/colors.dart';
import 'package:appoiment_docter/core/constands.dart';
import 'package:flutter/material.dart';

class Pageviewlast extends StatelessWidget {
  const Pageviewlast({
    Key? key,
    required this.mysize,
  }) : super(key: key);

  final Size mysize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: mysize.height * 0.5,
          // color: mBlue,
          child: Image.asset('lib/assets/Group 36074.png'),
        ),
        hsizedbox15,
        const Text(
          'Easier with a secure\nsystem',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        hsizedbox20,
        const Text(
          'We are prioritize and safety for\nyou and your dactor ',
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, color: mGreyc),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
