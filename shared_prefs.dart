import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesKeys{
   static String keyToken = 'token';
   static String valueToken = '';
   static String keyId = 'id';
   static String valueId = '';

}

class SharedPreferencesMethods{

   Future<void> setString(String key,String value) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(key, value);
   }

   Future<String?> getString(String key) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString(key);
   }

   Future<void> setInt(String key, int value) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setInt(key, value);
   }

   Future<int?> getInt(String key) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getInt(key);
   }

   Future<void> clearAll() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.clear();
   }

}

//for storeData
// await SharedPreferencesMethods().setString(SharedPreferencesKeys.keyToken, jsonData['payload']['token'] ?? '');
// await SharedPreferencesMethods().setInt(SharedPreferencesKeys.keyId, jsonData['payload']['id']);
//for getData
// String? accessToken = await SharedPreferencesMethods().getString(SharedPreferencesKeys.keyToken);
// int? roleId =  await SharedPreferencesMethods().getInt(SharedPreferencesKeys.keyId);
// for clearData
// await SharedPreferencesMethods().clearAll();
