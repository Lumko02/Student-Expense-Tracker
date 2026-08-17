import 'package:test/test.dart';
import 'package:student_expense_tracker/expense.dart';

void main() {
  test('Create an expense', () {
    final expense = Expense('Lunch', 50.0, 'Food');

    expect(expense.description, 'Lunch');
    expect(expense.amount, 50.0);
    expect(expense.category, 'Food');
  });
}