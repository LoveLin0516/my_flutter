import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NativeDataRoute extends StatefulWidget {
  NativeDataRoute({Key key}) : super(key: key);

  @override
  _SampleAppPageState createState() => _SampleAppPageState();
}

class _SampleAppPageState extends State<NativeDataRoute> {
  //指定platform的channel_name啊啊啊
  static const platform = const MethodChannel('com.example.native.data');

  String _nativeListData = "'Unknown battery level.';";

  List widgets = [];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ListView FromNetRoute"),
        ),
        body: _buildListView());
  }

  @override
  void initState() {
    super.initState();

    getNativeListData();
  }

  // #docregion _buildSuggestions
  Widget _buildListView() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: widgets.length * 2,
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return Divider();
          /*2*/

          final index = i ~/ 2; /*3*/

          return getRow(index);
        });
  }

  Widget getRow(int i) {
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: Text(
          "${widgets[i]["title"]}",
          style: _biggerFont,
        ));
  }

  Future<void> getNativeListData() async {
    String nativeData;
    try {
      final String result = await platform.invokeMethod('getNativeData');
      nativeData = result;
    } on PlatformException catch (e) {
      nativeData = "Failed to get NativeData: '${e.message}'.";
    }

    setState(() {
      _nativeListData = nativeData;
      widgets = json.decode(_nativeListData);
    });
  }
}
