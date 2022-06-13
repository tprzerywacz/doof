import 'package:doof_app/styles.dart';
import 'package:flutter/material.dart';
import 'package:doof_app/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import '../widgets/get_logo.dart';

class FruitItems extends StatelessWidget {
  const FruitItems({super.key});
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(48.0),
                ),
                filled: true,
                hintText: 'Enter the name of the fruit',
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(24.0),
            child: Text(
              'Recently selected',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          // const Padding(
          //   padding: EdgeInsets.all(24.0),
          //   child: Image(image: AssetImage('assets/a.png')),
          // ),
          _fruitItem(context, 'Orange (pcs)'),
          _fruitItem(context, 'Lemon (pcs)'),
          _fruitItem(context, 'Peach (pcs)'),
          const Padding(
            padding: EdgeInsets.all(24.0),
            child: Text(
              'All fruits',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          _fruitItem(context, 'Watermelon 100g'),
          _fruitItem(context, 'Avocado (pcs)'),
          _fruitItem(context, 'Orange (pcs)'),
          _fruitItem(context, 'Peach (pcs)'),
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
              onPressed: () {
                addToFirestore(uid: user!.uid);
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 22.0),
                child: Text('Next step (3)'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future addToFirestore({required uid}) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc();
    final json = {
      'timestamp': DateTime.now(),
      'uid': uid,
      'how_much': 'a lot',
      'what': "whatever"
    };
    await docUser.set(json);
  }

  Widget _fruitItem(BuildContext context, String label) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: itemsBackColor,
          border: Border.all(
            color: const Color.fromARGB(134, 44, 44, 44),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(45)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: GetLogo(name: label),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Text(label, style: textTheme.headline6),
              ),
              const Spacer(),
              const Icon(Icons.remove_circle_outlined, color: primaryColor),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text("1"),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 25),
                child: Icon(Icons.add_circle_outlined, color: primaryColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
