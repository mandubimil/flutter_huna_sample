import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'sub_controller.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:flutter/foundation.dart';

class ExamHttp extends StatelessWidget {
  const ExamHttp({Key key}) : super(key: key);

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
            RaisedButton(
                child: Text('post jsonplaceholder site'),
                onPressed: _postRequest),
            RaisedButton(
                child: Text('get jsonplaceholder site'),
                onPressed: _getRequest),
            Obx(
                  () => Text('${_subController.rv['text1']}'),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _getRequest() async {
  SubController _subController = Get.put(SubController());

  http.Client client = http.Client();
  var response = await client.get(
      'https://jsonplaceholder.typicode.com/posts/1');

  Map<String, dynamic> obj_json = jsonDecode(response.body);

  print(obj_json['id']);
  _subController.setLabel('text1', '${obj_json['id']}');
}

Future<void> _postRequest() async {
  String url = 'https://jsonplaceholder.typicode.com/posts';
  SubController _subController = Get.put(SubController());

  _subController.setLabel('text1', '');

  http.Response response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/x-www-form-urlencoded',
    },
    body: <String, String>{
      'user_id': 'user_id_value',
      'user_pwd': 'user_pwd_value'
    },
  );
  print(response.body);

  _subController.setLabel('text1', '${response.body}');
}
