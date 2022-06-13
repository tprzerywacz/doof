import 'package:flutter/material.dart';

import '../styles.dart';
import 'get_logo.dart';

class ProductItem extends StatefulWidget {
  final String label;
  const ProductItem({Key? key, required this.label}) : super(key: key);

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  int count = 0;

  Color btnColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    if (count > 0) {
      btnColor = primaryColor;
    } else {
      btnColor = Colors.grey;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: itemsBackColor,
          border: Border.all(
            color: const Color.fromARGB(134, 44, 44, 44),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(45)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: GetLogo(name: widget.label),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Text(widget.label, style: textTheme.headline6),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  setState(
                    () {
                      if (count > 0) {
                        count = count - 1;
                      }
                    },
                  );
                },
                icon: Icon(Icons.remove_circle_outlined, color: btnColor),
              ),
              Text(count.toString()),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: IconButton(
                  onPressed: () {
                    setState(
                      () {
                        count = count + 1;
                        btnColor = primaryColor;
                      },
                    );
                  },
                  icon: const Icon(Icons.add_circle_outlined,
                      color: primaryColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
