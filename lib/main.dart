import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DataTableExample(),
    );
  }
}

class DataTableExample extends StatefulWidget {
  const DataTableExample({super.key});

  @override
  _DataTableExampleState createState() => _DataTableExampleState();
}

class _DataTableExampleState extends State<DataTableExample> {
  // List of rows for the DataTable
  List<DataRow> rows = [];

  // Controller for the input fields (Name, Age)
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  // Method to add a row to the DataTable
  void addRow() {
    setState(() {
      rows.add(
        DataRow(
          cells: [
            DataCell(Text(nameController.text)),
            DataCell(Text(ageController.text)),
            DataCell(
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  // Remove the row when the delete button is pressed
                  setState(() {
                    rows.removeLast();
                  });
                },
              ),
            ),
          ],
        ),
      );
    });

    // Clear text fields after adding a row
    nameController.clear();
    ageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('This is a my family name and age'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            // TextFields to input Name and Age for the new row
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Name:',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: ageController,
                    decoration: InputDecoration(
                      labelText: 'Age:',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: addRow,
                  child: Text('Add Row'),
                ),
              ],
            ),
            SizedBox(height: 16),
            // Display DataTable
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: DataTable(
                  columns: [
                    DataColumn(label: Text('Name')),
                    DataColumn(label: Text('Age')),
                    DataColumn(label: Text('Actions')),
                  ],
                  rows: rows,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
