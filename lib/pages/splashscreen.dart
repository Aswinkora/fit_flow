import 'package:fit_flow/pages/bodypart.dart';
import 'package:fit_flow/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return splash();
  }
}

class splash extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late SharedPreferences preferences;
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    checklog();
  }

  Future<void> checklog() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? username = preferences.getString('username');
    String? password = preferences.getString('password');

    Future.delayed(Duration(seconds: 1), () {
      if (username != null || password != null) {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (_) => Bodypart()));
      } else {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      Color.fromARGB(
        255,
        252,
        250,
        255,
      ),
      const Color.fromARGB(
        255,
        53,
        47,
        78,
      ),
      const Color.fromARGB(
        255,
        31,
        21,
        65,
      ),
    ];
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 52, 24, 95),
                const Color.fromARGB(
                  255,
                  45,
                  36,
                  60,
                ),
                Color.fromARGB(255, 25, 13, 43),
                Color.fromARGB(255, 1, 0, 4)
              ]),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 50),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: colors)
                          .createShader(bounds);
                    },
                    child: Text(
                      'FitFloW',
                      style: TextStyle(
                        fontSize: 60.0,
                        color: Colors.white, // This color will be ignored
                        fontFamily: 'DancingScript',
                      ),
                    ),
                  ),
                ),
                Icon(
                  FontAwesomeIcons
                      .dumbbell, // Use FontAwesomeIcons for dumbbell icon
                  size: 200.0,
                  color: Color.fromARGB(
                      69, 106, 100, 124), // Orange color for the icon
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
