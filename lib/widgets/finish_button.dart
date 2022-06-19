import 'package:flutter/material.dart';
import '../styles.dart';
import 'package:doof_app/models/summary_item.dart';
import 'package:doof_app/models/user.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../globals.dart' as globals;


class FinishButton extends StatelessWidget {
  final int count;
  final Function() notifyParent;
  const FinishButton({super.key, required this.count, required this.notifyParent});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);
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
          finishCheckout(uid: user!.uid);
          notifyParent();
          },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 22.0),
          child: Text("Finish and save (${count.toString()})"),
        ),
      ),
    );
  }
  void finishCheckout({required uid})
  {
    for(var item in globals.summaryItems)
    {
      addToFirestore(uid: uid, item: item);
    }
    globals.summaryItems.clear();
  }

  Future addToFirestore({required uid, required SummaryItem item}) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc();
    final json = {
      'timestamp': DateTime.now(),
      'uid': uid,
      'what': item.name,
      'how_much': item.quantity,
      'reason': item.reason
    };
    await docUser.set(json);
  }
}
