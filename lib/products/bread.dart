import 'package:flutter/material.dart';
import '../widgets/next_button.dart';
import '../widgets/product_item.dart';
import '../globals.dart' as globals;

class BreadItems extends StatefulWidget {
  const BreadItems({Key? key}) : super(key: key);
  @override
  State<BreadItems> createState() => _BreadItemsState();
}

class _BreadItemsState extends State<BreadItems> {
  int count = 0;
  final filter = TextEditingController();

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
                hintText: 'Enter the name of the bread',
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
          ProductItem(filter: filter, label: 'White bread (50g)', notifyParent: refresh),
          ProductItem(filter: filter, label: 'Rolls (pcs)', notifyParent: refresh),
          ProductItem(filter: filter, label: 'Tortilla (50g)', notifyParent: refresh),
          const Padding(
            padding: EdgeInsets.all(24.0),
            child: Text(
              'All dairy',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          // ProductItem(filter: filter, label: 'White bread (50g)', notifyParent: refresh),
          ProductItem(filter: filter, label: 'Whole grain bread (50g)', notifyParent: refresh),
          ProductItem(filter: filter, label: 'Wheat bread (50g)', notifyParent: refresh),
          ProductItem(filter: filter, label: 'Eye bread (50g)', notifyParent: refresh),
          // ProductItem(filter: filter, label: 'Rolls (pcs)', notifyParent: refresh),
          ProductItem(filter: filter, label: 'Brench bread (50g)', notifyParent: refresh),
          ProductItem(filter: filter, label: 'Hot dog bread (50g)', notifyParent: refresh),
          ProductItem(filter: filter, label: 'Pretzel (50g)', notifyParent: refresh),
          // ProductItem(filter: filter, label: 'Tortilla (50g)', notifyParent: refresh),
          NextButton(count: count),
        ],
      ),
    );
  }
}
