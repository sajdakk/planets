import 'package:rxdart/rxdart.dart';

class FavoritesActivitiesManager {
  final BehaviorSubject<Set<int>> _favorites$ = BehaviorSubject<Set<int>>.seeded(<int>{});

  ValueStream<Set<int>> get favorites {
    return _favorites$;
  }

  void addActivity(int id) {
    final Set<int>? currentValues = _favorites$.valueOrNull?.toSet();
    if (currentValues == null) {
      return;
    }

    currentValues.add(id);
    _favorites$.add(currentValues);
  }

  void removeActivity(int id) {
    final Set<int>? currentValues = _favorites$.valueOrNull?.toSet();
    if (currentValues == null) {
      return;
    }

    currentValues.remove(id);
    _favorites$.add(currentValues);
  }

  bool isActivityInFavorites(int id) {
    final Set<int>? currentValues = _favorites$.valueOrNull;
    if (currentValues == null) {
      return false;
    }

    return currentValues.contains(id);
  }
}
