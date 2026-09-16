import 'package:student_expense_tracker/models/expense.dart';
import 'package:test/test.dart';

void main() {
  test('Create an expense', () {
    final expense = Expense('Lunch', 50.0, 'Food');

    expect(expense.description, 'Lunch');
    expect(expense.amount, 50.0);
    expect(expense.category, 'Food');
  });

  test('Expense has a readable description', () {
    final expense = Expense('Lunch', 50.0, 'Food');

    expect(expense.toString(), 'Lunch - R50.0 - Food');
  });
}