import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:excise/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart' as syncfusion;
import '../core/widgets/custom_appbar.dart';

class TestPDFScreen extends StatefulWidget {
  final String assetPath;

  const TestPDFScreen({super.key, required this.assetPath});

  @override
  State<TestPDFScreen> createState() => _TestPDFScreenState();
}

class _TestPDFScreenState extends State<TestPDFScreen> {
  String? _pdfPath;

  @override
  void initState() {
    super.initState();
    _addImageToPDF();
  }

  Future<void> _addImageToPDF() async {
    try {
      // Load PDF from assets
      final ByteData data = await rootBundle.load(widget.assetPath);
      final List<int> bytes = data.buffer.asUint8List();

      // Load the existing PDF document
      final syncfusion.PdfDocument document = syncfusion.PdfDocument(inputBytes: bytes);

      // Get the last page of the PDF document
      syncfusion.PdfPage page = document.pages[document.pages.count - 1];

      // Load image from assets
      final ByteData imageData = await rootBundle.load('assets/icon/checkmark.png'); // Update this path to your image asset
      final List<int> imageBytes = imageData.buffer.asUint8List();

      // Create PdfBitmap from image bytes
      final syncfusion.PdfBitmap image = syncfusion.PdfBitmap(imageBytes);

      // Get page size
      final pageSize = page.getClientSize();

      // Define the size for the image (width and height in pixels)
      final double imageWidth = 100.0;  // Specify desired width
      final double imageHeight = 100.0; // Specify desired height

      // Calculate position for bottom right corner
      final double x = pageSize.width - imageWidth - 75; // units from the right edge
      final double y = pageSize.height - imageHeight - 15; // units from the bottom edge

      // Draw the image on the last page with the specified size
      page.graphics.drawImage(image, Rect.fromLTWH(x, y, imageWidth, imageHeight));

      // Save the modified PDF document to a temporary file
      final String tempDir = (await getTemporaryDirectory()).path;
      final File modifiedPdf = File('$tempDir/modified_example.pdf');
      await modifiedPdf.writeAsBytes(await document.save());

      // Dispose of the document
      document.dispose();

      // Check if the modified PDF file is saved correctly
      if (await modifiedPdf.exists()) {
        print('Modified PDF saved at path: ${modifiedPdf.path}');
      } else {
        print('Failed to save modified PDF');
      }

      // Update the path to the modified PDF
      setState(() {
        _pdfPath = modifiedPdf.path;
      });
    } catch (e) {
      print('Error adding image to PDF: $e');
    }
  }

  // Future<void> _copyPDFFromAssets() async {
  //   try {
  //     final ByteData data = await rootBundle.load(widget.assetPath);
  //     final List<int> bytes = data.buffer.asUint8List();
  //     final String tempDir = (await getTemporaryDirectory()).path;
  //     final File file = File('$tempDir/example.pdf');
  //     await file.writeAsBytes(bytes);
  //     setState(() {
  //       _pdfPath = file.path;
  //     });
  //   } catch (e) {
  //     print('Error copying PDF from assets: $e');
  //   }
  // }

  // Future<void> _addImageToPDF() async {
  //   try {
  //     final String tempDir = (await getTemporaryDirectory()).path;
  //     final File originalPdf = File(_pdfPath!);
  //
  //     // Ensure the original PDF file exists
  //     if (!await originalPdf.exists()) {
  //       print('Original PDF file does not exist at path: ${_pdfPath!}');
  //       return;
  //     }
  //
  //     final syncfusion.PdfDocument document = syncfusion.PdfDocument(inputBytes: originalPdf.readAsBytesSync());
  //
  //     // Get the last page of the PDF document
  //     syncfusion.PdfPage page = document.pages[document.pages.count - 1];
  //
  //     // Load image from assets
  //     final ByteData imageData = await rootBundle.load('assets/icon/checkmark.png'); // Update this path to your image asset
  //     final List<int> imageBytes = imageData.buffer.asUint8List();
  //
  //     // Create PdfBitmap from image bytes
  //     final syncfusion.PdfBitmap image = syncfusion.PdfBitmap(imageBytes);
  //
  //     // Get page size
  //     final pageSize = page.getClientSize();
  //
  //     // Define the size for the image (width and height in pixels)
  //     final double imageWidth = 100.0;  // Specify desired width
  //     final double imageHeight = 100.0; // Specify desired height
  //
  //     // Calculate position for bottom right corner
  //     final double x = pageSize.width - imageWidth - 75.0; // units from the right edge
  //     final double y = pageSize.height - imageHeight - 15.0; // units from the bottom edge
  //
  //     // Draw the image on the first page with the specified size
  //     page.graphics.drawImage(image, Rect.fromLTWH(x, y, imageWidth, imageHeight));
  //
  //     // Save the modified PDF document
  //     final File modifiedPdf = File('$tempDir/modified_example.pdf');
  //     await modifiedPdf.writeAsBytes(await document.save());
  //
  //     // Dispose of the document
  //     document.dispose();
  //
  //     // Check if the modified PDF file is saved correctly
  //     if (await modifiedPdf.exists()) {
  //       print('Modified PDF saved at path: ${modifiedPdf.path}');
  //     } else {
  //       print('Failed to save modified PDF');
  //     }
  //
  //     // Update the path to the modified PDF
  //     setState(() {
  //       _pdfPath = modifiedPdf.path;
  //     });
  //   } catch (e) {
  //     print('Error adding image to PDF: $e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: ColorConstants.gamboge,
        title: Text(
          'Test Pdf Viewer',
          style: GoogleFonts.inter(
              fontSize: 14.0,
              color: ColorConstants.white,
              fontWeight: FontWeight.w700
          ),
          textAlign: TextAlign.start,
        ),
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
                child: _pdfPath != null
                    ? PDFView(
                  key: ValueKey(_pdfPath), // Ensures the widget reloads
                  filePath: _pdfPath!,
                )
                    : const Center(child: CircularProgressIndicator()),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _addImageToPDF,
                // onPressed: () {
                //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => ()));
                // },
              child: const Text('Add Image to PDF'),
            ),
          ],
        ),
      ),
    );
  }
}
