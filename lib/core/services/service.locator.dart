import 'package:get_it/get_it.dart';
import 'package:todo_app/core/database/cache/cache_helper.dart';

final sl = GetIt.instance; // sl =>> service locator

void setup() {
  sl.registerLazySingleton<CacheHelper>(() => CacheHelper());
}
