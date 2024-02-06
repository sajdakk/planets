import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:planets/managers/activity_manager.dart';
import 'package:planets/managers/exoplanet_manager.dart';
import 'package:planets/managers/favorites_data_manager.dart';

final GetIt sl = GetIt.instance;

void setupAppLocator() {
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

  sl.registerLazySingleton(
    () => FavoritesActivitiesManager(),
  );
}
