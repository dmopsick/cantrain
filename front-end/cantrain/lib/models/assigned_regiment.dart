import 'dart:convert';
import 'package:cantrain/models/client.dart';
import 'package:cantrain/utils/util.dart';
import 'package:cantrain/models/regiment.dart';

// From JSON for a list of assigned regiments
List<AssignedRegiment> assignedRegimentListWithoutClientsFromJson(String jsonString) => List<AssignedRegiment>.from(json.decode(jsonString).map((x) => AssignedRegiment.fromJsonWithoutClient(x))); 

// FROM Json for a single assigned regiment
String assignedRegimentListToJson(List<AssignedRegiment> assignedRegimentList) => json.encode(List<dynamic>.from(assignedRegimentList.map((x) => x.toJson())));

// To JSON for a single regiment 

// To JSON for a list of assigned regiments | May not need this

class AssignedRegiment {

  static const String jsonId = "ASSIGNED_REGIMENT_ID";
  static const String jsonRegimentId = "REGIMENT_ID";
  static const String jsonClientId = "CLIENT_ID";
  static const String jsonCurrentCycle = "CURRENT_CYCLE";
  static const String jsonActive = "REGIMENT_ACTIVE";
  static const String jsonArchive = "REGIMENT_ARCHIVE";
  static const String jsonStatus = "REGIMENT_STATUS";
  
  AssignedRegiment({
    required this.id,
    required this.regiment,
    this.client,
    this.clientId,
    this.currentCycle,
    this.active,
    this.archive,
    this.status
  });

  int id;
  Regiment regiment; // Want to always load the reigment
  Client? client;
  int? clientId; // Not sure I always want or need to load client... could I have different variables constructors? Not sure
  int? currentCycle;
  bool? active;
  bool? archive;
  int? status;

  // Could there be multiple fromJson based on whether or not I wanted to load nested objects?
  // Then in that case would need to have a client and clientId object and have them both be nullable
  factory AssignedRegiment.fromJsonWithoutClient(Map<String, dynamic> json) => AssignedRegiment(
    id: json[jsonId], 
    regiment: Regiment.fromJson(json), // Load the nested regiment object 
    clientId: json[jsonClientId], // Would I want to load nested client object here? I feel like no
    currentCycle: json[jsonCurrentCycle],
    active: Util().convertShortToBool(json[jsonActive]),
    archive: Util().convertShortToBool(json[jsonArchive]),
    status: json[jsonStatus]
  );

  // Load assigned regiment records with full client info
  factory AssignedRegiment.fromJsonWithClient(Map<String, dynamic> json) => AssignedRegiment(
    id: json[jsonId], 
    regiment: Regiment.fromJson(json), // Load the nested regiment object 
    client: Client.fromJson(json),
    currentCycle: json[jsonCurrentCycle],
    active: Util().convertShortToBool(json[jsonActive]),
    archive: Util().convertShortToBool(json[jsonArchive]),
    status: json[jsonStatus]
  );


  Map<String, dynamic> toJson() => {
    jsonId: id,
    jsonRegimentId: regiment.id,
    jsonClientId: clientId,
    jsonCurrentCycle: currentCycle,
    jsonActive: active, // Need to convert bool back to
  };

}
