import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planets/planets.dart';

part 'activity_details_state.dart';

class ActivityDetailsCubit extends Cubit<ActivityDetailsState> {
  ActivityDetailsCubit() : super(ActivityDetailsLoadingState());

  final ActivityManager _activityManager = sl();
  final FavoritesActivitiesManager _favoritesActivityManager = sl();

  StreamSubscription<dynamic>? _subscription;

  @override
  Future<void> close() {
    _subscription?.cancel();

    return super.close();
  }

  Future<void> init(int id) async {
    final Activity? activity = _activityManager.getWithId(id);
    if (isClosed) {
      return;
    }

    if (activity == null) {
      emit(const ActivityDetailsNoDataState());

      return;
    }

    _subscription = _favoritesActivityManager.favorites.listen(
      (Set<int> favoritesIds) {
        if (isClosed) {
          return;
        }

        emit(
          ActivityDetailsLoadedState(
            activity: activity,
            isActivityInFavorites: _favoritesActivityManager.isActivityInFavorites(activity.id),
          ),
        );
      },
    );
  }

  void addActivity(int id) {
    _favoritesActivityManager.addActivity(id);
  }

  void removeActivity(int id) {
    _favoritesActivityManager.removeActivity(id);
  }
}
