import 'package:flutter/material.dart';
import 'package:money_expanse/model/database_provider.dart';
import 'package:money_expanse/widgets/expense_screen/expense_list.dart';
import 'package:provider/provider.dart';

class ExpenseFetcher extends StatefulWidget {
  final String category;
  const ExpenseFetcher(this.category, {super.key});

  @override
  State<ExpenseFetcher> createState() => _ExpenseFetcherState();
}

class _ExpenseFetcherState extends State<ExpenseFetcher> {
  late Future _expenseList;
  Future _getExpenseList() async {
    final provider = Provider.of<DatabaseProvider>(context, listen: false);
    return await provider.fetchExpenses(widget.category);
  }

  @override
  void initState() {
    super.initState();
    _expenseList = _getExpenseList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _expenseList,
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()),);
          } else {
            return Column(
              children: const [
                SizedBox(height: 250, child: ExpenseList(),), Expanded(child: ExpenseList())
              ],
            );
          }
        } else {
          return const Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }
}
