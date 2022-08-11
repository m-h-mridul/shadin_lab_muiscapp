import 'package:flutter/material.dart';
import 'package:music_app/utils/constant/imageName.dart';
import 'package:music_app/utils/resource/ColorManager.dart';
import 'package:music_app/utils/resource/media.dart';
import 'package:music_app/utils/resource/textstyle.dart';

Padding song_view() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2),
    child: ListTile(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(15),
              bottomLeft: Radius.circular(15))),
      tileColor: ColorManager.textbackground,
      leading: Image.asset(ImageName.song_image,
          height: MediaQuerypage.smallSizeHeight! * 15,
          width: MediaQuerypage.smallSizeWidth! * 16,
          fit: BoxFit.fill),
      title: Text('Oniket Prantor', style: TextStyleManager.lato16white),
      subtitle: Text(
        '''by: Lincoln D'costa\n\n 12.30/25.12''',
        style: TextStyleManager.lato13white54,
      ),
      trailing: Column(
        children: [
          const Spacer(),
          Icon(
            Icons.play_circle,
            size: MediaQuerypage.pixel! * 14,
            color: ColorManager.greadientend,
          ),
        ],
      ),
    ),
  );
}
