import 'package:flutter_web/material.dart';

void chageScene(BuildContext context, Widget widget){
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}