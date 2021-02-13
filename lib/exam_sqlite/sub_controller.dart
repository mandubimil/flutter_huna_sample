import 'package:get/get.dart';

class SubController extends GetxController{
  String textResult = '결과';
  void setText(String id, String pText){
    textResult = pText;
    update([id]);
  }
}