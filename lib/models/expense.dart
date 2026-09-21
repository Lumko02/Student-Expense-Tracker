class Expense {
  String description;
  double amount;
  String category;

  Expense(this.description, this.amount, this.category);

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'amount': amount,
      'category': category,
    };
  }

  factory Expense.fromJson(Map<String, dynamic> json) {
    return Expense(
      json['description'] as String,
      (json['amount'] as num).toDouble(),
      json['category'] as String,
    );
  }

  @override
  String toString() {
    return '$description - R$amount - $category';
  }
}