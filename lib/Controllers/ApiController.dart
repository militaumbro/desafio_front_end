import 'dart:convert';

import 'package:desafio_front_end/Model/GitUser.dart';
import 'package:http/http.dart' as http;

class ApiController {
  ApiController();
  List<GitUser> gitUsers;
  Future<List<GitUser>> getGitHubUsers() async {
    final response = await http.get(Uri.parse('https://api.github.com/users'));

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      Iterable iterable = json.decode(response.body);
      List<GitUser> users =
          List<GitUser>.from(iterable.map((entry) => GitUser.fromJson(entry)));
      return users;
      // return
    }
  }
}
