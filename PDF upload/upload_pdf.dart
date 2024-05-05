import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PdfUploadScreen extends StatefulWidget {
  const PdfUploadScreen({super.key});

  @override
  State<PdfUploadScreen> createState() => _PdfUploadScreenState();
}

class _PdfUploadScreenState extends State<PdfUploadScreen> {
  File? _selectedPdf;

  void _selectPdf() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        _selectedPdf = File(result.files.single.path!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Upload & Display'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _selectPdf,
              child: const Text('Select PDF'),
            ),
            const SizedBox(height: 20.0),
            _selectedPdf != null
                ? Text('Selected PDF: ${_selectedPdf!.path}')
                : const SizedBox(),
            const SizedBox(height: 20.0),
            _selectedPdf != null
                ? Column(
                    children: [
                      Container(
                        height: 300, // Adjust the height as needed
                        child: PDFView(
                          key: UniqueKey(), // Force rebuild with new key
                          filePath: _selectedPdf!.path,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: () {
                          // Handle uploading the PDF file
                          // You can implement your upload logic here
                        },
                        child: const Text('Upload PDF'),
                      ),
                    ],
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}

