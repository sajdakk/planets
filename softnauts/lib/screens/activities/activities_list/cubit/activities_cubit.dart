import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:softnauts/softnauts.dart';

part 'activities_state.dart';

class ActivitiesListCubit extends Cubit<ActivitiesListState> {
  ActivitiesListCubit() : super(ActivitiesListLoadingState());

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
      emit(ActivitiesListLoadedState(
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

    emit(ActivitiesListLoadedState(
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
