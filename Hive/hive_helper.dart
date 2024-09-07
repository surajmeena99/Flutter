import 'dart:async';
import 'package:Suraj/hive/HiveUserLocation.dart';
import 'package:Suraj/hive/HiveUserInfo.dart';
import 'package:Suraj/hive/HiveUserForm.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'HiveCode.dart';
import 'HiveUserInfo.dart';
import 'HiveUserData.dart';

class HiveHelper {
  open() async {
    if (kIsWeb) {
      Hive.init("CoffeeBoard");
    } else {
      final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
      Hive.init(appDocumentDir.path);

      // Register adapters only if they are not already registered
      if (!Hive.isAdapterRegistered(0)) {
        Hive.registerAdapter(HiveUserDataAdapter()); // Ensure typeId 0 is unique
      }

      if (!Hive.isAdapterRegistered(1)) {
        Hive.registerAdapter(HiveUserInfoAdapter()); // Ensure typeId 1 is unique
      }

      if (!Hive.isAdapterRegistered(2)) {
        Hive.registerAdapter(HiveUserFormAdapter()); // Ensure typeId 2 is unique
      }
      if (!Hive.isAdapterRegistered(3)) {
        Hive.registerAdapter(HiveUserLocationAdapter()); // Ensure typeId 3 is unique
      }

    }
  }
  bool isBoxOpen() {
    return Hive.isBoxOpen(Boxes.test);
  }
  Future<Box> UserData() async {
    return await Hive.openBox<HiveUserData>(Boxes.test);
  }

  // Opens a box for HiveUserInfo
  Future<Box<HiveUserInfo>> openUserInfoBox() async {
    return await Hive.openBox<HiveUserInfo>(Boxes.userInfo);
  }

  // Opens a box for HiveUserForm
  Future<Box<HiveUserForm>> openUserFormBox() async {
    return await Hive.openBox<HiveUserForm>(Boxes.userForm);
  }

  // Opens a box for HiveUserLocation
  Future<Box<HiveUserLocation>> openAddGeoCoordinatesBox() async {
    return await Hive.openBox<HiveUserLocation>(Boxes.userLocation);
  }

  close() {
    Hive.close();
  }
}
class Boxes {
  static const String test = 'UserData';
  static const String userInfo = 'UserInfoBox';
  static const String userForm = 'UserFormBox';
  static const String userLocation = 'UserLocationBox';
}