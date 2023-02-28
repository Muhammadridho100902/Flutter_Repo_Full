

import 'package:flutter/material.dart';
import 'package:money_expanse/model/database_provider.dart';
import 'package:money_expanse/widgets/all_expenses_screen/all_expense_list.dart';
import 'package:money_expanse/widgets/all_expenses_screen/expense_search.dart';
import 'package:provider/provider.dart';

class AllExpenseFetcher extends StatefulWidget {
  const AllExpenseFetcher({super.key});

  @override
  State<AllExpenseFetcher> createState() => _AllExpenseFetcherState();
}

class _AllExpenseFetcherState extends State<AllExpenseFetcher> {

  late Future _allExpenseList;

  Future _getAllExpense() async {
    final provider = Provider.of<DatabaseProvider>(context, listen: false);
    return await provider.fetchAllExpenses();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _allExpenseList = _getAllExpense();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _allExpenseList,
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()),);
          } else {
            return Column(
              children: const [
                ExpenseSearch(),
                Expanded(child: AllExpenseList())
              ],
            );
          }
        } else {
          return const Center(child: CircularProgressIndicator(),);
        }
    },);
  }
}