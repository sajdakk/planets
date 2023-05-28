import 'package:rxdart/rxdart.dart';

class FavouritesActivitiesManager {
  final BehaviorSubject<Set<int>> _favourites$ = BehaviorSubject<Set<int>>.seeded(<int>{});

  ValueStream<Set<int>> get favourites {
    return _favourites$;
  }

  void addActivity(int id) {
    final Set<int>? currentValues = _favourites$.valueOrNull;
    if (currentValues == null) {
      return;
    }

    currentValues.add(id);
    _favourites$.add(currentValues);
  }

  void removeActivity(int id) {
    final Set<int>? currentValues = _favourites$.valueOrNull;
    if (currentValues == null) {
      return;
    }

    currentValues.remove(id);
    _favourites$.add(currentValues);
  }

  bool isActivityInFavourites(int id) {
    final Set<int>? currentValues = _favourites$.valueOrNull;
    if (currentValues == null) {
      return false;
    }

    return currentValues.contains(id);
  }
}
