import 'package:flutter/material.dart';

class BottomModal extends StatelessWidget {
  const BottomModal({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(45), topRight: Radius.circular(45)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.7),
                spreadRadius: 5,
                blurRadius: 7,
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }

  static open({required BuildContext context, required Widget child}) {
    showDialog(
      context: context,
      builder: (_) {
        return BottomModal(child: child);
      },
    );
  }
}
