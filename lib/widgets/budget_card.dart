import 'package:flutter/material.dart';

class BudgetCard extends StatelessWidget {
  const BudgetCard({
    super.key,
    required this.budget,
    required this.spent,
    required this.remaining,
    required this.progress,
  });

  final double budget;

  final double spent;

  final double remaining;

  final double progress;

  bool get _hasBudget => budget > 0;
  bool get _isOverBudget => _hasBudget && remaining < 0;

  String _money(double value) => 'R ${value.abs().toStringAsFixed(2)}';

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            scheme.primary,
            Color.lerp(scheme.primary, Colors.black, .28)!,
          ],
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 26,
            offset: const Offset(0, 12),
            color: scheme.primary.withValues(alpha: .28),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Spent so far',
            style: TextStyle(
              color: Colors.white.withValues(alpha: .78),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            _money(spent),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 38,
              fontWeight: FontWeight.w900,
              letterSpacing: -.5,
            ),
          ),
          const SizedBox(height: 20),
          if (!_hasBudget)
            _NoBudgetHint(scheme: scheme)
          else ...[
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 9,
                backgroundColor: Colors.white.withValues(alpha: .22),
                valueColor: AlwaysStoppedAnimation(
                  _isOverBudget ? const Color(0xFFFF8A80) : Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _Stat(label: 'Budget', value: _money(budget)),
                _Stat(
                  label: _isOverBudget ? 'Over by' : 'Left',
                  value: _money(remaining),
                  alignEnd: true,
                  highlight: _isOverBudget,
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _NoBudgetHint extends StatelessWidget {
  const _NoBudgetHint({required this.scheme});

  final ColorScheme scheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: .16),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.account_balance_wallet_rounded,
            color: Colors.white,
            size: 20,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              'Set a monthly budget to track what you have left.',
              style: TextStyle(
                color: Colors.white.withValues(alpha: .92),
                fontWeight: FontWeight.w600,
                height: 1.3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat({
    required this.label,
    required this.value,
    this.alignEnd = false,
    this.highlight = false,
  });

  final String label;
  final String value;
  final bool alignEnd;
  final bool highlight;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
      alignEnd ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withValues(alpha: .72),
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          value,
          style: TextStyle(
            color: highlight ? const Color(0xFFFF8A80) : Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}
