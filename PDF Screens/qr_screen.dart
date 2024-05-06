import 'package:bloc_app/pdf_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScreen extends StatefulWidget {
  const QRScreen({super.key});

  @override
  State<QRScreen>  createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> {

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  String qrResult = '';
  final String pdfUrl = "https://icseindia.org/document/sample.pdf";

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Scanner'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: QRView(
              key: qrKey,
              onQRViewCreated: (controller) {
                this.controller = controller;
                controller.scannedDataStream.listen((scanData) async {
                  setState(() {
                    qrResult = scanData.code!;
                  });
                  // await Navigator.of(context).push(MaterialPageRoute(builder: (context) => PDFScreen(url: qrResult)));
                  await Navigator.of(context).push(MaterialPageRoute(builder: (context) => PDFScreen(url: pdfUrl)));
                });
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text('QR Result: $qrResult'),
            ),
          ),
        ],
      ),
    );
  }
}
