import 'package:flutter/material.dart';

import '../../../../Domain/models/appoiment_modal.dart';
import '../../../../core/colors/colors.dart';

class Doctername extends StatelessWidget {
  const Doctername({
    Key? key,
    required this.data,
    required this.index,
  }) : super(key: key);
  final List<Appoinmentmodal> data;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Docter',
            style: TextStyle(fontSize: 15, color: mGrey),
          ),
          Text(
            data[index].doctername,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
