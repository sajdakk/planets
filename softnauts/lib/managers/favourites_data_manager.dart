import 'package:rxdart/rxdart.dart';

class FavouritesActivitiesManager {
  final BehaviorSubject<Set<int>> _data = BehaviorSubject<Set<int>>.seeded(<int>{});

  Stream<Set<int>> get data => _data.stream;

  Set<int> get lastKnownValues => _data.value.toSet();

  void addActivities(int id) {
    final Set<int> currentValues = _data.value;
    currentValues.add(id);

    _data.add(currentValues);
  }

  void removeActivities(int id) {
    final Set<int> currentValues = _data.value;
    currentValues.removeWhere((int value) => id == value);

    _data.add(currentValues);
  }

  bool isActivitiesInFavourites(int id) {
    final Set<int> currentValues = _data.value;

    return currentValues.contains(id);
  }
}
