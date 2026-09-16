class Expense {
  String description;
  double amount;
  String category;

  Expense(this.description, this.amount, this.category);

  @override
  String toString() {
    return '$description - R$amount - $category';
  }
}