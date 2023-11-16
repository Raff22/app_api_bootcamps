// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:testapp_aoi/main.dart';
import 'package:testapp_aoi/models/userModels/about_model.dart';
import 'package:testapp_aoi/models/userModels/project_model.dart';
import 'package:testapp_aoi/repository/const_networking.dart';
import 'package:http/http.dart' as http;
import 'package:testapp_aoi/screen/loading_screen.dart';
import 'package:testapp_aoi/utils/extension/navExtension.dart';

class UserMethodNetworking extends ConsentNetworking {
  // ------ getAboutMethod
  Future<UserAboutModel?>? getAboutMethod(
      {required BuildContext context}) async {
    var url = Uri.https(urlApi, getAbout);
    var response = await http.get(
      url,
      headers: {"authorization": prefs!.getString("token")!},
    );
    switch (response.statusCode) {
      case 200:
        return UserAboutModel.fromJson(json.decode(response.body));

      case 401:
        prefs?.clear();
        context.pushAndRemoveUntil(view: const LoadingScreen());
        break;
      default:
        throw const FormatException("here is error i dont not ");
    }
    return null;
  }

  // ------ registration
  Future<ProjectModel?>? getProjectsMethod(
      {required BuildContext context}) async {
    var url = Uri.https(urlApi, getProjects);
    var response = await http.get(
      url,
      headers: {"authorization": prefs!.getString("token")!},
    );
    switch (response.statusCode) {
      case 200:
        return ProjectModel.fromJson(json.decode(response.body));

      case 401:
        prefs?.clear();
        context.pushAndRemoveUntil(view: const LoadingScreen());
        break;
      default:
        throw const FormatException("here is error i dont not ");
    }
    return null;
  }
}
