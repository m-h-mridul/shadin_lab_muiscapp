import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:music_app/utils/resource/themsdata.dart';
import 'package:music_app/view/screen/homeui.dart';
import 'package:music_app/view/screen/main_app_start.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme:lighttheme,
      home: MainAppStart(),
    );
  }
}

