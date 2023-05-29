import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softnauts/softnauts.dart';

part 'activity_details_state.dart';

class ActivityDetailsCubit extends Cubit<ActivityDetailsState> {
  ActivityDetailsCubit() : super(ActivityDetailsLoadingState());

  final ActivityManager _activityManager = sl();
  final FavouritesActivitiesManager _favouritesActivityManager = sl();

  StreamSubscription<dynamic>? _subscription;

  @override
  Future<void> close() {
    _subscription?.cancel();

    return super.close();
  }

  Future<void> init(int id) async {
    final Activity? activity = _activityManager.getWithId(id);
    if (activity == null) {
      emit(const ActivityDetailsNoDataState());

      return;
    }

    _favouritesActivityManager.favourites.listen((Set<int> favouritesIds) {
      emit(
        ActivityDetailsLoadedState(
          activity: activity,
          isActivityInFavourites: _favouritesActivityManager.isActivityInFavourites(activity.id),
        ),
      );
    });
  }

  void addActivity(int id) {
    _favouritesActivityManager.addActivity(id);
  }

  void removeActivity(int id) {
    _favouritesActivityManager.removeActivity(id);
  }
}
