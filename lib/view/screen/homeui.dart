import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:music_app/utils/constant/imageName.dart';
import 'package:music_app/utils/resource/ColorManager.dart';
import 'package:music_app/utils/resource/media.dart';
import 'package:music_app/utils/resource/textstyle.dart';
import 'package:music_app/view/screen/_songplay.dart';

import '../../utils/constant/buttonName.dart';
import '../../utils/constant/heading.dart';
import '../../utils/constant/listten_sublisst.dart';
import '../widget/category_listview.dart';
import '../widget/playsublistview.dart';
import '../widget/song_view.dart';

class HomeUI extends StatelessWidget {
  const HomeUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQuerypage.init(context);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: ColorManager.primary,
      statusBarColor: ColorManager.primary,
      statusBarIconBrightness: Brightness.light,
    ));

    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorManager.primary,
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuerypage.safeBlockVertical!,
            horizontal: MediaQuerypage.safeBlockHorizontal! * 2),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Heading.home_one,
                style: TextStyleManager.lato22white,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(Heading.home_two,
                    style: TextStyleManager.lato13white54),
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'Search Podcast',
                    hintStyle: TextStyle(
                        color: Colors.white54,
                        fontSize: MediaQuerypage.fontsize! * 11),
                    contentPadding: const EdgeInsets.all(8.0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    fillColor: Color(0xFF222451),
                    filled: true,
                    suffixIcon: const Icon(
                      Icons.search,
                      color: Colors.white30,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: MediaQuerypage.screenHeight! * 0.04,
                  width: MediaQuerypage.screenWidth,
                  child: ListView.separated(
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(
                            width: 10,
                          ),
                      scrollDirection: Axis.horizontal,
                      itemCount: ButtonName.category_sublist.length,
                      itemBuilder: (BuildContext context, int index) => Obx(
                            () => InkWell(
                                onTap: () {
                                  ButtonName.category_sublist
                                      .forEach((element) {
                                    element.opne.value = false;
                                  });
                                  ButtonName.category_sublist[index].opne
                                      .value = true;
                                },
                                child: category_sublistView(index)),
                          )),
                ),
              ),
              SizedBox(
                height: MediaQuerypage.screenHeight! * 0.2,
                width: MediaQuerypage.screenWidth!,
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                    width: 0,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: Play_sublist.length,
                  itemBuilder: (BuildContext context, int index) =>
                      play_sublist_view(index),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recently Play',
                    style: TextStyleManager.lato16white,
                  ),
                  Text(
                    'See All',
                    style: TextStyleManager.lato13white54,
                  ),
                ],
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                    width: 0,
                  ),
                  scrollDirection: Axis.vertical,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) => InkWell(
                      onTap: () {
                        Get.to(() => SongPlay());
                      },
                      child: song_view()),
                ),
              ),
            ]),
      ),
    ));
  }
}
