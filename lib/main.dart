import 'package:flutter/material.dart';
import 'package:flutter_huna_sample/exam_sqlite/exam_sqlite.dart';
import 'package:get/get.dart';
import 'exam_sqlite/exam_sqlite.dart';
import 'exam_http/exam_http.dart';
import 'exam_tabview/exam_tabview.dart';
import 'exam_drawer/exam_drawer.dart';
import 'exam_list/exam_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'flutter 샘플 모음'),
      getPages: [
        GetPage(name: '/', page: () => MyHomePage()),
        GetPage(name: '/r/exam_sqlite', page: () => ExamSqlite()),
        GetPage(name: '/r/exam_http', page: () => ExamHttp()),
        GetPage(name: '/r/exam_tabview', page: () => TabBarDemo()),
        GetPage(name: '/r/exam_list', page: () => ExamList()),
      ],
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        drawer: ExamDrawer(),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          children: <Widget>[
            RaisedButton(
                child: Text('데이터 베이스 sqlite,  react getx'),
                onPressed: () {
                  Get.toNamed('/r/exam_sqlite', arguments: "arg");
                }),
            RaisedButton(
                child: Text('http 연결 (http, https, get, post)'),
                onPressed: () {
                  Get.toNamed('/r/exam_http', arguments: "arg");
                }),
            RaisedButton(
                child: Text('tabview'),
                onPressed: () {
                  Get.toNamed('/r/exam_tabview', arguments: "arg");
                }),
            RaisedButton(
                child: Text('list'),
                onPressed: () {
                  Get.toNamed('/r/exam_list', arguments: "arg");
                }),
          ],
        ));
  }
}
