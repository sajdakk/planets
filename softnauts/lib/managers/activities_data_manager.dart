import 'package:collection/collection.dart';
import 'package:softnauts/softnauts.dart';

class ActivitiesDataManager extends DataManager<Activities> {
  final ActivitiesDataProvider activitiesDataProvider = sl();

  @override
  Future<List<Activities>> fetch() {
    return activitiesDataProvider.fetch();
  }

  Future<bool> getMoreActivities() async {
    try {
      final List<Activities> result = await activitiesDataProvider.getMoreActivities();

      updateStreamWith(result);

      return true;
    } catch (e, _) {
      return false;
    }
  }

  Activities? getWithId(int id) {
    final Activities? activities = lastKnownValues.firstWhereOrNull((Activities activities) => activities.id == id);

    return activities;
  }
}
