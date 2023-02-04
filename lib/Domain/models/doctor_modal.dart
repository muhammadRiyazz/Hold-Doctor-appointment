import 'package:flutter/cupertino.dart';

class PopularDoctor {
  String? id;
  final String doctorName;
  final String category;
  final String aboutDoctor;
  final int experiance;
  final int petientsCount;
  final String image;
  PopularDoctor(
      {required this.aboutDoctor,
      required this.category,
      required this.image,
      required this.doctorName,
      required this.experiance,
      required this.petientsCount,
      this.id = ''});

  static Map<String, dynamic> toJson(
      {required String aboutDoctor,
      required String category,
      required String doctorName,
      required int experiance,
      String? id,
      required int petientsCount,
      required String image}) {
    return {
      'id': id,
      'DotorName': doctorName,
      'Category': category,
      'AboutDoctor': aboutDoctor,
      'Experiance': experiance,
      'PetientsCount': petientsCount,
      'image': image
    };
  }

  static PopularDoctor fromJson(Map<String, dynamic> json) {
    return PopularDoctor(
        id: json['id'],
        aboutDoctor: json['AboutDoctor'],
        category: json['Category'],
        image: json['image'],
        doctorName: json['DotorName'],
        experiance: json['Experiance'],
        petientsCount: json['PetientsCount']);
  }
}
///////////////////////////////////////////////////////////////////////////////////////

class OurDoctor {
  final String id;
  final String doctorName;
  final String category;
  final String aboutDoctor;
  final int experiance;
  final int petientsCount;
  final String image;

  OurDoctor(
      {required this.aboutDoctor,
      required this.category,
      required this.image,
      required this.doctorName,
      required this.experiance,
      required this.petientsCount,
      required this.id});

  static Map<String, dynamic> toJson(
      {required String aboutDoctor,
      required String category,
      required String doctorName,
      required int experiance,
      required String id,
      required int petientsCount,
      required String image}) {
    return {
      'id': id,
      'DotorName': doctorName,
      'Category': category,
      'AboutDoctor': aboutDoctor,
      'Experiance': experiance,
      'PetientsCount': petientsCount,
      'image': image
    };
  }

  static OurDoctor fromJson(Map<String, dynamic> json) {
    return OurDoctor(
      id: json['id'],
      aboutDoctor: json['AboutDoctor'],
      category: json['Category'],
      image: json['image'],
      doctorName: json['DotorName'],
      experiance: json['Experiance'],
      petientsCount: json['PetientsCount'],
    );
  }
}

// class Categoreis {
//   final String categoryname;

//   Categoreis({
//     required this.categoryname,
//   });

//   static Map<String, dynamic> toJson({
//     required String categoryname,
//   }) {
//     return {'categoryname': categoryname};
//   }

//   static Categoreis fromJson(Map<String, dynamic> json) {
//     return Categoreis(categoryname: json['categoryname']);
//   }
//}
