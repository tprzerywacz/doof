import 'package:flutter/material.dart';
import 'package:doof_app/fruit.dart';
import 'package:doof_app/products.dart';
import 'package:doof_app/my_profile.dart';
import 'package:doof_app/home.dart';

void main() => runApp(const MyApp());

const primaryColor = Color.fromARGB(255, 0, 160, 130);
const Color orange = Color.fromARGB(255, 240, 123, 79);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Doof';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primaryColor: primaryColor,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: orange),
      ),
      home: const MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class MyCustomForm extends StatelessWidget {
  const MyCustomForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
              hintText: 'Enter a search term',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your username',
            ),
          ),
        ),
      ],
    );
  }
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool btnVisibility = true;
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
    });
  }

  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    ThisWeek(),
    Products(),
    FruitItems(),
    MyProfile()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      btnVisibility = index == 0;
    });
  }

  List<String> appBarText = const [
    'This week',
    'Products',
    'Stats',
    'My profile'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromARGB(255, 0, 160, 130),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.delete),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_outlined),
            label: 'Stats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'My profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: orange,
        unselectedItemColor: const Color.fromARGB(255, 255, 255, 255),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _onItemTapped,
      ),
      appBar: AppBar(
        leading: const BackButton(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        title: Text(appBarText[_selectedIndex]),
        backgroundColor: const Color.fromARGB(255, 0, 160, 130),
      ),
      floatingActionButton: Visibility(
        visible: btnVisibility, // Set it to false
        child: FloatingActionButton(
          backgroundColor: primaryColor,
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.delete),
        ),
      ),
    );
  }
}
