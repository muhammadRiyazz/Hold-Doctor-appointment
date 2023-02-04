import 'package:appoiment_docter/presantation/Adminpages/appoinment%20info/appoinment_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constands.dart';

class ConformAppoinment extends StatelessWidget {
  const ConformAppoinment({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Conform Appoinments',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
            child: ListView.builder(
                itemBuilder: (context, index) {
                  return SimpleShadow(
                    opacity: 0.11, // Default: 0.5
                    //color: mgreya, // Default: Black
                    offset: const Offset(
                      5,
                      6,
                    ), // Default: Offset(2, 2)
                    sigma: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 13, vertical: 10),
                      child: InkWell(
                        onTap: () {
                          // Navigator.push(context, MaterialPageRoute(
                          //   builder: (context) {
                          //     return const AdmnAppoimentInfo();
                          //   },
                          // ));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            borderRadius: radius15,
                            color: cmain,
                          ),
                          height: 150,
                          child: Row(children: [
                            Expanded(
                              child: Container(
                                decoration: const BoxDecoration(
                                  borderRadius: radius10,
                                ),
                                child: Image.asset('lib/assets/docter 1.png'),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'Doctor',
                                        style: TextStyle(
                                            fontSize: 15, color: mgreyb),
                                      ),
                                      Text(
                                        'Dr.Jhony MBBS',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: mgreyb),
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'Date',
                                        style: TextStyle(
                                            fontSize: 15, color: mgreyb),
                                      ),
                                      Text(
                                        '22-12-2022',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: mgreyb),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            wsizedbox20
                          ]),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: 10)),
      ],
    );
  }
}
