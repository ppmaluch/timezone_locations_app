import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timezone_locations_app/features/world_timezone/domain/model/world_timezone_model.dart';

import 'package:timezone_locations_app/features/world_timezone/views/viewModels/timezone_di_provider.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final WorldTimezone timezone =
        ModalRoute.of(context).settings.arguments as WorldTimezone;
    return Scaffold(
        appBar: AppBar(
          title: Text('Timezone Details'),
          actions: [
            IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  Provider.of<TimezoneProvider>(context, listen: false)
                      .delTimezone(timezone.timezone);
                  Navigator.pop(context);
                })
          ],
        ),
        body: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            Text(
              timezone.timezone,
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              timezone.datetime.toString(),
              style: Theme.of(context).textTheme.headline3,
            ),
            Text(
              timezone.dayOfWeek.toString(),
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            Text(
              timezone.dayOfYear.toString(),
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              timezone.weekNumber.toString(),
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ));
  }
}
