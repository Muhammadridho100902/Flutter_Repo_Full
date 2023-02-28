import 'package:drift/drift.dart';

// @DataClassName('Transaction')
class Transactions extends Table{

  // write query here

  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(max: 200)();
  IntColumn get categoryId => integer()();
  IntColumn get amount => integer()();
  DateTimeColumn get transactionDate => dateTime()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
}