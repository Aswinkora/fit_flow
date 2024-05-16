
import 'package:fit_flow/model/accountdata.dart';
import 'package:fit_flow/pages/bodypart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Account extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AccountPage();
  }
}

class AccountPage extends State<Account> {
  bool obs = true;
  TextEditingController namecntrl = TextEditingController();
  TextEditingController agecntrl = TextEditingController();
  TextEditingController weightcntrl = TextEditingController();
  TextEditingController usernamecntrl = TextEditingController();
  TextEditingController passwordcntrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 11, 4, 21),
            Color.fromARGB(
              255,
              31,
              21,
              65,
            ),
            Color.fromARGB(
              255,
              8,
              2,
              16,
            )
          ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: screenHeight,
              width: screenWidth,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(33)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [
                    Column(
                      children: [
                        Text("CREATE ACCOUT",
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: namevalidate,
                          controller: namecntrl,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              labelText: 'Name',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: agevalidate,
                          controller: agecntrl,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              labelText: 'Age',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          // validator: weightvalidate,
                          controller: weightcntrl,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              labelText: 'Weight',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          // validator: uservalidate,
                          controller: usernamecntrl,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'USERNAME',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          obscureText: obs,
                          maxLength: 6,
                          // validator: passvalidate,
                          controller: passwordcntrl,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            counterText: '',
                            labelText: 'Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
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
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Color.fromRGBO(230, 238, 5, 1))),
                            onPressed: () {
                              createaccount();
                            },
                            child: Text(
                              'Create Account',
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )),
        )
      ],
    ));
  }

  void createaccount() async {
    if (namecntrl.text.isEmpty ||
        passwordcntrl.text.isEmpty ||
        agecntrl.text.isEmpty ||
        weightcntrl.text.isEmpty ||
        usernamecntrl.text.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error message'),
            content: Text('All fields are required'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Ok'),
              ),
            ],
          );
        },
      );
    } else if (namevalidate(namecntrl.text) != null ||
        agevalidate(agecntrl.text) != null) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('ERROR!'),
          );
        },
      );
    } else {
      final available =
          await AccountDatabase().isUserAvailable(usernamecntrl.text);
      if (!available) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Username already exists'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );
      } else {
        String Name = namecntrl.text;
        int weigh = int.parse(weightcntrl.text.toString());
        int Age = int.parse(agecntrl.text.toString());
        String user = usernamecntrl.text;
        dynamic pass = passwordcntrl.text;

        AccountModel newAccount = AccountModel(
          name: Name,
          age: Age,
          username: user,
          password: pass,
          weight: weigh,
        );
        AccountDatabase().senddata(newAccount);

        SharedPreferences preferences = await SharedPreferences.getInstance();
        await preferences.setString('username', user);
        await preferences.setString('password', pass);

        // Clear text fields before navigating
        clear();

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Bodypart()),
        );
      }
    }
  }

  String? namevalidate(value) {
    if (value.isEmpty) {
      return null;
    }
    if (value.contains(RegExp(r'[0-9]'))) {
      return 'Name cannot contain numbers';
    }
    return null;
  }

  String? agevalidate(value) {
    if (value.isEmpty) {
      return null;
    }
    if (value.length > 2) {
      return 'invalid';
    }
    return null;
  }

  void clear() {
    namecntrl.clear();
    passwordcntrl.clear();
    weightcntrl.clear();
    agecntrl.clear();
    usernamecntrl.clear();
  }
}
