import 'package:doof_app/widgets/reason.dart';
import 'package:flutter/material.dart';
import '../styles.dart';
import 'widgets/get_logo.dart';

class Summary extends StatelessWidget {
  const Summary({super.key});
  @override
  Widget build(BuildContext context) {
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
              children: [
                _getItem(context, 'Lemon (pcs)', 10),
                _getItem(context, 'Peach (pcs)', 10),
              ],
            ),
          ),
          //const Spacer(),
          Padding(
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
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 22.0),
                child: Text('Finish and save (2)'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getItem(BuildContext context, String name, int pcs) {
    final textTheme = Theme.of(context).textTheme;
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
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: GetLogo(name: name),
                  ),
                  Text(name, style: textTheme.headline6),
                  const Spacer(),
                  const Icon(Icons.remove_circle_outlined, color: primaryColor),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("3"),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 25),
                    child: Icon(Icons.add_circle_outlined, color: primaryColor),
                  )
                ],
              ),
              const Center(
                child: ReasonButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
