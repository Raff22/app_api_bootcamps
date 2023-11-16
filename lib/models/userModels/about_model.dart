class UserAboutModel {
  UserAboutModel({
    required this.msg,
    required this.data,
    required this.codeState,
  });
  late final String msg;
  late final Data? data;
  late final int codeState;

  UserAboutModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
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
    required this.id,
    required this.name,
    required this.email,
    this.titlePosition,
    required this.phone,
    this.location,
    this.birthday,
    this.about,
    this.image,
    required this.createAt,
  });
  late final int id;
  late final String name;
  late final String email;
  late final String? titlePosition;
  late final String phone;
  late final String? location;
  late final String? birthday;
  late final String? about;
  late final String? image;
  late final String createAt;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    titlePosition = json['title_position'];
    phone = json['phone'];
    location = json['location'];
    birthday = json['birthday'];
    about = json['about'];
    image = json['image'];
    createAt = json['create_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['title_position'] = titlePosition;
    data['phone'] = phone;
    data['location'] = location;
    data['birthday'] = birthday;
    data['about'] = about;
    data['image'] = image;
    data['create_at'] = createAt;
    return data;
  }
}
