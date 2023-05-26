// import 'package:fimber/fimber.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:softnauts/models/activities/activities.dart';

class ActivitiesDataProvider {
  bool _morePostsAvailable = true;
  int pageNumber = 1;

  Future<List<Activities>> fetch() async {
    _morePostsAvailable = true;

    final firstPart =
        await http.get(Uri.parse('https://api.arcsecond.io/activities/?page_size=20&page=$pageNumber&format=json'));

    if (firstPart.statusCode == 200) {
      final List<Activities> activitiesList = <Activities>[];

      Map<String, dynamic> decode = jsonDecode(firstPart.body);

      for (Map<String, dynamic> item in decode['results']) {
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

    final next =
        await http.get(Uri.parse('https://api.arcsecond.io/activities/?page_size=20&page=$pageNumber&format=json'));

    if (next.statusCode == 200) {
      final List<Activities> activitiesList = <Activities>[];

      Map<String, dynamic> decode = jsonDecode(next.body);

      if (decode['results'].length < 20) {
        _morePostsAvailable = false;
      }

      for (Map<String, dynamic> item in decode['results']) {
        final Activities activities = Activities.fromJson(item);

        activitiesList.add(activities);
      }

      return activitiesList;
    } else {
      throw Exception('Failed to load album');
    }
  }

  /// Returns error or null
  // Future<void> update({
  //   required String id,
  //   required PostWriteRequest postWriteRequest,
  // }) async {
  //   await _firebaseFirestore.collection(Collections.posts).doc(id).update(postWriteRequest.toJson());

  //   Fimber.d('Posts updated with id: $id');
  // }

  // Future<void> permanentDelete(String id) async {
  //   await _firebaseFirestore.collection(Collections.posts).doc(id).delete();

  //   Fimber.d('Posts deleted with id: $id');
  // }

  // Future<void> updateLike({
  //   required String postId,
  //   required String userId,
  // }) async {
  //   final HttpsCallable callable = _firebaseFunctions.httpsCallable('addLikesToPost');
  //   await callable.call<dynamic>(<String, dynamic>{'postId': postId});

  //   Fimber.d('Post likes updated with id: $userId');
  // }

  // Future<Post?> getWithId(String id) async {
  //   final DocumentSnapshot<Map<String, dynamic>> result =
  //       await _firebaseFirestore.collection(Collections.posts).doc(id).get();

  //   if (!result.exists) {
  //     return null;
  //   }

  //   return Post.fromJsonSafe(result.data()!..['id'] = result.id);
  // }
}
