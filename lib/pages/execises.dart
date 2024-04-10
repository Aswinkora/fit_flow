import 'package:flutter/material.dart';

class Exercise extends StatefulWidget {



  @override
  State<StatefulWidget> createState() {
    return ExerciseList();
  }
}

class ExerciseList extends State<Exercise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.54,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "images/img3.png",
                ),
                fit: BoxFit.cover),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 300),
          child: Center(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 12, 14, 49),
                    Color.fromARGB(255, 61, 57, 67)
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(33),
                      topLeft: Radius.circular(43))),
              child: Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 14, horizontal: 8),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(33),
                                    gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          const Color.fromRGBO(4, 4, 4, 1),
                                          const Color.fromRGBO(96, 95, 116, 1),
                                        ])),
                                height: 120,
                              ),
                            );
                          }))
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
