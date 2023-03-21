import 'package:careersuccess/appliedstudents.dart';
import 'package:careersuccess/dashboard.dart';
import 'package:flutter/material.dart';

class MultiSelect extends StatefulWidget {
  final List<String> items;

  const MultiSelect({Key? key, required this.items}) : super(key: key);

  @override
  _MultiSelectState createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  List<String> _selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select departments'),
      contentPadding: const EdgeInsets.all(16),
      content: SingleChildScrollView(
        child: Container(
          width: double.maxFinite,
          child: Wrap(
            children: widget.items.map((item) {
              return CheckboxListTile(
                title: Text(item),
                value: _selectedItems.contains(item),
                onChanged: (bool? value) {
                  setState(() {
                    if (value != null && value) {
                      _selectedItems.add(item);
                    } else {
                      _selectedItems.remove(item);
                    }
                  });
                },
              );
            }).toList(),
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('CANCEL'),
          onPressed: () {
            Navigator.of(context).pop(null);
          },
        ),
        TextButton(
          child: const Text('OK'),
          onPressed: () {
            Navigator.of(context).pop(_selectedItems);
          },
        ),
      ],
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _selectedItems = [];
  final _backlogController = TextEditingController();
  final _tenthPercentageController = TextEditingController();
  final _twelfthPercentageController = TextEditingController();
  List<int> _passoutYears = [];
  double _cgpaRange = 0;
  double _tenthPercentage = 0;
  double _twelfthPercentage = 0;

  void _showMultiSelect() async {
    final List<String> items = ['CSE', 'EEE', 'MECH', 'IT', 'CIVIL', 'EC'];

    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: items);
      },
    );

    if (results != null) {
      setState(() {
        _selectedItems = results;
      });
    }
  }

  @override
  void dispose() {
    _backlogController.dispose();
    _tenthPercentageController.dispose();
    _twelfthPercentageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: _showMultiSelect,
              child: const Text('Department'),
            ),
            const Divider(
              height: 15,
            ),
            TextFormField(
              controller: _backlogController,
              decoration: const InputDecoration(
                labelText: 'Number of backlogs',
              ),
            ),
            const Divider(
              height: 15,
            ),
            TextFormField(
              controller: _tenthPercentageController,
              decoration: const InputDecoration(
                labelText: '10th Percentage',
              ),
            ),
            const Divider(
              height: 15,
            ),
            TextFormField(
              controller: _twelfthPercentageController,
              decoration: const InputDecoration(
                labelText: '12th Percentage',
              ),
            ),
            const Divider(
              height: 15,
            ),
            Wrap(
              children: _selectedItems
                  .map((e) => Chip(
                        label: Text(e),
                      ))
                  .toList(),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
                'Passout Year: ${_passoutYears.isEmpty ? 'None' : _passoutYears.join(', ')}'),
            ListTile(
              title: const Text('2021'),
              leading: Checkbox(
                value: _passoutYears.contains(2021),
                onChanged: (bool? value) {
                  setState(() {
                    if (value != null && value) {
                      _passoutYears.add(2021);
                    } else {
                      _passoutYears.remove(2021);
                    }
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('2022'),
              leading: Checkbox(
                value: _passoutYears.contains(2022),
                onChanged: (bool? value) {
                  setState(() {
                    if (value != null && value) {
                      _passoutYears.add(2022);
                    } else {
                      _passoutYears.remove(2022);
                    }
                  });
                },
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text('CGPA Range: ${_cgpaRange.toStringAsFixed(2)}'),
            Slider(
              value: _cgpaRange,
              onChanged: (double value) {
                setState(() {
                  _cgpaRange = value;
                });
              },
              min: 0,
              max: 10,
              divisions: 100,
              label: _cgpaRange.toStringAsFixed(2),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              child: const Text('Submit'),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyApp()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
