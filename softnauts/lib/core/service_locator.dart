import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:softnauts/managers/activity_manager.dart';
import 'package:softnauts/managers/exoplanet_manager.dart';
import 'package:softnauts/managers/favourites_data_manager.dart';
import 'package:softnauts/screens/activity/activities/cubit/activities_cubit.dart';
import 'package:softnauts/screens/activity/activity_details/cubit/activity_details_cubit.dart';
import 'package:softnauts/screens/exoplanets/cubit/exoplanets_cubit.dart';

final GetIt sl = GetIt.instance;

void setupAppLocator() {
  // Managers.
  sl.registerLazySingleton(
    () => ExoplanetsDataManager(
      dio: Dio(),
    ),
  );
  sl.registerLazySingleton(
    () => ActivityManager(
      dio: Dio(),
    ),
  );
  sl.registerLazySingleton(() => FavouritesActivitiesManager());

  // Cubits.
  sl.registerFactory(() => ExoplanetsCubit());
  sl.registerFactory(() => ActivitiesCubit());
  sl.registerFactory(() => ActivityDetailsCubit());
}
