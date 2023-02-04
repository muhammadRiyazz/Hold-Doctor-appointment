import 'dart:developer';

import 'package:appoiment_docter/presantation/User%20pages/screen%20main/screen_main.dart';
import 'package:appoiment_docter/presantation/intro%20and%20log%20in%20page/widgets/snckbar.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constands.dart';

import '../screen login/screen_login.dart';
import '../screen splash/screen_splash.dart';

class ScreenSignUp extends StatelessWidget {
  ScreenSignUp({super.key});

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController conformpasswordcontroller = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formkey,
            child: SizedBox(
              height: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //  const Spacer(flex: 1),
                    Center(
                      child: SizedBox(
                          height: 220,
                          width: 220,
                          child: Image.asset('lib/assets/Group 36074.png')),
                    ),
                    // const Spacer(flex: 1),
                    const Center(
                      child: Text(
                        'Create Your account',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    hsizedbox10,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: emailcontroller,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'You must fill this field';
                          } else if (!EmailValidator.validate(value)) {
                            return "Enter valid email Id";
                          } else {
                            return null;
                          }
                        },
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email_outlined),
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 14),
                          focusColor: mBlack,
                          border: OutlineInputBorder(borderRadius: radius15),
                          hintText: "Email",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        obscureText: true,
                        //  enableSuggestions: false,
                        // autocorrect: false,
                        controller: passwordcontroller,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'You must fill this field';
                          } else if (value.length < 6) {
                            return "Password must has 6 characters";
                          } else {
                            return null;
                          }
                        },
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.lock_open_rounded),
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 14),
                          focusColor: mBlack,
                          border: OutlineInputBorder(borderRadius: radius15),
                          hintText: "Password",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        obscureText: true,
                        // enableSuggestions: false,
                        // autocorrect: false,
                        controller: conformpasswordcontroller,
                        validator: (value) {
                          //  log(value!);
                          log('frc');
                          log(passwordcontroller.text);
                          if (value == null || value.isEmpty) {
                            return 'You must fill this field';
                          } else if (value != passwordcontroller.text) {
                            return "Password not mach";
                          } else {
                            return null;
                          }
                        },
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.lock_outline_rounded),
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 14),
                          focusColor: mBlack,
                          border: OutlineInputBorder(borderRadius: radius15),
                          hintText: "Conform Password",
                        ),
                      ),
                    ),
                    hsizedbox10,
                    TextButton(
                        onPressed: () async {
                          // context.showToastySnackbar(
                          //     'asdfghjkl', 'asdfghjk', AlertType.success);
                          if (_formkey.currentState!.validate()) {
                            await signup(context);
                          }
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                              borderRadius: radius10, color: cmain),
                          width: double.infinity,
                          height: 50,
                          child: const Center(
                              child: Text(
                            'Sign up',
                            style: TextStyle(color: mWhite),
                          )),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account?"),
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(
                              builder: (context) {
                                return ScreenLogin();
                              },
                            ));
                            // Navigator.push(context, MaterialPageRoute(
                            //   builder: (context) {
                            //     return ScreenLogin();
                            //   },
                            // ));
                          },
                          child: const Text(
                            " Sign In ",
                            style: TextStyle(color: mBlue, fontSize: 16.1),
                          ),
                        ),
                      ],
                    ),
                    //const Spacer(),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 10),
                    //   child: Row(
                    //     children: const [
                    //       Expanded(
                    //           child: Divider(
                    //         thickness: 1,
                    //       )),
                    //       Padding(
                    //         padding: EdgeInsets.all(8.0),
                    //         child: Text(
                    //           'or continue with',
                    //           style: TextStyle(
                    //               fontWeight: FontWeight.w500, fontSize: 16),
                    //         ),
                    //       ),
                    //       Expanded(
                    //           child: Divider(
                    //         thickness: 1,
                    //       )),
                    //     ],
                    //   ),
                    // ),
                    // hsizedbox10,
                    // Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    //   Container(
                    //     decoration: BoxDecoration(
                    //         border: Border.all(color: cmain),
                    //         borderRadius: radius10),
                    //     height: 70,
                    //     child: Padding(
                    //       padding: const EdgeInsets.all(19.0),
                    //       child: Image.asset('lib/assets/facebook-color-icon.png'),
                    //     ),
                    //   ),
                    //   wsizedbox20,
                    //   Container(
                    //     decoration: BoxDecoration(
                    //         border: Border.all(color: cmain),
                    //         borderRadius: radius10),
                    //     height: 70,
                    //     child: Padding(
                    //       padding: const EdgeInsets.all(16.0),
                    //       child: Image.asset('lib/assets/gpay.png'),
                    //     ),
                    //   ),
                    // ]),
                    hsizedbox20
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future signup(context) async {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailcontroller.text.trim(),
              password: passwordcontroller.text.trim())
          .onError((error, stackTrace) {
        Navigator.pop(context);
        return showSnakbar(error.toString(), context);
      }).then((value) {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
          builder: (context) {
            return ScreenMain();
          },
        ), (route) => false);
      });
    } on FirebaseAuthException catch (e) {
      log(e.message.toString());

      showSnakbar(e.message, context);
      Navigator.pop(context);
    }
  }
}
