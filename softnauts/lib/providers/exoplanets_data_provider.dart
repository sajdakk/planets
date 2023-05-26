import 'package:dio/dio.dart';
import 'package:softnauts/models/exoplanets/exoplanets.dart';

class ExoplanetsDataProvider {
  bool _moreExoplanetsAvailable = true;
  int pageNumber = 1;

  final dio = Dio();

  Future<List<Exoplanets>> fetch() async {
    _moreExoplanetsAvailable = true;

    final firstPart = await dio.get('https://api.arcsecond.io/exoplanets/?page_size=20&page=$pageNumber&format=json');

    if (firstPart.statusCode == 200) {
      final List<Exoplanets> exoplanetsList = <Exoplanets>[];

      Map<String, dynamic> results = firstPart.data;

      for (Map<String, dynamic> item in results['results']) {
        final Exoplanets exoplanets = Exoplanets.fromJson(item);

        exoplanetsList.add(exoplanets);
      }

      return exoplanetsList;
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<List<Exoplanets>> getMoreExoplanets() async {
    if (_moreExoplanetsAvailable == false) {
      return <Exoplanets>[];
    }

    pageNumber++;

    final next = await dio.get('https://api.arcsecond.io/exoplanets/?page_size=20&page=$pageNumber&format=json');

    if (next.statusCode == 200) {
      final List<Exoplanets> exoplanetsList = <Exoplanets>[];

      Map<String, dynamic> results = next.data;

      if (results['results'].length < 20) {
        _moreExoplanetsAvailable = false;
      }

      for (Map<String, dynamic> item in results['results']) {
        final Exoplanets exoplanets = Exoplanets.fromJson(item);

        exoplanetsList.add(exoplanets);
      }

      return exoplanetsList;
    } else {
      throw Exception('Failed to load album');
    }
  }
}
