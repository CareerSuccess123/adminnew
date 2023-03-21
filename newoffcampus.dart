import 'package:flutter/material.dart';

class NewDetailScreen extends StatefulWidget {
  @override
  _NewDetailScreenState createState() => _NewDetailScreenState();
}

class _NewDetailScreenState extends State<NewDetailScreen> {
  TextEditingController _companyController = TextEditingController();
  TextEditingController _jobTitleController = TextEditingController();
  TextEditingController _jobDescriptionController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _applyLinkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _companyController,
                decoration: InputDecoration(labelText: 'Company'),
              ),
              TextField(
                controller: _jobTitleController,
                decoration: InputDecoration(labelText: 'Job Title'),
              ),
              TextField(
                controller: _jobDescriptionController,
                decoration: InputDecoration(labelText: 'Job Description'),
                maxLines: 3,
              ),
              TextField(
                controller: _locationController,
                decoration: InputDecoration(labelText: 'Location'),
              ),
              TextField(
                controller: _applyLinkController,
                decoration: InputDecoration(labelText: 'Apply Link'),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: MaterialButton(
                  minWidth: 250,
                  height: 50,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
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
      '/new_detail': (context) => NewDetailScreen(),
    },
  ));
}
