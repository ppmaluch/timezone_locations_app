import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timezone_locations_app/features/world_timezone/domain/model/world_timezone_model.dart';
import 'package:timezone_locations_app/src/providers/timezone_di_provider.dart';
import 'package:timezone_locations_app/src/utils/utils.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<WorldTimezone> timezones;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      timezones = Provider.of<TimezoneProvider>(context).getTimezone();
    });
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Theme.of(context).backgroundColor,
        drawer: new Drawer(),
        appBar: _appbar(),
        body: _body());
  }

  AppBar _appbar() {
    return AppBar(
      elevation: 0,
      leading: IconButton(
          icon: Icon(
            Icons.menu, //
          ),
          onPressed: () => _scaffoldKey.currentState.openDrawer()),
      actions: [
        IconButton(
            icon: Icon(
              Icons.search,
            ),
            onPressed: () {
              Navigator.pushNamed(context, Environments.searchRoute);
            })
      ],
    );
  }

  Widget _body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Header(
          context: context,
          timezones: timezones,
        ),
        _ActionsCard(),
        _TimeZoneCards(
          timezones: timezones,
        )
      ],
    );
  }
}

// View one style
class _Header extends StatelessWidget {
  final List<WorldTimezone> timezones;
  const _Header({
    Key key,
    @required this.context,
    this.timezones,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.20,
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40.0),
          bottomRight: Radius.circular(40.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: CircleAvatar(
              radius: 55.0,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("assets/img/timeZoneHeader.png"),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.05,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Environments.appNameTitle,
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Selected TimeZones: #${timezones.length.toString()}",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ActionsCard extends StatelessWidget {
  const _ActionsCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25.0,
            vertical: 10.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Text(
                "Dark Mode",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.lightbulb,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {
                  print("dark mode on");
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TimeZoneCards extends StatelessWidget {
  final List<WorldTimezone> timezones;
  const _TimeZoneCards({
    Key key,
    this.timezones,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              crossAxisCount: 4,
              itemCount: timezones.length != null ? timezones.length : 1,
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
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
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
                                      style: TextStyle(color: Colors.white),
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
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.05,
                              ),
                              Text(
                                "${timezones[index].dayOfYear}/d",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "${TimezoneUtil.getTimeStamp(timezones[index])}",
                            style: TextStyle(
                              color: Colors.white,
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
            ),
          ),
        ],
      ),
    );
  }
}
