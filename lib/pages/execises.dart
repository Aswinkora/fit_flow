// import 'dart:convert';

// import 'package:fit_flow/pages/details.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class Exercise extends StatefulWidget {
//   final String selectedMuscle;

//   Exercise({required this.selectedMuscle});

//   @override
//   State<StatefulWidget> createState() {
//     return ExerciseState();
//   }
// }

// class ExerciseState extends State<Exercise> {
//   List<dynamic> exercises = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchExercises();
//   }

//   Future<void> fetchExercises() async {
//     try {
//       final response = await http.get(
//           Uri.parse('https://work-out-api1.p.rapidapi.com/search'),
//           headers: {
//             'X-RapidAPI-Key':
//                 'bd64e37889mshecda8d104ec0aacp1ef063jsnab833a25e317',
//             'X-RapidAPI-Host': 'work-out-api1.p.rapidapi.com'
//           });
//       if (response.statusCode == 200) {
//         final List<dynamic> data = jsonDecode(response.body);
//         final List<dynamic> filteredExercises = data
//             .where((exercise) =>
//                 exercise['Muscles'].toString() == widget.selectedMuscle)
//             .toList();
//         setState(() {
//           exercises = filteredExercises;
//         });
//       } else {
//         print('Failed to fetch data.Status code :${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error fetching data :$e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             height: MediaQuery.of(context).size.height * 0.54,
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage(
//                     "images/img3.png",
//                   ),
//                   fit: BoxFit.cover),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 300),
//             child: Center(
//               child: Container(
//                 height: double.infinity,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                     gradient: LinearGradient(colors: [
//                       Color.fromARGB(255, 12, 14, 49),
//                       Color.fromARGB(255, 61, 57, 67)
//                     ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
//                     borderRadius: BorderRadius.only(
//                         topRight: Radius.circular(33),
//                         topLeft: Radius.circular(43))),
//                 child: Column(
//                   children: [
//                     Expanded(
//                       child: ListView.builder(
//                         itemCount: exercises.length,
//                         itemBuilder: (context, index) {
//                           return Padding(
//                             padding: EdgeInsets.symmetric(
//                                 vertical: 14, horizontal: 8),
//                             child: GestureDetector(
//                               onTap: () {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) => details(workoutdetails:exercises[index])));
//                               },
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(33),
//                                     gradient: LinearGradient(
//                                         begin: Alignment.centerLeft,
//                                         end: Alignment.centerRight,
//                                         colors: [
//                                           const Color.fromRGBO(4, 4, 4, 1),
//                                           const Color.fromRGBO(96, 95, 116, 1),
//                                         ])),
//                                 height: 120,
//                                 child: Center(
//                                   child: ListTile(
//                                     title: Text(
//                                       exercises[index]['WorkOut'],
//                                       style: TextStyle(
//                                           color: Colors.white, fontSize: 20),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// import 'dart:convert';

// import 'package:fit_flow/pages/details.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class Exercise extends StatefulWidget {
//   final String selectedMuscle;

//   Exercise({required this.selectedMuscle});

//   @override
//   State<StatefulWidget> createState() {
//     return ExerciseState();
//   }
// }

// class ExerciseState extends State<Exercise> {
//   List<dynamic> exercises = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchExercises();
//   }

//   Future<void> fetchExercises() async {
//     try {
//       final response = await http.get(
//           Uri.parse('https://work-out-api1.p.rapidapi.com/search'),
//           headers: {
//             'X-RapidAPI-Key':
//                 'bd64e37889mshecda8d104ec0aacp1ef063jsnab833a25e317',
//             'X-RapidAPI-Host': 'work-out-api1.p.rapidapi.com'
//           });
//       if (response.statusCode == 200) {
//         final List<dynamic> data = jsonDecode(response.body);
//         final List<dynamic> filteredExercises = data
//             .where((exercise) =>
//                 exercise['Muscles'].toString() == widget.selectedMuscle)
//             .toList();
//         setState(() {
//           exercises = filteredExercises;
//         });
//       } else {
//         print('Failed to fetch data.Status code :${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error fetching data :$e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             height: MediaQuery.of(context).size.height * 0.54,
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage(
//                     "images/img3.png",
//                   ),
//                   fit: BoxFit.cover),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 300),
//             child: Center(
//               child: Container(
//                 height: double.infinity,
//                 width: double.infinity,
//                 decoration: BoxDecoration(color: Colors.black),
//                 child: Column(
//                   children: [
//                     Expanded(
//                       child: ListView.builder(
//                         itemCount: exercises.length,
//                         itemBuilder: (context, index) {
//                           return Padding(
//                             padding: EdgeInsets.symmetric(
//                                 vertical: 14, horizontal: 8),
//                             child: GestureDetector(
//                               onTap: () {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) => details(
//                                             workoutdetails: exercises[index])));
//                               },
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                     border: Border.all(
//                                         color: Color.fromRGBO(
//                                             197, 237, 18, 0.814)),
//                                     borderRadius: BorderRadius.circular(33),
//                                     color: Colors.transparent),
//                                 height: 120,
//                                 child: Center(
//                                   child: ListTile(
//                                     title: Text(
//                                       exercises[index]['WorkOut'],
//                                       style: TextStyle(
//                                           color: Colors.white, fontSize: 20),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// ................................................................

import 'dart:convert';

import 'package:fit_flow/model/model.dart';
import 'package:fit_flow/pages/details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Exercise extends StatefulWidget {
  final String selectedMuscle;

  Exercise({required this.selectedMuscle});

  @override
  State<StatefulWidget> createState() {
    return ExerciseState();
  }
}

class ExerciseState extends State<Exercise> {
  List<Datamodel> exercises = [];

  @override
  void initState() {
    super.initState();
    fetchExercises();
  }

  Future<void> fetchExercises() async {
    try {
      final response = await http.get(
          Uri.parse(
              'https://exercisedb.p.rapidapi.com/exercises/bodyPart/${widget.selectedMuscle}'),
          headers: {
            'X-RapidAPI-Key':
                'bd64e37889mshecda8d104ec0aacp1ef063jsnab833a25e317',
            'X-RapidAPI-Host': 'exercisedb.p.rapidapi.com'
          });
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        final List<Datamodel> filteredExercises = data.map((json) {
          if (json is Map<String, dynamic> && json.containsKey('index')) {
            json['index'] = json['index'].toString();
          }
          return Datamodel.fromJson(json);
        }).toList();
        setState(() {
          exercises = filteredExercises;
        });
      } else {
        print('Failed to fetch data.Status code :${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data :$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
                decoration: BoxDecoration(color: Colors.black),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: exercises.length,
                        itemBuilder: (context, index) {
                          final exercise = exercises[index];
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 14, horizontal: 8),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Details(
                                            workoutdetails: exercises[index])));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Color.fromRGBO(
                                            197, 237, 18, 0.814)),
                                    borderRadius: BorderRadius.circular(33),
                                    color: Colors.transparent),
                                height: 120,
                                child: Center(
                                  child: ListTile(
                                    title: Text(
                                      exercise.name ?? '',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
