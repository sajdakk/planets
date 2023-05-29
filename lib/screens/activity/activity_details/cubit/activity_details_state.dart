part of 'activity_details_cubit.dart';

abstract class ActivityDetailsState extends Equatable {
  const ActivityDetailsState();

  @override
  List<Object?> get props => <dynamic>[];
}

class ActivityDetailsLoadingState extends ActivityDetailsState {}

class ActivityDetailsNoDataState extends ActivityDetailsState {
  const ActivityDetailsNoDataState();
}

class ActivityDetailsLoadedState extends ActivityDetailsState {
  const ActivityDetailsLoadedState({
    required this.activity,
    required this.isActivityInFavourites,
  });

  final Activity activity;
  final bool isActivityInFavourites;

  @override
  List<Object?> get props => <dynamic>[
        activity,
        isActivityInFavourites,
      ];
}
