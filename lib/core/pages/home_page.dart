import 'package:cross_connectivity/cross_connectivity.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timezone_locations_app/core/shared_prefs/user_preferences.dart';
import 'package:timezone_locations_app/features/world_timezone/domain/model/world_timezone_model.dart';
import 'package:timezone_locations_app/core/utils/utils.dart';
import 'package:timezone_locations_app/features/world_timezone/views/viewModels/timezone_di_provider.dart';
import 'package:timezone_locations_app/features/world_timezone/views/widgets/timezone_cards_carousel.dart';
import 'package:timezone_locations_app/features/world_timezone/views/widgets/timezone_cards_grids.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<WorldTimezone> timezones;
  bool _isGridMode;
  final prefs = UserPreferences();

  @override
  void initState() {
    super.initState();
    _isGridMode = prefs.gridMode;
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      timezones = Provider.of<TimezoneProvider>(context).getTimezones();
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
        EasyDynamicThemeBtn(),
        _actionsFromConnectivity(),
      ],
    );
  }

  Widget _body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _header(
          context: context,
          timezones: timezones,
        ),
        _actionBar(),
        timezones.length > 0
            ? prefs.gridMode
                ? TimeZoneCardsGrids(
                    timezones: timezones,
                  )
                : TimeZoneCardsCarousel(
                    timezones: timezones,
                  )
            : Container()
      ],
    );
  }

  Widget _header({BuildContext context, List<WorldTimezone> timezones}) {
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
                backgroundImage: _setBackground()),
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
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
              ),
              Text(
                "Selected TimeZones: #${timezones.length.toString()}",
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _actionsFromConnectivity() {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: ConnectivityBuilder(
        builder: (context, isConnected, status) => Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            isConnected == true
                ? IconButton(
                    icon: Icon(
                      Icons.search,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, Environments.searchRoute);
                    })
                : IconButton(
                    icon: Icon(Icons.search_off),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('No esta conectado a internet'),
                      ));
                    },
                  )
          ],
        ),
      ),
    );
  }

  Widget _actionBar() {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text("Grid Mode"),
          Switch(
              value: _isGridMode,
              onChanged: (value) {
                setState(() {
                  _isGridMode = value;
                  prefs.gridMode = value;
                });
              }),
        ],
      ),
    );
  }

  _setBackground() {
    return Theme.of(context).brightness == Brightness.light
        ? AssetImage("assets/img/TimeMonochromaticLight.png")
        : AssetImage("assets/img/TimeMonochromaticDark.png");
  }
}

// View one style
