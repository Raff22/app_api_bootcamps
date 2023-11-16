import 'dart:convert';

import 'package:testapp_aoi/models/auth_models/VerificationModel.dart';
import 'package:testapp_aoi/models/auth_models/successAuth.dart';
import 'package:testapp_aoi/repository/const_networking.dart';
import 'package:http/http.dart' as http;

class AuthMethodNetworking extends ConsentNetworking {
  // ------ registration
  Future<RegistrationModel> registrationMethod(
      {required Map<String, dynamic> body}) async {
    var url = Uri.https(urlApi, registration);
    var response = await http.post(url, body: json.encode(body));

    final convertResponse =
        RegistrationModel.fromJson(json.decode(response.body));
    return convertResponse;
  }

  // ------ login

  Future<RegistrationModel> loginMethod(
      {required Map<String, dynamic> body}) async {
    var url = Uri.https(urlApi, login);
    var response = await http.post(url, body: json.encode(body));

    final convertResponse =
        RegistrationModel.fromJson(json.decode(response.body));
    return convertResponse;
  }

  // ------ verification

  Future<VerificationModel> verificationMethod(
      {required Map<String, dynamic> body}) async {
    var url = Uri.https(urlApi, verification);
    var response = await http.post(url, body: json.encode(body));

    final convertResponse =
        VerificationModel.fromJson(json.decode(response.body));
    return convertResponse;
  }
}
