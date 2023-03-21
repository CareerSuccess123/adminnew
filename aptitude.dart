import 'package:flutter/material.dart';

class Aptitude extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1f566d),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Quantitative Aptitude'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Card(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Image.network(
                          'https://cdn.iconscout.com/icon/premium/png-512-thumb/arithmetic-1-558576.png'),
                      title: Text('Arithmetic Aptitude'),
                    ),
                    Divider(),
                    Container(
                      color: Colors.blue[100],
                      child: ListTile(
                        title: Text('Addition'),
                      ),
                    ),
                    Container(
                      color: Colors.blue[200],
                      child: ListTile(
                        title: Text('Subtraction'),
                      ),
                    ),
                    Container(
                      color: Colors.blue[300],
                      child: ListTile(
                        title: Text('Multiplication'),
                      ),
                    ),
                    Container(
                      color: Colors.blue[400],
                      child: ListTile(
                        title: Text('Division'),
                      ),
                    ),
                    Container(
                      color: Colors.blue[500],
                      child: ListTile(
                        title: Text('Fractions'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              // Create a section for data interpretation
              Card(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Image.network(
                          'https://static.thenounproject.com/png/4067106-200.png'),
                      title: Text('Data Interpretation'),
                    ),
                    Divider(),
                    Container(
                      color: Colors.green[100],
                      child: ListTile(
                        title: Text('Tables'),
                      ),
                    ),
                    Container(
                      color: Colors.green[200],
                      child: ListTile(
                        title: Text('Graphs'),
                      ),
                    ),
                    Container(
                      color: Colors.green[300],
                      child: ListTile(
                        title: Text('Pie Charts'),
                      ),
                    ),
                    Container(
                      color: Colors.green[400],
                      child: ListTile(
                        title: Text('Line Charts'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              // Create a section for online aptitude test
              Card(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Image.network(
                          'https://cdn.iconscout.com/icon/premium/png-512-thumb/test-3008594-2499359.png'),
                      title: Text('Online Aptitude Test'),
                    ),
                    Divider(),
                    Container(
                      color: Colors.orange[100],
                      child: ListTile(
                        title: Text('Sample Questions'),
                      ),
                    ),
                    Container(
                      color: Colors.orange[200],
                      child: ListTile(
                        title: Text('Full-length Tests'),
                      ),
                    ),
                    Container(
                      color: Colors.orange[300],
                      child: ListTile(
                        title: Text('Answer Key and Explanations'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
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
}
