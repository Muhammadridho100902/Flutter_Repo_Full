import 'package:flutter/material.dart';
import 'package:money_expanse/model/database_provider.dart';
import 'package:money_expanse/widgets/expense_screen/expense_card.dart';
import 'package:provider/provider.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (_, db, __) {
        var exList = db.expanses;
        return exList.isNotEmpty  ? ListView.builder(
                itemCount: exList.length,
                itemBuilder: (_, i) => ExpenseCard(exList[i])) :  const Center(
                child: Text('No Expenses Added'),
              );
      },
    );
  }
}
