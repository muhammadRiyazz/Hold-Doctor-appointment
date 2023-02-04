import 'dart:developer';
import 'dart:io';

import 'package:appoiment_docter/Domain/firebase%20functions/doctor/read%20from%20firebase/read_popular_doctor.dart';
import 'package:appoiment_docter/Domain/models/doctor_modal.dart';
import 'package:appoiment_docter/core/colors/colors.dart';
import 'package:appoiment_docter/core/constands.dart';
import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../../screen aboutdocter/screen_about_docter.dart';
import '../../screen time and date/screen_time_date.dart';

class Docters extends StatelessWidget {
  const Docters({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mysize = MediaQuery.of(context).size;

    return StreamBuilder(
        stream: readdata(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('something went wrong'),
            );
          } else if (snapshot.hasData) {
            final dctrlist = snapshot.data;
            return Dctrlist(
              mysize: mysize,
              dctrlist: dctrlist!,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}

class Dctrlist extends StatelessWidget {
  const Dctrlist({Key? key, required this.mysize, required this.dctrlist})
      : super(key: key);

  final Size mysize;
  final List<PopularDoctor> dctrlist;

  @override
  Widget build(BuildContext context) {
    // log(dctrlist[1].image);
    return Expanded(
        child: ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        log(dctrlist.length.toString());
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return AdoutDocter(
                    pagekey: 'popular doctors',
                    indexdoctor: index,
                  );
                },
              ));
            },
            child: SimpleShadow(
              opacity: 0.6, // Default: 0.5
              color: mgreyb, // Default: Black
              offset: const Offset(
                5,
                6,
              ), // Default: Offset(2, 2)
              sigma: 7,
              child: Container(
                padding: const EdgeInsets.all(7),
                decoration: const BoxDecoration(
                  borderRadius: radius15,
                  color: mWhite,
                ),
                height: mysize.height * 0.16,
                child: Row(children: [
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: radius10,
                        // color: mgreya,
                      ),
                      child: ClipRRect(
                        borderRadius: radius20,
                        child: Image.network(
                          dctrlist[index].image,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Doctertxt(data: dctrlist, index: index),
                      ClickButton(dctrlist: dctrlist, index: index),
                      const Spacer(),
                    ],
                  )
                ]),
              ),
            ),
          ),
        );
      },
      itemCount: dctrlist.length,
    )
        // child: ListView.separated(
        //     scrollDirection: Axis.horizontal,
        //     itemBuilder: (context, index) {
        //       return SimpleShadow(
        //         opacity: 0.6, // Default: 0.5
        //         color: mgreya, // Default: Black
        //         offset: const Offset(
        //           5,
        //           5,
        //         ), // Default: Offset(2, 2)
        //         sigma: 7,
        //         child: InkWell(
        //           onTap: () {
        //             Navigator.push(context, MaterialPageRoute(
        //               builder: (context) {
        //                 return AdoutDocter(
        //                   indexdoctor: index,
        //                   pagekey: 'popular doctors',
        //                 );
        //               },
        //             ));
        //           },
        //           child: Padding(
        //             padding: const EdgeInsets.symmetric(vertical: 20),
        //             child: Container(
        //               decoration: const BoxDecoration(
        //                   color: mWhite, borderRadius: radius10),
        //               width: mysize.width * 0.46,
        //               padding: const EdgeInsets.all(5),
        //               child: Column(
        //                 children: [
        //                   Container(
        //                     height: mysize.height * 0.1,
        //                     width: double.infinity,
        //                     decoration: const BoxDecoration(
        //                         // color: cmain,
        //                         borderRadius: radius10),
        //                     child: ClipRRect(
        //                       borderRadius: radius20,
        //                       child: Image.network(
        //                         dctrlist[index].image,
        //                         fit: BoxFit.cover,
        //                       ),
        //                     ),
        //                   ),
        //                   hsizedbox10,
        //                   Text(
        //                     "Dr.${dctrlist[index].doctorName.toUpperCase()} MBBS ",
        //                     style: const TextStyle(
        //                         fontSize: 16, fontWeight: FontWeight.bold),
        //                   ),
        //                   hsizedbox2,
        //                   Text(
        //                     dctrlist[index].category,
        //                     style: const TextStyle(
        //                         fontSize: 14,
        //                         fontWeight: FontWeight.w500,
        //                         color: mGrey),
        //                   ),
        //                   hsizedbox5,
        //                   TextButton(
        //                     onPressed: () {
        //                       Navigator.push(context, MaterialPageRoute(
        //                         builder: (context) {
        //                           return const ScreenDateTime();
        //                         },
        //                       ));
        //                     },
        //                     child: Container(
        //                       decoration: const BoxDecoration(
        //                           color: cmain, borderRadius: radius5),
        //                       padding: const EdgeInsets.symmetric(
        //                           horizontal: 35, vertical: 10),
        //                       child: const Text(
        //                         'Appoment',
        //                         style: TextStyle(color: mWhite),
        //                       ),
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //           ),
        //         ),
        //       );
        //     },
        //     separatorBuilder: (context, index) {
        //       return const SizedBox(
        //         width: 15,
        //       );
        //     },
        //     itemCount: dctrlist.length),
        );
  }
}

class Doctertxt extends StatelessWidget {
  const Doctertxt({Key? key, required this.data, required this.index})
      : super(key: key);
  final List<PopularDoctor> data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data[index].doctorName.toUpperCase(),
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
          Text(
            data[index].category,
            style: const TextStyle(fontSize: 15, color: mGreyc),
          ),
        ],
      ),
    );
  }
}

class ClickButton extends StatelessWidget {
  const ClickButton({Key? key, required this.dctrlist, required this.index})
      : super(key: key);
  final List<PopularDoctor> dctrlist;
  final int index;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return ScreenDateTime(
              pagekey: 'add Appoinment',
              image: dctrlist[index].image,
              category: dctrlist[index].category,
              doctorname: dctrlist[index].doctorName,
              id: dctrlist[index].id.toString(),
            );
          },
        ));
      },
      child: Container(
        decoration: const BoxDecoration(color: cmain, borderRadius: radius5),
        padding: const EdgeInsets.symmetric(horizontal: 75, vertical: 10),
        child: const Text(
          'Appoiment',
          style: TextStyle(color: mWhite),
        ),
      ),
    );
  }
}
