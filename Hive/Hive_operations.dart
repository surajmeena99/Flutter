final HiveHelper hiveHelper = HiveHelper(); // Create an instance of HiveHelper


//Method for save data offline Using Hive
Future<void> saveDataOffline(Map<String, dynamic> userdata) async {
    HiveHelper hiveHelper = HiveHelper();

    var box = await hiveHelper.openUserFormBox();

    // Create a HiveUserInfo object from the data map
    var offlineData = HiveUserForm(
      data: userdata['data'],
      document: userdata['document'],
      userCode: widget.UserInfo["userCode"].toString(),
    );

    // Save the data object to the box
    await box.add(offlineData);


    showMessageToast("User Data Saved offline.");
  }

  // Method to sync offline data to the server when the screen loads
  Future<void> syncDataOnLoad() async {
    bool? isConnected =   await checkNetworkConnectivity(); // Check network connectivity

    // Sync data only if the device is online
    if (isConnected == true) {
      await syncDataOfflineToOnline(hiveHelper);
    } else {
      // showMessageToast("You are offline. Data will sync when online.");
      print("You are offline. Data will sync when online.");
    }
  }

    Future<void> syncDataOfflineToOnline(HiveHelper hiveHelper) async {
    // Open the Hive box where offline data is stored
    var box = await hiveHelper.openUserFormBox();

    List<HiveUserForm> offlineDataList =  box.values.toList().cast<HiveUserForm>();

    // Loop through the offline data list and attempt to sync each entry
    print("syncDataOfflineToOnline $offlineDataList");
    // Attempt to sync each entry
    for (var data in offlineDataList) {
      // Create a map of data to send to the server
      Map<String, dynamic> payload = {
        'data': data.data,
        'document': data.document,
      };

      // Call the server with the synced data
      Map<String, dynamic> response = await httpPostMethod("saveUserForm", payload, context,);

      // Check if the data sync was successful
      if (response.isNotEmpty && response["Status"] == 200) {
        // Delete the synced data from local storage
        print("syncDataOfflineToOnline: ${response["Status"]}");
        await box.delete(data.key);
        print("saveUserForm Successfully");
      }
    }

    if (box.isEmpty) {
      // showMessageToast("All offline data synced successfully!");
      print("All offline data synced successfully!");
    } else {
      box.clear();
      // showMessageToast("Some data could not be synced. Please check your connection.");
      print("Some data could not be synced. Please check your connection.");
    }
  }
