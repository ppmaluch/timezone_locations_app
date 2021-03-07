import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:timezone_locations_app/core/res/utils.dart';
import 'package:timezone_locations_app/features/world_timezone/domain/model/world_timezone_model.dart';
import 'package:timezone_locations_app/features/world_timezone/presentation/notifiers/timezone_di_provider.dart';

class TimeZoneCardsCarousel extends StatefulWidget {
  final List<WorldTimezone> timezones;
  const TimeZoneCardsCarousel({
    Key key,
    this.timezones,
  }) : super(key: key);

  @override
  _TimeZoneCardsState createState() => _TimeZoneCardsState();
}

class _TimeZoneCardsState extends State<TimeZoneCardsCarousel> {
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
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
              child: AspectRatio(
                aspectRatio: 0.85,
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      initialPage = value;
                    });
                  },
                  physics: ClampingScrollPhysics(),
                  controller: _pageController,
                  itemCount: widget.timezones.length,
                  itemBuilder: (context, index) => AnimatedBuilder(
                      animation: _pageController,
                      builder: (context, child) {
                        double value = 0;
                        if (_pageController.position.haveDimensions) {
                          value = index - _pageController.page;
                          value = (value * 0.038).clamp(-1, 1);
                        }
                        return AnimatedOpacity(
                          duration: Duration(microseconds: 350),
                          opacity: initialPage == index ? 1 : 0.4,
                          child: Transform.rotate(
                            angle: pi * value,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: kDefaultPadding),
                              child: InkWell(
                                onTap: () {
                                  print("go to details");
                                },
                                child: Column(
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          boxShadow: [kDefaultShadow],
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/img/timeZoneHeader.png"),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: kDefaultPadding / 2),
                                      child: Text(
                                        "${widget.timezones[index].timezone.split("/").first}/${widget.timezones[index].timezone.split("/").last}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5
                                            .copyWith(
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: kDefaultPadding),
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 10.0,
                                            vertical: kDefaultPadding / 4,
                                          ),
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Text(
                                            "${widget.timezones[index].dayOfYear}/D & ${widget.timezones[index].weekNumber}/W",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline5
                                                .copyWith(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 10),
                                          ),
                                        ),
                                        SizedBox(
                                          width: kDefaultPadding,
                                        ),
                                        Expanded(
                                          child: Text(
                                            "${TimezoneUtil.getTimeStamp(widget.timezones[index])}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline5
                                                .copyWith(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 10),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
