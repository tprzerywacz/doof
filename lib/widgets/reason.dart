import 'package:flutter/material.dart';

class ReasonButton extends StatefulWidget {
  const ReasonButton({Key? key}) : super(key: key);

  @override
  State<ReasonButton> createState() => _ReasonButtonState();
}

class _ReasonButtonState extends State<ReasonButton> {
  String dropdownValue = 'Too big groceries';

  get itemsBackColor => null;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25, left: 25, top: 10),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: const Color.fromARGB(134, 44, 44, 44),
            ),
            borderRadius: const BorderRadius.all(Radius.circular(4))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: DropdownButton<String>(
            isExpanded: true,
            value: dropdownValue,
            icon: const Icon(Icons.arrow_drop_down),
            elevation: 1,
            style: const TextStyle(color: Colors.black),
            // underline: Container(
            //   height: 2,
            //   color: Colors.deepPurpleAccent,
            // ),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
            items: <String>[
              'Too big groceries',
              'Events (parties, holidays)',
              'Short expiration date',
              'None, just throwing without any reason',
              'Bought but didn\'t like it',
              'Eat out unexpected',
              'Peelings and stale vegetable parts',
              'Keeping too long',
              'Rotten food'
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
