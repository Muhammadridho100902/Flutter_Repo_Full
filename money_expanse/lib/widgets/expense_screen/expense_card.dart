import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_expanse/constant/icon.dart';
import 'package:money_expanse/model/expense.dart';
import 'package:money_expanse/widgets/expense_screen/confirm_box.dart';

class ExpenseCard extends StatelessWidget {
  final Expense exp;
  const ExpenseCard(this.exp, {super.key});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(exp.id),
      confirmDismiss: (_) async {
        showDialog(
          context: context,
          builder: (_) => ConfirmBox(exp),
        );
      },
      child: ListTile(
        leading: Padding(
          padding: EdgeInsets.all(8),
          child: Icon(
            icons[exp.category],
          ),
        ),
        title: Text(exp.title),
        subtitle: Text(DateFormat('MMMM dd, yyyy').format(exp.date)),
        trailing: Text(NumberFormat.currency(locale: 'en_IN', symbol: 'Rp.').format(exp.amount)),
      ),
    );
  }
}
