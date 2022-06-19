import 'package:flutter/material.dart';
import 'dart:math';

import 'widgets/get_logo.dart';

final _random = Random();

class Advice extends StatefulWidget {
  final int index;

  static int getRandomIndex() {
    return _random.nextInt(logos.length);
  }

  static const List<String> logos = [
    'shopping_list',
    'cart',
    'check_list',
    'fridge',
    'Cheese (10g)',
    'date',
    'bank',
    'paper_meat',
    'hot_water',
    'leftover',
    'bread',
    'apple',
    'Brocolli (10g)',
    'herbs',
    'Orange (pcs)',
    'Banana (pcs)',
    'small_bin',
    'husky',
    'jam',
    'zero_bin',
  ];

  static const List<String> titles = [
    'Don\'t go shopping without a list!',
    'Only buy what you need',
    'Always plan your meals in advance',
    'Use the freezer!',
    'So that the cheese does not dry out.',
    'Check the expiration dates',
    'Meet Food Banks!',
    'Use vacuum packaging',
    'Store food in optimal conditions',
    'Use leftovers from dinner',
    'Don\'t throw away the stale bread!',
    'Use all products to the end',
    'Look for healthy substitutes',
    'Freeze the herbs',
    'What to buy - mature or not?',
    'Buy Lonely Bananas!',
    'Do not throw away thoughtlessly!',
    'Donation to animals - yes or no?',
    'Make preserves',
    'Meet the zero waste movement',
  ];

  static const List<String> description = [
    'This is the first and most crucial step to avoid wasting food. When going to the store, always list what you are currently missing. Probably many of us use this rule in order not to forget about any shopping. Still, a carefully prepared list fulfils one more important function: it allows us to focus on buying specific products and prevents useless walking between store shelves and throwing random items into the basket.',
    'Thanks to this significant step, you will learn how to shop effectively. Similar to the previous point, but a bit different. The point is not to reach for any food on impulse (which is why, for example, it is not good to go shopping "hungry"), advertising or recommendation from a friend who urged us to try crab sticks so that we will take them for the sake of peace. However, we do not necessarily dare to eat. Let\'s not be tempted by promotions - why do we need three cubes of butter for the price of 2, a carton of milk for half the price and 2 kg of super-cheap sausage with a short shelf life? First, you have to store it all and then have time to eat it - can we do it?',
    'A shopping list is not enough if you do not know what you plan to prepare from the purchased products. Make a menu for the coming days, for example, for the whole week, and follow it closely. This is not only a way of not wasting food but also an excellent option to save yourself money, work and time, and also lose unnecessary kilograms. It provided that we take a little time to compose a thoughtful, nutritious, balanced menu.',
    'Foods won\'t spoil as quickly if you keep them in the freezer. Keep this in mind, especially with meats, fish, sliced vegetables and fruits. Each device is equipped with an instruction manual (or instructions placed, for example, directly on the door), which advices at what temperatures or on which shelves specific products should be stored. In this way, we will be sure that the products for Thursday lunch bought on Saturday will be fit for use. Remember, however, that freezing (and defrosting!) It must become a habit for us to avoid a situation; only after many months (or even later!) do we realize that we hid something in the freezer.',
    'The characteristic feature of yellow cheese is that it begins to dry and harden after being removed from the packaging. It often ends with throwing away a few slices or a piece cut from a giant nugget. Stop! You can prevent the cheese from drying by covering it with a thin layer of butter.',
    'When shopping, choose products with a more extended expiry date, especially if you know you won\'t be using them immediately. Pay particular attention to the use-by dates of dairy products - if they are short, remember to use them as soon as possible. Remember that the use-by date is not the same as the best-before date! The first one, marked on the packaging with the following formula: "Use by: (date)", is the limit term for perishable products. When it is exceeded, the risk of health hazards increases. On the other hand, the date of minimum durability, which is defined by the words: "Best before: (date)", is a kind of guarantee that until then, the food (usually dry) retains its best features. After this date, its quality may deteriorate, but eating the product does not pose a risk of poisoning.',
    'There are currently Food Banks in Poland, ensuring food goes to those in need. It turns out that food is already wasted at the production or processing stage, i.e. before reaching our homes. The job of Food Banks is to locate the places where food is produced in excess and distribute it to people living in extreme poverty. Private individuals can also donate food to the Food Bank. Remember, however, that these must be products in original, closed packages (i.e. those bought, for example, under the influence of some promotion), and not, for instance, bigos, which were left to us in excess after Christmas.',
    'You can find vacuum packs at most supermarkets and home furnishings. Thanks to them, you will extend the time the products will be able to spend in your fridge and freezer several times!',
    'Find the conditions where the individual products should be stored and follow these guidelines. This will significantly extend the shelf life and prevent it from being thrown out! You don\'t know if the product should be stored in the refrigerator, cupboard, or kitchen counter? The easiest way to find out is to remember the conditions under which it is stored in the store. For example, milk in a carton can be kept in a cupboard, but after opening, it must already be in the refrigerator - the note on the package informs about it.',
    'Lunch is rarely eaten whole - sometimes, we overestimate our options. So you can cook dinner right away with the offer that you will eat it for two days, or you can creatively use what is left. Use the leftovers from your dinner again! Make potato dumplings, sliced tomatoes, cheese, cold meats or vegetables from the pan, use them to make a delicious omelette, shred the roast and add to the salad!',
    'Stale bread often ends up in the garbage. That is entirely wrong because you can easily and quickly prepare delicious casseroles or sweet or savoury toasts. It is also a good idea to dry the bread and then grind it on a grater, thanks to which you will get breadcrumbs.',
    'Throwing out the \'tips\' of products is very common and contributes significantly to food waste - a heel of bread, a carelessly cut pepper, a slightly dry slice of cheese or ham. We cannot fully use the articles for which - if it wasn\'t - we paid with the money we earned.',
    'Look for healthy replacements for everyday products, prepare new dishes and grow. This will help you create a varied menu, open up to new combinations of flavours and indirectly translate into less food waste. You will not be afraid to experiment and combine ingredients unusually!',
    'In summer, it\'s a good idea to freeze fresh, chopped herbs such as basil, dill, and chives. Thanks to this, you will not have to buy basil bushes wrapped in plastic foil in the supermarket (an additional plus for environmental protection!). From this, you will pick only a few leaves to decorate spaghetti. Remember that herbs can be frozen together with butter or oil on an ice tray! The cubes prepared in this way are perfect for frying and seasoning dishes.',
    'Choosing ripe fruit and vegetables requires you to devour them or throw them away. By buying less mature products (e.g. harder tomatoes, green bananas), we will have more time to use them. On the other hand, we need to be aware that very ripe fruit and vegetables may eventually not sell at all, and the store will have to throw them away. Therefore, if we know that we will eat them almost immediately, let\'s choose the softest. So once again, it all depends on our needs.',
    'Have you heard about this action? Often, we want to buy three bananas. What do we do then? We tear off three gorgeous pieces from a bunch of 4 and go to the cash register with satisfaction. Another customer does the same, and as a result, there are individual bananas in the banana crate that no one wants to buy. As you can easily guess, many of them will end up in the garbage can. So the next time you go to the store for three bananas, buy three lonely pieces!',
    'Think about it before you throw it away. If the product is edible, there is always a use for it! Don\'t you feel like eating stuffed cabbage for another day in a row? Call a colleague from work and say that tomorrow you will bring lunch, and give her a dish you have prepared with such dedication!',
    'Some of the leftovers from meals can be given to our pets or, as a last resort, to local cats. But beware - animals cannot eat everything! While groats and scraps of meat are unlikely to harm pets, potatoes, for example, should never end up in a dog\'s or cat\'s bowl. Also, be careful with the spices - they must not be too salty or too spicy!',
    'When you have access to a large amount of fresh fruit, for example, from a plot of land, be sure to use it to prepare preserves. Properly stored, they will last much longer than fresh products, so you do not have to look for fruit for dough or vegetables for salad in winter. However, remember to use all preserves within a year of their production.',
    'The zero-waste ideology was created to reduce food waste and the amount of waste generated. On the pages promoting this lifestyle, you will find even more tricks on saving food and using leftovers in the refrigerator. You will also learn ways to reduce the amount of generated waste - paper, plastic or glass. This is an excellent response to the wasteful lifestyle in which many people are getting lost today.',
  ];

  const Advice({super.key, required this.index});

  @override
  State<Advice> createState() => _AdviceState();
}

class _AdviceState extends State<Advice> {
  bool visible = false;
  Icon icon = const Icon(Icons.expand_more);

  @override
  Widget build(BuildContext context) {
    //index = getIndex(0, 20);
    return Column(
      children: [
        _buildRow(context, Advice.logos[widget.index], Advice.titles[widget.index]),
        if (visible) Text(Advice.description[widget.index])
      ],
    );
  }

  Widget _buildRow(BuildContext context, String label, String value) {
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
          const Spacer(),
          IconButton(
              onPressed: () {
                setState(() {
                  visible = !visible;
                  if (visible) {
                    icon = const Icon(Icons.expand_less);
                  } else {
                    icon = const Icon(Icons.expand_more);
                  }
                });
              },
              icon: icon)
        ],
      ),
    );
  }
}
