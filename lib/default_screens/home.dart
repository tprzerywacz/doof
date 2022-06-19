import 'package:doof_app/stats.dart';
import 'package:flutter/material.dart';
import 'package:doof_app/styles.dart';
import 'package:doof_app/default_screens/this_week.dart';
import 'package:doof_app/default_screens/products.dart';
import 'package:doof_app/default_screens/my_profile.dart';
import 'package:doof_app/globals.dart' as globals;

class HomeNavigation with ChangeNotifier {
  int selectedIndex = 0;

  void updateIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool btnVisibility = true;

  @override
  void initState() {
    super.initState();
    globals.homeNavigation.addListener(_onScreenChanged);
  }

  void _onScreenChanged() {
    if (mounted) {
      setState(() {
        btnVisibility = globals.homeNavigation.selectedIndex == 0;
      });
    }
  }

  @override
  void dispose() {
    globals.homeNavigation.removeListener(_onScreenChanged);
    super.dispose();
  }

  final List<Widget> _widgetOptions = <Widget>[ThisWeek(), const Products(), const Statistics(), MyProfile()];

  List<String> appBarText = const ['This week', 'Products', 'Stats', 'My profile'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(globals.homeNavigation.selectedIndex),
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
        currentIndex: globals.homeNavigation.selectedIndex,
        selectedItemColor: customOrange,
        unselectedItemColor: const Color.fromARGB(255, 255, 255, 255),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: globals.homeNavigation.updateIndex,
      ),
      // appBar: AppBar(
      //   leading: const BackButton(
      //     color: Color.fromARGB(255, 255, 255, 255),
      //   ),
      //   title: Text(appBarText[_selectedIndex]),
      //   backgroundColor: const Color.fromARGB(255, 0, 160, 130),
      // ),
      floatingActionButton: Visibility(
        visible: btnVisibility, // Set it to false
        child: FloatingActionButton(
          backgroundColor: primaryColor,
          onPressed: () => globals.homeNavigation.updateIndex(1),
          tooltip: 'Throw some food',
          child: const Icon(Icons.delete),
        ),
      ),
    );
  }
}
