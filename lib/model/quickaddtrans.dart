class QuickAddTransaction {
  late String uid;
  late String description;
  late double price;
  late DateTime time;

  QuickAddTransaction(this.uid, this.description, this.price, this.time);

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'description': description,
      'price': price,
      'time': time.toUtc().toIso8601String(),
    };
  }
}
