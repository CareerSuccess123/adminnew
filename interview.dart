import 'package:flutter/material.dart';

class ProgrammingQuestionsPage extends StatefulWidget {
  @override
  _ProgrammingQuestionsPageState createState() =>
      _ProgrammingQuestionsPageState();
}

class _ProgrammingQuestionsPageState extends State<ProgrammingQuestionsPage> {
  List<String> _programmingQuestions = [
    'What is object-oriented programming?',
    'What is a constructor?',
    'What is inheritance?',
    'What is polymorphism?',
    'What is encapsulation?',
    'What is abstraction?',
    'What is a variable?',
    'What is a function?',
    'What is a class?',
    'What is a loop?',
    'What is recursion?',
    'What is a conditional statement?',
    'What is a data structure?',
    'What is an algorithm?',
    'What is a pointer?',
    'What is a stack?',
    'What is a queue?',
    'What is a linked list?',
    'What is a binary tree?',
    'What is a hash table?',
    'What is a sorting algorithm?',
    'What is a searching algorithm?',
    'What is a database?',
    'What is SQL?',
    'What is NoSQL?',
    'What is a REST API?',
    'What is a web framework?',
    'What is a unit test?',
    'What is integration testing?',
    'What is version control?',
    'What is Git?',
    'What is Agile methodology?',
    'What is Scrum?',
    'What is a sprint?'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Programming Questions'),
      ),
      body: ListView.builder(
        itemCount: _programmingQuestions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_programmingQuestions[index]),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        onPressed: _showDialog,
      ),
    );
  }

  Future<String> _showInputDialog(BuildContext context, String title) async {
    String value = '';
    await showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: TextField(
            onChanged: (newValue) {
              value = newValue;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, value);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
    return value;
  }

  void _showDialog() async {
    String newValue = await _showInputDialog(context, 'Add new question');
    setState(() {
      // Update the state with the new value
    });
  }
}
