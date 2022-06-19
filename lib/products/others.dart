import 'package:flutter/material.dart';
import '../widgets/next_button.dart';
import '../widgets/product_item.dart';
import '../globals.dart' as globals;

class OtherItems extends StatefulWidget {
  const OtherItems({Key? key}) : super(key: key);
  @override
  State<OtherItems> createState() => _OtherItemsState();
}

class _OtherItemsState extends State<OtherItems> {
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
          ProductItem(filter: filter, label: 'Egg (pcs)', notifyParent: refresh),
          ProductItem(filter: filter, label: 'Cookies (10g)', notifyParent: refresh),
          ProductItem(filter: filter, label: 'Mushrooms (10g)', notifyParent: refresh),
          const Padding(
            padding: EdgeInsets.all(24.0),
            child: Text(
              'All others',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          ProductItem(filter: filter, label: 'Prawns (10g)', notifyParent: refresh),
          // ProductItem(filter: filter, label: 'Egg (pcs)', notifyParent: refresh),
          ProductItem(filter: filter, label: 'Ketchup or mustard (10g)', notifyParent: refresh),
          // ProductItem(filter: filter, label: 'Cookies (10g)', notifyParent: refresh),
          ProductItem(filter: filter, label: 'Candy (10g)', notifyParent: refresh),
          ProductItem(filter: filter, label: 'Honey (10g)', notifyParent: refresh),
          ProductItem(filter: filter, label: 'Fries (10g)', notifyParent: refresh),
          ProductItem(filter: filter, label: 'Chips (10g)', notifyParent: refresh),
          // ProductItem(filter: filter, label: 'Mushrooms (10g)', notifyParent: refresh),
          NextButton(count: count),
        ],
      ),
    );
  }
}
