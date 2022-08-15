import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/utils/resource/textstyle.dart';
import '../../utils/constant/imageName.dart';
import '../../utils/resource/ColorManager.dart';
import '../../utils/resource/media.dart';
import '../widget/songlist.dart';

class AlbumeView extends StatelessWidget {
  AlbumeView({Key? key}) : super(key: key);
  RxBool playon = true.obs;
  RxBool subscribe = false.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorManager.primary,
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  size: MediaQuerypage.pixel! * 10,
                ),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuerypage.safeBlockHorizontal!,
                  vertical: MediaQuerypage.safeBlockVertical!),
              child: Column(
                children: [
                  Image.asset(
                    ImageName.albume_song,
                    height: MediaQuerypage.screenHeight! * 0.4,
                    width: MediaQuerypage.screenWidth! * 0.8,
                    fit: BoxFit.fill,
                  ),
                  Container(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuerypage.safeBlockVertical! * 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuerypage.screenWidth! * 0.35,
                          height: MediaQuerypage.screenHeight! * 0.06,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: ColorManager.gradient_constiner,
                              )),
                          child: Center(
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.play_circle,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    'Play All',
                                    style: TextStyleManager.lato13white,
                                  ),
                                ]),
                          ),
                        ),
                        SizedBox(width: MediaQuerypage.screenWidth! * 0.1),
                        InkWell(
                          onTap: () {
                            subscribe.value = !subscribe.value;
                            playon.value = !playon.value;
                          },
                          child: Obx(
                            () => Container(
                              width: MediaQuerypage.screenWidth! * 0.35,
                              height: MediaQuerypage.screenHeight! * 0.06,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                    color: ColorManager.greadientend),
                                // gradient: subscribe.value? LinearGradient(
                                //   begin: Alignment.topLeft,
                                //   end: Alignment.bottomRight,
                                //   colors: ColorManager.gradient_constiner,
                                // ):LinearGradient()
                              ),
                              child: Center(
                                  child: Text('Subscribed',
                                      style: TextStyleManager.lato13white)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Theme(
                    data: Theme.of(context).copyWith(
                      unselectedWidgetColor:
                          Colors.white, // here for close state
                      colorScheme: ColorScheme.light(
                        primary: Colors.white,
                      ), // here for open state in replacement of deprecated accentColor
                      dividerColor: Colors
                          .transparent, // if you want to remove the border
                    ),
                    child: ExpansionTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Top Ten Best Artcell Songs',
                                style: TextStyleManager.lato18white54),
                            Text('See', style: TextStyleManager.lato18white54),
                          ],
                        ),
                        iconColor: Colors.white54,
                        // Contents
                        children: [
                          songlist(),
                          songlist(),
                          songlist(),
                        ]),
                  ),
                ],
              ),
            )));
  }
}
