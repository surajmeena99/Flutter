import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';

class PhoneCallScreen extends StatefulWidget {
  const PhoneCallScreen({super.key});

  @override
  State<PhoneCallScreen> createState() => _PhoneCallScreenState();
}

class _PhoneCallScreenState extends State<PhoneCallScreen> {

  void _checkPermission() async {
    PermissionStatus status = await Permission.phone.request();

    if (status == PermissionStatus.granted) {
      Fluttertoast.showToast(msg: 'Permission granted');
      // Continue with your app logic after getting permission
    } else {
      Fluttertoast.showToast(msg: 'Permission denied');
      // Handle the case where the user denies permission
    }
  }
  @override
  void initState() {
    super.initState();
    _checkPermission();
  }

  @override
  Widget build(BuildContext context) {   
    return Scaffold(
      appBar: AppBar(
        title: const Text("Phone Call App"),
        backgroundColor: Colors.green,
      ),
      body: const Center(
        child: Text("Phone Numbers"),
      ),
    );
  }
}