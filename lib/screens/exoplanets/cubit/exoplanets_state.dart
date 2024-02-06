part of 'exoplanets_cubit.dart';

sealed class ExoplanetsState extends Equatable {
  const ExoplanetsState();

  @override
  List<Object?> get props => <dynamic>[];
}

class ExoplanetsLoadingState extends ExoplanetsState {}

class ExoplanetsLoadedState extends ExoplanetsState {
  const ExoplanetsLoadedState({
    required this.exoplanetsList,
  });

  final List<Exoplanet> exoplanetsList;

  @override
  List<Object?> get props => <dynamic>[
        exoplanetsList,
      ];
}
