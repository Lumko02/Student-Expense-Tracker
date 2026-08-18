import 'package:test/test.dart';
import 'package:student_expense_tracker/expense.dart';
import 'package:student_expense_tracker/expense_manager.dart';

void main() {
  test('Add an expense', () {
    final manager = ExpenseManager();

    final expense = Expense('Lunch', 50.0, 'Food');

    manager.addExpense(expense);

    expect(manager.expenses.length, 1);
  });

  test('Calculate total expenses', () {
    final manager = ExpenseManager();

    manager.addExpense(Expense('Lunch', 50.0, 'Food'));
    manager.addExpense(Expense('Transport', 35.0, 'Transport'));
    manager.addExpense(Expense('Data', 99.0, 'Internet'));

    expect(manager.calculateTotal(), 184.0);
  });

  test('Calculate remaining budget', () {
    final manager = ExpenseManager();

    manager.budget = 2000.0;

    manager.addExpense(Expense('Lunch', 50.0, 'Food'));
    manager.addExpense(Expense('Transport', 35.0, 'Transport'));

    expect(manager.calculateRemainingBudget(), 1915.0);
  });
}