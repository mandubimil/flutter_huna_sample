import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'sub_create_table.dart';
import 'sub_controller.dart';
import 'db_helper.dart';
import 'db_table.dart';

// ignore: must_be_immutable
class ExamSqlite extends StatelessWidget {
  const ExamSqlite({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SubController _subController = Get.put(SubController());

    return Scaffold(
      appBar: AppBar(title: Text('sqlite 입력 삭제 수정 조회')),
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubCreateTable(),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
                child: Text('다른 클래스에서 첫번째 text 수정'),
                onPressed: () {
                  _subController.setLabel('text1', '엄마 크래스에서 수정');
                }),
            SizedBox(
              height: 20,
            ),
            RaisedButton(child: Text('insert into memo'), onPressed: saveDB),
            Obx(
              () => Text('${_subController.rv['text3']}'),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(child: Text('get memo'), onPressed: getDB),
            Obx(
              () => Text('${_subController.rv['text4']}'),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> saveDB() async {
  DBHelper sd = DBHelper();
  SubController _subController = Get.put(SubController());

  var fido = Memo(
    title: 'title !',
    text: 'text !',
    createTime: DateTime.now().toString(),
    editTime: DateTime.now().toString(),
  );

  await sd.insertMemo(fido);
  var lists = await sd.memos();

  _subController.setLabel('text3', '${lists.length} 개');
}

Future<void> getDB() async {
  DBHelper sd = DBHelper();
  SubController _subController = Get.put(SubController());

  var lists = await sd.memos();

  _subController.setLabel('text4', '${lists.toString()}');
}
