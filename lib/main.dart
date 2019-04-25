import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime hora = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(

          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: Slidable(
                delegate: new SlidableDrawerDelegate(),
                actionExtentRatio: 0.25,
                child: new Container(
                  color: Colors.white,
                  child: new ListTile(
                    title: new Text('Proximo alarme'),
                    subtitle: new Text('05:00 h'),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: Slidable(
                delegate: new SlidableDrawerDelegate(),
                actionExtentRatio: 0.25,
                child: new Container(
                  color: Colors.white,
                  child: new ListTile(
                    title: new Text('${hora.hour}:${hora.minute} h'),
                    subtitle: new Text('Ativo - Dias da Semana'),
                  ),
                ),
                actions: <Widget>[
                  new IconSlideAction(
                    caption: 'Archive',
                    color: Colors.blue,
                    icon: Icons.archive,
                    onTap: () => print('Archive'),
                  ),
                  new IconSlideAction(
                    caption: 'Share',
                    color: Colors.indigo,
                    icon: Icons.share,
                    onTap: () => print('Share'),
                  ),
                ],
                secondaryActions: <Widget>[
                  new IconSlideAction(
                    caption: 'More',
                    color: Colors.black45,
                    icon: Icons.more_horiz,
                    onTap: () => print('More'),
                  ),
                  new IconSlideAction(
                    caption: 'Delete',
                    color: Colors.red,
                    icon: Icons.delete,
                    onTap: () => print('Delete'),
                  ),
                ],
              ),
            )
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
}
