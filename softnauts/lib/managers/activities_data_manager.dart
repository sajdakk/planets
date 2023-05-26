import 'package:softnauts/core/_core.dart';
import 'package:softnauts/models/activities/activities.dart';
import 'package:softnauts/providers/activities_data_provider.dart';
import 'package:collection/collection.dart';

import 'data_manager.dart';

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
