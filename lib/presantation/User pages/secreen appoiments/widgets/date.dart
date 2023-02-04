import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../Domain/models/appoiment_modal.dart';
import '../../../../core/colors/colors.dart';

class Date extends StatelessWidget {
  const Date({
    required this.data,
    required this.index,
    Key? key,
  }) : super(key: key);
  final List<Appoinmentmodal> data;
  final int index;

  @override
  Widget build(BuildContext context) {
    final datefilter = datefilterd(date: data[index].date);

    return Container(
      padding: const EdgeInsets.only(left: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Date',
            style: TextStyle(fontSize: 15, color: mGrey),
          ),
          Text(
            datefilter,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

datefilterd({required String date}) {
  DateTime parseDate = DateFormat("yyyy-MM-dd").parse(date);

  final newdate = '${parseDate.day}-${parseDate.month}-${parseDate.year}';
  log(newdate);

  return newdate;
}
