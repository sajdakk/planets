part of 'activities_cubit.dart';

abstract class ActivitiesState extends Equatable {
  const ActivitiesState();

  @override
  List<Object?> get props => <dynamic>[];
}

class ActivitiesLoadingState extends ActivitiesState {
  const ActivitiesLoadingState();
}

class ActivitiesNoDataState extends ActivitiesState {
  const ActivitiesNoDataState();
}

class ActivitiesLoadedState extends ActivitiesState {
  const ActivitiesLoadedState({
    required this.activitiesList,
    required this.favouritesIds,
  });

  final List<Activity> activitiesList;
  final Set<int> favouritesIds;

  @override
  List<Object?> get props => <dynamic>[
        activitiesList,
        favouritesIds,
      ];
}
