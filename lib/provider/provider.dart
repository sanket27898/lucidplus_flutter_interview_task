import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:lucidplus_interview_task/List/User.dart';

class ProviderClass with ChangeNotifier {
  var url = Uri.https('jsonplaceholder.typicode.com', "/users");

  Future<List<User>> getUsers() async {
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<User> list = parseUsers(response.body);
        notifyListeners();
        return list;
      } else {
        notifyListeners();
        throw Exception("Error");
      }
    } catch (e) {
      notifyListeners();
      throw Exception(e.toString());
    }
  }

  List<User> parseUsers(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    notifyListeners();
    return parsed.map<User>((json) => User.fromJson(json)).toList();
  }
}
