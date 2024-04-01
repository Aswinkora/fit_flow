import 'package:fit_flow/pages/execises.dart';
import 'package:flutter/material.dart';

class Bodypart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Selectbody();
  }
}

class Selectbody extends State<Bodypart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Color.fromARGB(
                    255,
                    55,
                    10,
                    123,
                  ),
                  Color.fromARGB(255, 34, 21, 55),
                  Color.fromARGB(255, 32, 28, 49)
                ])),
          ),
          Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 14, horizontal: 8),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Exercise()));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(33),
                                      gradient: LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [
                                            const Color.fromRGBO(4, 4, 4, 1),
                                            const Color.fromRGBO(
                                                96, 95, 116, 1),
                                          ])),
                                  height: 120,
                                ),
                              ),
                            );
                          }))
                ],
              )),
        ],
      ),
    );
  }
}
