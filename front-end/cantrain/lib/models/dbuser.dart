import 'dart:convert';
import 'package:cantrain/utils/util.dart';

DBUser userFromJson(String jsonString) => DBUser.fromJson(json.decode(jsonString)[0]);

String userToJson(DBUser user) => json.encode(user.toJson());

class DBUser {
  
  // Define the field names used in the JSON
  static const String jsonId = 'USER_ID';
  static const String jsonEmail = 'USER_EMAIL';
  static const String jsonFirstName = 'USER_FIRST_NAME';
  static const String jsonLastName = 'USER_LAST_NAME';
  static const String jsonPreferredName = 'USER_PREFERRED_NAME';
  static const String jsonActive = 'USER_ACTIVE';
  static const String jsonUnitsOfMeasurementSwitch = 'UNITS_OF_MEASUREMENT_SWITCH';

  DBUser({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    this.preferredName = '',
    required this.active,
    required this.unitsOfMeasurementSwitch,
  });

  int id;
  String email;
  String firstName;
  String lastName;
  String? preferredName;
  bool active;
  bool unitsOfMeasurementSwitch; // Will determine whether to show the user imperial or metric system, will hold off on this for now 

  factory DBUser.fromJson(Map<String, dynamic> json) => DBUser(
    id: json[jsonId],
    email: json[jsonEmail],
    firstName: json[jsonFirstName],
    lastName: json[jsonLastName],
    preferredName: json[jsonPreferredName],
    active: Util().convertShortToBool(json[jsonActive]),
    unitsOfMeasurementSwitch: Util().convertShortToBool(json[jsonUnitsOfMeasurementSwitch])
  );

  Map<String, dynamic> toJson() => {
    jsonId: id,
    jsonEmail: email,
    jsonFirstName: firstName,
    jsonLastName: lastName,
    jsonPreferredName: preferredName,
    jsonActive: active,
    jsonUnitsOfMeasurementSwitch: unitsOfMeasurementSwitch,
  };

}

