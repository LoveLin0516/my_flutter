import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NetDataRoute extends StatefulWidget {
  NetDataRoute({Key key}) : super(key: key);

  @override
  _SampleAppPageState createState() => _SampleAppPageState();
}

class _SampleAppPageState extends State<NetDataRoute> {
  List widgets = [];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  void initState() {
    super.initState();

    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
          appBar: AppBar(
            title: Text("NetDataRoute"),
          ),
          body: _buildListView()),

      onWillPop: () {
        print("返回键点击了");
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        }
      },
    );
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

  loadData() async {
    String dataURL = "https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.get(dataURL);
    setState(() {
      widgets = json.decode(response.body);
    });
  }
}
