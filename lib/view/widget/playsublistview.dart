import 'package:flutter/material.dart';
import 'package:music_app/utils/resource/media.dart';
import 'package:music_app/utils/resource/textstyle.dart';

import '../../utils/constant/listten_sublisst.dart';
import '../../utils/resource/ColorManager.dart';

SizedBox play_sublist_view(int index) {
  return SizedBox(
    height: MediaQuerypage.screenHeight! * 0.18,
    width: MediaQuerypage.screenWidth! * 0.6,
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            Play_sublist[index].imageName,
            height: MediaQuerypage.screenHeight! * 0.19,
            width: MediaQuerypage.screenWidth! * 0.55,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          bottom: 25,
          left: 10,
          child: Container(
            height: MediaQuerypage.screenHeight! * 0.03,
            width: MediaQuerypage.screenWidth! * 0.5,
            decoration: const BoxDecoration(
              color: ColorManager.textbackground,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Row(
              children: [
                const SizedBox(
                  width: 5,
                ),
                Container(
                  height: MediaQuerypage.screenHeight! * 0.025,
                  width: MediaQuerypage.smallSizeWidth! * 11,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color(0xFF6629B0),
                          ColorManager.buttom,
                        ],
                      )),
                  child: const Center(
                      child: Text(
                    'NEW!',
                    style: TextStyle(
                        fontSize: 13, color: Color.fromARGB(255, 185, 84, 84)),
                  )),
                ),
                const Spacer(),
                Center(
                    child: Text(Play_sublist[index].hotnews,
                        style: TextStyleManager.lato13white)),
                const Spacer(),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
