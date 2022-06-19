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
  final filter = TextEditingController();
  int count = 0;

  @override
  Widget build(BuildContext context) {
    count = 0;
    for (var item in globals.summaryItems.tempItems) {
      count += item.quantity;
    }

    refresh() {
      count = 0;
      for (var item in globals.summaryItems.tempItems) {
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
            child: TextFormField(
              controller: filter,
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
          ProductItem(filter: filter, label: 'Orange (pcs)', notifyParent: refresh),
          ProductItem(filter: filter, label: 'Lemon (pcs)', notifyParent: refresh),
          ProductItem(filter: filter, label: 'Peach (pcs)', notifyParent: refresh),
          const Padding(
            padding: EdgeInsets.all(24.0),
            child: Text(
              'All fruits',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          ProductItem(filter: filter, label: 'Watermelon (10g)', notifyParent: refresh),
          ProductItem(filter: filter, label: 'Avocado (pcs)', notifyParent: refresh),
          ProductItem(filter: filter, label: 'Banana (pcs)', notifyParent: refresh),
          ProductItem(filter: filter, label: 'Berries (10g)', notifyParent: refresh),
          ProductItem(filter: filter, label: 'Cherries (10g)', notifyParent: refresh),
          ProductItem(filter: filter, label: 'Grapes (10g)', notifyParent: refresh),
          ProductItem(filter: filter, label: 'Kiwi (pcs)', notifyParent: refresh),
          ProductItem(filter: filter, label: 'Lychee (pcs)', notifyParent: refresh),
          ProductItem(filter: filter, label: 'Mango (pcs)', notifyParent: refresh),
          ProductItem(filter: filter, label: 'Papaya (pcs)', notifyParent: refresh),
          ProductItem(filter: filter, label: 'Pear (pcs)', notifyParent: refresh),
          ProductItem(filter: filter, label: 'Pineapple (10g)', notifyParent: refresh),
          ProductItem(filter: filter, label: 'Plum (10g)', notifyParent: refresh),
          ProductItem(filter: filter, label: 'Pomegranate (pcs)', notifyParent: refresh),
          ProductItem(filter: filter, label: 'Raspberry (10g)', notifyParent: refresh),
          ProductItem(filter: filter, label: 'Strawberry (10g)', notifyParent: refresh),
          ProductItem(filter: filter, label: 'Tangerine (10g)', notifyParent: refresh),
          // ProductItem(filter: filter, label: 'Orange (pcs)', notifyParent: refresh),
          // ProductItem(filter: filter, label: 'Peach (pcs)', notifyParent: refresh),
          NextButton(count: count)
        ],
      ),
    );
  }
}
