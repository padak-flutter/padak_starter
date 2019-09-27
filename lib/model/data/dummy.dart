import 'dart:convert' as json;
import 'package:flutter/services.dart';

import '../movies_response.dart';

Future<String> loadJsonStr() async {
  final jsonCrossword = await rootBundle.loadString('assets/dummy.json');
  return jsonCrossword;
}

Future<MoviesResponse> loadJsonObject() async {
  final jsonString = await loadJsonStr();
  final Map userMap = json.jsonDecode(jsonString);
  final data = MoviesResponse.fromJson(userMap);
  return data;
}
