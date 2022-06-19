library doof_app.globals;
import 'models/summary_item.dart';

List<SummaryItem> tempItems =[];

List<SummaryItem> summaryItems = [
    // SummaryItem(name: 'Lemon (pcs)', quantity: 2, reason: 'Too much'),
    // SummaryItem(name: 'Peach (pcs)', quantity: 5, reason: 'Too much'),
    ];

updateItemsQuanitity(String name, int pcs) {
  final index = summaryItems.indexWhere((item) => item.name == name);
  if (index != -1) {
    summaryItems[index].quantity = pcs;
  }
}

updateItemsReason(String name, String reason) {
  final index = summaryItems.indexWhere((item) => item.name == name);
  if (index != -1) {
    summaryItems[index].reason = reason;
  }
}

updateTempItem(String name, int pcs) {
  final index = tempItems.indexWhere((item) => item.name == name);
  if (index != -1) {
    tempItems[index].quantity = pcs;
  }
  else
  {
    tempItems.add(SummaryItem(name: name, quantity: pcs, reason: 'Too big groceries'));
  }
}


