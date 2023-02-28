import 'package:flutter/material.dart';
import 'package:money_expanse/model/database_provider.dart';
import 'package:money_expanse/page/all_expenses.dart';
import 'package:money_expanse/page/categories..dart';
import 'package:money_expanse/page/expenses.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => DatabaseProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: CategoriesScreen.name,
      routes: {
        CategoriesScreen.name: (_) => const CategoriesScreen(),
        ExpenseScreen.name: (_) => const ExpenseScreen(),
        AllExpenses.name: (_) => const AllExpenses(),
      },
    );
  }
}
