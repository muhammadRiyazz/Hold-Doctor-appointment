import 'package:appoiment_docter/Domain/firebase%20functions/doctor/read%20from%20firebase/main_readfunction.dart';
import 'package:appoiment_docter/Domain/firebase%20functions/doctor/read%20from%20firebase/read_popular_doctor.dart';
import 'package:appoiment_docter/Domain/models/doctor_modal.dart';
import 'package:appoiment_docter/core/colors/colors.dart';
import 'package:appoiment_docter/core/constands.dart';
import 'package:appoiment_docter/presantation/User%20pages/screen%20time%20and%20date/screen_time_date.dart';
import 'package:flutter/material.dart';

import '../../../Domain/firebase functions/doctor/read from firebase/read_all_doctors.dart';
import '../screen patiants info/screen_patiants_info.dart';

class AdoutDocter extends StatelessWidget {
  const AdoutDocter(
      {super.key,
      required this.pagekey,
      required this.indexdoctor,
      this.categorykey});
  final int indexdoctor;
  final String pagekey;
  final String? categorykey;

  @override
  Widget build(BuildContext context) {
    Size msize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: cmain,
      body: SafeArea(
          child: StreamBuilder(
        stream: mainfunction(functionkey: pagekey, categoryname: categorykey),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('something went wrong'),
            );
          } else if (snapshot.hasData) {
            final data = snapshot.data;
            return MainColumn(
                msize: msize, data: data, indexdoctor: indexdoctor);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      )),
    );
  }
}

class MainColumn extends StatelessWidget {
  const MainColumn({
    Key? key,
    required this.msize,
    required this.data,
    required this.indexdoctor,
  }) : super(key: key);

  final Size msize;
  final data;
  final int indexdoctor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 13, left: 13),
          child: InkWell(
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
        SizedBox(
          height: msize.height * 0.3,
          width: double.infinity,
          // color: mGreyc,
          child: Image.network(data[indexdoctor].image,
              alignment: Alignment.bottomCenter, fit: BoxFit.contain),
        ),
        Expanded(
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: radius30,
                  color: Color.fromARGB(255, 153, 213, 223),
                ),
                //height: 350,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          data[indexdoctor].doctorName,
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        ),
                      ),
                      hsizedbox5,
                      Center(
                        child: Text(
                          data[indexdoctor].category,
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 75,
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                    color: mgreyb,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ScndpartDocter(
                                label: "+",
                                fristtxt:
                                    data[indexdoctor].petientsCount.toString(),
                                scndtxt: 'Patiants',
                                icon: const Icon(
                                  Icons.supervisor_account,
                                  color: mGreyc,
                                  size: 33,
                                ),
                              ),
                              ScndpartDocter(
                                label: "Years",
                                fristtxt:
                                    data[indexdoctor].experiance.toString(),
                                scndtxt: 'Experians',
                                icon: const Icon(
                                  Icons.format_list_numbered,
                                  color: mGreyc,
                                  size: 33,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Center(
                          child: Text(
                            textAlign: TextAlign.center,
                            'About Docter',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          ),
                        ),
                        hsizedbox20,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            data[indexdoctor].aboutDoctor,
                            style: const TextStyle(color: mGreyc),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return ScreenDateTime(
                                    id: data[indexdoctor].id,
                                    pagekey: 'add Appoinment',
                                    image: data[indexdoctor].image,
                                    category: data[indexdoctor].category,
                                    doctorname: data[indexdoctor].doctorName,
                                  );
                                },
                              ));
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                  borderRadius: radius10, color: cmain),
                              width: double.infinity,
                              height: 45,
                              child: const Center(
                                  child: Text(
                                'Book An Appoiment',
                                style: TextStyle(color: mWhite),
                              )),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class ScndpartDocter extends StatelessWidget {
  const ScndpartDocter({
    required this.fristtxt,
    required this.icon,
    required this.scndtxt,
    required this.label,
    Key? key,
  }) : super(key: key);
  final String fristtxt;
  final String scndtxt;
  final Widget icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            decoration:
                const BoxDecoration(color: mgreyb, borderRadius: radius10),
            padding: const EdgeInsets.all(10),
            child: icon),
        wsizedbox10,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$fristtxt $label",
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            Text(
              scndtxt,
              style: const TextStyle(color: mGreyc),
            )
          ],
        )
      ],
    );
  }
}
