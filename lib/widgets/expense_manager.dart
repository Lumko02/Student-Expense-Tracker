import 'expense.dart';

class ExpenseManager {
  final List<Expense> expenses = [];

  double budget = 0.0;

  void addExpense(Expense expense) {
    expenses.add(expense);
  }

  double calculateTotal() {
    return expenses.fold(
      0.0,
          (total, expense) => total + expense.amount,
    );
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
    return expenses
        .where((expense) => expense.category == category)
        .toList();
  }

  double calculateCategoryTotal(String category) {
    return getExpensesByCategory(category).fold(
      0.0,
          (total, expense) => total + expense.amount,
    );
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