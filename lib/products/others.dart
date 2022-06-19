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
          ProductItem(label: 'Egg (pcs)', notifyParent: refresh),
          ProductItem(label: 'Cookies (50g)', notifyParent: refresh),
          ProductItem(label: 'Mushrooms (50g)', notifyParent: refresh),
          const Padding(
            padding: EdgeInsets.all(24.0),
            child: Text(
              'All others',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          ProductItem(label: 'Prawns (50g)', notifyParent: refresh),
          // ProductItem(label: 'Egg (pcs)', notifyParent: refresh),
          ProductItem(label: 'Ketchup or mustard (50g)', notifyParent: refresh),
          // ProductItem(label: 'Cookies (50g)', notifyParent: refresh),
          ProductItem(label: 'Candy (50g)', notifyParent: refresh),
          ProductItem(label: 'Honey (50g)', notifyParent: refresh),
          ProductItem(label: 'Fries (50g)', notifyParent: refresh),
          ProductItem(label: 'Chips (50g)', notifyParent: refresh),
          // ProductItem(label: 'Mushrooms (50g)', notifyParent: refresh),
          NextButton(count: count),
          ],
      ),
    );
  }
}
