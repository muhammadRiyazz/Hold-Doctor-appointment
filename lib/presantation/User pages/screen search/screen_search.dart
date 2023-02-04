import 'dart:developer';

import 'package:appoiment_docter/Domain/firebase%20functions/doctor/read%20from%20firebase/read_popular_doctor.dart';
import 'package:appoiment_docter/Domain/models/doctor_modal.dart';
import 'package:appoiment_docter/core/colors/colors.dart';
import 'package:appoiment_docter/core/constands.dart';
import 'package:appoiment_docter/presantation/User%20pages/secreen%20appoiments/screen_appoiment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../../../Domain/firebase functions/doctor/read from firebase/read_all_doctors.dart';
import '../../Adminpages/screen main/screen main.dart';
import '../screen aboutdocter/screen_about_docter.dart';
import '../screen time and date/screen_time_date.dart';

class ScreenSearch extends StatefulWidget {
  ScreenSearch({super.key, required this.doctorlist});
  final List<OurDoctor> doctorlist;

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  List<OurDoctor>? searchlist;
  @override
  void initState() {
    super.initState();
    searchlist = widget.doctorlist;
  }

  searchdoctors({String? value}) {
    setState(() {
      searchlist = widget.doctorlist
          .where((doctor) => doctor.doctorName
              .toLowerCase()
              .contains(value!.trim().toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 3, left: 10),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: radius10,
                      color: mgreya,
                    ),
                    height: 50,
                    width: 50,
                    child: const Icon(
                      size: 15,
                      Icons.arrow_back_ios_new_sharp,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: TextField(
                    onChanged: (value) {
                      searchdoctors(value: value);
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: radius30,
                            color: cmain,
                          ),
                          height: 40,
                          width: 40,
                          child: const Icon(
                            size: 29,
                            Icons.search,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                      focusColor: mBlack,
                      border: const OutlineInputBorder(borderRadius: radius20),
                      hintText: 'Find Your Docter',
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Ourpageview(
              data: searchlist!,
            ),
          ),
        ]),
      ),
    );
  }
}

class Ourpageview extends StatelessWidget {
  const Ourpageview({
    Key? key,
    required this.data,
  }) : super(key: key);
  final List<OurDoctor> data;

  @override
  Widget build(BuildContext context) {
    Size msize = MediaQuery.of(context).size;
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        log(data.length.toString());
        return SimpleShadow(
          opacity: 0.6, // Default: 0.5
          color: mgreya, // Default: Black
          offset: const Offset(
            5,
            6,
          ), // Default: Offset(2, 2)
          sigma: 7,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return AdoutDocter(
                      pagekey: 'all doctors',
                      indexdoctor: index,
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
                height: msize.height * 0.16,
                child: Row(children: [
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: radius10,
                        // color: mgreya,
                      ),
                      child: ClipRRect(
                        borderRadius: radius20,
                        child: Image.network(
                          data[index].image,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Doctertxt(data: data, index: index),
                      ClickButton(dctrlist: data, index: index),
                      const Spacer(),
                    ],
                  )
                ]),
              ),
            ),
          ),
        );
      },
      itemCount: data.length,
    );
  }
}

class Doctertxt extends StatelessWidget {
  const Doctertxt({Key? key, required this.data, required this.index})
      : super(key: key);
  final List<OurDoctor> data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data[index].doctorName,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
          Text(
            data[index].category,
            style: const TextStyle(fontSize: 15, color: mGreyc),
          ),
        ],
      ),
    );
  }
}

class ClickButton extends StatelessWidget {
  const ClickButton({Key? key, required this.dctrlist, required this.index})
      : super(key: key);
  final List<OurDoctor> dctrlist;
  final int index;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return ScreenDateTime(
              id: dctrlist[index].id,
              pagekey: 'add Appoinment',
              image: dctrlist[index].image,
              category: dctrlist[index].category,
              doctorname: dctrlist[index].doctorName,
            );
          },
        ));
      },
      child: Container(
        decoration: const BoxDecoration(color: cmain, borderRadius: radius5),
        padding: const EdgeInsets.symmetric(horizontal: 75, vertical: 10),
        child: const Text(
          'Appoiment',
          style: TextStyle(color: mWhite),
        ),
      ),
    );
  }
}
