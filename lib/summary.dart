import 'package:doof_app/widgets/reason.dart';
import 'package:flutter/material.dart';
import '../styles.dart';
import 'widgets/get_logo.dart';

class Summary extends StatefulWidget {
  const Summary({Key? key}) : super(key: key);

  @override
  State<Summary> createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  int count = 0;
  int productsNumber = 2;

  String btnText = 'Finish and save';

  Color btnColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    if (count > 0) {
      btnColor = primaryColor;
    } else {
      btnColor = Colors.grey;
    }

    btnText = "Finish and save (${count.toString()})";
    return Column(
      children: [
        SingleChildScrollView(
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 22.0),
                    child: Text(btnText),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
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
          padding: const EdgeInsets.only(top: 2, bottom: 10),
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
