// import 'package:fimber/fimber.dart';
import 'package:softnauts/models/exoplanets/exoplanets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ExoplanetsDataProvider {
  List<dynamic>? _lastVisible;
  bool _morePostsAvailable = true;
  int pageNumber = 1;

  Future<List<Exoplanets>> fetch() async {
    _morePostsAvailable = true;

    final firstPart =
        await http.get(Uri.parse('https://api.arcsecond.io/exoplanets/?page_size=20&page=$pageNumber&format=json'));

    if (firstPart.statusCode == 200) {
      final List<Exoplanets> exoplanetsList = <Exoplanets>[];

      Map<String, dynamic> decode = jsonDecode(firstPart.body);

      for (Map<String, dynamic> item in decode['results']) {
        final Exoplanets exoplanets = Exoplanets.fromJson(item);

        exoplanetsList.add(exoplanets);
      }

      return exoplanetsList;
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<List<Exoplanets>> getMorePosts() async {
    if (_morePostsAvailable == false) {
      return <Exoplanets>[];
    }

    pageNumber++;

    final next =
        await http.get(Uri.parse('https://api.arcsecond.io/exoplanets/?page_size=20&page=$pageNumber&format=json'));

    if (next.statusCode == 200) {
      final List<Exoplanets> exoplanetsList = <Exoplanets>[];

      Map<String, dynamic> decode = jsonDecode(next.body);

      if (decode['results'].length < 20) {
        _morePostsAvailable = false;
      }

      for (Map<String, dynamic> item in decode['results']) {
        final Exoplanets exoplanets = Exoplanets.fromJson(item);

        exoplanetsList.add(exoplanets);
      }

      return exoplanetsList;
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
