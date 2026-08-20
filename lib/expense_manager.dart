import 'expense.dart';

class ExpenseManager {
  final List<Expense> expenses = [];
  double budget = 0;

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

  double calculateRemainingBudget() {
    return budget - calculateTotal();
  }

  void deleteExpense(int index) {
    if (index >= 0 && index < expenses.length) {
      expenses.removeAt(index);
    }
  }

  bool hasExpenses() {
    return expenses.isNotEmpty;
  }

  List<Expense> getExpensesByCategory(String category) {
    final result = <Expense>[];

    for (final expense in expenses) {
      if (expense.category == category) {
        result.add(expense);
      }
    }

    return result;
  }

  double calculateCategoryTotal(String category) {
    double total = 0;

    for (final expense in expenses) {
      if (expense.category == category) {
        total += expense.amount;
      }
    }

    return total;
  }

  void editExpense(
      int index,
      String description,
      double amount,
      String category,
      ) {
    if (index >= 0 && index < expenses.length) {
      expenses[index].description = description;
      expenses[index].amount = amount;
      expenses[index].category = category;
    }
  }
}