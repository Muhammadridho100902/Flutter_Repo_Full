

import 'package:flutter/material.dart';
import 'package:money_expanse/widgets/all_expenses_screen/all_expense_fetcher.dart';

class AllExpenses extends StatefulWidget {
  const AllExpenses({super.key});

  static const name = '/all_expenses';

  @override
  State<AllExpenses> createState() => _AllExpensesState();
}

class _AllExpensesState extends State<AllExpenses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All Expenses')),
      body: const AllExpenseFetcher(),
    );
  }
}