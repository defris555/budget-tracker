class Transaction {
  final String id;
  final String name;
  final String type;
  final String category;
  final double price;
  final DateTime date;

  const Transaction({
    required this.id,
    required this.name,
    required this.type,
    required this.category,
    required this.price,
    required this.date,
  });

  Transaction.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        type = map['type'],
        category = map['category'],
        price = map['price'],
        date = DateTime.parse(map['date']);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'category': category,
      'price': price,
      'date': date.toIso8601String(),
    };
  }
}
