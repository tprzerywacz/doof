import 'package:doof_app/widgets/finish_button.dart';
import 'package:doof_app/widgets/reason.dart';
import 'package:doof_app/widgets/quantity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'globals.dart' as globals;
import 'styles.dart';

class Summary extends StatefulWidget {
  const Summary({Key? key}) : super(key: key);
  @override
  State<Summary> createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  int count = 0;
  Color btnColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    count = 0;
    for (var item in globals.summaryItems.items) {
      count += item.quantity;
    }

    return SingleChildScrollView(
      child: Column(
        children: [if (count < 1) _emptyGarbageCan() else _garbageCan()],
      ),
    );
  }

  _emptyGarbageCan() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const Center(
          child: Padding(
            padding: EdgeInsets.all(40.0),
            child: Text(
              'Your food has been thrown away successively!',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SvgPicture.asset('assets/successful.svg'),
        _backHomeButton(),
      ],
    );
  }

  Widget _backHomeButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(customOrange),
          textStyle: MaterialStateProperty.all(
            const TextStyle(fontSize: 18),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(44.0), side: const BorderSide(color: customOrange)),
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, 'Home');
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 22.0),
          child: Text("Go to home page"),
        ),
      ),
    );
  }

  Widget _garbageCan() {
    refresh() {
      setState(() {
        for (var item in globals.summaryItems.items) {
          count += item.quantity;
        }
      });
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(24.0),
            child: Text(
              'Your garbage can',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [for (var item in globals.summaryItems.items) _getItem(context, item.name, item.quantity)],
            ),
          ),
          //const Spacer(),
          FinishButton(
            count: count,
            notifyParent: () {
              refresh();
            },
          ),
        ],
      ),
    );
  }

  Widget _getItem(BuildContext context, String name, int pcs_) {
    refresh() {
      setState(() {});
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(133, 255, 255, 255),
          border: Border.all(
            color: const Color.fromARGB(134, 44, 44, 44),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 2, bottom: 10),
          child: Column(
            children: [
              Quantity(name: name, pcs: pcs_, notifyParent: refresh),
              Center(
                child: ReasonButton(name: name),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
