import 'dart:convert';

import 'package:flutter_app_mydiaryfood/models/diaryfood.dart';
import 'package:flutter_app_mydiaryfood/services/env.dart';
import 'package:http/http.dart' as http;

class DiaryfoodAPI{
  static Future<List<diaryfood>> getAllDiaryfood() async {
    final res = await http.get(
      Uri.parse('${Env.SERVER_URL}/getall'),
      headers: {'Content-Type': 'application/json'},
    );

    if(res.statusCode == 200){
      final resData = jsonDecode(res.body);
      final diaryfoodData = await resData.map<diaryfood>((json) {
        return diaryfood.fromJson(json);
      }).toList();

      return diaryfoodData;
    }else{
      throw Exception('Have problems...');
    }
  }
}