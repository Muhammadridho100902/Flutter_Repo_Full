import 'package:flutter/material.dart';
import 'package:money_record/db/database_instance.dart';
import 'package:money_record/model/transaksi_model.dart';
import 'package:sqflite/sqflite.dart';

class EditScreen extends StatefulWidget {
  final TransaksiModel transaksiModel;
  const EditScreen({Key? key, required this.transaksiModel}) : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  DatabaseInstance databaseInstance = DatabaseInstance();

  TextEditingController nameController = TextEditingController();

  TextEditingController totalController = TextEditingController();
  int _value = 1;

  @override
  void initState() {
    databaseInstance.database();
    nameController.text = widget.transaksiModel.name!;
    totalController.text = widget.transaksiModel.total.toString();
    _value = widget.transaksiModel.type!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Nama"),
            TextField(
              controller: nameController,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text("Tipe Transaksi"),
            ListTile(
              title: const Text("Pemasukan"),
              leading: Radio(
                value: 1,
                groupValue: _value,
                onChanged: (value) {
                  setState(() {
                    _value = int.parse(value.toString());
                  });
                },
              ),
            ),
            ListTile(
              title: const Text("Pengeluaran"),
              leading: Radio(
                value: 2,
                groupValue: _value,
                onChanged: (value) {
                  setState(() {
                    _value = int.parse(value.toString());
                  });
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text("Total"),
            TextField(
              controller: totalController,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                await databaseInstance.update(
                  widget.transaksiModel.id!,
                  {
                    'name': nameController.text,
                    'total': totalController.text,
                    'type': _value,
                    'update_at': DateTime.now().toString(),
                  },
                );
                Navigator.pop(context);
              },
              child: const Text("Simpan"),
            )
          ],
        ),
      ),
    );
  }
}
