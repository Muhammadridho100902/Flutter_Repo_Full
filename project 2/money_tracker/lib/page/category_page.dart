import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_tracker/models/database.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  bool isExpanse = false;
  final database = AppDb();
  DateTime now = DateTime.now();
  int? type;

  TextEditingController categoryNameController = TextEditingController();

  Future insert(String name, int type) async {
    final row = await database.into(database.categories).insertReturning(
          CategoriesCompanion.insert(
              name: name, type: type, createdAt: now, updatedAt: now),
        );
    print(row);
  }

  Future<List<Category>> getAllCategory(int type) async {
    return await database.getAllCategoryRepo(type);
  }

  Future update(int categoryId, String newName) async {
    return await database.updateCategoryRepo(categoryId, newName);
  }

  @override
  void initState() {
    isExpanse = true;
    type = (isExpanse) ? 2 : 1;
    super.initState();
  }

  void openDialog(Category? category) {
    if (category != null) {
      categoryNameController.text = category.name;
    }
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    (isExpanse)
                        ? Text(
                            'Add Expanse',
                            style: GoogleFonts.montserrat(color: Colors.red),
                          )
                        : Text(
                            'Add Expanse',
                            style: GoogleFonts.montserrat(color: Colors.green),
                          ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: categoryNameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Name",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (category == null) {
                          insert(
                              categoryNameController.text, isExpanse ? 2 : 1);
                        } else {
                          update(category.id, categoryNameController.text);
                        }
                        Navigator.of(context, rootNavigator: true)
                            .pop('dialog');
                        setState(() {});
                        categoryNameController.clear();
                      },
                      child: const Text("Save"),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Switch(
                inactiveTrackColor: Colors.green.shade200,
                inactiveThumbColor: Colors.green,
                activeColor: Colors.red,
                value: isExpanse,
                onChanged: ((bool value) {
                  setState(() {
                    isExpanse = value;
                    type = (value) ? 2 : 1;
                  });
                }),
              ),
              IconButton(
                  onPressed: () {
                    openDialog(null);
                  },
                  icon: const Icon(Icons.add))
            ],
          ),
        ),
        FutureBuilder<List<Category>>(
          future: getAllCategory(type!),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (snapshot.hasData) {
                if (snapshot.data!.length > 0) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Card(
                          elevation: 10,
                          child: ListTile(
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () {
                                      database.deleteCategoryRepo(
                                          snapshot.data![index].id);
                                      setState(() {});
                                    },
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.edit),
                                    onPressed: () {
                                      openDialog(snapshot.data![index]);
                                    },
                                  )
                                ],
                              ),
                              leading: Container(
                                  padding: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: (isExpanse)
                                      ? Icon(Icons.upload,
                                          color: Colors.redAccent[400])
                                      : Icon(
                                          Icons.download,
                                          color: Colors.greenAccent[400],
                                        )),
                              title: Text(snapshot.data![index].name)),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: Text("No has data"),
                  );
                }
              } else {
                return const Center(
                  child: Text("No has data"),
                );
              }
            }
          },
        ),
      ],
    ));
  }
}
