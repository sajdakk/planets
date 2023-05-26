import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softnauts/softnauts.dart';

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
      _filtrData();
    });
  }

  Future<void> getMorePosts() async {
    await _exoplanetsDataManager.getMoreExoplanets();
  }

  void _filtrData() {
    String? searchedText = _searchController?.text;

    if (searchedText == null || searchedText.isEmpty) {
      emit(ExoplanetsLoadedState(
        exoplanetsList: _exoplanetsDataManager.lastKnownValues,
      ));

      return;
    }

    List<Exoplanets> availableExoplanets = _exoplanetsDataManager.lastKnownValues;
    List<Exoplanets> filteredExoplanets = <Exoplanets>[];

    for (Exoplanets exoplanets in availableExoplanets) {
      if (exoplanets.name.contains(searchedText)) {
        filteredExoplanets.add(exoplanets);
      }
    }

    emit(ExoplanetsLoadedState(
      exoplanetsList: filteredExoplanets,
    ));
  }
}
