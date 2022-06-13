import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GetLogo extends StatelessWidget {
  final String name;

  const GetLogo({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    Map<String, String> assetsMap = {
      'Meat': 'assets/chicken-leg.svg',
      'Vegetables': 'assets/lettuce.svg',
      'Fruits': 'assets/orange.svg',
      'Dairy': 'assets/milk.svg',
      'Drinks': 'assets/bubble-tea.svg',
      'Bread': 'assets/bread.svg',
      'Other': 'assets/groceries.svg',
      'Avocado': 'assets/avocado.svg',
      'Summary': 'assets/chicken-leg.svg',
      'White bread (50g)': 'assets/bread 2.svg',
      'Whole grain bread (50g)': 'assets/bread 3.svg',
      'Wheat bread (50g)': 'assets/bread 4.svg',
      'Eye bread (50g)': 'assets/croissant.svg',
      'Rolls (pcs)': 'assets/bread-roll.svg',
      'Brench bread (50g)': 'assets/baguette.svg',
      'Hot dog bread (50g)': 'assets/hotdog.svg',
      'Pretzel (50g)': 'assets/pretzel.svg',
      'Tortilla (50g)': 'assets/tortilla.svg',
      'Cheese (50g)': 'assets/cheese.svg',
      'Yoghurt (50g)': 'assets/yoghurt.svg',
      'Milk (50ml)': 'assets/milk.svg',
      'Milk desserts (50g)': 'assets/sweet-mustard.svg',
      'Cream (50ml)': 'assets/milkshake.svg',
      'Butter (50g)': 'assets/butter.svg',
      'Water (50ml)': 'assets/water.svg',
      'Juice (50ml)': 'assets/juice.svg',
      'Alcohol (50ml)': 'assets/cocktail.svg',
      'Coffee (50ml)': 'assets/ice-coffee.svg',
      'Tea (50ml)': 'assets/tea-bag.svg',
      'Orange (pcs)': 'assets/orange.svg',
      'Lemon (pcs)': 'assets/lemon.svg',
      'Peach (pcs)': 'assets/peach.svg',
      'Watermelon 100g': 'assets/watermelon.svg',
      'Avocado (pcs)': 'assets/avocado.svg',
      'Chicken (50g)': 'assets/hen.svg',
      'Beef (50g)': 'assets/cattle.svg',
      'Pork (50g)': 'assets/pig.svg',
      'Lamb (50g)': 'assets/sheep.svg',
      'Fish (50g)': 'assets/shark.svg',
      'Sausage (50g)': 'assets/hotdog.svg',
      'Prawns (50g)': 'assets/prawn.svg',
      'Egg (pcs)': 'assets/egg.svg',
      'Ketchup or mustard (50g)': 'assets/mustard.svg',
      'Cookies (50g)': 'assets/cookie.svg',
      'Candy (50g)': 'assets/candy.svg',
      'Honey (50g)': 'assets/honey.svg',
      'Fries (50g)': 'assets/fries.svg',
      'Chips (50g)': 'assets/chips.svg',
      'Mushrooms (50g)': 'assets/mushroom.svg',
      'Carrots (pcs)': 'assets/carrot.svg',
      'Potatoes (pcs)': 'assets/potato.svg',
      'Tomatoes (pcs)': 'assets/tomato.svg',
      'Onion (pcs)': 'assets/onion.svg',
      'Paprika (pcs)': 'assets/paprika.svg',
      'Cabbage (pcs)': 'assets/cabbage.svg',
      'Lettuce (pcs)': 'assets/lettuce.svg',
      'Cucumber (pcs)': 'assets/cucumber.svg',
      'Brocolli (pcs)': 'assets/broccoli.svg',
      'Parsley (pcs)': 'assets/paprika.svg',
      'Garlic (pcs)': 'assets/garlic.svg',
      'Green': 'assets/recycle-bin-green.svg',
      'Yellow': 'assets/recycle-bin-yellow.svg',
      'Red': 'assets/recycle-bin-red.svg',
      'Lettuce': 'assets/lettuce.svg',
      'Money': 'assets/money.svg',
    };

    final String assetName = assetsMap[name]!;
    final Widget svg = SvgPicture.asset(
      assetName,
    );
    return svg;
  }
}
