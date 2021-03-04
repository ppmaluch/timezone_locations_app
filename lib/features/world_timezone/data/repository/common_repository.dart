import 'package:timezone_locations_app/features/world_timezone/data/datasource/remote_datasource.dart';
import 'package:timezone_locations_app/features/world_timezone/domain/model/world_timezone_model.dart';
import 'package:timezone_locations_app/features/world_timezone/domain/repository/repository.dart';

class CommonRepository extends Repository {
  final RemoteDatasource remoteDatasource;
  CommonRepository(this.remoteDatasource);

  @override
  Future<WorldTimezone> getTimezoneInfo(String timezone) {
    return remoteDatasource.getTimezoneInfo(timezone);
  }
}
