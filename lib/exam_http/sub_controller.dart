import 'package:get/get.dart';

class SubController{
  RxMap rv = RxMap.from({
    'text1':'text1',
    'text2':'text2',
    'text3':'text3',
    'text4':'text4',
  });
  void setLabel(String id, String pText){
    rv[id] = pText;
  }
}