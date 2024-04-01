import 'package:flutter/material.dart';
import 'package:fit_flow/pages/level.dart';

class SignInPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return signin();
  }
}

class signin extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Phonenumber',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(height: 30),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'OTP',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Level()),
            );
          },
          child: Text('Sign Up'),
        ),
      ],
    );
  }
}
