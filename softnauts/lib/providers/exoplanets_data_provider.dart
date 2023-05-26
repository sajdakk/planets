import 'package:dio/dio.dart';
import 'package:softnauts/softnauts.dart';

class ExoplanetsDataProvider {
  bool _moreExoplanetsAvailable = true;
  int _pageNumber = 1;

  static const int _pageSize = 20;

  final _dio = Dio();

  Future<List<Exoplanets>> fetch() async {
    final firstPart =
        await _dio.get('https://api.arcsecond.io/exoplanets/?page_size=$_pageSize&page=$_pageNumber&format=json');

    if (firstPart.statusCode != 200) {
      throw Exception('Failed to load exoplanets');
    }

    final List<Exoplanets> exoplanetsList = <Exoplanets>[];

    Map<String, dynamic> results = firstPart.data;

    if (results['results'].length < _pageSize) {
      _moreExoplanetsAvailable = false;
    }

    for (Map<String, dynamic> item in results['results']) {
      final Exoplanets exoplanets = Exoplanets.fromJson(item);

      exoplanetsList.add(exoplanets);
    }

    return exoplanetsList;
  }

  Future<List<Exoplanets>> getMoreExoplanets() async {
    if (_moreExoplanetsAvailable == false) {
      return <Exoplanets>[];
    }

    _pageNumber++;

    final next =
        await _dio.get('https://api.arcsecond.io/exoplanets/?page_size=$_pageSize&page=$_pageNumber&format=json');

    if (next.statusCode != 200) {
      throw Exception('Failed to load exoplanets');
    }

    final List<Exoplanets> exoplanetsList = <Exoplanets>[];

    Map<String, dynamic> results = next.data;

    if (results['results'].length < _pageSize) {
      _moreExoplanetsAvailable = false;
    }

    for (Map<String, dynamic> item in results['results']) {
      final Exoplanets exoplanets = Exoplanets.fromJson(item);

      exoplanetsList.add(exoplanets);
    }

    return exoplanetsList;
  }
}
