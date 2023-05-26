import 'package:softnauts/softnauts.dart';

class ExoplanetsDataManager extends DataManager<Exoplanets> {
  final ExoplanetsDataProvider _exoplanetsDataProvider = sl();

  @override
  Future<List<Exoplanets>> fetch() {
    return _exoplanetsDataProvider.fetch();
  }

  Future<bool> getMoreExoplanets() async {
    try {
      final List<Exoplanets> result = await _exoplanetsDataProvider.getMoreExoplanets();

      updateStreamWith(result);

      return true;
    } catch (e, _) {
      return false;
    }
  }
}
