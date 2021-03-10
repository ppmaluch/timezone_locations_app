import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';

class ActionsCard extends StatelessWidget {
  const ActionsCard({
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
              EasyDynamicThemeBtn()
              // IconButton(
              //   icon: Icon(
              //     Icons.lightbulb,
              //     color: Theme.of(context).primaryColor,
              //   ),
              //   onPressed: () {
              //     EasyDynamicTheme.of(context).changeTheme();
              //   },
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
