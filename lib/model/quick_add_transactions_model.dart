class QuickAddTransactions{
  String userId;
  String description;
  int price;
  DateTime time;

  QuickAddTransactions({
    required this.userId,
    required this.description,
    required this.price,
    required this.time,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'description': description,
      'price': price,
      'time': time.toUtc().toIso8601String(), // Convert DateTime to String
    };
  }
}