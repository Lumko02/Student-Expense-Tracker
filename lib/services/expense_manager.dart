import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/expense.dart';

class ExpenseManager {
  final List<Expense> expenses = [];
  double budget = 0;

  static const String _expensesKey = 'expenses';
  static const String _budgetKey = 'budget';

  Future<void> saveBudget() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_budgetKey, budget);
  }

  Future<void> loadBudget() async {
    final prefs = await SharedPreferences.getInstance();
    budget = prefs.getDouble(_budgetKey) ?? 0;
  }

  Future<void> saveExpenses() async {
    final prefs = await SharedPreferences.getInstance();

    final expenseList = expenses
        .map((expense) => jsonEncode(expense.toJson()))
        .toList();

    await prefs.setStringList(_expensesKey, expenseList);
  }

  Future<void> loadExpenses() async {
    final prefs = await SharedPreferences.getInstance();
    final savedExpenses = prefs.getStringList(_expensesKey);

    if (savedExpenses == null) {
      return;
    }

    expenses.clear();

    for (final savedExpense in savedExpenses) {
      final json = jsonDecode(savedExpense) as Map<String, dynamic>;
      expenses.add(Expense.fromJson(json));
    }
  }

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