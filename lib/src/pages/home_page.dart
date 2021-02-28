import 'package:flutter/material.dart';
import 'package:timezone_locations_app/src/pages/search_page.dart';
import 'package:timezone_locations_app/src/utils/utils.dart';
import 'package:timezone_locations_app/src/widget/card_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _selectedTimeZones;

  @override
  void initState() {
    // TODO: implement initState
    _selectedTimeZones = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              showSearch(context: context, delegate: SearchPage());
            })
      ],
    );
  }

  Widget _body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Environments.appNameTitle,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                'Selected TimeZones - ${_selectedTimeZones.toString()}',
                style: TextStyle(color: Colors.black, fontSize: 25.0),
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        _contentArea()
      ],
    );
  }

  Padding _contentArea() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Current Locations',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CardWidget(
                    image:
                        'https://images.unsplash.com/photo-1613280675731-c21848a85020?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwyMTA2MTF8MHwxfHJhbmRvbXx8fHx8fHx8&ixlib=rb-1.2.1&q=80&w=400'),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          color: Color.fromRGBO(244, 243, 243, 1),
          borderRadius: BorderRadius.circular(15)),
      child: TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black87,
            ),
            hintText: 'Search TimeZone',
            hintStyle: TextStyle(color: Colors.grey, fontSize: 15)),
      ),
    );
  }
}
