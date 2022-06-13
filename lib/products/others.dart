import 'package:flutter/material.dart';
import 'package:doof_app/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import '../styles.dart';
import '../widgets/product_item.dart';

class OtherItems extends StatelessWidget {
  const OtherItems({super.key});
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
                hintText: 'Enter the name of the product',
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
          const ProductItem(label: 'Egg (pcs)'),
          const ProductItem(label: 'Cookies (50g)'),
          const ProductItem(label: 'Mushrooms (50g)'),
          const Padding(
            padding: EdgeInsets.all(24.0),
            child: Text(
              'All others',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const ProductItem(label: 'Prawns (50g)'),
          const ProductItem(label: 'Egg (pcs)'),
          const ProductItem(label: 'Ketchup or mustard (50g)'),
          const ProductItem(label: 'Cookies (50g)'),
          const ProductItem(label: 'Candy (50g)'),
          const ProductItem(label: 'Honey (50g)'),
          const ProductItem(label: 'Fries (50g)'),
          const ProductItem(label: 'Chips (50g)'),
          const ProductItem(label: 'Mushrooms (50g)'),
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
}
