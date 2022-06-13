import 'dart:convert';

import 'package:bloc_state_management/models/covid_dm.dart';
import 'package:bloc_state_management/models/error_dm.dart';
import 'package:bloc_state_management/models/gallery_dm.dart';
import 'package:http/http.dart';

import '../screens/post_request/sign_in_dm.dart';

class ApiProvider {
  final covidUrl = "https://api.covid19api.com/summary";

  Future<CovidDm> getCovidData() async {
    final res = await get(Uri.parse(covidUrl));
    CovidDm covidDm = covidDmFromJson(res.body);
    return covidDm;
  }

  Future<List<GalleryDm>> getGalleryData() async {
    var headers = {
      'Accept-Version': 'v1',
      'Authorization': 'Client-ID rhwcV9wzd5u6tIf-NNFs1HTNM88VHlJpcEa7qTlgXjM',
    };

    final response = await get(
        Uri.parse('https://api.unsplash.com/photos?page=1'),
        headers: headers);

    List<GalleryDm> galleryDm = galleryDmFromJson(response.body);
    return galleryDm;
  }

  Future<dynamic> doSignIn({required String email, password}) async {
    var body = {
      'email_id': email,
      'password': password,
      'device_token': '1234567890',
    };
    final response = await post(
        Uri.parse("http://driver.indieat.se/api/driver/driver_login"),
        body: body);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }
}
