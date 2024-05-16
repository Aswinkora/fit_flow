import 'package:fit_flow/model/model.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  final Datamodel workoutdetails;
  Details({required this.workoutdetails});

  @override
  State<StatefulWidget> createState() {
    return Instructions();
  }
}

class Instructions extends State<Details> {
  double _sheetPosition = 0.0;
  double _gifSizeFactor = 10.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(),
            child: Image.network(
              widget.workoutdetails.gifUrl ?? '',
              height: 300 * _gifSizeFactor,
              width: 300 * _gifSizeFactor,
            ),
          ),
          GestureDetector(
            onVerticalDragUpdate: (details) {
              setState(() {
                _sheetPosition -= details.primaryDelta!;
                _gifSizeFactor =
                    1.0 - (_sheetPosition / MediaQuery.of(context).size.height);
                if (_gifSizeFactor < 0.5) {
                  _gifSizeFactor = 0.5;
                } else if (_gifSizeFactor > 1.0) {
                  _gifSizeFactor = 1.0;
                }
              });
            },
            child: DraggableScrollableSheet(
              initialChildSize: 0.1,
              minChildSize: 0.1,
              maxChildSize: 0.9,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: Color.fromRGBO(21, 22, 15, 0.812)),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(33),
                      topRight: Radius.circular(33),
                    ),
                    color: Colors.black,
                  ),
                  child: ListView(
                    controller: scrollController,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: RichText(
                              text: TextSpan(
                                text: 'Name: ',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                                children: [
                                  TextSpan(
                                    text: '${widget.workoutdetails.name}',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 84, 113, 239)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: RichText(
                              text: TextSpan(
                                text: 'Equipment: ',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                                children: [
                                  TextSpan(
                                    text: '${widget.workoutdetails.equipment}',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 84, 113, 239)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: RichText(
                              text: TextSpan(
                                text: 'Target: ',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                                children: [
                                  TextSpan(
                                    text: '${widget.workoutdetails.target}',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 84, 113, 239)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: RichText(
                              text: TextSpan(
                                text: 'SecondaryMuscle: ',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                                children: [
                                  TextSpan(
                                    text:
                                        '${widget.workoutdetails.secondaryMuscles}',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 84, 113, 239)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: RichText(
                              text: TextSpan(
                                text: 'Explanation: ',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                                children: [
                                  TextSpan(
                                    text:
                                        '${widget.workoutdetails.instructions}',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 84, 113, 239)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
