import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:music_app/utils/resource/ColorManager.dart';
import 'package:music_app/utils/resource/media.dart';
import 'package:music_app/view/screen/search.dart';
import 'package:music_app/view/screen/settingui.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'bookmarkui.dart';
import 'homeui.dart';

class MainAppStart extends StatelessWidget {
  const MainAppStart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQuerypage.init(context);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: ColorManager.primary,
      statusBarColor: ColorManager.primary,
      statusBarIconBrightness: Brightness.light,
    ));
    List screenView = [
      HomeUI(),
      SearchUI(),
      BookMarkui(),
      SettingUi(),
    ];
    List<IconData> icon = [
      Icons.home_outlined,
      Icons.search,
      Icons.bookmark_border,
      Icons.camera
    ];
    RxInt viewChange = 0.obs;
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorManager.primary,
      body: Obx(() => screenView[viewChange.value]),

      bottomNavigationBar: Obx(
        ()=> AnimatedBottomNavigationBar(
          icons: icon,
          activeIndex: viewChange.value,
          backgroundColor: ColorManager.bottomnavigation,
          leftCornerRadius: 32,
          rightCornerRadius: 32,
          gapLocation: GapLocation.none,
          activeColor: ColorManager.buttom,
          onTap: (index) {
            viewChange.value = index;
          },
        ),
      ),
      //other params

      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: viewChange.value,
      //   onTap: (index) {
      //     viewChange.value = index;
      //   },
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       backgroundColor: ColorManager.buttom,
      //       icon: Icon(Icons.home_outlined),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.search),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.bookmark_border),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.camera),
      //       label: '',
      //     ),
      //   ],
      // ),
    ));
  }
}
