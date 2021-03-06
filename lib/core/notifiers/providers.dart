import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:timezone_locations_app/features/world_timezone/views/viewModels/timezone_di_provider.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(
    create: (context) => TimezoneProvider(),
  ),
];
