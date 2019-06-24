import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Uncomment lines 7 and 10 to view the visual layout at runtime.
// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
  // debugPaintSizeEnabled = true;
  runApp(SweeperAbout());
}

class SweeperAbout extends StatefulWidget {
  SweeperAbout({Key key}) : super(key: key);

  @override
  _SweeperAboutState createState() => _SweeperAboutState();
}

class _SweeperAboutState extends State<SweeperAbout> {
  static const Native_Android = "Android";
  static const Native_iOS = "iOS";

  static const Channel_Sweeper_About = "Channel_Sweeper_About";
  static const Channel_Global_Bridge = "Channel_Global_Bridge";

  static const Method_Get_Sweeper_Name = "getSweeperName";
  static const Method_Get_Serial_Num = "getSerialNum";
  static const Method_Get_Device_Version = "getDeviceVersion";
  static const Method_Get_Which_Native = "getWhichNative";
  static const Method_Close_Current_Page = "closeCurrentPage";

  static const Method_Config_NetWork = "configNetWork";
  static const Method_Reset_Device = "resetDevice";
  static const Method_Copy_Serial_Num = "copySerialNum";

  //指定platform的channel_name啊啊啊
  static const platform = const MethodChannel(Channel_Sweeper_About);
  static const globalPlatform = const MethodChannel(Channel_Global_Bridge);

  String mSweeperName = "";
  String mSerialNum = "";
  String mDeviceVersion = "";
  String mWhichNative = "";

  String mBackIconPath = "images/sweeper_ic_back.png";
  int mTitleBarHeight = 44;
  double mStatusHeight = 0.0;

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
              "关于扫地机器人",
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
                color: const Color(0xfff9fafc),
                padding: const EdgeInsets.only(top: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //第一行
                    Container(
                        color: const Color(0xffffffff),
                        height: 55,
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                "商品名称",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff022047),
                                ),
                              ),
                            ),
                            Text(
                              mSweeperName,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff8894a8),
                              ),
                            ),
                          ],
                        )),

                    Container(
                      margin: const EdgeInsets.only(left: 15),
                      height: 0.5,
                      color: const Color(0xfff5f5f5),
                    ),

                    //第二行
                    Container(
                        color: const Color(0xffffffff),
                        height: 55,
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                "设备序列号",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff022047),
                                ),
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  mSerialNum,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff8894a8),
                                  ),
                                ),
                                Container(
                                    margin: const EdgeInsets.only(left: 15),
                                    child: GestureDetector(
                                      onTap: () {
                                        copySerialNum();
                                      },
                                      child: Text(
                                        "复制",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xff303ab2),
                                        ),
                                      ),
                                    ))
                              ],
                            )
                          ],
                        )),

                    Container(
                      margin: const EdgeInsets.only(left: 15),
                      height: 0.5,
                      color: const Color(0xfff5f5f5),
                    ),

                    //第三行
                    Container(
                        color: const Color(0xffffffff),
                        height: 55,
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                "固件版本号",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff022047),
                                ),
                              ),
                            ),
                            Text(
                              mDeviceVersion,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff8894a8),
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: const Color(0xfff9fafc),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// 获取本地的一些数据
  Future<void> getNativeData() async {
    String sweeperName;
    String serialNum;
    String deviceVersion;
    String whichNative;

    try {
      sweeperName = await platform.invokeMethod(Method_Get_Sweeper_Name);
//      print("flutter:  platform.invokeMethod(Method_Get_Sweeper_Name)----->");
    } on PlatformException catch (e) {
      sweeperName = "";
    }

    try {
      serialNum = await platform.invokeMethod(Method_Get_Serial_Num);
//      print("flutter:  platform.invokeMethod(Method_Get_Serial_Num)----->");
    } on PlatformException catch (e) {
      serialNum = "";
    }

    try {
      deviceVersion = await platform.invokeMethod(Method_Get_Device_Version);
//      print("flutter:  platform.invokeMethod(Method_Get_Device_Version)----->");
    } on PlatformException catch (e) {
      deviceVersion = "";
    }

    try {
      whichNative = await globalPlatform.invokeMethod(Method_Get_Which_Native);
//      print("flutter:  globalPlatform.invokeMethod(Method_Get_Which_Native)----->");
    } on PlatformException catch (e) {
      whichNative = "";
    }
//    print("flutter:  sweeperName---->" + sweeperName);
//    print("flutter:  serialNum---->" + serialNum);
//    print("flutter:  deviceVersion---->" + deviceVersion);
//    print("flutter:  whichNative---->" + whichNative);

    setState(() {
      mSweeperName = sweeperName;
      mSerialNum = serialNum;
      mDeviceVersion = deviceVersion;
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

  /// 配置网络
  Future<void> configNetwork() async {
    try {
      await platform.invokeMethod(Method_Config_NetWork);
    } on PlatformException catch (e) {}
  }

  /// 恢复出厂设置
  Future<void> resetDevice() async {
    try {
      await platform.invokeMethod(Method_Reset_Device);
    } on PlatformException catch (e) {}
  }

  /// 复制设备序列号
  Future<void> copySerialNum() async {
    try {
      await platform.invokeMethod(Method_Copy_Serial_Num);
    } on PlatformException catch (e) {}
  }

  ///退出当前页面 For iOS
  Future<void> closeCurrentPage() async {
    try {
      await globalPlatform.invokeMethod(Method_Close_Current_Page);
    } on PlatformException catch (e) {}
  }
}
