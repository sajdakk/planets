import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:planets/planets.dart';

part 'activities_state.dart';

class ActivitiesCubit extends Cubit<ActivitiesState> {
  ActivitiesCubit() : super(const ActivitiesLoadingState());

  TextEditingController? _searchController;

  StreamSubscription<dynamic>? _subscription;

  final ActivityManager _activityManager = sl();
  final FavoritesActivitiesManager _favoritesActivitiesManager = sl();

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
      _favoritesActivitiesManager.favorites,
      (
        List<Activity> activitiesList,
        Set<int> favoritesIds,
      ) {
        _filterData();
      },
    ).listen((_) {});
  }

  Future<void> getMoreActivities() async {
    await _activityManager.fetchNextActivities();
  }

  void _filterData() {
    if (isClosed) {
      return;
    }

    final String? searchedText = _searchController?.text.trim().toLowerCase();
    if (searchedText == null || searchedText.isEmpty) {
      emit(ActivitiesLoadedState(
        activitiesList: _activityManager.activities.value,
        favoritesIds: _favoritesActivitiesManager.favorites.value,
      ));

      return;
    }

    final List<Activity> availableActivities = _activityManager.activities.value;
    final List<Activity> filteredActivities = <Activity>[];

    for (Activity activities in availableActivities) {
      String preparedName = activities.displayName.toLowerCase().trim();

      if (preparedName.contains(searchedText)) {
        filteredActivities.add(activities);
      }
    }

    emit(ActivitiesLoadedState(
      activitiesList: filteredActivities,
      favoritesIds: _favoritesActivitiesManager.favorites.value,
    ));
  }

  void addActivities(int id) {
    _favoritesActivitiesManager.addActivity(id);
  }

  void removeActivities(int id) {
    _favoritesActivitiesManager.removeActivity(id);
  }
}
