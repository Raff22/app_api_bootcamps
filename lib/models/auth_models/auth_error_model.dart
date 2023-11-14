class AuthError {
  AuthError({
    required this.msg,
    required this.data,
    required this.codeState,
  });
  late final String msg;
  late final DataErrorAuth data;
  late final int codeState;

  AuthError.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = DataErrorAuth.fromJson(json['data']);
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

class DataErrorAuth {
  DataErrorAuth();

  DataErrorAuth.fromJson(Map json);

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    return data;
  }
}
