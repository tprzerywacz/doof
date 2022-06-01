import 'package:doof_app/services/auth.dart';
import 'package:flutter/material.dart';
const primaryColor = Color.fromARGB(255, 0, 160, 130);
const Color orange = Color.fromARGB(255, 240, 123, 79);

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

class MyProfile extends StatelessWidget {
  //MyProfile({super.key});

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.all(24.0),
          child: Text(
            'Basic information',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        _buildRow(context, "Name", "Marcin"),
        _buildRow(context, "Surname", "Nowak"),
        _buildRow(context, "Gender", "Prefer not to say"),
        _buildRow(context, "Aga", "24"),
        _buildRow(context, "Household people count", "5"),
        const Padding(
          padding: EdgeInsets.all(24.0),
          child: Text(
            'Settings',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        _buildRow(context, "Password", "Change password"),
        _buildRow(context, "Data", "Export data"),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(20),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(orange),
              textStyle: MaterialStateProperty.all(
                const TextStyle(fontSize: 18),
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(44.0),
                    side: const BorderSide(color: orange)),
              ),
            ),
            onPressed: () async {
              await _auth.signOut();
              print('logging out');
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 22.0),
              child: Text('Log out'),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRow(BuildContext context, String label, String value) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(child: Text(label, style: textTheme.headline6)),
          Flexible(
            child: Text(
              value,
              style: textTheme.headline6?.copyWith(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    MyProfile()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<String> appBarText = const ['Home', 'Trash', 'Stats', 'My profile'];

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
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_outlined),
            label: 'School',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Alarm',
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
    );
  }
}
