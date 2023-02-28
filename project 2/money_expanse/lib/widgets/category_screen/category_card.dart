import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_expanse/model/ex_category.dart';

class CategoryCard extends StatelessWidget {
  final ExpanseCategory category;
  const CategoryCard(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        // Navigator.of(context).pushNamed(ExpanseScreen.name, arguments: category.title);
      },
      leading: Icon(category.icon),
      title: Text(category.title),
      subtitle: Text('entries: ${category.entries}'),
      trailing: Text(
        NumberFormat.currency(locale: 'en_IN', symbol: '\$')
            .format(category.amount),
      ),
    );
  }
}
