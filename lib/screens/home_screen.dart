import 'package:flutter/material.dart';
import '../models/expense.dart';
import '../services/expense_manager.dart';
import '../widgets/budget_card.dart';
import '../widgets/expense_card.dart';

class ExpenseHomePage extends StatefulWidget {
  const ExpenseHomePage({super.key});

  @override
  State<ExpenseHomePage> createState() => _ExpenseHomePageState();
}

class _ExpenseHomePageState extends State<ExpenseHomePage> {
  final ExpenseManager _manager = ExpenseManager();

  @override
  void initState() {
    super.initState();
    _loadExpenses();
  }

  Future<void> _loadExpenses() async {
    await _manager.loadExpenses();
    await _manager.loadBudget();

    if (!mounted) return;

    setState(() {});
  }

  final _descriptionController = TextEditingController();
  final _amountController = TextEditingController();
  final _budgetController = TextEditingController();

  final List<String> _categories = [
    'Food',
    'Transport',
    'Entertainment',
    'Study',
    'Other',
  ];

  String _selectedCategory = 'Food';
  String _selectedFilter = 'All';

  IconData _categoryIcon(String category) {
    switch (category) {
      case 'Food':
        return Icons.restaurant_rounded;
      case 'Transport':
        return Icons.directions_bus_rounded;
      case 'Entertainment':
        return Icons.movie_rounded;
      case 'Study':
        return Icons.school_rounded;
      default:
        return Icons.receipt_long_rounded;
    }
  }

  List<Expense> get _filteredExpenses {
    if (_selectedFilter == 'All') return _manager.expenses;
    return _manager.getExpensesByCategory(_selectedFilter);
  }

  double get _total => _manager.calculateTotal();
  double get _remaining => _manager.calculateRemainingBudget();

  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      );
  }

  Future<void> _setBudget() async {
    final budget = double.tryParse(_budgetController.text.trim());

    if (budget == null || budget <= 0) {
      _showMessage('Please enter a valid budget amount.');
      return;
    }

    setState(() => _manager.budget = budget);

    await _manager.saveBudget();

    _budgetController.clear();
    _showMessage('Budget updated successfully ✨');
  }

  Future<void> _addExpense() async {
    final description = _descriptionController.text.trim();
    final amount = double.tryParse(_amountController.text.trim());

    if (description.isEmpty || amount == null || amount <= 0) {
      _showMessage('Please enter a valid description and amount.');
      return;
    }

    setState(() {
      _manager.addExpense(
        Expense(description, amount, _selectedCategory),
      );
    });

    await _manager.saveExpenses();

    _descriptionController.clear();
    _amountController.clear();
    _showMessage('Expense added successfully 💸');
  }

  Future<void> _showAddExpenseSheet() async {
    _descriptionController.clear();
    _amountController.clear();

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) {
        String category = _selectedCategory;

        return StatefulBuilder(
          builder: (context, setSheetState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Container(
                padding: const EdgeInsets.fromLTRB(22, 14, 22, 24),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 42,
                          height: 4,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 22),
                      Text(
                        'Add an expense',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Keep track of where your money goes.',
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                      const SizedBox(height: 22),
                      TextField(
                        controller: _descriptionController,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: const InputDecoration(
                          labelText: 'What did you spend on?',
                          prefixIcon: Icon(Icons.edit_note_rounded),
                        ),
                      ),
                      const SizedBox(height: 14),
                      TextField(
                        controller: _amountController,
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        decoration: const InputDecoration(
                          labelText: 'Amount',
                          prefixText: 'R ',
                          prefixIcon: Icon(Icons.payments_rounded),
                        ),
                      ),
                      const SizedBox(height: 14),
                      DropdownButtonFormField<String>(
                        initialValue: category,
                        decoration: const InputDecoration(
                          labelText: 'Category',
                          prefixIcon: Icon(Icons.category_rounded),
                        ),
                        items: _categories
                            .map(
                              (item) => DropdownMenuItem(
                            value: item,
                            child: Text(item),
                          ),
                        )
                            .toList(),
                        onChanged: (value) {
                          if (value != null) {
                            setSheetState(() => category = value);
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 54,
                        child: FilledButton.icon(
                          onPressed: () async {
                            _selectedCategory = category;
                            await _addExpense();

                            if (sheetContext.mounted) {
                              Navigator.pop(sheetContext);
                            }
                          },
                          icon: const Icon(Icons.add_rounded),
                          label: const Text(
                            'Add Expense',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _editExpense(int index) async {
    final expense = _manager.expenses[index];
    final descriptionController =
    TextEditingController(text: expense.description);
    final amountController =
    TextEditingController(text: expense.amount.toStringAsFixed(2));
    String category = expense.category;

    await showDialog<void>(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: const Text(
            'Edit expense',
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
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
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Amount',
                    prefixText: 'R ',
                  ),
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  initialValue: category,
                  decoration: const InputDecoration(labelText: 'Category'),
                  items: _categories
                      .map(
                        (item) => DropdownMenuItem(
                      value: item,
                      child: Text(item),
                    ),
                  )
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setDialogState(() => category = value);
                    }
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () async {
                final description = descriptionController.text.trim();
                final amount = double.tryParse(amountController.text);

                if (description.isEmpty || amount == null || amount <= 0) {
                  return;
                }

                setState(() {
                  _manager.editExpense(
                    index,
                    description,
                    amount,
                    category,
                  );
                });

                await _manager.saveExpenses();

                if (!mounted || !dialogContext.mounted) return;

                Navigator.pop(dialogContext);
                _showMessage('Expense updated ✨');
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );

    descriptionController.dispose();
    amountController.dispose();
  }

  Future<void> _confirmDelete(int index) async {
    final expense = _manager.expenses[index];

    final shouldDelete = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete expense?'),
        content: Text(
          'Remove "${expense.description}" from your expenses?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (shouldDelete == true) {
      setState(() => _manager.deleteExpense(index));

      await _manager.saveExpenses();

      if (!mounted) return;

      _showMessage('Expense deleted');
    }
  }

  Widget _buildBudgetEditor() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black.withValues(alpha: .05),
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Monthly budget',
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _budgetController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'e.g. 2500',
                    prefixText: 'R ',
                  ),
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                height: 54,
                child: FilledButton(
                  onPressed: _setBudget,
                  child: const Text('Update'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFilters() {
    final filters = ['All', ..._categories];

    return SizedBox(
      height: 43,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final category = filters[index];
          final selected = _selectedFilter == category;

          return ChoiceChip(
            label: Text(category),
            selected: selected,
            showCheckmark: false,
            labelStyle: TextStyle(
              fontWeight: FontWeight.w700,
              color: selected ? Colors.white : Colors.grey.shade700,
            ),
            selectedColor: Theme.of(context).colorScheme.primary,
            backgroundColor: Colors.white,
            side: BorderSide.none,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            onSelected: (_) {
              setState(() => _selectedFilter = category);
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final progress = _manager.budget <= 0
        ? 0.0
        : (_total / _manager.budget).clamp(0.0, 1.0);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        titleSpacing: 20,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'My Expenses',
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
            Text(
              'Student Expense Tracker',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'Set budget',
            onPressed: () => showModalBottomSheet<void>(
              context: context,
              showDragHandle: true,
              builder: (context) => Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
                child: _buildBudgetEditor(),
              ),
            ),
            icon: const Icon(Icons.account_balance_wallet_rounded),
          ),
          const SizedBox(width: 8),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showAddExpenseSheet,
        icon: const Icon(Icons.add_rounded),
        label: const Text(
          'Add Expense',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async => setState(() {}),
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 100),
            children: [
              BudgetCard(
                budget: _manager.budget,
                spent: _total,
                remaining: _remaining,
                progress: progress,
              ),
              const SizedBox(height: 22),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Transactions',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    '${_manager.expenses.length} total',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              _buildFilters(),
              const SizedBox(height: 14),
              if (_filteredExpenses.isEmpty)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 50,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.receipt_long_rounded,
                        size: 60,
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withValues(alpha: .65),
                      ),
                      const SizedBox(height: 14),
                      const Text(
                        'No expenses yet',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Tap “Add Expense” to record your first purchase.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                )
              else
                ..._filteredExpenses.map((expense) {
                  final originalIndex =
                  _manager.expenses.indexOf(expense);

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: ExpenseCard(
                      expense: expense,
                      icon: _categoryIcon(expense.category),
                      onEdit: () => _editExpense(originalIndex),
                      onDelete: () => _confirmDelete(originalIndex),
                    ),
                  );
                }),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _amountController.dispose();
    _budgetController.dispose();
    super.dispose();
  }
}