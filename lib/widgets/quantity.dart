import 'package:flutter/material.dart';

import '../styles.dart';
import 'get_logo.dart';
import '../globals.dart' as globals;

class Quantity extends StatefulWidget {
  final int pcs;
  final String name;
  final Function() notifyParent;
  const Quantity({Key? key, required this.pcs, required this.name, required this.notifyParent}) : super(key: key);

  @override
  State<Quantity> createState() => _QuantityState();
}

class _QuantityState extends State<Quantity> {
  late int pcs;
  Color btnColor = Colors.grey;

  @override
  void initState() {
    super.initState();
    pcs = widget.pcs;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    if (widget.pcs > 0) {
      btnColor = primaryColor;
    } else {
      btnColor = Colors.grey;
    }

    return Row(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: GetLogo(name: widget.name),
      ),
      Text(widget.name, style: textTheme.headline6),
      const Spacer(),
      IconButton(
        onPressed: () {
          setState(
            () {
              if (widget.pcs > 0) {
                pcs = widget.pcs - 1;
                globals.summaryItems.updateItemsQuanitity(widget.name, pcs);
                widget.notifyParent();
              }
            },
          );
        },
        icon: Icon(Icons.remove_circle_outlined, color: btnColor),
      ),
      Text(widget.pcs.toString()),
      Padding(
        padding: const EdgeInsets.only(right: 10),
        child: IconButton(
          onPressed: () {
            setState(
              () {
                pcs = widget.pcs + 1;
                btnColor = primaryColor;
                globals.summaryItems.updateItemsQuanitity(widget.name, widget.pcs);
                widget.notifyParent();
              },
            );
          },
          icon: const Icon(Icons.add_circle_outlined, color: primaryColor),
        ),
      )
    ]);
  }
}
