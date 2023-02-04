import 'package:appoiment_docter/Domain/models/appoiment_modal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

addappoinment(
    {required String doctername,
    required String category,
    required String genter,
    required String image,
    // required String id,
    required String problem,
    required String patientname,
    required int age,
    required DateTime date,
    required TimeOfDay time}) async {
  // final id = '$age$patientname';

  final timeflter = '${time.hour}:${time.minute}';
  final datefilter = date.toString();
  final datadoc = FirebaseFirestore.instance.collection('appoinments').doc();
  final datamodal = Appoinmentmodal(
    age: age,
    category: category,
    date: datefilter,
    doctername: doctername,
    genter: genter,
    id: datadoc.id,
    image: image,
    patientname: patientname,
    problem: problem,
    time: timeflter,
  );

  final json = Appoinmentmodal.toJson(
      doctername: datamodal.doctername,
      category: datamodal.category,
      genter: datamodal.genter,
      time: datamodal.time,
      id: datamodal.id,
      problem: datamodal.problem,
      patientname: datamodal.patientname,
      date: datamodal.date,
      age: datamodal.age,
      image: datamodal.image);

  await datadoc.set(json);
}
