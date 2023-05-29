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

  final ExoplanetsDataManager _exoplanetsManager = sl();

  @override
  Future<void> close() {
    _subscription?.cancel();
    _searchController?.removeListener(_filterData);

    return super.close();
  }

  Future<void> init(TextEditingController searchController) async {
    _searchController = searchController;

    _searchController?.addListener(_filterData);

    await _exoplanetsManager.fetchNextExoplanets();

    _subscription = _exoplanetsManager.exoplanets.listen((List<Exoplanet> exoplanetsList) {
      _filterData();
    });
  }

  Future<void> getMoreExoplanets() async {
    await _exoplanetsManager.fetchNextExoplanets();
  }

  void _filterData() {
    if (isClosed) {
      return;
    }

    final String? searchedText = _searchController?.text;
    if (searchedText == null || searchedText.isEmpty) {
      emit(ExoplanetsLoadedState(
        exoplanetsList: _exoplanetsManager.exoplanets.value,
      ));

      return;
    }

    final List<Exoplanet> availableExoplanets = _exoplanetsManager.exoplanets.value;
    final List<Exoplanet> filteredExoplanets = <Exoplanet>[];

    for (Exoplanet exoplanets in availableExoplanets) {
      if (exoplanets.name.contains(searchedText)) {
        filteredExoplanets.add(exoplanets);
      }
    }

    emit(ExoplanetsLoadedState(
      exoplanetsList: filteredExoplanets,
    ));
  }
}
