import 'package:doof_app/products/bread.dart';
import 'package:doof_app/products/dairy.dart';
import 'package:doof_app/products/drinks.dart';
import 'package:doof_app/products/others.dart';
import 'package:doof_app/products/vegetables.dart';
import 'package:doof_app/styles.dart';
import 'package:doof_app/summary.dart';
import 'package:flutter/material.dart';
import 'package:doof_app/products/fruits.dart';
import 'package:doof_app/products/meat.dart';

import '../widgets/get_logo.dart';
import '../globals.dart' as globals;

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);
  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        Widget page = const Categories();

          switch (settings.name) {
            case 'Meat':
              page = const Meat();
              break;
            case 'Vegetables':
              page = const Vegetables();
              break;
            case 'Fruits':
              page = const Fruits();
              break;
            case 'Dairy':
              page = const Dairy();
              break;
            case 'Drinks':
              page = const Drinks();
              break;
            case 'Bread':
              page = const Bread();
              break;
            case 'Other':
              page = const Other();
              break;
            case 'Summary':
              page = const Checkout();
              break;
            default:
              break;
          }
        return MaterialPageRoute(builder: (_) => page);
      },
    );
  }
}

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        title: const Text("Products"),
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [_categories(context)],
          ),
        ),
      ),
    );
  }

  Widget _categories(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.all(24.0),
          child: Text(
            'Select a category',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        _foodItem(context, 'Meat', const Color.fromARGB(255, 206, 154, 86)),
        _foodItem(
            context, 'Vegetables', const Color.fromARGB(255, 107, 204, 104)),
        _foodItem(context, 'Fruits', const Color.fromARGB(255, 211, 102, 94)),
        _foodItem(context, 'Dairy', const Color.fromARGB(255, 94, 154, 211)),
        _foodItem(context, 'Drinks', const Color.fromARGB(255, 203, 211, 94)),
        _foodItem(context, 'Bread', const Color.fromARGB(255, 212, 144, 88)),
        _foodItem(context, 'Other', const Color.fromARGB(255, 212, 204, 88)),
        _foodItem(context, 'Summary', const Color.fromARGB(255, 212, 204, 88)),
      ],
    );
  }

  Widget _foodItem(BuildContext context, String label, Color borderColor) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          textStyle: MaterialStateProperty.all(
            const TextStyle(fontSize: 18),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(17.0),
                side: BorderSide(color: borderColor)),
          ),
        ),
        onPressed: () => {
          globals.tempItems.clear(),
          Navigator.pushNamed(context, label),
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GetLogo(name: label),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(label, style: textTheme.headline6),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Meat extends StatelessWidget {
  const Meat({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: const Text('Meat'),
        ),
        body: const MeatItems(),
      );
}

class Vegetables extends StatelessWidget {
  const Vegetables({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: const Text('Vegetables'),
        ),
        body: const VegetableItems(),
      );
}

class Fruits extends StatelessWidget {
  const Fruits({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: const Text('Fruits'),
        ),
        body: const FruitItems(),
      );
}

class Dairy extends StatelessWidget {
  const Dairy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: const Text('Vegetables'),
        ),
        body: const DairyItems(),
      );
}

class Drinks extends StatelessWidget {
  const Drinks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: const Text('Drinks'),
        ),
        body: const DrinkItems(),
      );
}

class Bread extends StatelessWidget {
  const Bread({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: const Text('Bread'),
        ),
        body: const BreadItems(),
      );
}

class Other extends StatelessWidget {
  const Other({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: const Text('Other'),
        ),
        body: const OtherItems(),
      );
}

class Checkout extends StatelessWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
            backgroundColor: primaryColor,
            title: const Text('Summary'),
            actions: [
              IconButton(
                icon: const Icon(Icons
                    .delete), //https://www.freecodecamp.org/news/how-to-add-custom-icons-to-your-flutter-application/
                onPressed: () {},
              ),
            ]),
        body: const Summary(),
      );
}
