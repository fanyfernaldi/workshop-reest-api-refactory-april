import 'dart:convert';

import 'package:belajar_rest_api/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserApiServices {
  Future<List<User>> getUsers() async {
    Uri uri = Uri.parse('https://reqres.in/api/users?per_page=12');
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      List<User> users = [];

      for (var item in data) {
        users.add(User.fromJson(item));
      }

      // for (var i = 0; i < data.length!; i++) {
      //   users.add(User.fromJson(data[i]));
      // }

      return users;
    } else {
      throw Exception('Error get api list users');
    }
  }
}