import 'package:flutter/material.dart';
import '../widgets/next_button.dart';
import '../widgets/product_item.dart';
import '../globals.dart' as globals;

class DrinkItems extends StatefulWidget {
  const DrinkItems({Key? key}) : super(key: key);
  @override
  State<DrinkItems> createState() => _DrinkItemsState();
}

class _DrinkItemsState extends State<DrinkItems> {
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
                hintText: 'Enter the name of the drink',
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
          ProductItem(filter: filter, label: 'Water (50ml)', notifyParent: refresh),
          ProductItem(filter: filter, label: 'Tea (50ml)', notifyParent: refresh),
          ProductItem(filter: filter, label: 'Juice (50ml)', notifyParent: refresh),
          const Padding(
            padding: EdgeInsets.all(24.0),
            child: Text(
              'All drinks',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          // ProductItem(filter: filter, label: 'Water (50ml)', notifyParent: refresh),
          // ProductItem(filter: filter, label: 'Juice (50ml)', notifyParent: refresh),
          ProductItem(filter: filter, label: 'Alcohol (50ml)', notifyParent: refresh),
          ProductItem(filter: filter, label: 'Coffee (50ml)', notifyParent: refresh),
          // ProductItem(filter: filter, label: 'Tea (50ml)),
          NextButton(count: count),
        ],
      ),
    );
  }
}
