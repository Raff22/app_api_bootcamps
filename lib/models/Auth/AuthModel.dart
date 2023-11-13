class AuthModel {
  AuthModel({
    required this.msg,
    required this.data,
    required this.codeState,
  });
  late final String msg;
  late final _Data data;
  late final int codeState;

  AuthModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = _Data.fromJson(json['data']);
    codeState = json['codeState'];
  }

  Map<String, dynamic> toJson() {
    final dataMap = <String, dynamic>{};
    dataMap['msg'] = msg;
    dataMap['data'] = data.toJson();
    dataMap['codeState'] = codeState;
    return dataMap;
  }
}

class _Data {
  _Data({
    required this.email,
  });
  late final String email;

  _Data.fromJson(Map<String, dynamic> json) {
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['email'] = email;
    return data;
  }
}
