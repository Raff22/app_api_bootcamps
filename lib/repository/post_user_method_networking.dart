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

class PostUserMethodNetworking extends ConsentNetworking {
  Future<DataProjectModel?> addNewProjectMethod(
      {required BuildContext context,
      required Map<String, dynamic> body}) async {
    var url = Uri.https(urlApi, editProject);
    var response = await http.post(
      url,
      body: json.encode(body),
      headers: {"authorization": prefs!.getString("token")!},
    );

    switch (response.statusCode) {
      case 200:
        print(json.decode(response.body));
        return DataProjectModel.fromJson((json.decode(response.body))["data"]);

      case 401:
        prefs?.clear();
        context.pushAndRemoveUntil(view: const LoadingScreen());
        break;
      default:
        print(response.body);
        throw const FormatException("here is error i dont not ");
    }
    return null;
  }
}
