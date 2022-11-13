import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:mvvm_task/view_model/shared_pref_model.dart';

import '../model/user_details_model.dart';

class Homeview extends ChangeNotifier {
  List<UserDetailsModel> taskList = [];
  final ref = FirebaseDatabase.instance.ref();
  Future<void> pushData(
      String tittle, String details, String time, bool state) async {
    bool iscomplete = false;
    var userId = await UserView.getUserid();
    DatabaseReference database =
        FirebaseDatabase.instance.ref('users/$userId/to_dos');
    await database.update({
      'task_${taskList.length + 1}': {
        'task_id': 'task_${taskList.length + 1}',
        'tittle': tittle,
        "time": time,
        "detail": details,
        "state": state,
        "completed": iscomplete,
      }
    });
  }

  iscomplete(bool state, String taskId) async {
    String userId = await UserView.getUserid();
    try {
      var snapshot =
          await ref.child('users').child(userId).child('to_dos').child(taskId);

      snapshot.update({"completed": state});
      for (var element in taskList) {
        if (element.taskId == taskId) {
          element.state = state;
        }
      }
      notifyListeners();
    } catch (e) {}
  }

  pullData() async {
    String userId = await UserView.getUserid();
    try {
      var snapshot =
          await ref.child('users').child(userId).child('to_dos').get();
      if (snapshot.exists) {
        try {
          if (taskList.isNotEmpty) {
            taskList.clear();
          }
          for (DataSnapshot element in snapshot.children) {
            taskList.add(UserDetailsModel.fromJson(
                element.value as Map<Object?, Object?>));
          }
          taskList
              .sort((a, b) => int.parse(a.time).compareTo(int.parse(b.time)));
        } catch (e) {
          //
        }
      }
    } catch (e) {}

    notifyListeners();
  }

  String millioDate(String time) {
    var dt = DateTime.fromMillisecondsSinceEpoch(int.parse(time));
    return DateFormat('dd/MM/yyyy, hh:mm a').format(dt);
  }
}
