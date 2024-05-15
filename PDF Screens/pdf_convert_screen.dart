import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../core/api/api_constant.dart';
import '../core/network/network_connectivity.dart';

class Base64ToPdfConverter extends StatefulWidget {
  Base64ToPdfConverter({super.key});

  @override
  _Base64ToPdfConverterState createState() => _Base64ToPdfConverterState();
}

class _Base64ToPdfConverterState extends State<Base64ToPdfConverter> {
  String? _pdfPath;
  String? base64String;

  void getPdf() async {
    try {
      await NetworkConnection.checkNetworkConnectivity();

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? accessToken = prefs.getString('accessToken');

      final response = await http.post(Uri.parse('${ApiConstant.ofsUrl}/${OfsApi.ofsPdf}'),
        body: json.encode({}),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken'
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        print("$jsonData['payload']");

        setState(() {
          base64String = jsonData['payload'];
        });

        _convertAndSavePdf();

      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Pdf Conversion Failed"),
          ),
        );
      }
    } catch (error) {
      print('Error: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("An error occurred. Please try again later."),
        ),
      );
    }
  }

  void _convertAndSavePdf() async {
    try {
      // Decode the Base64 string to binary data
      List<int> bytes = base64.decode(base64String!);

      // Write the binary data to a PDF file
      String dir = (await getApplicationDocumentsDirectory()).path;
      File file = File('$dir/example.pdf');
      await file.writeAsBytes(bytes);

      setState(() {
        _pdfPath = file.path;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    getPdf();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Base64 to PDF Converter'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Stack(
              children: [
                _pdfPath != null
                    ? PDFView(filePath: _pdfPath!)
                    : const Center(child: CircularProgressIndicator()),
                Positioned(
                  bottom: 100,
                  right: 50,
                  child: Image.asset('assets/icon/checkmark.png', width: 100, height: 100),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


