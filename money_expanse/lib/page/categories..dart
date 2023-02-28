import 'package:flutter/material.dart';
import 'package:money_expanse/widgets/category_screen/category_fetcher.dart';
import 'package:money_expanse/widgets/expense_form.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  static const name = '/category_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: const CategoryFetcher(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showBottomSheet(
            context: context,
            builder: (_) => const ExpenseForm(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
