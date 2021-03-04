import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timezone_locations_app/features/world_timezone/domain/model/world_timezone_model.dart';
import 'package:timezone_locations_app/src/providers/timezone_di_provider.dart';
import 'package:timezone_locations_app/src/utils/utils.dart';
import 'package:timezone_locations_app/src/widget/card_widget.dart';
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
        backgroundColor: Color.fromRGBO(244, 243, 243, 1),
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
        _Header(context: context),
        // Container(
        //   decoration: BoxDecoration(
        //       color: Colors.white,
        //       borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
        //   padding: EdgeInsets.all(20.0),
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Text(
        //         Environments.appNameTitle,
        //         style: TextStyle(
        //           color: Colors.black87,
        //           fontSize: 40.0,
        //           fontWeight: FontWeight.bold,
        //         ),
        //       ),
        //       SizedBox(
        //         height: 5.0,
        //       ),
        //       Text(
        //         'Selected TimeZones - ${timezones.length.toString()}',
        //         style: TextStyle(color: Colors.black, fontSize: 25.0),
        //       ),
        //       SizedBox(
        //         height: 20.0,
        //       ),
        //     ],
        //   ),
        // ),
        // SizedBox(
        //   height: 20.0,
        // ),
        // _headerArea(),
        SizedBox(
          height: 15,
        ),
        _contentArea()
      ],
    );
  }

  Padding _headerArea() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            timezones.length == 0 ? '' : 'Current Locations',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _cardList() {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemCount: timezones.length,
        itemBuilder: (BuildContext ctx, index) {
          final timezone = timezones[index];
          return CardWidget(object: timezone, image: 'assets/img/location.png');
        });
  }

  Widget _contentArea() {
    return timezones.length > 0
        ? Expanded(
            child: Padding(
                padding: const EdgeInsets.all(10.0), child: _cardList()))
        : Container();
  }
}

// View one style
class _Header extends StatelessWidget {
  const _Header({
    Key key,
    @required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.20,
      decoration: BoxDecoration(
        color: Colors.white,
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
              backgroundImage: AssetImage("assets/images/timeZoneHeader.png"),
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
                    color: kPrimaryBrown,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Selected TimeZones: #12",
                style: TextStyle(
                  color: kPrimaryBrown,
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
                style: TextStyle(color: Colors.white),
              ),
              IconButton(
                icon: Icon(
                  Icons.lightbulb,
                  color: Colors.white,
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
  const _TimeZoneCards({
    Key key,
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
              style: TextStyle(color: Colors.white),
            ),
          ),
          Expanded(
            child: StaggeredGridView.countBuilder(
              crossAxisCount: 4,
              itemCount: 8,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    color: kPrimaryGrey,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // SizedBox(
                      //   height: MediaQuery.of(context).size.height * 0.25,
                      //   child: CircleAvatar(
                      //     radius: 25.0,
                      //     backgroundColor: Colors.white,
                      //     backgroundImage:
                      //         AssetImage("assets/images/timeZoneHeader.png"),
                      //   ),
                      // ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "America/Havana",
                            style: TextStyle(
                                color: kPrimaryBrown,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "12/w",
                            style: TextStyle(
                              color: kPrimaryBrown,
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
