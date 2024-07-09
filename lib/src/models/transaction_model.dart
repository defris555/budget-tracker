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
}
