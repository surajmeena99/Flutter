import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class DownloadPdfScreen extends StatefulWidget {
  const DownloadPdfScreen({super.key, required this.pdfUrl});
  final String pdfUrl;

  @override
  State<DownloadPdfScreen>  createState() => _DownloadPdfScreenState();
}

class _DownloadPdfScreenState extends State<DownloadPdfScreen> {
  double? _progress;
  String? _downloadedFilePath;

  void _startDownload() {
    FileDownloader.downloadFile(
      url: widget.pdfUrl,
      onDownloadError: (String error) {
        print("Download Error: $error");
      },
      onProgress: (fileName, progress) {
        setState(() {
          _progress = progress;
        });
      },
      onDownloadCompleted: (path) {
        final File file = File(path);
        print('DownloadedFilePath: $file');
        setState(() {
          _downloadedFilePath = path;
          _progress = null;
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _startDownload();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Download Any File From URL\nin Flutter',
                style: TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              _downloadedFilePath != null
                  ? Expanded(
                      child: PDFView(
                        filePath: _downloadedFilePath!,
                        onError: (e) {
                          print("Error opening PDF: $e");
                        },
                      ),
                    )
                  : (_progress != null
                      ? const CircularProgressIndicator()
                      : const SizedBox()), 
                      // : ElevatedButton(
                      //     onPressed: () {
                      //       _startDownload();
                      //     },
                      //     child: const Text('Download'),
                      //   )),
            ],
          ),
        ),
      ),
    );
  }
}
