import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class StoreMessages{

  static String sharedPreferenceMessagesKey = "MESSAGESKEY";

  // SAVING data to SharedPreference

  static Future<bool> saveMessages(List<String> messagesList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setStringList(sharedPreferenceMessagesKey, messagesList);
  }

  // GETTING data from SharedPreference

  static Future<List<String>> getMessages() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getStringList(sharedPreferenceMessagesKey);
  }

}
