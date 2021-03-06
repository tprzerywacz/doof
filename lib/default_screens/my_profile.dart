import 'package:doof_app/services/auth.dart';
import 'package:doof_app/styles.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  MyProfile({super.key});

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        title: const Text("My profile"),
        backgroundColor: const Color.fromARGB(255, 0, 160, 130),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(24.0),
            child: Text(
              'Basic information',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          _buildRow(context, "Name", "Marcin"),
          _buildRow(context, "Surname", "Nowak"),
          _buildRow(context, "Gender", "Prefer not to say"),
          _buildRow(context, "Age", "24"),
          _buildRow(context, "Household people count", "5"),
          const Padding(
            padding: EdgeInsets.all(24.0),
            child: Text(
              'Settings',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          _buildRow(context, "Password", "Change password"),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(customOrange),
                textStyle: MaterialStateProperty.all(
                  const TextStyle(fontSize: 18),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(44.0),
                      side: const BorderSide(color: customOrange)),
                ),
              ),
              onPressed: () async {
                await _auth.signOut();
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 22.0),
                child: Text('Log out'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(BuildContext context, String label, String value) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(child: Text(label, style: textTheme.headline6)),
          Flexible(
            child: Text(
              value,
              style: textTheme.headline6?.copyWith(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
