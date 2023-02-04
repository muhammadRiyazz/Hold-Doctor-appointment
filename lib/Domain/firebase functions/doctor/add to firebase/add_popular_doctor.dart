import 'dart:developer';

import 'package:appoiment_docter/Domain/models/doctor_modal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

Future addpopulardoctors({
  required TextEditingController aboutcontroller,
  required String selectedValue,
  required TextEditingController doctornamecontroller,
  required TextEditingController expcontroller,
  required TextEditingController countcontroller,
  required String dctrimage,
  required String id,
}) async {
  log('function call/.................................');
  final Populardoctorfirebasedoc =
      FirebaseFirestore.instance.collection('Popular doctors').doc(id);

  final mypopulardictor = PopularDoctor(
    image: dctrimage,
    id: id,
    aboutDoctor: aboutcontroller.text,
    category: selectedValue.toString(),
    doctorName: 'Dr.${doctornamecontroller.text} MBBS',
    experiance: int.parse(expcontroller.text),
    petientsCount: int.parse(countcontroller.text),
  );
  log('call set 2');
  final json = PopularDoctor.toJson(
      image: mypopulardictor.image,
      id: mypopulardictor.id,
      aboutDoctor: mypopulardictor.aboutDoctor,
      category: mypopulardictor.category,
      doctorName: mypopulardictor.doctorName,
      experiance: mypopulardictor.experiance,
      petientsCount: mypopulardictor.petientsCount);
  log('call set 3');
  await Populardoctorfirebasedoc.set(json);
}
