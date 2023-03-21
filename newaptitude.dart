import 'package:flutter/material.dart';

class NewAptitudeScreen extends StatefulWidget {
  @override
  _NewDetailScreenState createState() => _NewDetailScreenState();
}

class _NewDetailScreenState extends State<NewAptitudeScreen> {
  TextEditingController _topicController = TextEditingController();
 
  List<String> _subContents = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Questions'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _topicController,
                decoration: InputDecoration(labelText: 'Topic'),
              ),
             
              SizedBox(height: 15),
              Text(
                'Contents',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                itemCount: _subContents.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(
                      'Subcontent ${index + 1}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Text(
                      _subContents[index],
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          _subContents.removeAt(index);
                        });
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      String newSubContent = '';
                      return AlertDialog(
                        title: Text('Add Content'),
                        content: TextField(
                          onChanged: (value) {
                            newSubContent = value;
                          },
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                _subContents.add(newSubContent);
                              });
                              Navigator.pop(context);
                            },
                            child: Text('Add'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Cancel'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Add Content'),
              ),
              SizedBox(height: 15),
              Container(
                child: MaterialButton(
                  minWidth: 250,
                  height: 50,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Text(
                    "Upload",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    routes: {
      '/new_detail': (context) => NewAptitudeScreen(),
    },
  ));
}
