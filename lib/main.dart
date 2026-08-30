import 'package:flutter/material.dart';
import 'expense.dart';
import 'expense_manager.dart';

void main() {
runApp(const StudentExpenseTracker());
}

class StudentExpenseTracker extends StatelessWidget {
const StudentExpenseTracker({super.key});

@override
Widget build(BuildContext context) {
return MaterialApp(
debugShowCheckedModeBanner: false,
title: 'Student Expense Tracker',
theme: ThemeData(
colorScheme: ColorScheme.fromSeed(
seedColor: Colors.deepPurple,
),
useMaterial3: true,
),
home: const ExpenseHomePage(),
);
}
}

class ExpenseHomePage extends StatefulWidget {
const ExpenseHomePage({super.key});

@override
State<ExpenseHomePage> createState() => _ExpenseHomePageState();
}

class _ExpenseHomePageState extends State<ExpenseHomePage> {
final ExpenseManager _expenseManager = ExpenseManager();

final TextEditingController _descriptionController =
TextEditingController();

final TextEditingController _amountController =
TextEditingController();

String _selectedCategory = 'Food';

final List<String> _categories = [
'Food',
'Transport',
'Entertainment',
'Study',
'Other',
];

void _addExpense() {
final description = _descriptionController.text.trim();
final amount = double.tryParse(_amountController.text);

if (description.isEmpty || amount == null || amount <= 0) {
ScaffoldMessenger.of(context).showSnackBar(
const SnackBar(
content: Text(
'Please enter a valid description and amount.',
),
),
);
return;
}

final expense = Expense(
description,
amount,
_selectedCategory,
);

setState(() {
_expenseManager.addExpense(expense);
});

_descriptionController.clear();
_amountController.clear();

ScaffoldMessenger.of(context).showSnackBar(
const SnackBar(
content: Text('Expense added successfully!'),
),
);
}

void _deleteExpense(int index) {
setState(() {
_expenseManager.deleteExpense(index);
});
}

void _editExpense(int index) {
final expense = _expenseManager.expenses[index];

final descriptionController = TextEditingController(
text: expense.description,
);

final amountController = TextEditingController(
text: expense.amount.toString(),
);

String selectedCategory = expense.category;

showDialog(
context: context,
builder: (context) {
return StatefulBuilder(
builder: (context, setDialogState) {
return AlertDialog(
title: const Text('Edit Expense'),
content: SingleChildScrollView(
child: Column(
mainAxisSize: MainAxisSize.min,
children: [
TextField(
controller: descriptionController,
decoration: const InputDecoration(
labelText: 'Description',
),
),
const SizedBox(height: 12),
TextField(
controller: amountController,
keyboardType:
const TextInputType.numberWithOptions(
decimal: true,
),
decoration: const InputDecoration(
labelText: 'Amount',
),
),
const SizedBox(height: 12),
DropdownButtonFormField<String>(
value: selectedCategory,
decoration: const InputDecoration(
labelText: 'Category',
),
items: _categories.map((category) {
return DropdownMenuItem(
value: category,
child: Text(category),
);
}).toList(),
onChanged: (value) {
if (value != null) {
setDialogState(() {
selectedCategory = value;
});
}
},
),
],
),
),
actions: [
TextButton(
onPressed: () {
Navigator.pop(context);
},
child: const Text('Cancel'),
),
ElevatedButton(
onPressed: () {
final description =
descriptionController.text.trim();

final amount =
double.tryParse(amountController.text);

if (description.isEmpty ||
amount == null ||
amount <= 0) {
return;
}

setState(() {
_expenseManager.editExpense(
index,
description,
amount,
selectedCategory,
);
});

Navigator.pop(context);
},
child: const Text('Save'),
),
],
);
},
);
},
);
}

IconData _getCategoryIcon(String category) {
switch (category) {
case 'Food':
return Icons.restaurant;
case 'Transport':
return Icons.directions_bus;
case 'Entertainment':
return Icons.movie;
case 'Study':
return Icons.school;
default:
return Icons.receipt;
}
}

@override
void dispose() {
_descriptionController.dispose();
_amountController.dispose();
super.dispose();
}

@override
Widget build(BuildContext context) {
final expenses = _expenseManager.expenses;
final total = _expenseManager.calculateTotal();

return Scaffold(
appBar: AppBar(
title: const Text('Student Expense Tracker'),
centerTitle: true,
),
body: Padding(
padding: const EdgeInsets.all(16),
child: Column(
children: [
Card(
child: Padding(
padding: const EdgeInsets.all(20),
child: Column(
children: [
const Text(
'Total Expenses',
style: TextStyle(
fontSize: 18,
fontWeight: FontWeight.bold,
),
),
const SizedBox(height: 8),
Text(
'R${total.toStringAsFixed(2)}',
style: Theme.of(context)
    .textTheme
    .headlineMedium
    ?.copyWith(
fontWeight: FontWeight.bold,
),
),
],
),
),
),

const SizedBox(height: 16),

TextField(
controller: _descriptionController,
decoration: const InputDecoration(
labelText: 'Description',
hintText: 'e.g. Lunch',
border: OutlineInputBorder(),
prefixIcon: Icon(Icons.description),
),
),

const SizedBox(height: 12),

TextField(
controller: _amountController,
keyboardType: const TextInputType.numberWithOptions(
decimal: true,
),
decoration: const InputDecoration(
labelText: 'Amount',
hintText: 'e.g. 50.00',
border: OutlineInputBorder(),
prefixIcon: Icon(Icons.attach_money),
),
),

const SizedBox(height: 12),

DropdownButtonFormField<String>(
value: _selectedCategory,
decoration: const InputDecoration(
labelText: 'Category',
border: OutlineInputBorder(),
prefixIcon: Icon(Icons.category),
),
items: _categories.map((category) {
return DropdownMenuItem(
value: category,
child: Text(category),
);
}).toList(),
onChanged: (value) {
if (value != null) {
setState(() {
_selectedCategory = value;
});
}
},
),

const SizedBox(height: 12),

SizedBox(
width: double.infinity,
child: ElevatedButton.icon(
onPressed: _addExpense,
icon: const Icon(Icons.add),
label: const Text('Add Expense'),
),
),

const SizedBox(height: 20),

Expanded(
child: _expenseManager.hasExpenses()
? ListView.builder(
itemCount: expenses.length,
itemBuilder: (context, index) {
final expense = expenses[index];

return Card(
child: ListTile(
leading: CircleAvatar(
child: Icon(
_getCategoryIcon(
expense.category,
),
),
),
title: Text(
expense.description,
style: const TextStyle(
fontWeight: FontWeight.bold,
),
),
subtitle: Text(
expense.category,
),
trailing: Row(
mainAxisSize: MainAxisSize.min,
children: [
Text(
'R${expense.amount.toStringAsFixed(2)}',
style: const TextStyle(
fontWeight: FontWeight.bold,
),
),
IconButton(
icon: const Icon(Icons.edit),
tooltip: 'Edit',
onPressed: () {
_editExpense(index);
},
),
IconButton(
icon: const Icon(Icons.delete),
tooltip: 'Delete',
onPressed: () {
_deleteExpense(index);
},
),
],
),
),
);
},
)
    : const Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Icon(
Icons.receipt_long,
size: 64,
),
SizedBox(height: 12),
Text(
'No expenses yet.',
style: TextStyle(fontSize: 18),
),
SizedBox(height: 4),
Text(
'Add your first expense above.',
),
],
),
),
),
],
),
),
);
}
}
