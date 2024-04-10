import 'dart:convert';

import 'package:fit_flow/pages/execises.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Bodypart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Selectbody();
  }
}

class Selectbody extends State<Bodypart> {
  List<String> Muscles = [];
  @override
  void initState() {
    super.initState();
    fetchMuscles();
  }

  Future<void> fetchMuscles() async {
    try {
      final response = await http.get(
          Uri.parse('https://work-out-api1.p.rapidapi.com/search'),
          headers: {
            'X-RapidAPI-Key':
                'bd64e37889mshecda8d104ec0aacp1ef063jsnab833a25e317',
            'X-RapidAPI-Host': 'work-out-api1.p.rapidapi.com'
          });
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        final List<String> muscles = List<String>.from(
            data.map((exercise) => exercise['Muscles'].toString()));
        setState(() {
          Muscles = muscles.toSet().toList();
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
                          itemCount: Muscles.length,
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
                                  child: Center(
                                    child: Text(
                                      Muscles[index],
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  ),
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
