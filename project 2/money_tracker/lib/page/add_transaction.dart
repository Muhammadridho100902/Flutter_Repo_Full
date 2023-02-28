import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:money_tracker/models/database.dart';
import 'package:money_tracker/models/transaction_with_category.dart';

class AddTransaction extends StatefulWidget {
  final TransactionWithCategory? transactionsWithCategory;
  const AddTransaction({Key? key, required this.transactionsWithCategory})
      : super(key: key);

  @override
  State<AddTransaction> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<AddTransaction> {
  bool isExpense = true;
  late int type;
  final AppDb database = AppDb();
  Category? selectedCategory;
  TextEditingController dateController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Future insertData(
      String description, int categoryId, int amount, DateTime date) async {
    DateTime now = DateTime.now();
    final row = await database.into(database.transactions).insertReturning(
        TransactionsCompanion.insert(
            name: description,
            categoryId: categoryId,
            amount: amount,
            transactionDate: date,
            createdAt: now,
            updatedAt: now));
  }

  @override
  void initState() {
    // TODO: implement initState
    if (widget.transactionsWithCategory != null) {
      updateTransaction(widget.transactionsWithCategory!);
    } else {
      type = 2;

      dateController.text = "";
    }

    super.initState();
  }

  Future<List<Category>> getAllCategory(int type) async {
    return await database.getAllCategoryRepo(type);
  }

  void updateTransaction(TransactionWithCategory initTransaction) {
    amountController.text = initTransaction.transaction.amount.toString();
    descriptionController.text =
        initTransaction.transaction.name.toString();
    dateController.text = DateFormat('yyyy-MM-dd')
        .format(initTransaction.transaction.transactionDate);
    type = initTransaction.category.type;
    (type == 2) ? isExpense = true : isExpense = false;
    selectedCategory = initTransaction.category;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Transacrtion")),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Switch(
                  // This bool value toggles the switch.
                  value: isExpense,
                  inactiveTrackColor: Colors.green[200],
                  inactiveThumbColor: Colors.green,
                  activeColor: Colors.red,
                  onChanged: (bool value) {
                    setState(() {
                      isExpense = value;
                      type = (isExpense) ? 2 : 1;
                      selectedCategory = null;
                    });
                  },
                ),
                Text(
                  isExpense ? "Expense" : "Income",
                  style: GoogleFonts.montserrat(fontSize: 14),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: TextFormField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Amount',
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text("Category", style: GoogleFonts.montserrat()),
            ),
            SizedBox(
              height: 5,
            ),
            FutureBuilder<List<Category>>(
                future: getAllCategory(type),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else {
                    if (snapshot.hasData) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: DropdownButton<Category>(
                          isExpanded: true,
                          value: (selectedCategory == null)
                              ? snapshot.data!.first
                              : selectedCategory,
                          icon: const Icon(Icons.arrow_downward),
                          elevation: 16,
                          onChanged: (Category? newValue) {
                            print(newValue!.name);
                            setState(() {
                              selectedCategory = newValue;
                            });
                          },
                          items: snapshot.data!.map((Category value) {
                            return DropdownMenuItem<Category>(
                              value: value,
                              child: Text(value.name),
                            );
                          }).toList(),
                        ),
                      );
                    } else {
                      return Text("Belum ada kategory");
                    }
                  }
                }),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
                controller: dateController,
                decoration: const InputDecoration(labelText: "Enter Date"),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(), //get today's date
                      firstDate: DateTime(
                          2000), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2101));

                  if (pickedDate != null) {
                    print(
                        pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
                    String formattedDate = DateFormat('yyyy-MM-dd').format(
                        pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                    print(
                        formattedDate); //formatted date output using intl package =>  2022-07-04
                    //You can format date as per your need

                    setState(() {
                      dateController.text =
                          formattedDate; //set foratted date to TextField value.
                    });
                  } else {
                    print("Date is not selected");
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Description',
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
                child: ElevatedButton(
                    onPressed: () {
                      insertData(
                          descriptionController.text,
                          selectedCategory!.id,
                          int.parse(amountController.text),
                          DateTime.parse(dateController.text));
                      Navigator.pop(context, true);
                    },
                    child: Text('Save')))
          ],
        )),
      ),
    );
  }
}
