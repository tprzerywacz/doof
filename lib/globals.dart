library doof_app.globals;

import 'package:flutter/foundation.dart';

import 'models/summary_item.dart';

final summaryItems = SummaryItemsRepository();

class SummaryItemsRepository with ChangeNotifier {
  List<SummaryItem> tempItems = [];
  List<SummaryItem> items = [];

  int get count {
    final itemCount = items.isEmpty ? 0 : items.map<int>((e) => e.quantity).reduce((v, e) => v + e);
    final tempCount = tempItems.isEmpty ? 0 : tempItems.map<int>((e) => e.quantity).reduce((v, e) => v + e);
    return itemCount + tempCount;
  }

  updateItemsQuanitity(String name, int pcs) {
    final index = items.indexWhere((item) => item.name == name);
    if (index != -1) {
      items[index].quantity = pcs;
      notifyListeners();
    }
  }

  updateItemsReason(String name, String reason) {
    final index = items.indexWhere((item) => item.name == name);
    if (index != -1) {
      items[index].reason = reason;
      notifyListeners();
    }
  }

  updateTempItem(String name, int pcs) {
    final index = tempItems.indexWhere((item) => item.name == name);
    if (index != -1) {
      tempItems[index].quantity = pcs;
    } else {
      tempItems.add(SummaryItem(name: name, quantity: pcs, reason: 'Too big groceries'));
    }
    notifyListeners();
  }

  void clearTempItems() {
    tempItems.clear();
    notifyListeners();
  }

  void clearItems() {
    items.clear();
    notifyListeners();
  }

  void moveToTrash() {
    for (var item in tempItems) {
      items.add(item);
    }
    clearTempItems();
  }
}
