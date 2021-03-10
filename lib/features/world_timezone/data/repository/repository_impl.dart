import 'package:timezone_locations_app/features/world_timezone/data/datasource/remote/Remote.dart';
import 'package:timezone_locations_app/features/world_timezone/domain/model/world_timezone_model.dart';
import 'package:timezone_locations_app/features/world_timezone/domain/repository/repository.dart';

class RepositoryImpl extends IRepository {
  final IRemote _remoteDatasource;
  RepositoryImpl(this._remoteDatasource);

  @override
  Future<WorldTimezone> getTimezoneInfo(String timezone) {
    return _remoteDatasource.getTimezoneInfo(timezone);
  }
}
