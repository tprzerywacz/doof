import 'package:flutter/material.dart';
import '../widgets/next_button.dart';
import '../widgets/product_item.dart';
import '../globals.dart' as globals;

class MeatItems extends StatefulWidget {
  const MeatItems({Key? key}) : super(key: key);
  @override
  State<MeatItems> createState() => _MeatItemsState();
}

class _MeatItemsState extends State<MeatItems> {
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
                hintText: 'Enter the name of the meat',
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
          ProductItem(filter: filter, label: 'Chicken (50g)', notifyParent: refresh),
          ProductItem(filter: filter, label: 'Pork (50g)', notifyParent: refresh),
          ProductItem(filter: filter, label: 'Fish (50g)', notifyParent: refresh),
          const Padding(
            padding: EdgeInsets.all(24.0),
            child: Text(
              'All meats',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          ProductItem(filter: filter, label: 'Beef (50g)', notifyParent: refresh),
          // ProductItem(filter: filter, label: 'Pork (50g)', notifyParent: refresh),
          ProductItem(filter: filter, label: 'Lamb (50g)', notifyParent: refresh),
          // ProductItem(filter: filter, label: 'Chicken (50g)', notifyParent: refresh),
          // ProductItem(filter: filter, label: 'Fish (50g)', notifyParent: refresh),
          ProductItem(filter: filter, label: 'Sausage (50g)', notifyParent: refresh),
          NextButton(count: count),
        ],
      ),
    );
  }
}
