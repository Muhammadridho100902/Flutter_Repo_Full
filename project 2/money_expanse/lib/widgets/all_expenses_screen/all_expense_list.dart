import 'package:flutter/material.dart';
import 'package:money_expanse/model/database_provider.dart';
import 'package:money_expanse/widgets/expense_screen/expense_card.dart';
import 'package:provider/provider.dart';

class AllExpenseList extends StatelessWidget {
  const AllExpenseList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (_, db, __) {
        var list = db.expanses;
        return list.isNotEmpty
            ? ListView.builder(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: list.length,
                itemBuilder: (_, i) => ExpenseCard(list[i]),
              )
            : const Center(
                child: Text("No Entries Found"),
              );
      },
    );
  }
}
