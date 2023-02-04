import 'package:appoiment_docter/core/colors/colors.dart';
import 'package:appoiment_docter/core/constands.dart';
import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';

class DocterPart extends StatelessWidget {
  const DocterPart({
    required this.category,
    required this.doctor,
    required this.image,
    Key? key,
    required this.msize,
  }) : super(key: key);

  final Size msize;
  final String image;
  final String doctor;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        height: msize.height * 0.18,
        decoration: const BoxDecoration(
            //borderRadius: radius15,
            //color: mgreya,
            ),
        child: Row(
          children: [
            SimpleShadow(
              opacity: 1, // Default: 0.5
              color: mgreya, // Default: Black
              offset: const Offset(
                7,
                7,
              ), // Default: Offset(2, 2)
              sigma: 4,
              child: Container(
                width: 120,
                decoration: const BoxDecoration(
                  borderRadius: radius15,
                  color: mWhite,
                ),
                child: Image.network(image),
              ),
            ),
            wsizedbox20,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                hsizedbox15,
                Text(doctor,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                hsizedbox5,
                Text(category,
                    style: TextStyle(
                      color: mGrey,
                      fontSize: 15,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
