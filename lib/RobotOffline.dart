import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Uncomment lines 7 and 10 to view the visual layout at runtime.
// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
  // debugPaintSizeEnabled = true;
  runApp(RobotOffline());
}

class RobotOffline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleLayout = Container(
      height: 44,
      color: const Color(0xffffffff),
      child: Stack(
        children: <Widget>[
          Container(
              padding: const EdgeInsets.fromLTRB(13, 10, 13, 10),
              child: GestureDetector(
                onTap: () {
                  if(Navigator.canPop(context)){
                    Navigator.pop(context);
                  }
                  else{
                    SystemNavigator.pop();
                  }
                },
                child: Image.asset(
                  'images/sweeper_ic_back.png',
                  width: 24,
                  height: 24,
                  fit: BoxFit.cover,
                ),
              )),
          Container(
            alignment: Alignment.center,
            child: Text(
              "机器人设置",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: const Color(0xff022047),
              ),
            ),
          )
        ],
      ),
    );

    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        body: ListView(
          children: [
            titleLayout,
            Container(
              height: 0.5,
              color: const Color(0xffe0e4e8),
            ),
            Container(
              color: const Color(0xfff9fafc),
              padding: const EdgeInsets.only(top: 107),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'images/sweeper_ic_offline.png',
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: Text(
                      "扫地机器人处于离线状态",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff022047),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 11),
                    child: Text(
                      "请开机后重试",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xffa4aebd),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
