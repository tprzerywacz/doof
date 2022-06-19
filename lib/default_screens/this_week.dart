import 'dart:math';

import 'package:doof_app/advices.dart';
import 'package:doof_app/styles.dart';
import 'package:flutter/material.dart';
import '../widgets/get_logo.dart';
import 'package:doof_app/globals.dart' as globals;

class ThisWeek extends StatefulWidget {
  const ThisWeek({super.key});

  @override
  State<ThisWeek> createState() => _ThisWeekState();
}

class _ThisWeekState extends State<ThisWeek> {
  final List<int> _indices = [];
  final _index = ValueNotifier(2);

  final _data = [
    {
      'logo': const GetLogo(name: 'Red'),
      'percentage': 16,
      'loss': 156,
    },
    {
      'logo': const GetLogo(name: 'Yellow'),
      'percentage': 14,
      'loss': 133,
    },
    {
      'logo': const GetLogo(name: 'Green'),
      'percentage': 10,
      'loss': 120,
    },
  ];

  @override
  void initState() {
    super.initState();
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
    return ValueListenableBuilder(
        valueListenable: _index,
        builder: (context, value, _) {
          return Scaffold(
            appBar: AppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => _index.value = max(_index.value - 1, 0),
                  ),
                  const Text("This week"),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward),
                    onPressed: () => _index.value = min(_index.value + 1, 2),
                  ),
                ],
              ),
              centerTitle: true,
              backgroundColor: primaryColor,
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
                    child: _data[_index.value]['logo'] as Widget,
                  ),
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
                            _buildRow(context, "Lettuce",
                                "You threw out ${_data[_index.value]['percentage']}% more vegetables last week"),
                            _buildRow(context, "Money", "You lost ${_data[_index.value]['loss']} PLN"),
                          ],
                        ),
                      ),
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
                      ),
                      // child: Text('Statistics', style: textTheme.headline6)),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
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
