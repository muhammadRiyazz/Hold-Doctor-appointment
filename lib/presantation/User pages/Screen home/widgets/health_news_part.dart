import 'package:appoiment_docter/core/colors/colors.dart';
import 'package:appoiment_docter/core/constands.dart';
import 'package:flutter/cupertino.dart';

class HealthNewsPart extends StatelessWidget {
  const HealthNewsPart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mysize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        decoration: const BoxDecoration(color: cmain, borderRadius: radius10),
        height: mysize.height * 0.23,
        width: double.infinity,
        child: const ClipRRect(
          borderRadius: radius20,
          // child: Image.asset(
          //   'lib/assets/doctor-nurses-special-equipment_23-2148980721.png',
          //   fit: BoxFit.fill,
          // ),
        ),
      ),
    );
  }
}
