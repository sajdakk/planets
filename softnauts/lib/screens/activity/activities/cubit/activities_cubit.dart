import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:softnauts/softnauts.dart';

part 'activities_state.dart';

class ActivitiesCubit extends Cubit<ActivitiesState> {
  ActivitiesCubit() : super(ActivitiesLoadingState());

  TextEditingController? _searchController;

  StreamSubscription<dynamic>? _subscription;

  final ActivityManager _activityManager = sl();
  final FavouritesActivitiesManager _favouritesActivitiesManager = sl();

  @override
  Future<void> close() {
    _subscription?.cancel();
    _searchController?.removeListener(_filterData);

    return super.close();
  }

  Future<void> init(TextEditingController searchController) async {
    _searchController = searchController;

    _searchController?.addListener(_filterData);

    await _activityManager.fetchNextActivities();

    _subscription = CombineLatestStream.combine2(
      _activityManager.activities,
      _favouritesActivitiesManager.favourites,
      (
        List<Activity> activitiesList,
        Set<int> favouritesIds,
      ) {
        _filterData();
      },
    ).listen((_) {});
  }

  Future<void> getMoreActivities() async {
    await _activityManager.fetchNextActivities();
  }

  void _filterData() {
    final String? searchedText = _searchController?.text;
    if (searchedText == null || searchedText.isEmpty) {
      emit(ActivitiesLoadedState(
        activitiesList: _activityManager.activities.value,
        favouritesIds: _favouritesActivitiesManager.favourites.value,
      ));

      return;
    }

    final List<Activity> availableActivities = _activityManager.activities.value;
    final List<Activity> filteredActivities = <Activity>[];

    for (Activity activities in availableActivities) {
      if (activities.displayName.contains(searchedText)) {
        filteredActivities.add(activities);
      }
    }

    emit(ActivitiesLoadedState(
      activitiesList: filteredActivities,
      favouritesIds: _favouritesActivitiesManager.favourites.value,
    ));
  }

  void addActivities(int id) {
    _favouritesActivitiesManager.addActivity(id);
  }

  void removeActivities(int id) {
    _favouritesActivitiesManager.removeActivity(id);
  }
}
