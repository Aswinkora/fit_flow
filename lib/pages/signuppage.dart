import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return signup();
  }
}

class signup extends State<SignUpPage> {
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
          onPressed: () {},
          child: Text('Sign In'),
        ),
      ],
    );
  }
}
