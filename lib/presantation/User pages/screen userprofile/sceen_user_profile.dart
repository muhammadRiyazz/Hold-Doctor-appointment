import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constands.dart';
import '../Screen editprofile/screen_editprofile.dart';

class ScreenUserprofile extends StatelessWidget {
  const ScreenUserprofile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: const Text(
                  'Your Profile',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
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
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 70),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: radius20,
                        color: mgreya,
                      ),
                      //width: 200,
                    )),
              ),
              const Deteails(
                firsttext: 'Name',
                secondtext: 'Muhammad Riyaz',
              ),
              const Deteails(
                firsttext: 'Gender',
                secondtext: 'Male',
              ),
              const Deteails(
                firsttext: 'Age',
                secondtext: '22',
              ),
              const Deteails(
                firsttext: 'Place',
                secondtext: 'Malappuram',
              ),
              const Deteails(
                firsttext: 'Phone Number',
                secondtext: '7034612195',
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return ScreenEditprofile();
                      },
                    ));
                  },
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: radius10, color: cmain),
                    width: double.infinity,
                    height: 45,
                    child: Center(
                        child: Text(
                      'Edit Your  Profile',
                      style: TextStyle(color: mWhite),
                    )),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class Deteails extends StatelessWidget {
  const Deteails({
    required this.firsttext,
    required this.secondtext,
    Key? key,
  }) : super(key: key);
  final String firsttext;
  final String secondtext;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        firsttext,
        style: TextStyle(fontSize: 15, color: mGrey),
      ),
      subtitle: Text(
        secondtext,
        style:
            TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: mBlack),
      ),
      // crossAxisAlignment: CrossAxisAlignment.start,
      // children: [

      // ],
    );
  }
}
