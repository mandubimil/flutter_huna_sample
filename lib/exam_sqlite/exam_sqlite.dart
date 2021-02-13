import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'sub_create_table.dart';
import 'sub_controller.dart';

// ignore: must_be_immutable
class ExamSqlite extends StatelessWidget {
  ExamSqlite({Key key}) : super(key: key);
  SubController _subController = Get.put(SubController());


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('sqlite 입력 삭제 수정 조회')),
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubCreateTable(),
            SizedBox(height: 20,),
            RaisedButton(
                child: Text('다른 클래스에서 첫번째 text 수정'),
                onPressed: () {
                  _subController.setText('text1', '엄마 크래스에서 수정');
                }),
            SizedBox(height: 20,),
            RaisedButton(child: Text('insert into memo'), onPressed: (){}),
            Text('결과'),
          ],
        ),
      ),
    );
  }
}

