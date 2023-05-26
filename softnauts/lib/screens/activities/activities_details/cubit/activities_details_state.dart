part of 'activities_details_cubit.dart';

abstract class ActivitiesDetailsState extends Equatable {
  const ActivitiesDetailsState();

  @override
  List<Object?> get props => <dynamic>[];
}

class ActivitiesDetailsLoadingState extends ActivitiesDetailsState {}

class ActivitiesDetailsNoDataState extends ActivitiesDetailsState {
  const ActivitiesDetailsNoDataState();
}

class ActivitiesDetailsLoadedState extends ActivitiesDetailsState {
  const ActivitiesDetailsLoadedState({
    required this.activities,
    required this.isActivitiesInFavourites,
  });

  final Activities activities;
  final bool isActivitiesInFavourites;

  @override
  List<Object?> get props => <dynamic>[
        activities,
        isActivitiesInFavourites,
      ];
}
