import 'package:flutter/material.dart';

import '../styles.dart';
import 'get_logo.dart';
import '../globals.dart' as globals;

class Quantity extends StatefulWidget {
  late int pcs;
  final String name;
  final Function() notifyParent;
  Quantity({Key? key, required this.pcs, required this.name, required this.notifyParent}) : super(key: key);

  @override
  State<Quantity> createState() => _QuantityState();
}

class _QuantityState extends State<Quantity> {
  Color btnColor = Colors.grey;
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
                widget.pcs = widget.pcs - 1;
                globals.updateItemsQuanitity(widget.name, widget.pcs);
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
                widget.pcs = widget.pcs + 1;
                btnColor = primaryColor;
                globals.updateItemsQuanitity(widget.name, widget.pcs);
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
