import 'package:fit_flow/model/accountdata.dart';
import 'package:fit_flow/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<StatefulWidget> createState() {
    return ProfileState();
  }
}

class ProfileState extends State<Profile> {
  late String loggedInUsername;
  AccountModel? userdata;

  @override
  void initState() {
    super.initState();
    checkSharedPreferencesData();
  }

  Future<void> checkSharedPreferencesData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey('username')) {
      String username = prefs.getString('username')!;
      setState(() {
        loggedInUsername = username;
      });
    } else {
      print('No data found in Shared Preferences.');
    }
    userdata = await AccountDatabase().getDataByUsername(loggedInUsername);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.black,
            child: Column(
              children: [
                SizedBox(height: 20),
                if (userdata != null) ...[
                  ListTile(
                    title: profileItem('Name', userdata!.name, Icons.person),
                  ),
                  ListTile(
                      title: profileItem('Age', userdata!.age.toString(),
                          Icons.calendar_today)),
                  ListTile(
                      title: profileItem('Weight', userdata!.weight.toString(),
                          Icons.fitness_center))
                ],
                SizedBox(
                  height: 30,
                ),
                ListTile(
                  onTap: () {
                    Logout();
                  },
                  leading: Icon(
                    Icons.logout,
                    color: Colors.yellow,
                  ),
                  title: Text(
                    'Logout',
                    style: TextStyle(color: Colors.white),
                  ),
                )
                // ],
              ],
            ),
          )
        ],
      ),
    );
  }

  void Logout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }
}

Widget profileItem(String label, String value, IconData icon) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    child: Row(
      children: [
        Icon(icon, color: Colors.white, size: 20),
        SizedBox(width: 8),
        Text(
          '$label: $value',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ],
    ),
  );
}
