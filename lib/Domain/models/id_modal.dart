import 'package:flutter/cupertino.dart';

class IDmodal {
  final String id;

  IDmodal({
    required this.id,
  });

  static Map<String, dynamic> tojson({required String id}) {
    return {
      'id': id,
    };
  }

  static IDmodal fromJson(Map<String, dynamic> json) {
    return IDmodal(
      id: json['id'],
    );
  }
}
