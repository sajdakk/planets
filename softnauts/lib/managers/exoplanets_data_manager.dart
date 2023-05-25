import 'package:softnauts/core/_core.dart';
import 'package:softnauts/models/exoplanets/exoplanets.dart';

import 'package:softnauts/providers/exoplanets_data_provider.dart';

import 'data_manager.dart';

class ExoplanetsDataManager  extends DataManager<Exoplanets>  {
  final ExoplanetsDataProvider _exoplanetsDataProvider = sl();

 @override
  Future<List<Exoplanets>> fetch() {
    return _exoplanetsDataProvider.fetch();
  }

  Future<bool> getMorePosts() async {
    try {
      final List<Exoplanets> result = await _exoplanetsDataProvider.getMorePosts();

      updateStreamWith(result);

      return true;
    } catch (e, _) {
      return false;
    }
  }
}
