import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:testapp_aoi/models/AboutModel.dart';
import 'package:testapp_aoi/models/skills_model.dart';

class ConsentNetworking {
  final String _urlApi = "bacend-fshi.onrender.com";
  final String _login = '/auth/login';
  final String _verification = '/auth/verification';
  final String _getSkills = '/user/skills';
  final String _deleteSkills = '/user/delete/skills';
}
