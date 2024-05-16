// import 'package:fit_flow/model/accountdata.dart';
// import 'package:fit_flow/pages/bodypart.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class Login extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return LoginScreen();
//   }
// }

// class LoginScreen extends State<Login> {
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//               height: double.infinity,
//               width: double.infinity,
//               decoration: const BoxDecoration(
//                   gradient: LinearGradient(colors: [
//                 Color.fromARGB(255, 11, 4, 21),
//                 Color.fromARGB(
//                   255,
//                   31,
//                   21,
//                   65,
//                 ),
//                 Color.fromARGB(
//                   255,
//                   8,
//                   2,
//                   16,
//                 )
//               ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
//               child: Center(
//                   child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Container(
//                         height: screenHeight / 2,
//                         width: screenWidth,
//                         decoration: BoxDecoration(
//                           gradient: LinearGradient(
//                               begin: Alignment.topLeft,
//                               end: Alignment.bottomRight,
//                               colors: [
//                                 Color.fromARGB(
//                                   255,
//                                   13,
//                                   13,
//                                   14,
//                                 ),
//                                 Color.fromARGB(255, 44, 43, 139)
//                               ]),
//                           borderRadius: BorderRadius.all(Radius.circular(33)),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Column(
//                             children: [
//                               Text(
//                                 'LOGIN',
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 20),
//                               ),
//                               SizedBox(
//                                 height: 20,
//                               ),
//                               TextFormField(
//                                 controller: _usernameController,
//                                 style: TextStyle(color: Colors.white),
//                                 decoration: InputDecoration(
//                                   labelText: 'USERNAME',
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 20),
//                               TextFormField(
//                                 controller: _passwordController,
//                                 style: TextStyle(color: Colors.white),
//                                 decoration: InputDecoration(
//                                   labelText: 'Password',
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               ElevatedButton(
//                                   onPressed: () {
//                                     login();
//                                   },
//                                   child: Text('LOGIN'))
//                             ],
//                           ),
//                         ),
//                       ))))
//         ],
//       ),
//     );
//   }

//   void login() async {
//     String username = _usernameController.text;
//     String password = _passwordController.text;

//     AccountDatabase db = AccountDatabase();
//     AccountModel? user = await db.getDataByUsername(username);

//     if (user != null && user.password == password) {
//       log();
//     } else {
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text('Error'),
//             content: Text('Invalid username or Password'),
//             actions: [
//               TextButton(
//                 onPressed: () => Navigator.of(context).pop(),
//                 child: Text('Ok'),
//               )
//             ],
//           );
//         },
//       );
//     }
//   }

//   void log() async {
//     Navigator.pushReplacement(
//         context, MaterialPageRoute(builder: (context) => Bodypart()));

//     SharedPreferences pref = await SharedPreferences.getInstance();
//     await pref.setString('username', _usernameController.text);
//     await pref.setString('password', _passwordController.text);
//   }
// }
// ....................................................................

import 'package:fit_flow/model/accountdata.dart';
import 'package:fit_flow/pages/bodypart.dart';
import 'package:fit_flow/pages/update.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreen();
  }
}

class LoginScreen extends State<Login> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool obs = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'LOGIN',
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _usernameController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'USERNAME',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(33),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
                obscureText: obs,
                controller: _passwordController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(33),
                  ),
                  suffixIcon: IconButton(
                      icon: Icon(
                        obs ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          obs = !obs;
                        });
                      }),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => UpdatePass()));
                  },
                  child: Text(
                    'ForgotPassword',
                    style: TextStyle(color: Color.fromARGB(255, 177, 240, 5)),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromRGBO(230, 238, 5, 1))),
                  onPressed: () {
                    login();
                  },
                  child: Text(
                    'LOGIN',
                    style: GoogleFonts.aBeeZee(
                      textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  )),
            )
          ]),
        ),
      ),
    );
  }

  void login() async {
    String username = _usernameController.text;
    String password = _passwordController.text;

    AccountDatabase db = AccountDatabase();
    AccountModel? user = await db.getDataByUsername(username);

    if (user != null && user.password == password) {
      log();
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Invalid username or Password'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Ok'),
              )
            ],
          );
        },
      );
    }
  }

  void log() async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Bodypart()));

    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('username', _usernameController.text);
    await pref.setString('password', _passwordController.text);
  }
}
