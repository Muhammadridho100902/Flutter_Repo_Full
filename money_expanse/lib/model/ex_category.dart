import 'package:flutter/cupertino.dart';

class ExpanseCategory {
  final String title;
  int entries =
      0; // seberapa banyak pengeluaran di categori ini, dan akan berubah"
  double amount = 0.0; // seberapa banyak pengeluaran itu
  final IconData icon; // untuk pendefinisian icon

  // constructor dari class expansecategory
  ExpanseCategory(
      {this.title,
      this.entries,
      this.amount,
      this.icon});

  // we need a method to convert this to a map
  // so we can insert it into a database
  Map<String, dynamic> toMap() => {
        'title': title,
        'entries': entries,
        'amount': amount,
        'icon': icon
            .toString() // our database wont able to store double values so we convert to string
      };

  // when we retrive the data it will be a map
  // for our data to understand that, we need to convert back to a 'Expense Category'
  factory ExpanseCategory.fromString(Map<String, dynamic> value) => ExpanseCategory(
        title: value['title'],
        entries: value['entries'],
        amount: value['amount'],
        icon: value['icon'],
      );
}
