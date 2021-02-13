import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'sub_controller.dart';

// ignore: must_be_immutable
class SubCreateTable extends StatelessWidget {
  SubCreateTable({Key key}) : super(key: key);
  SubController _subController = Get.put(SubController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RaisedButton(
            child: Text('getX id test 밑에 text만 변경한다'),
            onPressed: () {
              _subController.setText('text1', 'id 로 변경');
            }),
        GetBuilder<SubController>(
            id: 'text1',
            builder: (controller) {
              return Text('${_subController.textResult}');
            }),
        RaisedButton(
            child: Text('insert into memo'),
            onPressed: () {
              _subController.setText('text2', '?');
            }),
        GetBuilder<SubController>(
            id: 'text2',
            builder: (controller) {
              return Text('${_subController.textResult}');
            }),
      ],
    );
  }
}
