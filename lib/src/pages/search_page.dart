import 'package:flutter/material.dart';
import 'package:timezone_locations_app/src/providers/timezones_provider.dart';

class SearchPage extends SearchDelegate {
  String seleccion = '';
  final timezonesProvider = TimezoneProvider();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) return Container();
    List<Widget> listTiles;
    return FutureBuilder(
      future: timezonesProvider.searchTimezone(query),
      builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
        if (snapshot.hasData) {
          final timezones = snapshot.data;
          for (var timezone in timezones) {
            listTiles.add(ListTile(
              title: Text(timezone),
            ));
          }
          return ListView(
            children: listTiles,
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:timezone_locations_app/src/providers/timezones_provider.dart';

// class SearchPage extends StatefulWidget {
//   SearchPage({Key key}) : super(key: key);

//   @override
//   _SearchPageState createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {
//   TextEditingController _queryController;

//   @override
//   void initState() {
//     super.initState();
//     _queryController = TextEditingController();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: TextField(
//           controller: _queryController,
//           autofocus: true,
//           decoration: InputDecoration(
//               hintText: 'Search Timezone', border: InputBorder.none),
//           onChanged: _onSearchChange,
//         ),
//       ),
//       body: Container(),
//     );
//   }

//   void _onSearchChange(String query) {
//     // Query json file
//   }

//   // Widget _timezonesList() {
//   //   ListView.builder(
//   //     itemCount: timezoneProvider.loadTimezones().length,
//   //     itemBuilder: (BuildContext context, int index) {
//   //       return;
//   //     },
//   //   );
//   // }
// }
