import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:timezone_locations_app/core/res/utils.dart';
import 'package:timezone_locations_app/features/world_timezone/domain/model/world_timezone_model.dart';
import 'package:timezone_locations_app/features/world_timezone/presentation/notifiers/timezone_di_provider.dart';

class TimeZoneCardsGrids extends StatefulWidget {
  final List<WorldTimezone> timezones;
  const TimeZoneCardsGrids({
    Key key,
    this.timezones,
  }) : super(key: key);

  @override
  _TimeZoneCardsState createState() => _TimeZoneCardsState();
}

class _TimeZoneCardsState extends State<TimeZoneCardsGrids> {
  PageController _pageController;

  int initialPage = 1;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.8,
      initialPage: initialPage,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //TODO improve card styles
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 20, bottom: 12),
            child: Text(
              "TimeZones List",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          Expanded(
            child: _CardsViewFirst(timezones: widget.timezones),
          ),
        ],
      ),
    );
  }
}

class _CardsViewFirst extends StatelessWidget {
  const _CardsViewFirst({
    Key key,
    @required this.timezones,
  }) : super(key: key);

  final List<WorldTimezone> timezones;

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: timezones.length != null ? timezones.length : 0,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 20,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        timezones[index].timezone.split("/").last,
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () {
                            Provider.of<TimezoneProvider>(context,
                                    listen: false)
                                .delTimezone(timezones[index].timezone);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            // decoration: BoxDecoration(
                            //   borderRadius: BorderRadius.circular(20.0),
                            //   border: Border.all(
                            //     color: Colors.redAccent,
                            //     width: 2,
                            //   ),
                            // ),
                            child: Text(
                              '[X]',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${timezones[index].dayOfWeek}/w",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.05,
                      ),
                      Text(
                        "${timezones[index].dayOfYear}/d",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "${TimezoneUtil.getTimeStamp(timezones[index])}",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
      staggeredTileBuilder: (int index) {
        return StaggeredTile.count(2, index.isEven ? 2 : 1);
      },
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}
