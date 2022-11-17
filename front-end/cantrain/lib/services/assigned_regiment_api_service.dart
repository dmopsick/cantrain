
import 'package:cantrain/models/assigned_regiment.dart';
import 'package:cantrain/services/api_service.dart';

class AssignedRegimentApiService {

  Future<List<AssignedRegiment>?> getAssignedRegimentListByUser(user) async {
    var assignedRegimentList;
    var url = ('/assignedRegiment/getListbyUser/${user.id}');

    var response = await ApiService().get(url);

    if (response.statusCode == 200) {
      var json = response.body;

      assignedRegimentList = assignedRegimentListWithoutClientsFromJson(json);
    }

    return assignedRegimentList;
  }

}