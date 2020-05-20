import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:myshop/Models/Dishes.dart';

class HttpService {
  final String apiUrl = 'http://www.mocky.io/v2/5dfccffc310000efc8d2c1ad';

  Future<List<Dishes>> getDishes() async {
    http.Response res = await http.get(apiUrl);
    if (res.statusCode == 200) {
    
      List<dynamic> body = jsonDecode(res.body);

      List tbMenu = body[0]['table_menu_list'];
      List<Dishes> dishes =
          tbMenu.map((dynamic item) => Dishes.fromJson(item)).toList();
      return dishes;
    } else {
      throw 'Error found';
    }
  }
}
