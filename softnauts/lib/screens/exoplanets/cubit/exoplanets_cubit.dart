import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softnauts/core/_core.dart';
import 'package:softnauts/managers/exoplanets_data_manager.dart';
import 'package:softnauts/models/exoplanets/exoplanets.dart';

part 'exoplanets_state.dart';

class ExoplanetsCubit extends Cubit<ExoplanetsState> {
  ExoplanetsCubit() : super(ExoplanetsLoadingState());

  TextEditingController? _searchController;

  StreamSubscription<dynamic>? _subscription;

  final ExoplanetsDataManager _exoplanetsDataManager = sl();

  @override
  Future<void> close() {
    _subscription?.cancel();
    _searchController?.removeListener(_filtrData);

    return super.close();
  }

  Future<void> init(TextEditingController searchController) async {
    _searchController = searchController;

    _searchController?.addListener(_filtrData);

    await _exoplanetsDataManager.fetchData();

    _subscription = _exoplanetsDataManager.data$.listen((List<Exoplanets> exoplanetsList) {
      emit(ExoplanetsLoadedState(
        exoplanetsList: exoplanetsList,
      ));
    });
  }

  Future<void> getMorePosts() async {
    await _exoplanetsDataManager.getMorePosts();
  }

  void _filtrData() {
    String? searchedText = _searchController?.text;

    if (searchedText == null || searchedText.isEmpty) {
      emit(ExoplanetsLoadedState(
        exoplanetsList: _exoplanetsDataManager.lastKnownValues,
      ));

      return;
    }

    List<Exoplanets> availableActivities = _exoplanetsDataManager.lastKnownValues;
    List<Exoplanets> filteredActivities = <Exoplanets>[];

    for (Exoplanets exoplanets in availableActivities) {
      if (exoplanets.name.contains(searchedText)) {
        filteredActivities.add(exoplanets);
      }
    }

    emit(ExoplanetsLoadedState(
      exoplanetsList: filteredActivities,
    ));
  }
}
