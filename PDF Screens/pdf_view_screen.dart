import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:permission_handler/permission_handler.dart';

class PDFScreen extends StatefulWidget {
  final String url;

  const PDFScreen({super.key, required this.url});

  @override
  State<PDFScreen> createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> {
  String? pdfPath;

   @override
  void initState() {
    super.initState();
    requestPermissions();
    downloadPdf();
  }
  
  Future<void> requestPermissions() async {
    if (Platform.isAndroid) {
      var status = await Permission.storage.status;
      if (!status.isGranted) {
        await Permission.storage.request();
      }
    }
  }
  
  Future<void> downloadPdf() async {
    try {
      final response = await http.get(Uri.parse(widget.url));

    final directory = await getExternalStorageDirectory();
    if (directory != null) {
      final filePath = '${directory.path}/sample.pdf';
      final File file = File(filePath);

      await file.writeAsBytes(response.bodyBytes);

      setState(() {
        pdfPath = filePath;
      });
    }
    } on HandshakeException {
      _showCertificateErrorDialog();
    } catch (e) {
      print('Error downloading PDF: $e');
    }
  }

  void _showCertificateErrorDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Certificate Verification Error'),
        content: const Text(
          'There was an issue verifying the SSL certificate. Please try again later or contact support.',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Viewer'),
        backgroundColor: Colors.yellow,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 500, 
              decoration: BoxDecoration(
                border: Border.all(width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10), 
                child: pdfPath == null
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : PDFView(
                          filePath: pdfPath,
                        ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Verify PDF'),
            ),
          ],
        ),
      )
    );
  }
}
