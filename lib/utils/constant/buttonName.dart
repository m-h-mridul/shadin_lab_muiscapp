// ignore_for_file: non_constant_identifier_names

import 'package:get/get_rx/src/rx_types/rx_types.dart';

class ButtonName {
  static const recommmendation = 'Recommendation';
  static const treanding = 'Treanding';
  static const singer = 'Singer';
  static const albume = 'Albume';
  static const category = 'Catagory';

  static List<ButtonList> category_sublist = [
    ButtonList(name: recommmendation, opne: true.obs),
    ButtonList(name: treanding, opne: false.obs),
    ButtonList(name: singer, opne: false.obs),
    ButtonList(name: albume, opne: false.obs),
    ButtonList(name: category, opne: false.obs),
  ];
}

class ButtonList {
  String name = '';
  RxBool opne = false.obs;
  ButtonList({
    this.name = '',
    required this.opne,
  });
}
