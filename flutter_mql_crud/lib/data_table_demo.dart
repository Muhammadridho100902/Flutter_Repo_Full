import 'package:flutter/material.dart';
import 'package:flutter_mql_crud/model.dart';
import 'package:flutter_mql_crud/services.dart';

class DataTableDemo extends StatefulWidget {
  final String title = 'Flutter Data Table';

  const DataTableDemo({Key? key}) : super(key: key);

  @override
  State<DataTableDemo> createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {

  late List<Employee> _employee;
  late GlobalKey<ScaffoldState> _scaffoldKey;
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  late Employee _selectedEmployee;
  late bool _isUpdating;
  late String _titleProgress;

  @override
  void initState() {
    super.initState();
    _employee = [];
    _isUpdating = false;
    _titleProgress = widget.title;
    _scaffoldKey = GlobalKey(); // key to get the context to show a Snackbar
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
  }

  // method to update title in app bar
  _showProgress(String message) {
    setState(() {
      _titleProgress = message;
    });
  }

  _showSnackBar(context, message) {
    _scaffoldKey.currentState!.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  _createTable() {
    _showProgress("Create Table");
    Services.createTable().then((result) {
      if ("success" == result) {
        // show a snackbar
        _showSnackBar(context, result);
        _showProgress(widget.title);
      }
    });
  }

  _addTable() {}

  _getTable() {}

  _updateTable() {}

  _deleteTable() {}

  _clearValue() {
    _firstNameController.text = '';
    _lastNameController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(_titleProgress),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              _createTable();
            },
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              _getTable();
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: _firstNameController,
                decoration: const InputDecoration.collapsed(
                  hintText: 'First Name',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: _lastNameController,
                decoration: const InputDecoration.collapsed(
                  hintText: 'Last Name',
                ),
              ),
            ),
            _isUpdating
                ? Row(
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          _updateTable();
                        },
                        child: const Text('Update'),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          setState(() {
                            _isUpdating = false;
                          });
                          _clearValue();
                        },
                        child: const Text('Cancel'),
                      ),
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
