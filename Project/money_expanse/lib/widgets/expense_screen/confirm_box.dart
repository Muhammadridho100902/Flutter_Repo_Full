import 'package:flutter/material.dart';
import 'package:money_expanse/model/database_provider.dart';
import 'package:money_expanse/model/expense.dart';
import 'package:provider/provider.dart';

class ConfirmBox extends StatelessWidget {
  final Expense exp;
  const ConfirmBox(this.exp, {super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DatabaseProvider>(context, listen: false);
    return AlertDialog(
      title: Text('Delete ${exp.title}'),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text("Don't Delete"),
          ),
          const SizedBox(
            width: 5,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(true);
              provider.deleteExpanse(exp.id, exp.category, exp.amount);
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
