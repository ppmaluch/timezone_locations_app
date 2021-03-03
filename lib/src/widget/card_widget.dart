import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timezone_locations_app/src/providers/timezone_provider.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({Key key, @required this.image, this.object})
      : super(key: key);

  final image;
  final object;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 3,
      child: Container(
        margin: EdgeInsets.only(right: 15.0),
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(20.0),
          image: DecorationImage(
            fit: BoxFit.contain,
            image: AssetImage(image),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  Provider.of<TimezoneProvider>(context, listen: false)
                      .delTimezone(object.timezone);
                },
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(color: Colors.redAccent, width: 2)),
                  child: Text('X'),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  object.timezone,
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
