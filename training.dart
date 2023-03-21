import 'package:careersuccess/aptitude.dart';
import 'package:careersuccess/coding.dart';
import 'package:careersuccess/coresubjects.dart';
import 'package:careersuccess/interview.dart';
import 'package:flutter/material.dart';

class uploadtraining extends StatefulWidget {
  const uploadtraining({Key? key}) : super(key: key);

  @override
  _uploadtrainingState createState() => _uploadtrainingState();
}

class _uploadtrainingState extends State<uploadtraining> {
  Card uploadtraining(String title, String img, int index) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(8),
      child: Container(
        decoration: index == 0 || index == 3 || index == 4
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: const LinearGradient(
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(3.0, -1.0),
                  colors: [
                    Color(0xFF004B8D),
                    Color(0xFFffffff),
                  ],
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 3,
                    offset: Offset(2, 2),
                  )
                ],
              )
            : BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: const LinearGradient(
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(3.0, -1.0),
                  colors: [
                    Colors.cyan,
                    Colors.amber,
                  ],
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 3,
                    offset: Offset(2, 2),
                  )
                ],
              ),
        child: InkWell(
          onTap: () {
            if (index == 0) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Aptitude()));
            }
            if (index == 1) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CodingQuestions()));
            }
            if (index == 2) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LinksPage())); //3.item
            }
            if (index == 3) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProgrammingQuestionsPage()));
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: [
              const SizedBox(height: 50),
              Center(
                child: Image.asset(
                  img,
                  height: 50,
                  width: 50,
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 170, 193, 232),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            //For Dark Color
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text(
                      "Training Materials",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(2),
              children: [
                uploadtraining("Aptitude", "lib/images/aptitude.png", 0),
                uploadtraining("Coding", "lib/images/coding.png", 1),
                uploadtraining(
                    "Core Subjects", "lib/images/communication.png", 2),
                uploadtraining("Interview", "lib/icons/interview.png", 3),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
