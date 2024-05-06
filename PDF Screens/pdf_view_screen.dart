import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PDFScreen extends StatefulWidget {
  final String url;

  const PDFScreen({super.key, required this.url});

  @override
  State<PDFScreen> createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> {
  late bool _isLoading;
  late String? _pdfPath;

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _downloadAndDisplayPDF();
  }

  Future<void> _downloadAndDisplayPDF() async {
    try {
      var response = await http.get(Uri.parse(widget.url));
      var dir = await getApplicationDocumentsDirectory();
      File file = File('${dir.path}/example.pdf');
      await file.writeAsBytes(response.bodyBytes);
      setState(() {
        _pdfPath = file.path;
        _isLoading = false;
      });
    } on HandshakeException {
      _showCertificateErrorDialog();
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
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
                child: _isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : _pdfPath != null
                        ? PDFView(
                            filePath: _pdfPath!,
                          )
                        : const Center(
                            child: Text('Error loading PDF'),
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
