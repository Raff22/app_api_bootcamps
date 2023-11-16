class ProjectModel {
  ProjectModel({
    required this.msg,
    required this.data,
    required this.codeState,
  });
  late final String msg;
  late final List<DataProjectModel>? data;
  late final int codeState;

  ProjectModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = List.from(json['data'])
        .map((e) => DataProjectModel.fromJson(e))
        .toList();
    codeState = json['codeState'];
  }

  Map<String, dynamic> toJson() {
    final dataMap = <String, dynamic>{};
    dataMap['msg'] = msg;
    dataMap['data'] = data?.map((e) => e.toJson()).toList();
    dataMap['codeState'] = codeState;
    return dataMap;
  }
}

class DataProjectModel {
  DataProjectModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.description,
    required this.state,
  });
  late final int id;
  late final int userId;
  late final String name;
  late final String description;
  late final String state;

  DataProjectModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    description = json['description'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['name'] = name;
    data['description'] = description;
    data['state'] = state;
    return data;
  }
}
