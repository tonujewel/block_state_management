import 'package:bloc_state_management/models/covid_dm.dart';
import 'package:bloc_state_management/models/gallery_dm.dart';
import 'package:http/http.dart';


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
      'Cookie': 'ugid=40da89d52d2f72ca3e63624c9a1f3b2a5506973'
    };
    final response = await get(
        Uri.parse('https://api.unsplash.com/photos?page=1'),
        headers: headers);

    List<GalleryDm> galleryDm = galleryDmFromJson(response.body);
    return galleryDm;
  }
}
