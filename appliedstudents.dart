import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Applied Students List',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Student List '),
        ),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  List<Map<String, dynamic>> data = [
    {
      "Name": "Anna",
      "Department": "CS",
      "Tenth Percent": 90,
      "Twelth Percent": 85,
      "Passout": 2023,
      "CGPA": 8.2,
    },
    {
      "Name": "Jack",
      "Department": "CS",
      "Tenth Percent": 95,
      "Twelth Percent": 85,
      "Passout": 2023,
      "CGPA": 8.9,
    },
    {
      "Name": "John",
      "Department": "CS",
      "Tenth Percent": 75,
      "Twelth Percent": 70,
      "Passout": 2023,
      "CGPA": 7.3,
    },
    {
      "Name": "Teena",
      "Department": "CS",
      "Tenth Percent": 92,
      "Twelth Percent": 89,
      "Passout": 2023,
      "CGPA": 8.6,
    },
  ];

  List<Map<String, dynamic>> filteredData = [];

  final nameController = TextEditingController();
  final departmentController = TextEditingController();
  final tenthpercentController = TextEditingController();
  final twelthpercentController = TextEditingController();
  final passoutController = TextEditingController();
  final cgpaController = TextEditingController();

  @override
  void initState() {
    filteredData = data;
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    departmentController.dispose();
    tenthpercentController.dispose();
    twelthpercentController.dispose();
    passoutController.dispose();
    cgpaController.dispose();
    super.dispose();
  }

  void _onSearchTextChanged(String text) {
    setState(() {
      filteredData = text.isEmpty
          ? data
          : data
              .where((item) =>
                  item['Name'].toLowerCase().contains(text.toLowerCase()) ||
                  item['Department']
                      .toLowerCase()
                      .contains(text.toLowerCase()) ||
                  item['Tenth Percentage']
                      .toString()
                      .contains(text.toLowerCase()) ||
                  item['Twelth Percentage']
                      .toString()
                      .contains(text.toLowerCase()) ||
                  item['Passout'].toString().contains(text.toLowerCase()) ||
                  item['Cgpa'].toString().contains(text.toLowerCase()))
              .toList();
    });
  }

  void _addNewItem() {
    final String name = nameController.text;
    final String department = departmentController.text;
    final int tenthpercent = int.tryParse(tenthpercentController.text) ?? 0;
    final int twelthpercent = int.tryParse(twelthpercentController.text) ?? 0;
    final int passout = int.tryParse(passoutController.text) ?? 0;
    final int cgpa = int.tryParse(cgpaController.text) ?? 0;
    setState(() {
      data.add({
        "Name": name,
        "Department": department,
        "Tenth Percentage": tenthpercent,
        "Twelth Percentage": twelthpercent,
        "Passout": passout,
        "Cgpa": cgpa,
      });
      filteredData = data;
    });

    nameController.clear();
    departmentController.clear();
    tenthpercentController.clear();
    twelthpercentController.clear();
    passoutController.clear();
    cgpaController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: const <DataColumn>[
                DataColumn(
                  label: Text('Name'),
                ),
                DataColumn(
                  label: Text('Department'),
                ),
                DataColumn(
                  label: Text('Tenth Percentage'),
                ),
                DataColumn(
                  label: Text('Twelth Percentage'),
                ),
                DataColumn(
                  label: Text('Passout'),
                ),
                DataColumn(
                  label: Text('Cgpa'),
                ),
              ],
              rows: List<DataRow>.generate(
                filteredData.length,
                (int index) => DataRow(
                  color: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.selected)) {
                        return Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.08);
                      }
                      if (index.isEven) {
                        return Colors.grey.withOpacity(0.3);
                      }
                      return null;
                    },
                  ),
                  cells: <DataCell>[
                    DataCell(Text(filteredData[index]['Name'])),
                    DataCell(Text(filteredData[index]['Department'])),
                    DataCell(
                        Text(filteredData[index]['Tenth Percent'].toString())),
                    DataCell(
                        Text(filteredData[index]['Twelth Percent'].toString())),
                    DataCell(Text(filteredData[index]['Passout'].toString())),
                    DataCell(Text(filteredData[index]['CGPA'].toString())),
                  ],
                ),
              ),
            ),
          ),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(12.0),
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8), color: Colors.blue),
                child: Text(
                  "Generate Pdf",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
              Container(
                margin: EdgeInsets.all(12.0),
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8), color: Colors.blue),
                child: Text(
                  "Export",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              )
            ]),
      ],
    );
  }
}
