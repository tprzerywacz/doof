import 'package:doof_app/advices.dart';
import 'package:doof_app/styles.dart';
import 'package:flutter/material.dart';
import '../widgets/get_logo.dart';
import 'package:doof_app/globals.dart' as globals;

class ThisWeek extends StatelessWidget {
  final List<int> _indices = [];

  ThisWeek({super.key}) {
    for (int i = 0; i < 3; i++) {
      int x;
      do {
        x = Advice.getRandomIndex();
      } while (_indices.contains(x));
      _indices.add(x);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        centerTitle: true,
        title: const Text("This week"),
        backgroundColor: primaryColor,
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {},
          ),
          // NextButton(
          //   color: Color.fromARGB(255, 255, 255, 255),
          // )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(50.0),
              child: Text(
                'Indicator of food you waste',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            InkWell(
              customBorder: const CircleBorder(),
              onTap: () => globals.homeNavigation.updateIndex(2),
              child: const GetLogo(name: 'Green'),
            ),
            // const GetLogo(name: 'Yellow'),
            // const GetLogo(name: 'Red'),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
              child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(134, 44, 44, 44),
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Statistics',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        _buildRow(context, "Lettuce", "You threw out 10% more vegetables last week"),
                        _buildRow(context, "Money", "You lost 120 zł"),
                      ],
                    ),
                  )
                  // child: Text('Statistics', style: textTheme.headline6)),
                  ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 85),
              child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(134, 44, 44, 44),
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Recommendations',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        for (final i in _indices) Advice(index: i),
                      ],
                    ),
                  )
                  // child: Text('Statistics', style: textTheme.headline6)),
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(BuildContext context, String label, String value) {
    // final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GetLogo(name: label),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(value),
          ),
        ],
      ),
    );
  }
}
