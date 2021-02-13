import 'package:flutter/material.dart';
import 'package:flutter_huna_sample/exam_sqlite/exam_sqlite.dart';
import 'package:get/get.dart';
import 'exam_sqlite/exam_sqlite.dart';

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
        body: ListView(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          children: <Widget>[
            RaisedButton(
                child: Text('데이터 베이스 sqlite'),
                onPressed: () {
                  Get.to(ExamSqlite());
                }),
            RaisedButton(
                child: Text('http 연결 (http, https, get, post)'),
                onPressed: () {}),
          ],
        ));
  }
}
