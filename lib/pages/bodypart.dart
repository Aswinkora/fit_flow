import 'dart:convert';

import 'package:fit_flow/pages/execises.dart';
import 'package:fit_flow/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
          Uri.parse('https://exercisedb.p.rapidapi.com/exercises/bodyPartList'),
          headers: {
            'X-RapidAPI-Key':
                'bd64e37889mshecda8d104ec0aacp1ef063jsnab833a25e317',
            'X-RapidAPI-Host': 'exercisedb.p.rapidapi.com'
          });
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        setState(() {
          Muscles = List<String>.from(data);
        });
      } else {
        print('Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        elevation: 0.0,
        actions: [
          Builder(builder: (context) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                icon: Icon(
                  Icons.person_2,
                  color: Colors.white,
                  size: 30,
                ));
          })
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "images/img.png",
                    ),
                    fit: BoxFit.cover),
                color: Colors.black),
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
                                            builder: (context) => Exercise(
                                                  selectedMuscle:
                                                      Muscles[index],
                                                )));
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
                                      child: Text(
                                        Muscles[index],
                                        style: GoogleFonts.aBeeZee(
                                          textStyle: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ));
                          }))
                ],
              )),
        ],
      ),
      endDrawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          child: Profile(),
        ),
      ),
    );
    // );
  }
}
