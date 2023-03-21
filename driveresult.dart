import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:async/async.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Upload File',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ResultPage(),
      builder: EasyLoading.init(),
    );
  }
}

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,
            )),
        title: Text('Upload'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => uploadFile(context),
              child: Text('Upload File'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> uploadFile(BuildContext context) async {
    try {
      final file = await FilePicker.platform.pickFiles();

      if (file == null || file.files.isEmpty) {
        return;
      }

      final uri = Uri.parse('https://your-upload-url.com');
      final request = http.MultipartRequest('POST', uri);
      final fileBytes = await file.files.first.bytes!.toList();
      final fileName = file.files.first.name;

      request.files.add(
          http.MultipartFile.fromBytes('file', fileBytes, filename: fileName));

      await EasyLoading.show(
        status: 'Uploading file...',
        maskType: EasyLoadingMaskType.black,
      );

      final response = await request.send();

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('File uploaded successfully'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                'File upload failed with status code: ${response.statusCode}'),
          ),
        );
      }
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('File upload failed'),
        ),
      );
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<void> downloadFile(BuildContext context) async {
    try {
      final dio = Dio();
      final tempDir = await getTemporaryDirectory();
      final savePath = '${tempDir.path}/myFile.pdf';

      await EasyLoading.show(
        status: 'Downloading file...',
        maskType: EasyLoadingMaskType.black,
      );

      await dio.download(
        'https://example.com/myFile.pdf',
        savePath,
        onReceiveProgress: (receivedBytes, totalBytes) {
          final progress = receivedBytes / totalBytes;
          EasyLoading.showProgress(progress, status: 'Downloading file...');
        },
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('File downloaded successfully'),
        ),
      );

      // Open the downloaded file
      OpenFile.open(savePath);
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('File download failed'),
        ),
      );
    }
  }
}
