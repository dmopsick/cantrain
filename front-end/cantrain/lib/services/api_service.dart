import 'package:cantrain/models/client.dart';
import 'package:cantrain/models/trainer.dart';
import 'package:http/http.dart' as http;
import '../models/dbuser.dart';

class ApiService {

  // Load this from a .env or a secret
  static const String apiBaseUrl = 'https://1r3rc9zvq0.execute-api.us-east-1.amazonaws.com/dev';


  get(String endpoint) async {
     var client = http.Client();
     var fullUrl = Uri.parse(apiBaseUrl + endpoint);

     var response = await client.get(fullUrl);

     client.close();

     return response;
  }

  Future<DBUser?> getUserByEmail(email) async {
    var user;
    var endpoint = '/user/findByEmail/$email';
   
    var response = await get(endpoint);

    if (response.statusCode == 200) {
      var json = response.body;

      user = userFromJson(json);
    }

    return user;
  }

  // Get Trainer by user
  Future<Trainer?> getTrainerByUser(DBUser? user) async {
    var trainer;


    return trainer;
  }

  // Get Client by user
  Future<Client?> getClientByUser(DBUser? user) async {
    var dbClient;

    if (user != null) {
      var endpoint = '/client/findByUser/${user.id}';

      var response = await get(endpoint);

      if (response.statusCode == 200) {
        var json = response.body;
        
        if (json.isNotEmpty) {
          dbClient = clientFromJson(json);
        }

      }
    }

    return dbClient;
  }

  // Get clients by trainer

  // Get AssignedRegiments by client



}
