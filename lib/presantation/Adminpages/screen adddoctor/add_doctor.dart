import 'dart:developer';
import 'dart:io';

import 'package:appoiment_docter/Domain/firebase%20functions/doctor/add%20to%20firebase/add_imgfile.dart';
import 'package:appoiment_docter/core/colors/colors.dart';
import 'package:appoiment_docter/core/constands.dart';
import 'package:appoiment_docter/presantation/intro%20and%20log%20in%20page/widgets/snckbar.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../../Domain/firebase functions/doctor/add to firebase/add_all_doctors.dart';
import '../../../Domain/firebase functions/doctor/add to firebase/add_popular_doctor.dart';

class Adddoctor extends StatefulWidget {
  const Adddoctor({
    super.key,
    required this.pagekey,
  });
  final String pagekey;

  @override
  State<Adddoctor> createState() => _AdddoctorState();
}

class _AdddoctorState extends State<Adddoctor> {
  final List<String> catetories = [
    'Gynecologists',
    'Cardiologists',
    'Endocrinologists',
    'Gastroenterologists',
    'Nephrologists',
    'Urologists',
    'Pulmonologists',
    'Otolaryngologists',
    'Neurologists',
    'Psychiatrists',
    'Oncologists',
    'Radiologists',
    'Rheumatologists',
    'Anesthesiologists',
    'Ophthalmologist',
    "Dermatologist,",
    'Pathologist',
    'Dermatology',
  ];

  String? selectedValue;

  TextEditingController doctornamecontroller = TextEditingController();

  TextEditingController expcontroller = TextEditingController();

  TextEditingController countcontroller = TextEditingController();

  TextEditingController aboutcontroller = TextEditingController();
  TextEditingController idController = TextEditingController();
  XFile? imagefile;
  String? imgurl;
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: _formkey,
            child: Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: const Text(
                      'Add Docter',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
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
                        decoration: const BoxDecoration(
                          borderRadius: radius20,
                          // color: mgreya,
                        ),
                        child: CircleAvatar(
                            radius: 80,
                            backgroundColor: mWhite,
                            backgroundImage: imagefile == null
                                ? null
                                : FileImage(File(imagefile!.path))),
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () async {
                        await cropImage();
                      },
                      icon: const Icon(Icons.crop)),
                  TextButton(
                      onPressed: () async {
                        await addimage();
                        // imgurl = await uploadimg(imagefile: imagefile);
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                            borderRadius: radius10, color: cmain),
                        width: double.infinity,
                        height: 45,
                        child: const Center(
                            child: Text(
                          'Add Photo',
                          style: TextStyle(color: mWhite),
                        )),
                      )),
                  Mytextfield(
                    type: TextInputType.name,
                    firsttext: 'Doctor Name',
                    myTextEditingController: doctornamecontroller,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    child: DropdownButtonFormField2(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'required';
                        } else {
                          return null;
                        }
                      },
                      buttonHeight: 40,
                      buttonPadding: const EdgeInsets.only(left: 0, right: 10),
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hint: const Text(
                        'Select Doctor Catogories',
                        style: TextStyle(fontSize: 14),
                      ),
                      decoration: const InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                      items: catetories
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
                      isExpanded: true,
                    ),
                  ),
                  Mytextfield(
                    type: TextInputType.number,
                    firsttext: 'Experiance',
                    myTextEditingController: expcontroller,
                  ),
                  Mytextfield(
                    type: TextInputType.number,
                    firsttext: 'Petient count',
                    myTextEditingController: countcontroller,
                  ),
                  Mytextfield(
                    type: TextInputType.text,
                    firsttext: 'About Doctor',
                    myTextEditingController: aboutcontroller,
                  ),
                  Mytextfield(
                    type: TextInputType.text,
                    firsttext: 'id',
                    myTextEditingController: idController,
                  ),
                  TextButton(
                    onPressed: () async {
                      if (imagefile == null) {
                        return showSnakbar('All field are required', context);
                      } else {
                        if (_formkey.currentState!.validate()) {
                          if (widget.pagekey == 'populardoctors') {
                            imgurl = await uploadimg(imagefile: imagefile);
                            await addpopulardoctors(
                                id: idController.text,
                                dctrimage: imgurl!,
                                aboutcontroller: aboutcontroller,
                                countcontroller: countcontroller,
                                doctornamecontroller: doctornamecontroller,
                                expcontroller: expcontroller,
                                selectedValue: selectedValue!);
                            await addalldoctors(
                              id: idController.text,

                              //  id: selectedValue!,
                              aboutcontroller: aboutcontroller,
                              countcontroller: countcontroller,
                              doctornamecontroller: doctornamecontroller,
                              expcontroller: expcontroller,
                              selectedValue: selectedValue!,
                              imgurl: imgurl!,
                            );
                            Navigator.pop(context);
                          } else {
                            imgurl = await uploadimg(imagefile: imagefile);
                            log('message');
                            Navigator.pop(context);

                            await addalldoctors(
                              id: idController.text,
                              // id: selectedVa lue!,
                              aboutcontroller: aboutcontroller,
                              countcontroller: countcontroller,
                              doctornamecontroller: doctornamecontroller,
                              expcontroller: expcontroller,
                              selectedValue: selectedValue!,
                              imgurl: imgurl!,
                            );
                          }
                        }
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
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future addimage() async {
    log('call');
    final file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file == null) return;

    setState(() {
      imagefile = file;
    });
  }

  Future<void> cropImage() async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: imagefile!.path,
      compressFormat: ImageCompressFormat.jpg,
      compressQuality: 100,
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false)
      ],
    );
    if (croppedFile != null) {
      setState(() {
        imagefile = XFile(croppedFile.path);
      });
    }
  }
}

class Mytextfield extends StatelessWidget {
  const Mytextfield({
    required this.firsttext,
    required this.myTextEditingController,
    required this.type,
    Key? key,
  }) : super(key: key);
  final String firsttext;
  final TextEditingController myTextEditingController;
  final TextInputType type;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          firsttext,
          style: const TextStyle(fontSize: 15, color: mGrey),
        ),
        subtitle: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'required';
            } else {
              return null;
            }
          },
          keyboardType: type,
          controller: myTextEditingController,
          decoration: const InputDecoration(hintText: ''),
        ));
  }
}
