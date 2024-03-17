import 'dart:convert';

class Expense {
  int methodID;
  int eCategoryID;
  String title;
  String? description;
  int amount;
  int accountID;
  DateTime date;

  Expense({
    required this.methodID,
    required this.eCategoryID,
    required this.title,
    this.description,
    required this.amount,
    required this.accountID,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'MethodID': methodID,
      'ECategoryID': eCategoryID,
      'Title': title,
      'Description': description,
      'Amount': amount,
      'AccountID': accountID,
    };
  }

  String toJson() {
    Map<String, dynamic> expensesMap = toMap();
    return jsonEncode(expensesMap);
  }
}
