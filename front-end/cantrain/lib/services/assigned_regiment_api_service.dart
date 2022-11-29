
import 'package:cantrain/models/assigned_regiment.dart';
import 'package:cantrain/services/api_service.dart';

class AssignedRegimentApiService {

  Future<List<AssignedRegiment>?> getAssignedRegimentListByUser(userId) async {
    var assignedRegimentList;
    var url = ('/assignedRegiment/getListbyUser/$userId');

    var response = await ApiService().get(url);

    if (response.statusCode == 200) {
      var json = response.body;

      assignedRegimentList = assignedRegimentListWithoutClientsFromJson(json);
    }

    return assignedRegimentList;
  }

  Future<AssignedRegiment?> getAssignedRegimentById(assignedRegimentId) async {
    var assignedRegiment;
    var url = ('/assignedRegiment/findById/$assignedRegimentId');

    var response = await ApiService().get(url);

    if (response.statusCode == 200) {
      var json = response.body;

      assignedRegiment = assignedRegimentWithoutClientFromJson(json);
    }

    return assignedRegiment;
  }

}
