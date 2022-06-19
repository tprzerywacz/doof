import 'package:flutter/material.dart';
import '../widgets/next_button.dart';
import '../widgets/product_item.dart';
import '../globals.dart' as globals;

class DairyItems extends StatefulWidget {
  const DairyItems({Key? key}) : super(key: key);
  @override
  State<DairyItems> createState() => _DairyItemsState();
}

class _DairyItemsState extends State<DairyItems> {
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
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(48.0),
                ),
                filled: true,
                hintText: 'Enter the name of the dairy',
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
          ProductItem(label: 'Cheese (50g)', notifyParent: refresh),
          ProductItem(label: 'Butter (50g)', notifyParent: refresh),
          ProductItem(label: 'Milk (50ml)', notifyParent: refresh),
          const Padding(
            padding: EdgeInsets.all(24.0),
            child: Text(
              'All dairy',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          // ProductItem(label: 'Cheese (50g)', notifyParent: refresh),
          ProductItem(label: 'Yoghurt (50g)', notifyParent: refresh),
          // ProductItem(label: 'Milk (50ml)', notifyParent: refresh),
          ProductItem(label: 'Milk desserts (50g)', notifyParent: refresh),
          ProductItem(label: 'Cream (50ml)', notifyParent: refresh),
          // ProductItem(label: 'Butter (50g)', notifyParent: refresh),
          NextButton(count: count),
        ],
      ),
    );
  }
}
