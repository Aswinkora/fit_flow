

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_flow/pages/bodypart.dart';
import 'package:fit_flow/pages/createaccount.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class SignInPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SigninState();
  }
}

class SigninState extends State<SignInPage> {
  final auth = FirebaseAuth.instance;
  String _verificationId = '';
  TextEditingController phn = TextEditingController();
  final otpcntrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          TextFormField(
            keyboardType: TextInputType.phone,
            style: TextStyle(color: Colors.white),
            maxLength: 10,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: phonevalidation,
            controller: phn,
            decoration: InputDecoration(
              prefixText: '+91',
              prefixStyle: TextStyle(color: Colors.white),
              counterText: '',
              labelText: 'Phonenumber',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Color.fromRGBO(230, 238, 5, 1)),
            ),
            onPressed: () async {
              String phoneNum = '+91${phn.text.trim()}';
              final isValid = phonevalidation(phoneNum) == null;
              if (isValid) {
                try {
                  await auth.verifyPhoneNumber(
                    phoneNumber: phoneNum,
                    verificationCompleted: (PhoneAuthCredential) async {
                      await auth.signInWithCredential(PhoneAuthCredential);
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => Bodypart()),
                        (Route<dynamic> route) => false
                      );
                    },
                    verificationFailed: (FirebaseAuthException e) {
                      if (e.code == 'Invalide-phone number') {
                        print('Number is invalid');
                      } else {
                        print('verification failed:${e.code}');
                      }
                    },
                    codeSent: (verificationId, resendtoken) async {
                      _verificationId = verificationId;
                      setState(() {});
                      // Show dialog to enter OTP
                      await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: Colors.black,
                            title: Text(
                              'Enter OTP',
                              style: TextStyle(color: Colors.white),
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Pinput(
                                  defaultPinTheme: PinTheme(
                                    height: 50,
                                    width: 50,
                                    textStyle: TextStyle(color: Colors.white),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  controller: otpcntrl,
                                  length: 6,
                                  autofocus: true,
                                ),
                              ],
                            ),
                            actions: <Widget>[
                              ElevatedButton(
                                onPressed: () async {
                                  String enteredOtp = otpcntrl.text.trim();
                                  if (enteredOtp.isNotEmpty) {
                                    try {
                                      final credential =
                                          PhoneAuthProvider.credential(
                                        verificationId: _verificationId,
                                        smsCode: enteredOtp,
                                      );
                                      await auth
                                          .signInWithCredential(credential);
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Account()),
                                      );
                                    } catch (e) {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text('Error'),
                                            content: Text(
                                                'Invalid OTP, please try again.'),
                                          );
                                        },
                                      );
                                    }
                                  }
                                },
                                child: Text('Verify'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {
                      _verificationId = verificationId;
                    },
                  );
                } catch (e) {
                  print('Error sending Otp :$e');
                }
              } else {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text('Please enter the phonenumber'),
                    );
                  },
                );
              }
            },
            child: Text(
              'Send OTP',
              style: GoogleFonts.aBeeZee(
                textStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String? phonevalidation(value) {
    if (value.length < 10) {
      return 'Enter the full number';
    }
    return null;
  }
}
