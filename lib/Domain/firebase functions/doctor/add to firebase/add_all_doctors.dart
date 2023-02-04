import 'package:appoiment_docter/Domain/firebase%20functions/doctor/add%20to%20firebase/add_categories.dart';
import 'package:appoiment_docter/Domain/firebase%20functions/doctor/add%20to%20firebase/add_id.dart';
import 'package:appoiment_docter/Domain/models/doctor_modal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

addalldoctors({
  required TextEditingController doctornamecontroller,
  required TextEditingController aboutcontroller,
  required String selectedValue,
  required TextEditingController expcontroller,
  required String imgurl,
  required TextEditingController countcontroller,
//  required List<Categoreis> data,
  required String id,
}) async {
  final mydoctor = FirebaseFirestore.instance.collection('all doctors').doc(id);

  final modaldata = OurDoctor(
      id: id,
      aboutDoctor: aboutcontroller.text,
      category: selectedValue,
      doctorName: 'Dr.${doctornamecontroller.text} MBBS',
      experiance: int.parse(expcontroller.text),
      image: imgurl,
      petientsCount: int.parse(countcontroller.text));

  final json = OurDoctor.toJson(
      aboutDoctor: modaldata.aboutDoctor,
      category: modaldata.category,
      doctorName: modaldata.doctorName,
      experiance: modaldata.experiance,
      petientsCount: modaldata.petientsCount,
      image: modaldata.image,
      id: modaldata.id);

  await mydoctor.set(json);

  doctorstocategory(
      id: id,
      aboutdoctor: aboutcontroller.text,
      categoryname: selectedValue,
      count: int.parse(countcontroller.text),
      doctorname: doctornamecontroller.text,
      exp: int.parse(expcontroller.text),
      imgurl: imgurl);

  addid(category: selectedValue);

  //addcategoreis(categoryname: selectedValue);

  //showcatetories.add(selectedValue!);
  //log(showcatetories.length.toString());
}
