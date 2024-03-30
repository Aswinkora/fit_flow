import 'package:fit_flow/pages/signinpage.dart';
import 'package:fit_flow/pages/signuppage.dart';
import 'package:flutter/material.dart';

class SignPage extends StatefulWidget {
  const SignPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return Signin();
  }
}

class Signin extends State<SignPage> {
  bool sign = true;
  void togglesignin() {
    setState(() {
      sign = true;
    });
  }

  void signup() {
    setState(() {
      sign = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "images/img.png",
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 400),
            child: Center(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(33),
                        topLeft: Radius.circular(43)),
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 11, 4, 21),
                      Color.fromARGB(
                        255,
                        31,
                        21,
                        65,
                      ),
                      Color.fromARGB(
                        255,
                        8,
                        2,
                        16,
                      )
                    ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: togglesignin,
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                    fontSize: 30,
                                    color: sign ? Colors.white : Colors.black),
                              ),
                            ),
                            GestureDetector(
                              onTap: signup,
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                    fontSize: 30,
                                    color: sign ? Colors.black : Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 360,
                      width: 390,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromARGB(
                                255,
                                13,
                                13,
                                14,
                              ),
                              Color.fromARGB(255, 44, 43, 139)
                            ]),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(33),
                            topRight: Radius.circular(33)),
                      ),
                      child: SingleChildScrollView(
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: sign ? SignInPage() : SignUpPage()),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
