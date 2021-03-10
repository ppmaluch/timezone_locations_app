import 'package:timezone_locations_app/features/world_timezone/data/datasource/remote/remote_http_impl.dart';
import 'package:timezone_locations_app/features/world_timezone/data/repository/repository_impl.dart';
import 'package:timezone_locations_app/features/world_timezone/domain/repository/repository.dart';

class DI {
  static final IRepository repository = RepositoryImpl(
    HttpRemote(),
  );
}
