import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_expanse/constant/icon.dart';
import 'package:money_expanse/model/ex_category.dart';
import 'package:money_expanse/model/expense.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider with ChangeNotifier {
  String _searchText = '';
  String get searchText => _searchText;
  set searchText(String value) {
    _searchText = value;
    notifyListeners();
    // when value from the searchtext is change it will notify the widgets
  }

  // in-app memories for holding the expense categories temporarily
  List<ExpanseCategory> _expanseCategory = [];
  List<ExpanseCategory> get categories => _expanseCategory;

  List<Expense> _expenase = [];
  // when the search text is empty return whole list, else search the value
  List<Expense> get expanses {
    return _searchText != ''
        ? _expenase
            .where((e) =>
                e.title.toLowerCase().contains(_searchText.toLowerCase()))
            .toList()
        : _expenase;
  }

  Database? _database;
  Future<Database> get database async {
    final dbDirectory = await getDatabasesPath();
    const dbName = 'expanse_mr.db';
    final path = join(dbDirectory, dbName);

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: _createDb,
    );

    return _database!;
  }

  static const cTable = 'catagoryTable';
  static const eTable = 'expanseTable';
  Future<void> _createDb(Database db, int version) async {
    // this method runs only once. when the database is being created
    // so create the tables here and if you want to insert some initial values
    // insert it in this function.
    await db.transaction((txn) async {
      // category table
      await txn.execute('''CREATE TABLE $cTable(
        title TEXT,
        entries INTEGER,
        totalAmount TEXT
      )''');

      // expanse table
      await txn.execute('''CREATE TABLE $eTable(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        amount TEXT,
        date TEXT,
        category TEXT
      )''');

      // insert the initial categories.
      // this will add all the categories to category table and initialize the 'entries' with 0 and 'totalAmount' to 0.0
      for (int i = 0; i < icons.length; i++) {
        await txn.insert(cTable, {
          'title': icons.keys.toList()[i],
          'entries': 0,
          'totalAmount': (0.0).toString(),
        });
      }
    });
  }

  // method to fetch categories

  Future<List<ExpanseCategory>> fetchCategories() async {
    // get the database
    final db = await database;
    return await db.transaction((txn) async {
      return await txn.query(cTable).then((data) {
        // 'data' is our fetched value
        // convert it from "Map<String, object>" to "Map<String, dynamic>"
        final converted = List<Map<String, dynamic>>.from(data);
        // create a 'ExpenseCategory'from every 'map' in this 'converted'
        List<ExpanseCategory> nList = List.generate(converted.length,
            (index) => ExpanseCategory.fromString(converted[index]));
        // set the value of 'categories' to 'nList'
        _expanseCategory = nList;
        // return the '_categories'
        return _expanseCategory;
      });
    });
  }

  Future<void> updateCategories(
    String category,
    int nEntries,
    double nTotalAmount,
  ) async {
    final db = await database;
    await db.transaction((txn) async {
      await txn
          .update(
        cTable,
        {
          'entries': nEntries,
          'amount': nTotalAmount,
        },
        where: 'title == ?',
        whereArgs: [category],
      )
          .then((_) {
        // after updating in database. update it in our in-app memory too.
        var file =
            _expanseCategory.firstWhere((element) => element.title == category);
        file.entries = nEntries;
        file.amount = nTotalAmount;
        notifyListeners();
      });
    });
  }

  Future<void> addExpanse(Expense exp) async {
    final db = await database;
    await db.transaction((txn) async {
      await txn
          .update(
        eTable,
        exp.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      )
          .then((generatedId) {
        final file = Expense(
          id: generatedId,
          title: exp.title,
          amount: exp.amount,
          date: exp.date,
          category: exp.category,
        );

        // add it to '_expenase'
        _expenase.add(file);
        // notify the listeners about the change in value of '_expenase'
        notifyListeners();
        // after we inserted the expense, we need to update the 'entries' and 'totalAmount' of the related 'category'
        var ex = findCategory(exp.category);
        updateCategories(exp.category, ex.entries + 1, ex.amount);
      });
    });
  }

  ExpanseCategory findCategory(String title) {
    return _expanseCategory.firstWhere((element) => element.title == title);
  }

  Future<void> deleteExpanse(int expId, String category, double amount) async {
    final db = await database;
    await db.transaction((txn) async {
      await txn.delete(eTable,
          where: 'id == ?', whereArgs: [expId]).then((_){
            _expenase.removeWhere((element) => element.id == expId);
            notifyListeners();

            var ex = findCategory(category);
            updateCategories(category, ex.entries - 1, ex.amount - amount);
          });
    });
  }

  Future<List<Expense>> fetchExpenses(String category) async {
    final db = await database;
    return await db.transaction((txn) async {
      return await txn.query(eTable,
          where: 'category == ?', whereArgs: [category]).then((data) {
        final converted = List<Map<String, dynamic>>.from(data);
        //
        List<Expense> nList = List.generate(
            converted.length, (index) => Expense.fromString(converted[index]));
        _expenase = nList;
        return _expenase;
      });
    });
  }

  Future<List<Expense>> fetchAllExpenses() async {
    final db = await database;
    return await db.transaction((txn) async {
      return await txn.query(eTable).then((data) {
        final converted = List<Map<String, dynamic>>.from(data);
        List<Expense> nList = List.generate(
            converted.length, (index) => Expense.fromString(converted[index]));
        _expenase = nList;
        return _expenase;
      });
    });
  }

  Map<String, dynamic> calculateEntriesAndAmount(String category) {
    double total = 0.0;
    var list = _expenase.where((element) => element.category == category);
    for (final i in list) {
      total += i.amount;
    }
    return {'entries': list.length, 'totalAmount': total};
  }

  double calculateTotalExpenses() {
    return _expanseCategory.fold(
        0.0, (previousValue, element) => previousValue + element.amount);
  }

  List<Map<String, dynamic>> calculateWeekExpenses() {
    List<Map<String, dynamic>> data = [];

    // we know that we need 7 entries
    for (int i = 0; i < 7; i++) {
      // 1 total for each entry
      double total = 0.0;
      // subtract i from today to get previous dates.
      final weekDay = DateTime.now().subtract(Duration(days: i));

      // check how many transacitons happened that day
      for (int j = 0; j < _expenase.length; j++) {
        if (_expenase[j].date.year == weekDay.year &&
            _expenase[j].date.month == weekDay.month &&
            _expenase[j].date.day == weekDay.day) {
          // if found then add the amount to total
          total += _expenase[j].amount;
        }
      }

      // add to a list
      data.add({'day': weekDay, 'amount': total});
    }
    // return the list
    return data;
  }
}
