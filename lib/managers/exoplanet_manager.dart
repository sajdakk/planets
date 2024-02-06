import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:planets/planets.dart';

class ExoplanetsDataManager {
  ExoplanetsDataManager({
    required this.dio,
  });

  static const int _pageSize = 20;

  final Dio dio;

  bool _moreExoplanetsAvailable = true;
  int _pageNumber = 1;

  final BehaviorSubject<List<Exoplanet>> _exoplanets$ = BehaviorSubject<List<Exoplanet>>.seeded(<Exoplanet>[]);

  ValueStream<List<Exoplanet>> get exoplanets {
    return _exoplanets$;
  }

  Future<bool> fetchNextExoplanets() async {
    if (_moreExoplanetsAvailable == false) {
      return true;
    }

    final Response<Map<String, dynamic>> next =
        await dio.get('https://api.arcsecond.io/exoplanets/?page_size=$_pageSize&page=$_pageNumber&format=json');

    if (next.statusCode != 200) {
      throw Exception('Failed to load exoplanets');
    }

    final Map<String, dynamic>? results = next.data;
    if (results == null) {
      throw Exception('Failed to load activities');
    }

    if (results['results'].length < _pageSize) {
      _moreExoplanetsAvailable = false;
    }

    final List<Exoplanet> exoplanetsList = <Exoplanet>[];

    for (Map<String, dynamic> item in results['results']) {
      final Exoplanet exoplanets = Exoplanet.fromJson(item);

      exoplanetsList.add(exoplanets);
    }

    _pageNumber++;

    _updateStream(exoplanetsList);

    return true;
  }

  void _updateStream(List<Exoplanet> newData) {
    final List<Exoplanet>? existingData = _exoplanets$.valueOrNull?.toList();
    if (existingData == null) {
      return;
    }

    for (final Exoplanet data in newData) {
      final Exoplanet? existingValue = existingData.firstWhereOrNull(
        (Exoplanet exoplanet) => exoplanet.name == data.name,
      );
      if (existingValue != null) {
        existingData.remove(existingValue);
        existingData.add(data);
        continue;
      }

      existingData.add(data);
    }

    _exoplanets$.add(existingData);
  }
}
