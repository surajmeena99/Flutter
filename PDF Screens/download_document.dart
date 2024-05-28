import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class DocumentScreen extends StatefulWidget {
  const DocumentScreen({super.key});

  @override
  State<DocumentScreen> createState() => _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Download Document",
          style: GoogleFonts.inter(
              fontSize: 14.0,
              color: Colors.white,
              fontWeight: FontWeight.w700
          ),
          textAlign: TextAlign.start,
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          const Center(
                            child: Text("Card 1",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          ),
                          const SizedBox(height: 10,),
                          cardItem('Item 1:', "1"),
                          cardItem('Item 2:', "2"),
                          cardItem('Item 3:', "3"),
                          cardItem('Item 4:', "4"),
                          cardItem('Item 5:', "5"),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          const Center(
                            child: Text("Card 2",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          ),
                          const SizedBox(height: 10,),
                          cardItem('Item 6:', "6"),
                          cardItem('Item 7:', "7"),
                          cardItem('Item 8:', "8"),
                          cardItem('Item 9:', "9"),
                          cardItem('Item 10:', "10"),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  ElevatedButton(
                    onPressed: () {
                      downloadAndSavePdf("assets/VPT-240153.pdf");
                    },
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.amber),
                      overlayColor: MaterialStateProperty.all(Colors.white.withOpacity(0.4)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    ),
                    child: const Text("Download Pdf")
                ),
                  const SizedBox(height: 20,)
                ],
              ),
            ),
          )
    );
  }

  Widget cardItem(itemName, itemData) {
     return Padding(
       padding: const EdgeInsets.all(2.0),
       child: Row(
         children: [
           Expanded(child: Text(itemName, style: const TextStyle(fontWeight: FontWeight.bold),)),
           Expanded(
               child: Text(itemData, maxLines: 2,),
           )
         ],
       ),
     );
  }

  Future<void> downloadAndSavePdf(String? assetPath) async {
  if (assetPath != null) {
    try {
      // Request storage permissions
      if (await _requestPermission(Permission.storage)) {
        // Load the asset as ByteData
        final ByteData data = await rootBundle.load(assetPath);
        final List<int> bytes = data.buffer.asUint8List();

        // Determine the path to save the file
        String path;
        if (Platform.isIOS) {
          Directory directory = await getApplicationDocumentsDirectory();
          path = directory.path;
        } else {
          // Android specific directory path
          String directory = "/storage/emulated/0/Download";
          bool dirExists = await Directory(directory).exists();
          if (!dirExists) {
            directory = "/storage/emulated/0/Downloads";
          }
          String myDirectoryName = "Excise";
          String relativePath = "$directory/$myDirectoryName";

          Directory downloadsDirectory = Directory(relativePath);

          // Ensure the directory exists
          if (!(await downloadsDirectory.exists())) {
            await downloadsDirectory.create(recursive: true);
          }

          path = downloadsDirectory.path;
        }

        // Proceed if the path is valid
        if (path.isNotEmpty) {
          int timestamp = DateTime.now().millisecondsSinceEpoch;
          // DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);

          // final dateFormatter = DateFormat('yyyy-MM-dd');
          // final timeFormatter = DateFormat('HH:mm:ss');

          // final formattedDate = dateFormatter.format(dateTime);
          // final formattedTime = timeFormatter.format(dateTime);

          final String filePath = '$path/OfsDocument$timestamp.pdf';

          // Write the bytes to a file
          final File file = File(filePath);
          await file.writeAsBytes(bytes);

          print('PDF downloaded and saved to: $filePath');
        } else {
          print("Path not found");
        }
      } else {
        print("Storage permission not granted");
      }
    } catch (e) {
      print('Failed to download PDF: $e');
      // CommonWidget().toastMessage(OfsDocConstant.downloadCatchError);
    }
  } else {
    print('Download Failed');
    // CommonWidget().toastMessage(OfsDocConstant.downloadFailureMessage);
  }
}

Future<bool> _requestPermission(Permission permission) async {
  final permissionStatus = await permission.status;
  if (permissionStatus.isDenied) {
    // Request the permission for the first time
    await permission.request();

    // Check once again if the permission is still denied
    if (await permission.status.isDenied) {
      await openAppSettings();
      return false;
    }
  } else if (permissionStatus.isPermanentlyDenied) {
    // Open app settings for user to manually enable permission
    await openAppSettings();
    return false;
  }
  return permissionStatus.isGranted;
}

}

