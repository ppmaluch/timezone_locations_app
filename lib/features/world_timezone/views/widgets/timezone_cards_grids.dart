import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:timezone_locations_app/features/world_timezone/domain/model/world_timezone_model.dart';
import 'package:timezone_locations_app/features/world_timezone/views/viewModels/timezone_di_provider.dart';

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
    //TODO improve text visualization over white background on dark mode on
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
            child: StaggeredGridView.countBuilder(
              padding: EdgeInsets.all(0),
              crossAxisCount: 2,
              itemCount:
                  widget.timezones.length != null ? widget.timezones.length : 0,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(20),
                  height: index.isEven ? 200 : 240,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: AssetImage("assets/img/timeZoneHeader.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () {
                            Provider.of<TimezoneProvider>(context,
                                    listen: false)
                                .delTimezone(widget.timezones[index].timezone);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              '[X]',
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "${widget.timezones[index].timezone.split("/").first}/${widget.timezones[index].timezone.split("/").last}",
                        style: Theme.of(context).textTheme.headline5.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      Text(
                        "${widget.timezones[index].dayOfWeek}/w",
                        style: Theme.of(context).textTheme.headline5.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                      )
                    ],
                  ),
                );
              },
              staggeredTileBuilder: (index) => StaggeredTile.fit(1),
            ),
          )
        ],
      ),
    );
  }
}
