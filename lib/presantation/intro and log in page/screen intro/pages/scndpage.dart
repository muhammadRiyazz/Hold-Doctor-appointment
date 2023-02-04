import 'package:appoiment_docter/core/colors/colors.dart';
import 'package:appoiment_docter/core/constands.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class PageviewScnd extends StatelessWidget {
  const PageviewScnd({
    Key? key,
    required this.mysize,
  }) : super(key: key);

  final Size mysize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: mysize.height * 0.5,
          //  color: mGrey,
          child: Image.asset('lib/assets/Group 36074.png'),
        ),
        hsizedbox15,
        const Text(
          'Book the best doctor\nin your ASTER',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        hsizedbox20,
        const Text(
          'More than 100+ specialist doctors are\nready to serve you ',
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, color: mGreyc),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
