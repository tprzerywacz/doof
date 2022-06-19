import 'package:flutter/material.dart';
import '../styles.dart';
import '../globals.dart' as globals;

class NextButton extends StatelessWidget {
  final int count;
  const NextButton({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(customOrange),
          textStyle: MaterialStateProperty.all(
            const TextStyle(fontSize: 18),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(44.0),
                side: const BorderSide(color: customOrange)),
          ),
        ),
        onPressed: () {
          addToTrash();
          Navigator.pushNamed(context, 'Summary');
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 22.0),
          child: Text("Next step (${count.toString()})"),
        ),
      ),
    );
  }

  Future addToTrash() async {
    for (var item in globals.tempItems) {
      globals.summaryItems.add(item);
    }
    globals.tempItems.clear();
  }
}
