import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesKeys{
   static String keyAccessToken = 'accessToken';
   static String valueAccessToken = '';
   static String keyRefreshToken = 'refreshToken';
   static String valueRefreshToken = '';
   static String keyRoleId = 'roleId';
   static String valueRoleId = '';

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
// await SharedPreferencesMethods().setString(SharedPreferencesKeys.keyAccessToken, jsonData['payload']['accessToken'] ?? '');
// await SharedPreferencesMethods().setInt(SharedPreferencesKeys.keyRoleId, jsonData['payload']['role_id']);
//for getData
// String? accessToken = await SharedPreferencesMethods().getString(SharedPreferencesKeys.keyAccessToken);
// int? roleId =  await SharedPreferencesMethods().getInt(SharedPreferencesKeys.keyRoleId);
// for clearData
// await SharedPreferencesMethods().clearAll();