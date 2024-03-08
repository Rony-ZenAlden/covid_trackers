import 'dart:convert';

import 'package:covid_trackers/model/all_model.dart';
import 'package:covid_trackers/services/utils/app_url.dart';
import 'package:http/http.dart' as http;

class StatesServices {
  Future<All> fetchWorldStatesRecords() async {
    final response = await http.get(
      Uri.parse(AppUrl.worldStateApi),
    );
    if(response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return All.fromJson(data);
    }else {
      throw Exception('Error');
    }
  }

  Future<List<dynamic>> fetchCountriesList() async {
    final response = await http.get(
      Uri.parse(AppUrl.countriesList),
    );
    if(response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    }else {
      throw Exception('Error');
    }
  }
}
