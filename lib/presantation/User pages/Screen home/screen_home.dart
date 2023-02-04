import 'package:appoiment_docter/Domain/models/doctor_modal.dart';
import 'package:appoiment_docter/core/colors/colors.dart';

import 'package:appoiment_docter/presantation/User%20pages/Screen%20home/widgets/categoreis.dart';
import 'package:appoiment_docter/presantation/User%20pages/Screen%20home/widgets/docters.dart';
import 'package:appoiment_docter/presantation/User%20pages/Screen%20home/widgets/health_news_part.dart';
import 'package:appoiment_docter/presantation/User%20pages/Screen%20home/widgets/title_part.dart';
import 'package:appoiment_docter/presantation/User%20pages/screen%20search/screen_search.dart';
import 'package:flutter/material.dart';

import '../../../Domain/firebase functions/doctor/read from firebase/read_all_doctors.dart';
import '../../../core/constands.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10, right: 13, left: 13),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const TitlePart(),
        const HealthNewsPart(),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'Categoreis',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        Categoreis(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Popular Doctors',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            InkWell(
              onTap: () async {
                List<OurDoctor> doctorlist = await morereaddata().first;

                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return ScreenSearch(doctorlist: doctorlist);
                  },
                ));
              },
              child: const Text(
                'See More',
                style: TextStyle(
                  color: mBlue,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
        hsizedbox10,
        const Docters(),
      ]),
    );
  }
}
