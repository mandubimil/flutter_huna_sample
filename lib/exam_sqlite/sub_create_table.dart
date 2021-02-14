import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'sub_controller.dart';

// ignore: must_be_immutable
class SubCreateTable extends StatelessWidget {
  SubCreateTable({Key key}) : super(key: key);
  SubController _subController = Get.put(SubController());

  @override
  Widget build(BuildContext context) {
    print('${Get.arguments}');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RaisedButton(
            child: Text('text1 만 변경한다'),
            onPressed: () {
              _subController.setLabel('text1', 'id 로 text1 변경');
            }),
        RaisedButton(
            child: Text('text2 만 변경한다'),
            onPressed: () {
              _subController.setLabel('text2', 'id 로 text2 변경');
            }),
        Obx(() =>
            Text('${_subController.rv['text1']}'),
        ),
        Obx(() =>
            Text('${_subController.rv['text2']}'),
        )
      ],
    );
  }
}
