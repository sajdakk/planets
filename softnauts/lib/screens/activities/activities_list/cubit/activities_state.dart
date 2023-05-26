part of 'activities_cubit.dart';

abstract class ActivitiesListState extends Equatable {
  const ActivitiesListState();

  @override
  List<Object?> get props => <dynamic>[];
}

class ActivitiesListLoadingState extends ActivitiesListState {}

class ActivitiesListNoDataState extends ActivitiesListState {
  const ActivitiesListNoDataState();
}

class ActivitiesListLoadedState extends ActivitiesListState {
  const ActivitiesListLoadedState({
    required this.activitiesList,
    required this.favouritesIds,
  });

  final List<Activities> activitiesList;
  final Set<int> favouritesIds;

  @override
  List<Object?> get props => <dynamic>[
        activitiesList,
        favouritesIds,
      ];
}
