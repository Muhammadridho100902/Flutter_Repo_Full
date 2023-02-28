import 'package:flutter/material.dart';
import 'package:money_record/db/database_instance.dart';
import 'package:money_record/model/transaksi_model.dart';
import 'package:money_record/screens/create_screen.dart';
import 'package:money_record/screens/edit_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DatabaseInstance? databaseInstance;

  @override
  void initState() {
    databaseInstance = DatabaseInstance();
    initDatabase();
    super.initState();
  }

  Future initDatabase() async {
    await databaseInstance!.database();
    setState(() {});
  }

  showalertdialog(BuildContext context, int idTransaksi) {
    Widget okButton = ElevatedButton(
      onPressed: () {
        // call method delete here
        databaseInstance!.hapus(idTransaksi);
        Navigator.of(context, rootNavigator: true).pop();
        setState(() {});
      },
      child: const Text("Yakin"),
    );
    AlertDialog alertDialog = AlertDialog(
      title: const Text("Peringatan"),
      content: const Text("Apakah Anda yakin ingin menghapus?"),
      actions: [okButton],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Money Record"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(
                MaterialPageRoute(
                  builder: (context) => const CreateScreen(),
                ),
              )
                  .then((value) {
                setState(() {});
              });
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: FutureBuilder(
                  future: databaseInstance!.totalPemasukan(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Text("-");
                    } else {
                      if (snapshot.hasData) {
                        return Text(
                          "Uang Pemasukan : Rp.${snapshot.data.toString()}",
                        );
                      } else {
                        const Text("Tidak ada pemasukan");
                      }
                      return Column();
                    }
                  }),
            ),
            const SizedBox(
              height: 10,
            ),
            FutureBuilder(
                future: databaseInstance!.totalPengeluaran(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text("-");
                  } else {
                    if (snapshot.hasData) {
                      return Text(
                        "Uang Pengeluaran : Rp.${snapshot.data.toString()} ",
                      );
                    } else {
                      return const Text("Tidak ada Pengeluaran");
                    }
                  }
                }),
            FutureBuilder<List<TransaksiModel>>(
              future: databaseInstance!.getAll(),
              builder: (context, snapshot) {
                print("hasil  : " + snapshot.data.toString());
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else {
                  if (snapshot.hasData) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: snapshot.data![index].type == 1
                                ? const Icon(
                                    Icons.download,
                                    color: Colors.green,
                                  )
                                : const Icon(
                                    Icons.upload,
                                    color: Colors.red,
                                  ),
                            title: Text(snapshot.data![index].name!),
                            subtitle: Text(
                                "Rp." + snapshot.data![index].total.toString()),
                            trailing: Wrap(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(
                                      MaterialPageRoute(
                                        builder: (context) => EditScreen(
                                            transaksiModel:
                                                snapshot.data![index]),
                                      ),
                                    )
                                        .then((value) {
                                      setState(() {});
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                IconButton(
                                  onPressed: () {
                                    showalertdialog(
                                        context, snapshot.data![index].id!);
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return const Center(
                      child: Text("No data"),
                    );
                  }
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
