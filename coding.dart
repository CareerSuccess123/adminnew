import 'package:careersuccess/newcoding.dart';
import 'package:flutter/material.dart';

class CodingQuestions extends StatelessWidget {
  final List<Map<String, dynamic>> questions = [
    {
      'question':
          'What is the output of the following C code?\n\nint main() {\nint x = 10, y = 5;\nif (x == 10 && y++ == 5)\nprintf("x=%d, y=%d\\n", x, y);\nelse\nprintf("x=%d, y=%d\\n", x, y);\nreturn 0;\n}',
      'output': 'x=10, y=6'
    },
    {
      'question':
          'What is the output of the following C code?\n\n#include <stdio.h>\nint main() {\nint x = 5, y = 10, z = 15;\nint *p[] = {&x, &y, &z};\nprintf("%d\\n", **(p+2));\nreturn 0;\n}',
      'output': '15'
    },
    {
      'question':
          'What is the output of the following C code?\n\n#include <stdio.h>\nint main() {\nint x = 10, y = 20;\nint *p1 = &x, *p2 = &y;\n*p1 = 20;\n*p2 = *p1;\nprintf("%d %d\\n", x, y);\nreturn 0;\n}',
      'output': '20 20'
    },
    {
      'question':
          'What is the output of the following C code?\n\n#include <stdio.h>\nint main() {\nint x = 10, y = 20, z = 30;\nint *ptr[] = {&x, &y, &z};\nint **p = ptr;\nprintf("%d\\n", **(p+2));\nreturn 0;\n}',
      'output': '30'
    },
    {
      'question':
          'What is the output of the following C code?\n\n#include <stdio.h>\nint main() {\nint x = 10, y = 20, z = 30;\nint *ptr[] = {&x, &y, &z};\nint **p = ptr;\nprintf("%d\\n", *++p == &y);\nreturn 0;\n}',
      'output': '1'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1f566d),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Coding Questions in C'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: questions
                .map((question) => Card(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              question['question'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Divider(),
                            Text(
                              'Expected Output:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              question['output'],
                              style: TextStyle(
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => NewCoding()));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
