import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:timezone_locations_app/src/providers/timezone_provider.dart';
import 'package:timezone_locations_app/src/utils/utils.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _queryController;
  List<String> itemList = [];
  List filteredItems = [];
  bool _isSearching = false;

  @override
  void initState() {
    _queryController = TextEditingController();
    timezoneProvider.loadTimezone().then((value) {
      setState(() {
        itemList = filteredItems = value;
      });
    });
    super.initState();
  }

  _filterList(value) {
    setState(() {
      filteredItems = itemList
          .where((timezone) =>
              timezone.toLowerCase().contains(value.toLowerCase()))
          .toList()
          .sublist(0, 10);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: !_isSearching
            ? Center(
                child: Text(
                'All Timezones',
                style: TextStyle(fontWeight: FontWeight.bold),
              ))
            : TextField(
                controller: _queryController,
                autofocus: true,
                decoration: InputDecoration(
                    hintText: 'Search Timezone', border: InputBorder.none),
                onChanged: (value) {
                  _filterList(value);
                },
              ),
        actions: <Widget>[
          _isSearching
              ? IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    setState(() {
                      this._isSearching = false;
                      filteredItems = itemList;
                    });
                  },
                )
              : IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      this._isSearching = true;
                    });
                  },
                )
        ],
      ),
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<TimezoneProvider>(context).isloading,
        child: Container(
          padding: EdgeInsets.all(10),
          child: filteredItems.length > 0
              ? ListView.builder(
                  itemCount: filteredItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        _getTimezone(filteredItems[index]);
                      },
                      child: Card(
                        elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 8),
                          child: Text(
                            filteredItems[index],
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    );
                  })
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }

  void _getTimezone(filteredItem) async {
    if (filteredItem.toString().isEmpty) {
      Provider.of<TimezoneProvider>(context, listen: false)
          .setErrorMessage('Invalid element');
    } else {
      final result = await Provider.of<TimezoneProvider>(context, listen: false)
          .fetchTimezone(filteredItem);
      if (result) {
        Navigator.of(context).pop();
      }
    }
  }
}
