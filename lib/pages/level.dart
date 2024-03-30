import 'package:fit_flow/pages/bodypart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Level extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Levels();
  }
}

class Levels extends State<Level> {
  List<Color> colors = [
    Color.fromARGB(255, 40, 38, 122),
    const Color.fromARGB(255, 58, 21, 115),
    const Color.fromARGB(255, 13, 5, 26),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomLeft,
              colors: colors,
            )),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 1.5,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(43),
                  bottomRight: Radius.circular(43)),
              image: DecorationImage(
                  image: AssetImage(
                    "images/img2.png",
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                color: Colors.transparent,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                child: Column(
                  children: [
                    Expanded(
                        child: ListView.builder(
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.all(8),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Bodypart()));
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
          )
        ],
      ),
    );
  }
}
