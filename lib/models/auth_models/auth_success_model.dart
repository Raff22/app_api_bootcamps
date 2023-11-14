class AuthModelSuccess {
  AuthModelSuccess({
    required this.msg,
    required this.dataAuth,
    required this.codeState,
  });
  late final String msg;
  late final DataAuth dataAuth;
  late final int codeState;

  AuthModelSuccess.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    dataAuth = DataAuth.fromJson(json['data']);
    codeState = json['codeState'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['msg'] = msg;
    data['data'] = dataAuth.toJson();
    data['codeState'] = codeState;
    return data;
  }
}

class DataAuth {
  DataAuth({
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

  DataAuth.fromJson(Map<String, dynamic> json) {
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
