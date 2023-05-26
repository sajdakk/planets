import 'package:get_it/get_it.dart';
import 'package:softnauts/managers/activities_data_manager.dart';
import 'package:softnauts/managers/exoplanets_data_manager.dart';
import 'package:softnauts/providers/activities_data_provider.dart';
import 'package:softnauts/providers/exoplanets_data_provider.dart';
import 'package:softnauts/screens/activities/cubit/activities_cubit.dart';
import 'package:softnauts/screens/exoplanets/cubit/exoplanets_cubit.dart';

final GetIt sl = GetIt.instance;

void setupAppLocator() {
  sl.registerFactory(() => ExoplanetsCubit());
  sl.registerFactory(() => ActivitiesCubit());

  sl.registerFactory(() => ExoplanetsDataProvider());
  sl.registerFactory(() => ActivitiesDataProvider());

  sl.registerLazySingleton(() => ExoplanetsDataManager());
  sl.registerLazySingleton(() => ActivitiesDataManager());
}
