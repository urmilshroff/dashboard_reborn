import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dashboard_reborn/main.dart';
import 'package:dashboard_reborn/utils/colors.dart';
import 'package:dashboard_reborn/utils/functions.dart';
import 'package:dashboard_reborn/utils/textstyles.dart';
import 'package:dashboard_reborn/utils/widgets.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> templateNames = [
    'Material Design',
    'Gradients',
    'UI/UX',
    'Android',
    'iOS',
    'GitHub'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          isThemeCurrentlyDark(context) ? MyColors.black : MyColors.white,
      body: Container(
//        decoration: BoxDecoration(
//            gradient: LinearGradient(
//                colors: [
//              MyColors.purple,
//              MyColors.blue,
//            ],
//                begin: Alignment.topCenter,
//                end: Alignment.bottomCenter,
//                tileMode: TileMode.clamp)),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  left: 20.0, top: 50.0, bottom: 20.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Dashboard Reborn',
                    style: MyTextStyles.titleStyle,
                  ),
                  IconButton(
                    icon: isThemeCurrentlyDark(context)
                        ? Icon(Icons.brightness_5) //use sun icon
                        : Icon(Icons.brightness_2), //use moon icon
                    tooltip: isThemeCurrentlyDark(context)
                        ? 'Switch to light mode'
                        : 'Switch to dark mode',
                    onPressed: () {
                      DynamicTheme.of(context).setBrightness(
                          Theme.of(context).brightness == Brightness.dark
                              ? Brightness.light
                              : Brightness.dark);
                    },
                  ),
                ],
              ),
            ),
            Expanded(
                child: StaggeredGridView.countBuilder(
              crossAxisCount: 4,
              itemCount: templateNames.length,
              itemBuilder: (BuildContext context, int index) => buildTile(
                    context,
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '${templateNames[index]}',
                            style: MyTextStyles.headingTheme,
                            softWrap: false,
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                          )
                        ]),
                    onTap: null,
                  ),
              staggeredTileBuilder: (int index) =>
                  StaggeredTile.count(2, index.isEven ? 2 : 1),
              mainAxisSpacing: 5.0,
              crossAxisSpacing: 5.0,
            )),
          ],
        ),
      ),
    );
  }
}
