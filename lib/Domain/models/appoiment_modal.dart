import 'package:flutter/material.dart';

class Appoinmentmodal {
  final String id;
  final String doctername;

  final String patientname;
  final String genter;
  final String problem;
  final String category;
  final int age;
  final String time;
  final String date;
  final String image;
  Appoinmentmodal({
    required this.doctername,
    required this.category,
    required this.image,
    required this.genter,
    required this.age,
    required this.date,
    required this.patientname,
    required this.time,
    required this.problem,
    required this.id,
  });

  static Map<String, dynamic> toJson({
    required String doctername,
    required String category,
    required String genter,
    required String time,
    required String id,
    required String problem,
    required String patientname,
    required String date,
    required int age,
    required String image,
  }) {
    return {
      'id': id,
      'dotorName': doctername,
      'category': category,
      'image': image,
      'genter': genter,
      'time': time,
      'problem': problem,
      'patientname': patientname,
      'age': age,
      'date': date,
    };
  }

  static Appoinmentmodal fromJson(Map<String, dynamic> json) {
    return Appoinmentmodal(
        age: json['age'],
        category: json['category'],
        date: json['date'],
        doctername: json['dotorName'],
        genter: json['genter'],
        id: json['id'],
        image: json['image'],
        patientname: json['patientname'],
        problem: json['problem'],
        time: json['time']);
  }
}
