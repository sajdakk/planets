part of 'activities_cubit.dart';

sealed class ActivitiesState extends Equatable {
  const ActivitiesState();

  @override
  List<Object?> get props => <dynamic>[];
}

class ActivitiesLoadingState extends ActivitiesState {
  const ActivitiesLoadingState();
}

class ActivitiesLoadedState extends ActivitiesState {
  const ActivitiesLoadedState({
    required this.activitiesList,
    required this.favoritesIds,
  });

  final List<Activity> activitiesList;
  final Set<int> favoritesIds;

  @override
  List<Object?> get props => <dynamic>[
        activitiesList,
        favoritesIds,
      ];
}
