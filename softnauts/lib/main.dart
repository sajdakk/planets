import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:softnauts/core/_core.dart';
import 'package:softnauts/screens/feed/feed_screen.dart';
import 'package:flutter/material.dart';
import 'package:softnauts/screens/feed/feed_screen.dart';

void main() {
  setupAppLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Softnauts',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: InitScreen(),
      builder: BotToastInit(),
    );
  }
}

class InitScreen extends StatelessWidget {
  const InitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('SoftNauts'),
      ),
      body: const DefaultTabController(
        length: 2,
        child: Column(
          children: <Widget>[
            TabBar(
              labelColor: Colors.deepPurple,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.purpleAccent,
              labelPadding: EdgeInsets.all(4.0),
              indicatorWeight: 1.0,
              indicatorPadding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 4.0),
              tabs: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('exoplanets'),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('activities'),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  FeedScreen(),
                  FeedScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
