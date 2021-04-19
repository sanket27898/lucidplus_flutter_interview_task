import 'package:flutter/Material.dart';
import '../JsonParse/users.dart';

import 'package:http/http.dart' as https;

class ProviderClass with ChangeNotifier {
  var url = Uri.https('jsonplaceholder.typicode.com', "/users");

  static bool isLoading = true;

  Future<List<User>> getUsers() async {
    try {
      var reponse = await https.get(url);

      if (200 == reponse.statusCode) {
        final List<User> users = userFromJson(reponse.body);
        isLoading = false;
        notifyListeners();
        return users;
      } else {
        isLoading = false;
        notifyListeners();
        return List<User>();
      }
    } catch (e) {
      print(e);
      isLoading = false;
      notifyListeners();

      return List<User>();
    }
  }
}
