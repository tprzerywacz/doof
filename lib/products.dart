
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
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
        // const Padding(
        //   padding: EdgeInsets.all(24.0),
        //   child: Image(image: AssetImage('assets/a.png')),
        // ),
        _foodItem(context, 'Meat', const Color.fromARGB(255, 206, 154, 86)),
        _foodItem(
            context, 'Vegetables', const Color.fromARGB(255, 107, 204, 104)),
        _foodItem(context, 'Fruits', const Color.fromARGB(255, 211, 102, 94)),
        _foodItem(context, 'Dairy', const Color.fromARGB(255, 94, 154, 211)),
        _foodItem(context, 'Drinks', const Color.fromARGB(255, 203, 211, 94)),
        _foodItem(context, 'Bread', const Color.fromARGB(255, 212, 144, 88)),
        _foodItem(context, 'Another', const Color.fromARGB(255, 212, 204, 88)),
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
        onPressed: () => {},
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _getLogo(context, label),
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

  Widget _getLogo(BuildContext context, String name) {
    Map<String, String> assetsMap = {
      'Meat': 'assets/chicken-leg.svg',
      'Vegetables': 'assets/lettuce.svg',
      'Fruits': 'assets/orange.svg',
      'Dairy': 'assets/milk.svg',
      'Drinks': 'assets/bubble-tea.svg',
      'Bread': 'assets/bread.svg',
      'Another': 'assets/mustard.svg',
      'Avocado': 'assets/avocado.svg'
    };
    final String assetName = assetsMap[name]!;
    final Widget svg = SvgPicture.asset(
      assetName,
    );
    return svg;
  }
}
