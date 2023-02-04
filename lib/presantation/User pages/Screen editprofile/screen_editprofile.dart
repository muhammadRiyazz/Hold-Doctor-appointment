import 'dart:developer';

import 'package:appoiment_docter/core/colors/colors.dart';
import 'package:appoiment_docter/core/constands.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ScreenEditprofile extends StatelessWidget {
  ScreenEditprofile({super.key});
  final List<String> genderItems = [
    'Male',
    'Female',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: const Text(
                  'Edit Your Profile',
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
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 70),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: radius20,
                        color: mgreya,
                      ),
                      //width: 200,
                    )),
              ),
              EditDeteails(firsttext: 'Name', secondtext: 'Muhammad Riyaz'),
              EditDeteails(firsttext: 'Age', secondtext: '22'),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: DropdownButtonFormField2(
                  buttonHeight: 40,
                  buttonPadding: const EdgeInsets.only(left: 0, right: 10),
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),

                  hint: const Text(
                    'Select Your Gender',
                    style: TextStyle(fontSize: 14),
                  ),
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    // border: OutlineInputBorder(
                    //   borderRadius: radius5,
                    // ),
                  ),
                  items: genderItems
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
                    selectedValue = value.toString();
                  },
                  // onSaved: (value) {
                  //   selectedValue = value.toString();
                  // },
                  isExpanded: true,
                ),
              ),
              EditDeteails(firsttext: 'Place', secondtext: 'Malappuram'),
              EditDeteails(firsttext: 'Phone Number', secondtext: '7034612195'),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    log(selectedValue.toString());
                  },
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: radius10, color: cmain),
                    width: double.infinity,
                    height: 45,
                    child: const Center(
                        child: Text(
                      'Conform',
                      style: TextStyle(color: mWhite),
                    )),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class EditDeteails extends StatelessWidget {
  const EditDeteails({
    required this.firsttext,
    required this.secondtext,
    Key? key,
  }) : super(key: key);
  final String firsttext;
  final String secondtext;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          firsttext,
          style: const TextStyle(fontSize: 15, color: mGrey),
        ),
        subtitle: TextFormField(
          decoration: InputDecoration(hintText: ''),
        )
        // crossAxisAlignment: CrossAxisAlignment.start,
        // children: [

        // ],
        );
  }
}
