import 'package:flutter/material.dart';
import '../widgets/next_button.dart';
import '../widgets/product_item.dart';
import '../globals.dart' as globals;

class FruitItems extends StatefulWidget {
  const FruitItems({Key? key}) : super(key: key);
  @override
  State<FruitItems> createState() => _FruitItemsState();
}

class _FruitItemsState extends State<FruitItems> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    count = 0;
    for (var item in globals.tempItems) {
      count += item.quantity;
    }

    refresh() {
      count = 0;
      for (var item in globals.tempItems) {
        count += item.quantity;
      }

      setState(() {});
    }
    
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
          ProductItem(label: 'Orange (pcs)', notifyParent: refresh),
          ProductItem(label: 'Lemon (pcs)', notifyParent: refresh),
          ProductItem(label: 'Peach (pcs)', notifyParent: refresh),
          const Padding(
            padding: EdgeInsets.all(24.0),
            child: Text(
              'All fruits',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          ProductItem(label: 'Watermelon 100g', notifyParent: refresh),
          ProductItem(label: 'Avocado (pcs)', notifyParent: refresh),
          // ProductItem(label: 'Orange (pcs)', notifyParent: refresh),
          // ProductItem(label: 'Peach (pcs)', notifyParent: refresh),
          NextButton(count: count)
        ],
      ),
    );
  }
}
