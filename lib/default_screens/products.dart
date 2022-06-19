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

abstract class _Layout extends StatelessWidget {
  const _Layout({Key? key}) : super(key: key);

  Widget get child;
  String get title;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        globals.summaryItems.clearTempItems();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text(title),
          actions: const [GarbageSummaryIcon()],
        ),
        body: child,
      ),
    );
  }
}

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
        actions: const [GarbageSummaryIcon()],
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
        _foodItem(context, 'Vegetables', const Color.fromARGB(255, 107, 204, 104)),
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
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(17.0), side: BorderSide(color: borderColor)),
          ),
        ),
        onPressed: () => {
          globals.summaryItems.clearTempItems(),
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

class Meat extends _Layout {
  const Meat({Key? key}) : super(key: key);

  @override
  String get title => 'Meat';
  @override
  Widget get child => const MeatItems();
}

class Vegetables extends _Layout {
  const Vegetables({Key? key}) : super(key: key);

  @override
  String get title => 'Vegetables';
  @override
  Widget get child => const VegetableItems();
}

class Fruits extends _Layout {
  const Fruits({Key? key}) : super(key: key);

  @override
  String get title => 'Fruits';
  @override
  Widget get child => const FruitItems();
}

class Dairy extends _Layout {
  const Dairy({Key? key}) : super(key: key);

  @override
  String get title => 'Dairy';
  @override
  Widget get child => const DairyItems();
}

class Drinks extends _Layout {
  const Drinks({Key? key}) : super(key: key);

  @override
  String get title => 'Drinks';
  @override
  Widget get child => const DrinkItems();
}

class Bread extends _Layout {
  const Bread({Key? key}) : super(key: key);

  @override
  String get title => 'Bread';
  @override
  Widget get child => const BreadItems();
}

class Other extends _Layout {
  const Other({Key? key}) : super(key: key);

  @override
  String get title => 'Other';
  @override
  Widget get child => const OtherItems();
}

class Checkout extends _Layout {
  const Checkout({Key? key}) : super(key: key);

  @override
  String get title => 'Summary';
  @override
  Widget get child => const Summary();
}

class GarbageSummaryIcon extends StatelessWidget {
  const GarbageSummaryIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          icon: const GetLogo(name: 'small_bin'),
          onPressed: () {
            globals.summaryItems.moveToTrash();
            Navigator.pushNamed(context, 'Summary');
          },
        ),
        AnimatedBuilder(
          animation: globals.summaryItems,
          builder: (context, snapshot) {
            return Positioned(
              top: 5,
              right: 5,
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                alignment: Alignment.center,
                width: 18,
                height: 18,
                child: Text(
                  "${globals.summaryItems.count}",
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
