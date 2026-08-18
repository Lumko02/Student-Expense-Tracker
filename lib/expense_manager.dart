import 'expense.dart';

class ExpenseManager {
  final List<Expense> expenses = [];

  void addExpense(Expense expense) {
    expenses.add(expense);
  }

  double calculateTotal() {
    double total = 0;

    for (final expense in expenses) {
      total += expense.amount;
    }
    return total;
  }
}