part of 'exoplanets_cubit.dart';

abstract class ExoplanetsState extends Equatable {
  const ExoplanetsState();

  @override
  List<Object?> get props => <dynamic>[];
}

class ExoplanetsLoadingState extends ExoplanetsState {}

class ExoplanetsNoDataState extends ExoplanetsState {
  const ExoplanetsNoDataState();
}

class ExoplanetsLoadedState extends ExoplanetsState {
  const ExoplanetsLoadedState({
    required this.exoplanetsList,
  });

  final List<Exoplanets> exoplanetsList;

  @override
  List<Object?> get props => <dynamic>[
        exoplanetsList,
      ];
}
