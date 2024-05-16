// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class UpdatePass extends StatefulWidget {
//   const UpdatePass({super.key});

//   @override
//   State<UpdatePass> createState() => _UpdatePassState();
// }

// class _UpdatePassState extends State<UpdatePass> {
//   TextEditingController user = TextEditingController();
//   TextEditingController pass = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: Colors.black,
//         width: double.infinity,
//         height: double.infinity,
//         child: Column(
//           children: [
//             Text(
//               'create password',
//               style: GoogleFonts.lato(
//                 textStyle: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             TextFormField(
//               controller: user,
//               style: TextStyle(color: Colors.white),
//               decoration: InputDecoration(
//                 labelText: 'USERNAME',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(33),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             TextFormField(
//                 // obscureText: obs,
//                 controller: pass,
//                 style: TextStyle(color: Colors.white),
//                 decoration: InputDecoration(
//                   labelText: 'Password',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(33),
//                   ),
//                   // suffixIcon: IconButton(
//                   //     icon: Icon(
//                   //       obs ? Icons.visibility_off : Icons.visibility,
//                   //       color: Colors.grey,
//                   //     ),
//                   //     onPressed: () {
//                   //       setState(() {
//                   //         obs = !obs;
//                   //       });
//                   //     }),
//                 )),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:fit_flow/model/accountdata.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdatePass extends StatefulWidget {
  const UpdatePass({Key? key}) : super(key: key);

  @override
  State<UpdatePass> createState() => _UpdatePassState();
}

class _UpdatePassState extends State<UpdatePass> {
  bool obscure = true;
  bool obs = true;
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController confirmpass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Create Password',
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
                    controller: user,
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
                    obscureText: obscure,
                    controller: pass,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        labelText: 'NewPassword',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(33),
                        ),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                obscure = !obscure;
                              });
                            },
                            icon: Icon(obscure
                                ? Icons.visibility_off
                                : Icons.visibility))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: obs,
                    controller: confirmpass,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        labelText: 'ConfirmPassword',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(33),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obs = !obs;
                            });
                          },
                          icon: Icon(
                            obs ? Icons.visibility_off : Icons.visibility,
                            color: Colors.grey,
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Color.fromRGBO(230, 238, 5, 1))),
                    onPressed: () {
                      updatePassword();
                    },
                    child: Text(
                      'Update Password',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updatePassword() async {
    String name = user.text;
    String pasw = pass.text;
    String confirm = confirmpass.text;
    bool upadate = await AccountDatabase().updatePassword(name, pasw);
    if (pasw != confirm) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Passwords Do Not Match'),
            content:
                Text('The new password and confirm password do not match.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    if (!upadate) {
      showDialog(
          context: context,
          builder: (BuildContext) {
            return AlertDialog(
              title: Text('UsernotFound'),
              content: Text('The username provided was not found'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'))
              ],
            );
          });
    } else {
      Navigator.of(context).pop();
    }
  }
}
