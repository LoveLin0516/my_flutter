import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_flutter/SecondRoute.dart';

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text('First Route'),
        ),
        body: Center(
          child: RaisedButton(
            child: Text('Open SecondRoute'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondRoute()),
              );
            },
          ),
        ),
      ),

      onWillPop: () {
        print("返回键点击了");
        if(Navigator.canPop(context)){
          Navigator.pop(context);
        }
        else{
          SystemNavigator.pop();
        }
      },
    );
  }

}