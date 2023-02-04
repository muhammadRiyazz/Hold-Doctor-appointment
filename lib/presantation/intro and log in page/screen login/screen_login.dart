import 'dart:developer';
import 'package:appoiment_docter/presantation/Adminpages/screen%20main/screen%20main.dart';
import 'package:appoiment_docter/presantation/intro%20and%20log%20in%20page/screen%20firstlog/screen_firstlog.dart';
import 'package:appoiment_docter/presantation/intro%20and%20log%20in%20page/screen%20forget/screen%20forget.dart';
import 'package:appoiment_docter/presantation/intro%20and%20log%20in%20page/screen%20splash/screen_splash.dart';
import 'package:appoiment_docter/presantation/intro%20and%20log%20in%20page/widgets/snckbar.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/colors/colors.dart';
import '../../../core/constands.dart';
import '../../User pages/screen main/screen_main.dart';
import '../screen sign up/screen_sign_up.dart';

class ScreenLogin extends StatelessWidget {
  ScreenLogin({super.key});

  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ScreenMain();
            } else {
              return SafeArea(
                  child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  key: _formkey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // const Spacer(),
                        Center(
                          child: SizedBox(
                              height: 220,
                              width: 220,
                              child: Image.asset('lib/assets/Group 36074.png')),
                        ),
                        hsizedbox15,
                        // const Spacer(
                        //   flex: 1,
                        // ),
                        const Center(
                          child: Text(
                            'Login to your Account',
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter your Email';
                              } else if (!EmailValidator.validate(value)) {
                                return "Enter a valid email address!";
                              } else {
                                return null;
                              }
                            },
                            controller: emailcontroller,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.email_outlined),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 14),
                              focusColor: mBlack,
                              border:
                                  OutlineInputBorder(borderRadius: radius15),
                              hintText: "Email",
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            obscureText: true,
                            enableSuggestions: false,
                            autocorrect: false,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Invalid password!';
                              } else {
                                return null;
                              }
                            },
                            controller: passwordcontroller,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.lock_outline_rounded),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 14),
                              focusColor: mBlack,
                              border:
                                  OutlineInputBorder(borderRadius: radius15),
                              hintText: "Password",
                            ),
                          ),
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return Screenforget();
                                },
                              ));
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text('Forget Password',
                                  style: TextStyle(color: mBlue)),
                            )),
                        const Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 7),
                        ),
                        // const Spacer(flex: 1),
                        TextButton(
                          onPressed: () async {
                            if (passwordcontroller.text == 'admin111') {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(
                                builder: (context) {
                                  return adminScreenMain();
                                },
                              ));
                            } else {
                              if (_formkey.currentState!.validate()) {
                                await signin(context);
                              }
                            }
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                                borderRadius: radius10, color: cmain),
                            width: double.infinity,
                            height: 50,
                            child: const Center(
                                child: Text(
                              'Sign In',
                              style: TextStyle(color: mWhite),
                            )),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don’t have an account?"),
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(
                                  builder: (context) {
                                    return ScreenSignUp();
                                  },
                                ));
                              },
                              child: const Text(
                                "Sign Up ",
                                style: TextStyle(color: mBlue),
                              ),
                            ),
                          ],
                        ),
                        //  const Spacer(),
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
                        // Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       Container(
                        //         padding: const EdgeInsets.all(19.0),
                        //         decoration: BoxDecoration(
                        //           border: Border.all(color: cmain),
                        //           borderRadius: radius10,
                        //           color: mWhite,
                        //         ),
                        //         height: 70,
                        //         child: Image.asset(
                        //             'lib/assets/facebook-color-icon.png'),
                        //       ),
                        //       wsizedbox20,
                        //       Container(
                        //         padding: const EdgeInsets.all(16),
                        //         decoration: BoxDecoration(
                        //           border: Border.all(color: cmain),
                        //           borderRadius: radius10,
                        //           color: mWhite,
                        //         ),
                        //         height: 70,
                        //         child: Image.asset('lib/assets/gpay.png'),
                        //       ),
                        //     ]),
                        hsizedbox20
                      ],
                    ),
                  ),
                ),
              ));
            }
          }),
    );
  }

  Future signin(context) async {
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
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: emailcontroller.text.trim(),
        password: passwordcontroller.text.trim(),
      )
          //   .onError((error, stackTrace) {
          // return showSnakbar(error.toString(), context);
          //})
          .then((value) {
        // final _sharepreferances = await SharedPreferences.getInstance();
        // final userlogin = _sharepreferances.setBool(kayname, true);

        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
          builder: (context) {
            return const AuthScreen();
          },
        ), (route) => false);
      });
    } on FirebaseAuthException catch (e) {
      log(e.message.toString());
      showSnakbar(e.message, context);

      // log(e.message.toString());
    }
  }
}
