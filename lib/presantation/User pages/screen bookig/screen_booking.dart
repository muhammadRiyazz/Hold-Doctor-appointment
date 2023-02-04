// import 'dart:developer';

// import 'package:date_time_picker_widget/date_time_picker_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:weekly_date_picker/weekly_date_picker.dart';

// import '../../core/colors/colors.dart';
// import '../../core/constands.dart';

// class ScreenBooking extends StatefulWidget {
//   const ScreenBooking({super.key});

//   @override
//   State<ScreenBooking> createState() => _ScreenBookingState();
// }

// class _ScreenBookingState extends State<ScreenBooking> {
//   @override
//   Widget build(BuildContext context) {
//     DateTime _selectedDay = DateTime.now();
//     log(_selectedDay.toString());

//     return Scaffold(
//       body: SafeArea(
//           child: Column(
//         children: [
//           const Titlepart(),
//           // Padding(
//           //   padding: const EdgeInsets.all(8.0),
//           //   child: WeeklyDatePicker(
//           //     selectedDay: _selectedDay,
//           //     changeDay: (value) {
//           //       _selectedDay = value;
//           //       log(value.toString());
//           //     },
//           //     enableWeeknumberText: false,
//           //     weeknumberColor: const Color(0xFF57AF87),
//           //     weeknumberTextColor: Color.fromARGB(255, 0, 0, 0),
//           //     backgroundColor: Color.fromARGB(255, 221, 221, 221),
//           //     weekdayTextColor: const Color(0xFF8A8A8A),
//           //     digitsColor: Color.fromARGB(255, 19, 18, 18),
//           //     selectedBackgroundColor: Color.fromARGB(255, 62, 66, 64),
//           //     weekdays: const ["Mo", "Tu", "We", "Th", "Fr", 'Sa', 'Su'],
//           //     daysInWeek: 7,
//           //   ),
//           // ),
//           dateTimePicker(context: context),

//           //Datepick
//         ],
//       )),
//     );
//   }
// }

// class Titlepart extends StatelessWidget {
//   const Titlepart({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: const Text(
//         'Book An Appoiment',
//         style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
//       ),
//       leading: InkWell(
//         onTap: () {
//           Navigator.pop(context);
//         },
//         child: Container(
//           decoration: const BoxDecoration(
//             borderRadius: radius10,
//             color: mgreya,
//           ),
//           height: 40,
//           width: 40,
//           child: const Icon(
//             size: 15,
//             Icons.arrow_back_ios_new_sharp,
//             color: Colors.black,
//           ),
//         ),
//       ),
//     );
//   }
// }

// Widget dateTimePicker({required BuildContext context}) {
//   String _d1, _d2;
//   String _t1, _t2;
//   final dt = DateTime.now();
//   return Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       // Text(
//       //   'Date & Time Picker',
//       //   textAlign: TextAlign.center,
//       //   style: Theme.of(context).textTheme.headline6,
//       // ),
//       // const SizedBox(height: 8),
//       // Text(
//       //   'Date: $dt  Time: $dt',
//       //   textAlign: TextAlign.center,
//       //   style: Theme.of(context).textTheme.bodyText2,
//       // ),
//       // const SizedBox(height: 16),
//       DateTimePicker(
//         initialSelectedDate: dt,
//         startDate: dt.subtract(const Duration(days: 1)),
//         endDate: dt.add(const Duration(days: 9)),
//         startTime: DateTime(dt.year, dt.month, dt.day, 6),
//         endTime: DateTime(dt.year, dt.month, dt.day, 7),
//         timeInterval: const Duration(minutes: 60),
//         datePickerTitle: 'Pick your preferred date',
//         timePickerTitle: 'Pick your preferred time',
//         timeOutOfRangeError: 'Sorry shop is closed now',
//         is24h: false,
//         numberOfWeeksToDisplay: 3,
//         onDateChanged: (date) {
//           log(date.toString());
//           //  _d1 = DateFormat('dd MMM, yyyy').format(date);
//           // setState(() {
//           //   _d1 = DateFormat('dd MMM, yyyy').format(date);
//           // });
//         },
//         onTimeChanged: (time) {
//           log(time.toString());
//           // _t1 = DateFormat('hh:mm:ss aa').format(time);
//           // setState(() {
//           //   _t1 = DateFormat('hh:mm:ss aa').format(time);
//           // });
//         },
//       )
//     ],
//   );
// }
