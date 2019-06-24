import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Uncomment lines 7 and 10 to view the visual layout at runtime.
// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
  // debugPaintSizeEnabled = true;
  runApp(SweeperOffline());
}

class SweeperOffline extends StatefulWidget {
  SweeperOffline({Key key}) : super(key: key);

  @override
  _SweeperOfflineState createState() => _SweeperOfflineState();
}

class _SweeperOfflineState extends State<SweeperOffline> {
  static const Native_Android = "Android";
  static const Native_iOS = "iOS";

  static const Channel_Sweeper_Offline = "Channel_Sweeper_Offline";
  static const Channel_Global_Bridge = "Channel_Global_Bridge";

  static const Method_Get_Offline_Title = "getOfflineTitle";
  static const Method_Get_Which_Native = "getWhichNative";
  static const Method_Close_Current_Page = "closeCurrentPage";

  String mOfflineTitle = "";
  String mWhichNative = "";

  //指定platform的channel_name啊啊啊
  static const platform = const MethodChannel(Channel_Sweeper_Offline);
  static const globalPlatform = const MethodChannel(Channel_Global_Bridge);

  String mBackIconPath = "images/sweeper_ic_back.png";
  int mTitleBarHeight = 44;
  double mStatusHeight =0.0;

  @override
  void initState() {
    super.initState();
    getNativeData();
  }

  @override
  Widget build(BuildContext context) {

    EdgeInsets padding = MediaQuery.of(context).padding;
    if (padding.top >= EdgeInsets.zero.top) {
      mStatusHeight = padding.top;
    } else {
      mStatusHeight = EdgeInsets.zero.top;
    }

    Widget titleLayout = Container(
      height: mTitleBarHeight.toDouble(),
      color: const Color(0xffffffff),
      child: Stack(
        children: <Widget>[
          Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: GestureDetector(
                onTap: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  } else {
                    if (mWhichNative == Native_iOS) {
                      closeCurrentPage();
                    } else {
                      SystemNavigator.pop();
                    }
                  }
                },
                child: Image.asset(
                  mBackIconPath,
                  width: 24,
                  height: 24,
                  fit: BoxFit.cover,
                ),
              )),
          Container(
            alignment: Alignment.center,
            child: Text(
              mOfflineTitle,
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
        body: Container(
          color: const Color(0xffffffff),
          padding: EdgeInsets.only(top: mStatusHeight),
          child: Column(
            children: <Widget>[
              titleLayout,
              Container(
                height: 0.5,
                color: const Color(0xffe0e4e8),
              ),
              Container(
                width: double.infinity,
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
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Container(
                  color: const Color(0xfff9fafc),)
                ,)

            ],
          ),
        ),
      ),
    );
  }

  /// 获取本地的一些数据
  Future<void> getNativeData() async {
    String offlineTitle;
    String whichNative;

    try {
      offlineTitle = await platform.invokeMethod(Method_Get_Offline_Title);
//      print("flutter:  platform.invokeMethod(Method_Get_Offline_Title)----->");
    } on PlatformException catch (e) {
      offlineTitle = "";
    }

    try {
      whichNative = await globalPlatform.invokeMethod(Method_Get_Which_Native);
//      print("flutter:  globalPlatform.invokeMethod(Method_Get_Which_Native)----->");
    } on PlatformException catch (e) {
      whichNative = "";
    }

//    print("flutter:  offlineTitle---->" + offlineTitle);
//    print("flutter:  whichNative----->" + whichNative);

    setState(() {
      mOfflineTitle = offlineTitle;
      mWhichNative = whichNative;
      if (mWhichNative == Native_Android) {
        mTitleBarHeight = 56;
        mBackIconPath = "images/sweeper_ic_android_back.png";
      } else if (mWhichNative == Native_iOS) {
        mTitleBarHeight = 44;
        mBackIconPath = "images/sweeper_ic_back.png";
      }
    });
  }

  ///退出当前页面 For iOS
  Future<void> closeCurrentPage() async {
    try {
      await globalPlatform.invokeMethod(Method_Close_Current_Page);
    } on PlatformException catch (e) {}
  }
}
