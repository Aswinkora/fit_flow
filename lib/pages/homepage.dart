import 'package:fit_flow/pages/sign.dart';
// import 'package:fit_flow/pages/signinpage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Home();
  }
}

class Home extends State<HomePage> {
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
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(33),
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 12, 14, 49),
                      Color.fromARGB(255, 61, 57, 67)
                      // Color.fromARGB(255, 11, 4, 21),
                      // Color.fromARGB(
                      //   255,
                      //   31,
                      //   21,
                      //   65,
                      // ),
                      // Color.fromARGB(
                      //   255,
                      //   8,
                      //   2,
                      //   16,
                      // )
                    ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: TextButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                            Colors.black,
                          )),
                          onPressed: () {},
                          child: Text('LOGIN')),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: TextButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                              Colors.black,
                            )),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignPage()));
                            },
                            child: Text('Sign up')))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
