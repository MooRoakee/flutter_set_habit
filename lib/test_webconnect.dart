import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:webdav/webdav.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String content = 'You have pushed the button this many times:';
  Client client = new Client('https://dav.jianguoyun.com/dav/',
      '1422323955@qq.com', 'a5xvna3e63enrzus', 'set_habit/');

  bool _state = false;
  void _incrementCounter() async {
    // content = (await client.ls()).toString();
    _state = true;
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _setUpChild(),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _setUpChild() {
    if (!_state) {
      return Text(
        "$content",
      );
    } else if (_state) {
      return FutureBuilder(
        future: _getNews(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          /*表示数据成功返回*/
          if (snapshot.hasData) {
            return Text("$snapshot");
          } else {
            return SpinKitDoubleBounce(
              color: Colors.blue,
            );
          }
        },
      );
    } else {
      return null;
    }
  }

  Future<String> _getNews() async {
    content = (await client.ls()).toString();
    print("请求完成");

    return content;
  }
}
