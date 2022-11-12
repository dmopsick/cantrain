import 'package:http/http.dart' as http;
import '../models/dbuser.dart';

class ApiService {

  // Load this from a .env or a secret
  static const String apiBaseUrl = 'https://1r3rc9zvq0.execute-api.us-east-1.amazonaws.com/dev';

  Future<DBUser?> getUserByEmail(email) async {
    var user;
    var client = http.Client();
    var url = Uri.parse('$apiBaseUrl/user/findByEmail/$email');
   
    var response = await client.get(url);

    if (response.statusCode == 200) {
      var json = response.body;

      user = userFromJson(json);
    }

    return user;
  }

  // Is User Trainer

  // Get Trainer by user

  // Get Client by user

  // Get clients by trainer

  // Get Regiments by client



}
