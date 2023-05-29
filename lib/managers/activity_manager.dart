import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:softnauts/softnauts.dart';

class ActivityManager {
  ActivityManager({
    required this.dio,
  });

  static const int _pageSize = 20;

  final Dio dio;

  bool _moreActivityAvailable = true;
  int _pageNumber = 1;

  final BehaviorSubject<List<Activity>> _activities$ = BehaviorSubject<List<Activity>>.seeded(<Activity>[]);

  ValueStream<List<Activity>> get activities {
    return _activities$;
  }

  Future<bool> fetchNextActivities() async {
    if (_moreActivityAvailable == false) {
      return true;
    }

    final Response<Map<String, dynamic>> next =
        await dio.get('https://api.arcsecond.io/activities/?page_size=$_pageSize&page=$_pageNumber&format=json');

    if (next.statusCode != 200) {
      throw Exception('Failed to load activities');
    }

    final Map<String, dynamic>? results = next.data;
    if (results == null) {
      throw Exception('Failed to load activities');
    }

    if (results['results'].length < _pageSize) {
      _moreActivityAvailable = false;
    }

    final List<Activity> activitiesList = <Activity>[];

    for (Map<String, dynamic> item in results['results']) {
      final Activity activities = Activity.fromJson(item);

      activitiesList.add(activities);
    }

    _pageNumber++;

    _updateStream(activitiesList);

    return true;
  }

  void _updateStream(List<Activity> newData) {
    final List<Activity>? existingData = _activities$.valueOrNull?.toList();
    if (existingData == null) {
      return;
    }

    for (final Activity data in newData) {
      final Activity? existingValue = existingData.firstWhereOrNull(
        (Activity exoplanet) => exoplanet.id == data.id,
      );
      if (existingValue != null) {
        existingData.remove(existingValue);
        existingData.add(data);
        continue;
      }

      existingData.add(data);
    }

    _activities$.add(existingData);
  }

  Activity? getWithId(int id) {
    final List<Activity>? currentValues = _activities$.valueOrNull;
    if (currentValues == null) {
      return null;
    }

    return currentValues.firstWhereOrNull(
      (Activity activities) => activities.id == id,
    );
  }
}
