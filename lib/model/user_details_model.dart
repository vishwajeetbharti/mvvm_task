class UserDetailsModel {
  String tittle;
  String time;
  String description;
  bool state;
  bool complete;
  String taskId;

  UserDetailsModel(
      {required this.tittle,
      required this.time,
      required this.description,
      required this.state,
      required this.complete,
      required this.taskId});

  factory UserDetailsModel.fromJson(Map<dynamic, dynamic> json) =>
      UserDetailsModel(
          tittle: json['tittle'],
          time: json['time'],
          description: json['detail'],
          state: json['state'],
          complete: json['completed'],
          taskId: json['task_id']);

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = {
      'tittle': tittle,
      'time': time,
      'detail': description,
      'state': state,
      "completed": complete,
      "task_id": taskId
    };
    return data;
  }
}
