import 'package:get_it/get_it.dart';
import 'package:softnauts/managers/exoplanets_data_manager.dart';
import 'package:softnauts/providers/exoplanets_data_provider.dart';
import 'package:softnauts/screens/feed/cubit/feed_cubit.dart';
import 'package:softnauts/screens/tournament/cubit/tournament_cubit.dart';


final GetIt sl = GetIt.instance;

void setupAppLocator() {
  sl.registerFactory(() => FeedCubit());
  sl.registerFactory(() => TournamentCubit());

  sl.registerFactory(() => ExoplanetsDataProvider());

  sl.registerLazySingleton(() => ExoplanetsDataManager());
}
