
class User {
  
  // Define the field names used in the JSON
  static const String jsonId = 'USER_ID';
  static const String jsonEmail = 'USER_EMAIL';
  static const String jsonFirstName = 'USER_FIRST_NAME';
  static const String jsonLastName = 'USER_LAST_NAME';
  static const String jsonPreferredName = 'USER_PREFERRED_NAME';
  static const String jsonActive = 'USER_ACTIVE';
  static const String jsonUnitsOfMeasurementSwitch = 'UNITS_OF_MEASUREMENT_SWITCH';

  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    this.preferredName = "",
    required this.active,
    required this.unitsOfMeasurementSwitch,
  });

  int id;
  String email;
  String firstName;
  String lastName;
  String preferredName;
  bool active;
  bool unitsOfMeasurementSwitch; // Will determine whether to show the user imperial or metric system, will hold off on this for now 

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json[jsonId],
    email: json[jsonEmail],
    firstName: json[jsonFirstName],
    lastName: json[jsonLastName],
    preferredName: json[jsonPreferredName],
    active: json[jsonActive],
    unitsOfMeasurementSwitch: json[jsonUnitsOfMeasurementSwitch]
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

