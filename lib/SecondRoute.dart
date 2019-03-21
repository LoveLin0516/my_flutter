import 'package:flutter/material.dart';
import 'package:my_flutter/NativeDataRoute.dart';
import 'package:my_flutter/NetDataRoute.dart';

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Route'),
      ),
      body: Center(
        child: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  if(Navigator.canPop(context)){
                    Navigator.pop(context);
                  }
                },
                child: Text('Go back!'),
              ),

              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NetDataRoute()),
                  );
                },
                child: Text('Go NetDataRoute'),
              ),

              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NativeDataRoute()),
                  );
                },
                child: Text('Go NativeDataRoute'),
              ),

            ]
        )
      ),
    );
  }
}
