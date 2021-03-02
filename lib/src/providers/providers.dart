import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:timezone_locations_app/src/providers/timezone_provider.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(
    create: (context) => TimezoneProvider(),
  ),
  // ChangeNotifierProvider(
  //   create: (context) => TransactionState(),
  // ),
];
