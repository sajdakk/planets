import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softnauts/softnauts.dart';

part 'activities_details_state.dart';

class ActivitiesDetailsCubit extends Cubit<ActivitiesDetailsState> {
  ActivitiesDetailsCubit() : super(ActivitiesDetailsLoadingState());

  final ActivitiesDataManager _activitiesDataManager = sl();
  final FavouritesActivitiesManager _favouritesActivitiesManager = sl();

  StreamSubscription<dynamic>? _subscription;

  @override
  Future<void> close() {
    _subscription?.cancel();

    return super.close();
  }

  Future<void> init(int id) async {
    Activities? activities = _activitiesDataManager.getWithId(id);

    if (activities == null) {
      emit(const ActivitiesDetailsNoDataState());

      return;
    }

    _favouritesActivitiesManager.data.listen((Set<int> favouritesIds) {
      emit(
        ActivitiesDetailsLoadedState(
          activities: activities,
          isActivitiesInFavourites: _favouritesActivitiesManager.isActivitiesInFavourites(activities.id),
        ),
      );
    });
  }

  void addActivities(int id) {
    _favouritesActivitiesManager.addActivities(id);
  }

  void removeActivities(int id) {
    _favouritesActivitiesManager.removeActivities(id);
  }
}
