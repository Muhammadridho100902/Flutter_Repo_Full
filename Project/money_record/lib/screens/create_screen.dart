import 'package:flutter/material.dart';
import 'package:money_record/db/database_instance.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({Key? key}) : super(key: key);

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  DatabaseInstance databaseInstance = DatabaseInstance();

  TextEditingController nameController = TextEditingController();

  TextEditingController totalController = TextEditingController();

  @override
  void initState() {
    databaseInstance.database();
    super.initState();
  }

  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create"),
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
                 int idInsert = await databaseInstance.insert({
                    'name': nameController.text,
                    'type': _value,
                    'total': totalController.text,
                    'created_at': DateTime.now().toString(),
                    'update_at': DateTime.now().toString(),
                  });
                  print("sudah masuk : " + idInsert.toString());
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
