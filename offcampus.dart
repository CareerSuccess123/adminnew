import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:careersuccess/newoffcampus.dart';

class OffCampusDrives extends StatefulWidget {
  @override
  _OffCampusDrivesState createState() => _OffCampusDrivesState();
}

class _OffCampusDrivesState extends State<OffCampusDrives> {
  List<Map<String, String>> _drives = [
    {
      'company': 'Amazon',
      'job_title': 'Software Engineer',
      'job_description':
          'We are looking for a skilled software engineer to join our team. You will be responsible for developing and maintaining software solutions that meet the needs of our business and customers.',
      'location': 'Remote',
      'apply_link':
          'https://www.amazon.jobs/en-gb/jobs/1623327/software-development-engineer'
    },
    {
      'company': 'Google',
      'job_title': 'Data Analyst',
      'job_description':
          'As a data analyst, you will be responsible for analyzing and interpreting complex data sets to provide insights and recommendations to our business and clients.',
      'location': 'New York, NY',
      'apply_link':
          'https://careers.google.com/jobs/results/133066811757824070-data-analyst-business-intelligence/?q=Data%20Analyst&company=Google&distance=50&employment_type=FULL_TIME&location=New%20York%2C%20NY%2C%20USA&'
    },
  ];
  final List<Color> colors = [
    Colors.yellow,
    Colors.pinkAccent,
    Colors.purple,
    Colors.orange,
    Colors.purple,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Off-Campus Drives'),
      ),
      body: ListView.builder(
        itemCount: _drives.length,
        itemBuilder: (BuildContext context, int index) {
          final drive = _drives[index];
          return Card(
              color: colors[index % colors.length],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      drive['company']!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      drive['job_title']!,
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(drive['job_description']!),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Location: ${drive['location']}',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      onPressed: () {
                        launch(drive['apply_link']!);
                      },
                      child: Text('Apply'),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                      ),
                    ),
                  )
                ],
              ));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => NewDetailScreen()));
        },
      ),
    );
  }
}
