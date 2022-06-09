import 'package:flutter/material.dart';

class Statistics extends StatelessWidget {
  const Statistics({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        title: const Text("Statistics"),
        backgroundColor: const Color.fromARGB(255, 0, 160, 130),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const <Widget>[
          Padding(
            padding: EdgeInsets.all(24.0),
            child: Text(
              'Statistics',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),    
        ],
      ),
    );
  }
}
