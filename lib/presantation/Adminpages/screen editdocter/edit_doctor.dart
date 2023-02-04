import 'dart:developer';
import 'dart:io';

import 'package:appoiment_docter/Domain/firebase%20functions/doctor/edit%20data/edit_data.dart';
import 'package:appoiment_docter/Domain/models/doctor_modal.dart';
import 'package:appoiment_docter/core/colors/colors.dart';
import 'package:appoiment_docter/core/constands.dart';
import 'package:appoiment_docter/presantation/Adminpages/screen%20main/screen%20main.dart';
import 'package:appoiment_docter/presantation/intro%20and%20log%20in%20page/widgets/snckbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../Domain/firebase functions/doctor/add to firebase/add_imgfile.dart';
import '../../../Domain/firebase functions/doctor/read from firebase/read_categoreis.dart';

class Editdoctor extends StatefulWidget {
  const Editdoctor({
    super.key,
    required this.pagekey,
    required this.about,
    required this.category,
    required this.count,
    required this.id,
    required this.exp,
    required this.image,
    required this.name,
  });
  final String pagekey;
  final String name;
  final int exp;
  final int count;
  final String id;
  final String about;
  final String image;
  final String category;

  @override
  State<Editdoctor> createState() => _EditdoctorState();
}

class _EditdoctorState extends State<Editdoctor> {
  TextEditingController? doctornamecontroller;

  TextEditingController? expcontroller;

  TextEditingController? countcontroller;

  TextEditingController? aboutcontroller;
  // TextEditingController? idController;

  XFile? imagefile;
  String? imgurl;
  final _formkey = GlobalKey<FormState>();
  void putvalue() {
    doctornamecontroller = TextEditingController(text: widget.name);
    expcontroller = TextEditingController(text: widget.exp.toString());
    aboutcontroller = TextEditingController(text: widget.about);
    //  idController = TextEditingController(text: widget.id);
    countcontroller = TextEditingController(text: widget.count.toString());
    imgurl = widget.image;
  }

  @override
  Widget build(BuildContext context) {
    putvalue();
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
                      'Edit Docter',
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
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 70),
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: radius20,
                        // color: mgreya,
                      ),
                      child: imagefile == null
                          ? CircleAvatar(
                              radius: 80,
                              child: Image.network(imgurl.toString()),
                            )
                          : CircleAvatar(
                              radius: 80,
                              backgroundColor: mWhite,
                              backgroundImage:
                                  FileImage(File(imagefile!.path))),
                    ),
                  ),
                  TextButton(
                      onPressed: () async {
                        log(imgurl!);

                        await addimage();

                        setState(() async {
                          imgurl = await uploadimg(imagefile: imagefile);
                          log(imgurl!);
                        });
                        setState(() {});
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
                    myTextEditingController: doctornamecontroller!,
                  ),
                  Mytextfield(
                    type: TextInputType.number,
                    firsttext: 'Experiance',
                    myTextEditingController: expcontroller!,
                  ),
                  Mytextfield(
                    type: TextInputType.number,
                    firsttext: 'Petient count',
                    myTextEditingController: countcontroller!,
                  ),
                  Mytextfield(
                    type: TextInputType.text,
                    firsttext: 'About Doctor',
                    myTextEditingController: aboutcontroller!,
                  ),
                  TextButton(
                    onPressed: () async {
                      await edit(
                          about: aboutcontroller!.text,
                          category: widget.category,
                          count: int.parse(countcontroller!.text),
                          exp: int.parse(expcontroller!.text),
                          id: widget.id,
                          image: imgurl!,
                          name: doctornamecontroller!.text);
                      log(imgurl!);
                      Navigator.pop(context);
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
