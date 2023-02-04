import 'dart:developer';

import 'package:appoiment_docter/Domain/firebase%20functions/doctor/delete%20from%20firebase/delete_data.dart';
import 'package:appoiment_docter/Domain/firebase%20functions/doctor/read%20from%20firebase/main_readfunction.dart';
import 'package:appoiment_docter/Domain/firebase%20functions/doctor/read%20from%20firebase/read_popular_doctor.dart';
import 'package:appoiment_docter/Domain/models/doctor_modal.dart';
import 'package:appoiment_docter/core/colors/colors.dart';
import 'package:appoiment_docter/core/constands.dart';
import 'package:appoiment_docter/presantation/Adminpages/screen%20adddoctor/add_doctor.dart';
import 'package:appoiment_docter/presantation/Adminpages/screen%20editdocter/edit_doctor.dart';
import 'package:appoiment_docter/presantation/User%20pages/screen%20time%20and%20date/screen_time_date.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../../../Domain/firebase functions/doctor/read from firebase/read_all_doctors.dart';

class InfoDocter extends StatelessWidget {
  const InfoDocter(
      {super.key,
      required this.pagekey,
      required this.index,
      this.categorykey});
  final int index;
  final String pagekey;
  final String? categorykey;
  @override
  Widget build(BuildContext context) {
    Size msize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: cmain,
      body: SafeArea(
          child: StreamBuilder(
              stream:
                  mainfunction(functionkey: pagekey, categoryname: categorykey),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(
                    child: Text('something went worng'),
                  );
                } else if (snapshot.hasData) {
                  final data = snapshot.data;
                  return maincolumn(
                    msize: msize,
                    ddata: data!,
                    index: index,
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              })),
    );
  }
}

class maincolumn extends StatelessWidget {
  const maincolumn({
    Key? key,
    required this.msize,
    required this.ddata,
    required this.index,
  }) : super(key: key);

  final Size msize;
  final ddata;
  final int index;

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
          child: Image.network(ddata[index].image,
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
                          'Dr. ${ddata[index].doctorName} MBBS',
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Center(
                        child: Text(
                          ddata[index].category,
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
                                fristtxt:
                                    '${ddata[index].petientsCount.toString()} +',
                                scndtxt: 'Patients',
                                icon: const Icon(
                                  Icons.account_circle_outlined,
                                  color: mGreyc,
                                  size: 33,
                                ),
                              ),
                              ScndpartDocter(
                                fristtxt: '${ddata[index].experiance} Year',
                                scndtxt: 'Experians',
                                icon: const Icon(
                                  Icons.account_circle_outlined,
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
                            'About Doctor',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          ),
                        ),
                        hsizedbox20,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            ddata[index].aboutDoctor,
                            style: const TextStyle(color: mGreyc),
                          ),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Expanded(
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return Editdoctor(
                                          about: ddata[index].aboutDoctor,
                                          category: ddata[index].category,
                                          count: ddata[index].petientsCount,
                                          exp: ddata[index].experiance,
                                          name: ddata[index].doctorName,
                                          image: ddata[index].image,
                                          id: ddata[index].id,
                                          pagekey: 'all doctors',
                                        );
                                      },
                                    ));
                                  },
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        borderRadius: radius10, color: cmain),
                                    //width: double.infinity,
                                    height: 45,
                                    child: const Center(
                                        child: Text(
                                      'Edit',
                                      style: TextStyle(color: mWhite),
                                    )),
                                  )),
                            ),
                            Expanded(
                              child: TextButton(
                                  onPressed: () {
                                    final id = ddata[index].id;
                                    final category = ddata[index].category;
                                    Navigator.pop(context);

                                    deletedata(id: id, categoryname: category);
                                  },
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        borderRadius: radius10, color: cmain),
                                    // width: double.infinity,
                                    height: 45,
                                    child: const Center(
                                        child: Text(
                                      'Delete',
                                      style: TextStyle(color: mWhite),
                                    )),
                                  )),
                            )
                          ],
                        )
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
    Key? key,
  }) : super(key: key);
  final String fristtxt;
  final String scndtxt;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            decoration: BoxDecoration(color: mgreyb, borderRadius: radius10),
            padding: EdgeInsets.all(10),
            child: icon),
        wsizedbox10,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              fristtxt,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            Text(
              scndtxt,
              style: TextStyle(color: mGreyc),
            )
          ],
        )
      ],
    );
  }
}
