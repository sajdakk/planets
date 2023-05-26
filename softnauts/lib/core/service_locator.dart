import 'package:get_it/get_it.dart';
import 'package:softnauts/managers/activities_data_manager.dart';
import 'package:softnauts/managers/exoplanets_data_manager.dart';
import 'package:softnauts/managers/favourites_data_manager.dart';
import 'package:softnauts/providers/activities_data_provider.dart';
import 'package:softnauts/providers/exoplanets_data_provider.dart';
import 'package:softnauts/screens/activities/activities_details/cubit/activities_details_cubit.dart';
import 'package:softnauts/screens/activities/activities_list/cubit/activities_cubit.dart';
import 'package:softnauts/screens/exoplanets/cubit/exoplanets_cubit.dart';

final GetIt sl = GetIt.instance;

void setupAppLocator() {
  sl.registerFactory(() => ExoplanetsCubit());
  sl.registerFactory(() => ActivitiesCubit());
  sl.registerFactory(() => ActivitiesDetailsCubit());

  sl.registerFactory(() => ExoplanetsDataProvider());
  sl.registerFactory(() => ActivitiesDataProvider());

  sl.registerLazySingleton(() => ExoplanetsDataManager());
  sl.registerLazySingleton(() => ActivitiesDataManager());
  sl.registerLazySingleton(() => FavouritesActivitiesManager());
}
