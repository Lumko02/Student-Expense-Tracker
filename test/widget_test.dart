import 'package:flutter_test/flutter_test.dart';

import 'package:student_expense_tracker/main.dart';

void main() {
  testWidgets('Student Expense Tracker loads successfully',
          (WidgetTester tester) async {

        await tester.pumpWidget(const StudentExpenseTracker());
        await tester.pumpAndSettle();

        expect(find.byType(StudentExpenseTracker), findsOneWidget);
      });
}
