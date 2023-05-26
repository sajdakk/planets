// import 'package:fimber/fimber.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:softnauts/models/activities/activities.dart';

class ActivitiesDataProvider {
  bool _morePostsAvailable = true;
  int pageNumber = 1;

  final dio = Dio();

  Future<List<Activities>> fetch() async {
    _morePostsAvailable = true;

    final firstPart = await dio.get('https://api.arcsecond.io/activities/?page_size=20&page=$pageNumber&format=json');

    if (firstPart.statusCode == 200) {
      final List<Activities> activitiesList = <Activities>[];

      Map<String, dynamic> results = firstPart.data;

      for (Map<String, dynamic> item in results['results']) {
        final Activities activities = Activities.fromJson(item);

        activitiesList.add(activities);
      }

      return activitiesList;
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<List<Activities>> getMoreActivities() async {
    if (_morePostsAvailable == false) {
      return <Activities>[];
    }

    pageNumber++;

    final next = await dio.get('https://api.arcsecond.io/activities/?page_size=20&page=$pageNumber&format=json');

    if (next.statusCode == 200) {
      final List<Activities> activitiesList = <Activities>[];

      Map<String, dynamic> results = next.data;

      if (results['results'].length < 20) {
        _morePostsAvailable = false;
      }

      for (Map<String, dynamic> item in results['results']) {
        final Activities activities = Activities.fromJson(item);

        activitiesList.add(activities);
      }

      return activitiesList;
    } else {
      throw Exception('Failed to load album');
    }
  }
}
