import 'package:flutter/material.dart';

// Uncomment lines 7 and 10 to view the visual layout at runtime.
// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
  // debugPaintSizeEnabled = true;
  runApp(RobotAbout());
}

class RobotAbout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleLayout = Container(
      height: 44,
      color: const Color(0xffffffff),
      child: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(13, 10, 13, 10),
            child: Image.asset(
              'images/sweeper_ic_back.png',
              width: 24,
              height: 24,
              fit: BoxFit.cover,
            ),
          ),
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
        body: ListView(
          children: [
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
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff022047),
                              ),
                            ),
                          ),
                          Text(
                            "激光扫地机器人",
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
                    color: const Color(0xffe0e4e8),
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
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff022047),
                              ),
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                "SN5545454545",
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
                                  onTap: (){

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
                                )

                              )
                            ],
                          )
                        ],
                      )),

                  Container(
                    margin: const EdgeInsets.only(left: 15),
                    height: 0.5,
                    color: const Color(0xffe0e4e8),
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
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff022047),
                              ),
                            ),
                          ),
                          Text(
                            "2.1.0",
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
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 20),
                    height: 55,
                    color: const Color(0xffffffff),

                    child: GestureDetector(
                      onTap: (){

                      },
                      child: Text(
                        "恢复出厂设置",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff303ab2),
                        ),
                      ),
                    )

                  ),

                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 20),
                    height: 55,
                    color: const Color(0xffffffff),

                    child: GestureDetector(
                      onTap: (){

                      },
                      child: Text(
                        "配置网络",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff303ab2),
                        ),
                      ),
                    )


                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
