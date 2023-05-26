import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:softnauts/core/_core.dart';
import 'package:softnauts/managers/activities_data_manager.dart';
import 'package:softnauts/managers/favourites_data_manager.dart';
import 'package:softnauts/models/activities/activities.dart';

part 'activities_state.dart';

class ActivitiesCubit extends Cubit<ActivitiesState> {
  ActivitiesCubit() : super(ActivitiesLoadingState());

  TextEditingController? _searchController;

  StreamSubscription<dynamic>? _subscription;

  final ActivitiesDataManager _activitiesDataManager = sl();
  final FavouritesActivitiesManager _favouritesActivitiesManager = sl();

  @override
  Future<void> close() {
    _subscription?.cancel();
    _searchController?.removeListener(_filtrData);

    return super.close();
  }

  Future<void> init(TextEditingController searchController) async {
    _searchController = searchController;

    _searchController?.addListener(_filtrData);

    await _activitiesDataManager.fetchData();

    _subscription = CombineLatestStream.combine2(
      _activitiesDataManager.data$,
      _favouritesActivitiesManager.data,
      (
        List<Activities> activitiesList,
        Set<int> favouritesIds,
      ) {
        _filtrData();
      },
    ).listen((_) {});
  }

  Future<void> getMoreActivities() async {
    await _activitiesDataManager.getMoreActivities();
  }

  void _filtrData() {
    String? searchedText = _searchController?.text;

    if (searchedText == null || searchedText.isEmpty) {
      emit(ActivitiesLoadedState(
        activitiesList: _activitiesDataManager.lastKnownValues,
        favouritesIds: _favouritesActivitiesManager.lastKnownValues,
      ));

      return;
    }

    List<Activities> availableActivities = _activitiesDataManager.lastKnownValues;
    List<Activities> filteredActivities = <Activities>[];

    for (Activities activities in availableActivities) {
      if (activities.displayName.contains(searchedText)) {
        filteredActivities.add(activities);
      }
    }

    emit(ActivitiesLoadedState(
      activitiesList: filteredActivities,
      favouritesIds: _favouritesActivitiesManager.lastKnownValues,
    ));
  }

   void addActivities(int id) {
   _favouritesActivitiesManager.addActivities(id);
  }

  void removeActivities(int id) {
      _favouritesActivitiesManager.removeActivities(id);

  }
}
