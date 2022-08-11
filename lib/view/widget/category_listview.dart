import 'package:flutter/material.dart';
import 'package:music_app/utils/constant/buttonName.dart';
import 'package:music_app/utils/resource/media.dart';
import 'package:music_app/utils/resource/textstyle.dart';

import '../../utils/resource/ColorManager.dart';

Column category_sublistView(int index) {
  return Column(
    children: [
      Text(ButtonName.category_sublist[index].name,
          style: TextStyleManager.lato16white),
      ButtonName.category_sublist[index].opne.value
          ? Container(
              height: MediaQuerypage.smallSizeHeight! * 0.7,
              width: MediaQuerypage.smallSizeWidth! * 10,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(11)),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xFF6629B0),
                      ColorManager.buttom,
                    ],
                  )),
            )
          : SizedBox(),
    ],
  );
}
