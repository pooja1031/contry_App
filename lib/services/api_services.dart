import 'dart:convert';
import 'package:countryapp/utils/constants.dart';
import 'package:http/http.dart' as http;

import 'package:countryapp/models/contry.dart';

class ApiServices {
  Future<List<Country>> fetchCountries() async {
    List<Country> countries = [];
    
    try {
      for (String url in AppConstants.countryUrls) { 
        final response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
                          final data = json.decode(response.body);
          countries.add(Country.fromJson(data[0]));
        } else {
          throw Exception('Failed to load country data');
        }
      }
    } catch (e) {
      print(e);
    }
    
    return countries;
  }
}