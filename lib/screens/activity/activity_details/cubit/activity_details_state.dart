part of 'activity_details_cubit.dart';

sealed class ActivityDetailsState extends Equatable {
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
    required this.isActivityInFavorites,
  });

  final Activity activity;
  final bool isActivityInFavorites;

  @override
  List<Object?> get props => <dynamic>[
        activity,
        isActivityInFavorites,
      ];
}
