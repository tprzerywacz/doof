import 'package:flutter/material.dart';
import '../globals.dart' as globals;

import '../styles.dart';
import 'get_logo.dart';

class ProductItem extends StatefulWidget {
  final String label;
  final Function() notifyParent;
  final ValueNotifier<TextEditingValue> filter;

  const ProductItem({
    Key? key,
    required this.label,
    required this.notifyParent,
    required this.filter,
  }) : super(key: key);

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
    return ValueListenableBuilder(
      valueListenable: widget.filter,
      builder: (BuildContext context, TextEditingValue value, _) {
        final filterText = value.text;
        if (filterText.isNotEmpty && !widget.label.toLowerCase().contains(filterText.toLowerCase())) {
          return const SizedBox.shrink();
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: GetLogo(name: widget.label),
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            child: Text(
                              widget.label,
                              style: textTheme.headline6,
                              maxLines: 2,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(
                            () {
                              if (count > 0) {
                                count = count - 1;
                                globals.summaryItems.updateTempItem(widget.label, count);
                                widget.notifyParent();
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
                                globals.summaryItems.updateTempItem(widget.label, count);
                                widget.notifyParent();
                                btnColor = primaryColor;
                              },
                            );
                          },
                          icon: const Icon(Icons.add_circle_outlined, color: primaryColor),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
