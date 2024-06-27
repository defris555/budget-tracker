class Transaction {
  final String name;
  final String type;
  final String category;
  final double price;
  final DateTime date;

  const Transaction({
    required this.name,
    required this.type,
    required this.category,
    required this.price,
    required this.date,
  });

  factory Transaction.fromMap(Map<String, dynamic> map) {
    final properties = map['properties'] as Map<String, dynamic>;
    final dateStr = properties['Date']?['date']?['start'];
    return Transaction(
      name: properties['Name']?['title']?[0]?['plain_text'] ?? '?',
      type: properties['Type']?['select']?['name'] ?? 'Any',
      category: properties['Category']?['select']?['name'] ?? 'Any',
      price: (properties['Price']?['number'] ?? 0).toDouble(),
      date: dateStr != null ? DateTime.parse(dateStr) : DateTime.now(),
    );
  }
}
