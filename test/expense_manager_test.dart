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

  test('Delete an expense', () {
    final manager = ExpenseManager();

    manager.addExpense(Expense('Lunch', 50.0, 'Food'));
    manager.addExpense(Expense('Transport', 35.0, 'Transport'));
    manager.addExpense(Expense('Data', 99.0, 'Internet'));

    manager.deleteExpense(1);

    expect(manager.expenses.length, 2);
    expect(manager.expenses[0].description, 'Lunch');
    expect(manager.expenses[1].description, 'Data');
  });

  test('Do not delete an expense with an invalid index', () {
    final manager = ExpenseManager();

    manager.addExpense(Expense('Lunch', 50.0, 'Food'));

    manager.deleteExpense(5);

    expect(manager.expenses.length, 1);
  });

  test('Check if expenses exist', () {
    final manager = ExpenseManager();

    expect(manager.hasExpenses(), false);

    manager.addExpense(
      Expense('Lunch', 50.0, 'Food'),
    );

    expect(manager.hasExpenses(), true);
  });

  test('Get expenses by category', () {
    final manager = ExpenseManager();

    manager.addExpense(
      Expense('Lunch', 50.0, 'Food'),
    );

    manager.addExpense(
      Expense('Uber', 100.0, 'Transport'),
    );

    manager.addExpense(
      Expense('Takeaway', 80.0, 'Food'),
    );

    final foodExpenses = manager.getExpensesByCategory('Food');

    expect(foodExpenses.length, 2);
    expect(foodExpenses[0].description, 'Lunch');
    expect(foodExpenses[1].description, 'Takeaway');
  });

  test('Calculate total for a category', () {
    final manager = ExpenseManager();

    manager.addExpense(
      Expense('Lunch', 50.0, 'Food'),
    );

    manager.addExpense(
      Expense('Takeaway', 80.0, 'Food'),
    );

    manager.addExpense(
      Expense('Uber', 100.0, 'Transport'),
    );

    expect(manager.calculateCategoryTotal('Food'), 130.0);
    expect(manager.calculateCategoryTotal('Transport'), 100.0);
  });

  test('Edit an expense', () {
    final manager = ExpenseManager();

    manager.addExpense(
      Expense('Lunch', 50.0, 'Food'),
    );

    manager.editExpense(
      0,
      'Dinner',
      80.0,
      'Food',
    );

    expect(manager.expenses[0].description, 'Dinner');
    expect(manager.expenses[0].amount, 80.0);
    expect(manager.expenses[0].category, 'Food');
  });
}