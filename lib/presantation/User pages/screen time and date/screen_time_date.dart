import 'dart:developer';

import 'package:appoiment_docter/Domain/firebase%20functions/appoinment/edit%20appoinment/edit_appoinment.dart';
import 'package:appoiment_docter/core/constands.dart';
import 'package:appoiment_docter/presantation/User%20pages/succes%20page/succes_page.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../core/colors/colors.dart';
import '../screen patiants info/screen_patiants_info.dart';

class ScreenDateTime extends StatefulWidget {
  const ScreenDateTime(
      {super.key,
      required this.category,
      required this.image,
      required this.doctorname,
      required this.pagekey,
      required this.id});
  final String doctorname;
  final String category;
  final String image;
  final String pagekey;
  final String id;
  @override
  State<ScreenDateTime> createState() => _ScreenDateTimeState();
}

class _ScreenDateTimeState extends State<ScreenDateTime> {
  DateTime day = DateTime.now();

  List<TimeOfDay> timelist = [
 
  ];


  int currebtintex = 0;
  
  @override
  Widget build(BuildContext context) {
    final firstDay = DateTime.now();
    final lastDay = firstDay.add(const Duration(days: 7));

    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          ListTile(
            title: const Text('Make An Appoiment'),
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
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: TableCalendar(
                currentDay: day,
                daysOfWeekVisible: true,
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    day = selectedDay;
                    day = focusedDay;
                  });
                },
                firstDay: firstDay,
                lastDay: lastDay,
                focusedDay: day),
          ),

          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Time Slots',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: GridView.builder(
              physics: const ScrollPhysics(),
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 1,
                  mainAxisExtent: 65,
                  crossAxisCount: 4,
                  childAspectRatio: 2),
              itemCount: timelist.length,
              itemBuilder: (BuildContext context, int index) {

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SimpleShadow(
                    sigma: 2,
                    opacity: 0.3,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          currebtintex = index;
                        });
                      },
                      child: Container(
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: radius10,
                            color: currebtintex == index ? cmain : mWhite,
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                ' ${timelist[index].hour.toString()}:${timelist[index].minute.toString()}',
                                style: TextStyle(
                                    fontSize: 17.0,
                                    color: currebtintex == index
                                        ? mWhite
                                        : mBlack),
                              ),
                            ),
                          )),
                    ),
                  ),
                );
              },
            ),
          ),
          Button(
              pagekey: widget.pagekey,
              id: widget.id,
              image: widget.image,
              date: day,
              time: timelist[currebtintex],
              category: widget.category,
              doctorname: widget.doctorname),
          hsizedbox10
        ],
      )),
    );
  }
}

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.date,
    required this.time,
    required this.doctorname,
    required this.category,
    required this.image,
    required this.pagekey,
    required this.id,
  }) : super(key: key);
  final DateTime date;
  final TimeOfDay time;
  final String doctorname;
  final String category;
  final String image;
  final String pagekey;
  final String id;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          if (pagekey == 'add Appoinment') {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return ScreenPatiantsInfo(
                  date: date,
                  time: time,
                  category: category,
                  doctorname: doctorname,
                  image: image,
                );
              },
            ));
          } else {
            QuickAlert.show(
              context: context,
              type: QuickAlertType.confirm,
              text: 'Do you want to Reschedule',
              confirmBtnText: 'Yes',
              cancelBtnText: 'No',
              confirmBtnColor: Colors.green,
              onConfirmBtnTap: () async {
                log('message');
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return SuccesPage();
                  },
                ));
                await reschedul(date: date.toString(), time: time, id: id);
              },
            );
          }
        },
        child: Container(
          decoration: const BoxDecoration(borderRadius: radius10, color: cmain),
          width: double.infinity,
          height: 45,
          child: const Center(
              child: Text(
            'Book An Appoiment',
            style: TextStyle(color: mWhite),
          )),
        ));
  }
}
