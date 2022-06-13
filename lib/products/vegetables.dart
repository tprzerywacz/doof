import 'package:flutter/material.dart';
import 'package:doof_app/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import '../styles.dart';
import '../widgets/product_item.dart';

class VegetableItems extends StatelessWidget {
  const VegetableItems({super.key});
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
                hintText: 'Enter the name of the vegetable',
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
          const ProductItem(label: 'Carrots (pcs)'),
          const ProductItem(label: 'Tomatoes (pcs)'),
          const ProductItem(label: 'Cucumber (pcs)'),
          const Padding(
            padding: EdgeInsets.all(24.0),
            child: Text(
              'All vegetables',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const ProductItem(label: 'Carrots (pcs)'),
          const ProductItem(label: 'Potatoes (pcs)'),
          const ProductItem(label: 'Tomatoes (pcs)'),
          const ProductItem(label: 'Onion (pcs)'),
          const ProductItem(label: 'Paprika (pcs)'),
          const ProductItem(label: 'Cabbage (pcs)'),
          const ProductItem(label: 'Lettuce (pcs)'),
          const ProductItem(label: 'Cucumber (pcs)'),
          const ProductItem(label: 'Brocolli (pcs)'),
          const ProductItem(label: 'Parsley (pcs)'),
          const ProductItem(label: 'Garlic (pcs)'),
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
                    side: const BorderSide(color: customOrange),
                  ),
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
