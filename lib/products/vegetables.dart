import 'package:flutter/material.dart';
import '../widgets/next_button.dart';
import '../widgets/product_item.dart';
import '../globals.dart' as globals;

class VegetableItems extends StatefulWidget {
  const VegetableItems({Key? key}) : super(key: key);
  @override
  State<VegetableItems> createState() => _VegetableItemsState();
}

class _VegetableItemsState extends State<VegetableItems> {
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
          ProductItem(filter: filter, label: 'Carrots (pcs)', notifyParent: refresh),
          ProductItem(filter: filter, label: 'Tomatoes (pcs)', notifyParent: refresh),
          ProductItem(filter: filter, label: 'Cucumber (pcs)', notifyParent: refresh),
          const Padding(
            padding: EdgeInsets.all(24.0),
            child: Text(
              'All vegetables',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          // ProductItem(filter: filter, label: 'Carrots (pcs)', notifyParent: refresh),
          ProductItem(filter: filter, label: 'Potatoes (pcs)', notifyParent: refresh),
          // ProductItem(filter: filter, label: 'Tomatoes (pcs)', notifyParent: refresh),
          ProductItem(filter: filter, label: 'Onion (pcs)', notifyParent: refresh),
          ProductItem(filter: filter, label: 'Paprika (pcs)', notifyParent: refresh),
          ProductItem(filter: filter, label: 'Cabbage (pcs)', notifyParent: refresh),
          ProductItem(filter: filter, label: 'Lettuce (pcs)', notifyParent: refresh),
          // ProductItem(filter: filter, label: 'Cucumber (pcs)', notifyParent: refresh),
          ProductItem(filter: filter, label: 'Brocolli (pcs)', notifyParent: refresh),
          ProductItem(filter: filter, label: 'Parsley (pcs)', notifyParent: refresh),
          ProductItem(filter: filter, label: 'Garlic (pcs)', notifyParent: refresh),
          NextButton(count: count),
        ],
      ),
    );
  }
}
