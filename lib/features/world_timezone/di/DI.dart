import 'package:timezone_locations_app/features/world_timezone/data/datasource/remote/remote_datasource_impl.dart';
import 'package:timezone_locations_app/features/world_timezone/data/repository/common_repository.dart';
import 'package:timezone_locations_app/features/world_timezone/domain/repository/repository.dart';

class DI {
  static final Repository repository = CommonRepository(
    RemoteDatasourceImpl(),
  );
}
