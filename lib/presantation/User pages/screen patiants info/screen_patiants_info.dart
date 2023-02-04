import 'dart:developer';

import 'package:appoiment_docter/Domain/firebase%20functions/appoinment/add%20to%20firebase/add_appoinment.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constands.dart';
import '../screen payment/scree_payment.dart';

class ScreenPatiantsInfo extends StatelessWidget {
  ScreenPatiantsInfo(
      {super.key,
      required this.date,
      required this.time,
      required this.category,
      required this.image,
      required this.doctorname});

  final DateTime date;
  final TimeOfDay time;
  final String doctorname;
  final String category;
  final String image;

  final TextEditingController namecontroller = TextEditingController();

  final TextEditingController agecontroller = TextEditingController();

  final TextEditingController problemcontroller = TextEditingController();

  String? gentervalue;

  final List<String> genterlist = ['Male', 'Femail'];

  final _globalkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Form(
        key: _globalkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ListTile(
              title: const Text(
                'Patient Details',
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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Infotext(
                      texttype: TextInputType.name,
                      hindtext: 'Name',
                      icon: const Icon(Icons.account_circle, color: cmain),
                      label: "Name",
                      conteroller: namecontroller,
                    ),
                    Infotext(
                      texttype: TextInputType.number,
                      hindtext: 'Age',
                      icon: const Icon(Icons.apps_outage_rounded, color: cmain),
                      label: "Age",
                      conteroller: agecontroller,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                      child: DropdownButtonFormField2(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'required';
                          } else {
                            return null;
                          }
                        },
                        buttonHeight: 40,
                        buttonPadding:
                            const EdgeInsets.only(left: 0, right: 10),
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        hint: const Text(
                          'Select Patient Gender',
                          style: TextStyle(fontSize: 14),
                        ),
                        decoration: const InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                        ),
                        items: genterlist
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ))
                            .toList(),
                        onChanged: (value) {
                          gentervalue = value.toString();
                        },
                        isExpanded: true,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Pleas Write Your Problem',
                            style: TextStyle(
                                color: mGreyc, fontWeight: FontWeight.bold),
                          ),
                          hsizedbox10,
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'required';
                              } else {
                                return null;
                              }
                            },
                            controller: problemcontroller,
                            maxLines: 7,
                            decoration: const InputDecoration(
                              isDense: true,
                              // contentPadding: EdgeInsets.symmetric(vertical: 60),
                              focusColor: mBlack,
                              border:
                                  OutlineInputBorder(borderRadius: radius15),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Spacer(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0, right: 5, left: 5),
              child: TextButton(
                  onPressed: () {
                    if (_globalkey.currentState!.validate()) {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return ScreenPaymnt(
                            age: int.parse(agecontroller.text),
                            category: category,
                            date: date,
                            doctorname: doctorname,
                            genter: gentervalue!,
                            image: image,
                            patiantname: namecontroller.text,
                            problem: problemcontroller.text,
                            time: time,
                          );
                        },
                      ));
                    }
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: radius10, color: cmain),
                    width: double.infinity,
                    height: 45,
                    child: const Center(
                        child: Text(
                      'Conform',
                      style: TextStyle(color: mWhite),
                    )),
                  )),
            ),
          ],
        ),
      )),
    );
  }
}

class Infotext extends StatelessWidget {
  const Infotext(
      {Key? key,
      required this.hindtext,
      required this.icon,
      required this.label,
      required this.conteroller,
      required this.texttype})
      : super(key: key);

  final Widget icon;
  final String hindtext;
  final String label;
  final TextEditingController conteroller;
  final TextInputType texttype;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
      child: Column(
        children: [
          Row(
            children: [
              icon,
              wsizedbox5,
              Text(
                label,
                style:
                    const TextStyle(color: mGreyc, fontWeight: FontWeight.bold),
              )
            ],
          ),
          hsizedbox5,
          TextFormField(
            keyboardType: texttype,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'required';
              } else {
                return null;
              }
            },
            controller: conteroller,
            decoration: InputDecoration(
              focusColor: mBlack,
              border: const OutlineInputBorder(borderRadius: radius15),
              hintText: hindtext,
            ),
          ),
        ],
      ),
    );
  }
}
