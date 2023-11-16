class VerificationModel {
  VerificationModel({
    required this.msg,
    required this.data,
    required this.codeState,
  });
  late final String msg;
  late final Data? data;
  late final int codeState;

  VerificationModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    // data = json['data'] != {} ? null : Data.fromJson(json['data']);
    data = (json['data'] as Map).isEmpty ? null : Data.fromJson(json['data']);

    codeState = json['codeState'];
  }

  Map<String, dynamic> toJson() {
    final dataMap = <String, dynamic>{};
    dataMap['msg'] = msg;
    dataMap['data'] = data?.toJson();
    dataMap['codeState'] = codeState;
    return dataMap;
  }
}

class Data {
  Data({
    required this.token,
    required this.expiresAt,
    required this.tokenType,
    required this.expiresIn,
    required this.email,
  });
  late final String token;
  late final int expiresAt;
  late final String tokenType;
  late final int expiresIn;
  late final String email;

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    expiresAt = json['expiresAt'];
    tokenType = json['tokenType'];
    expiresIn = json['expiresIn'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['token'] = token;
    data['expiresAt'] = expiresAt;
    data['tokenType'] = tokenType;
    data['expiresIn'] = expiresIn;
    data['email'] = email;
    return data;
  }
}
