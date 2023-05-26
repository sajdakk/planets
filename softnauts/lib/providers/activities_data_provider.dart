import 'package:dio/dio.dart';
import 'package:softnauts/softnauts.dart';

class ActivitiesDataProvider {
  bool _moreActivitiesAvailable = true;
  int pageNumber = 1;

  static const int _pageSize = 20;

  final _dio = Dio();

  Future<List<Activities>> fetch() async {
    final firstPart =
        await _dio.get('https://api.arcsecond.io/activities/?page_size=$_pageSize&page=$pageNumber&format=json');

    if (firstPart.statusCode != 200) {
      throw Exception('Failed to load activities');
    }

    final List<Activities> activitiesList = <Activities>[];

    Map<String, dynamic> results = firstPart.data;

    if (results['results'].length < _pageSize) {
      _moreActivitiesAvailable = false;
    }

    for (Map<String, dynamic> item in results['results']) {
      final Activities activities = Activities.fromJson(item);

      activitiesList.add(activities);
    }

    return activitiesList;
  }

  Future<List<Activities>> getMoreActivities() async {
    if (_moreActivitiesAvailable == false) {
      return <Activities>[];
    }

    pageNumber++;

    final next = await _dio.get('https://api.arcsecond.io/activities/?page_size=20&page=$pageNumber&format=json');

    if (next.statusCode != 200) {
      throw Exception('Failed to load activities');
    }

    final List<Activities> activitiesList = <Activities>[];

    Map<String, dynamic> results = next.data;

    if (results['results'].length < 20) {
      _moreActivitiesAvailable = false;
    }

    for (Map<String, dynamic> item in results['results']) {
      final Activities activities = Activities.fromJson(item);

      activitiesList.add(activities);
    }

    return activitiesList;
  }
}
