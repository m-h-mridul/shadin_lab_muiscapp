import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:music_app/utils/constant/imageName.dart';
import 'package:music_app/utils/resource/media.dart';
import 'package:music_app/utils/resource/textstyle.dart';

import '../../thredparty/greadient.dart';
import '../../utils/resource/ColorManager.dart';

class SongPlay extends StatelessWidget {
  const SongPlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorManager.primary,
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuerypage.safeBlockVertical!,
            horizontal: MediaQuerypage.safeBlockHorizontal! * 2),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuerypage.screenHeight! * 0.1,
            ),
            Image.asset(
              ImageName.albume_song,
              height: MediaQuerypage.screenHeight! * 0.4,
              width: MediaQuerypage.screenWidth! * 0.8,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Tobu ei deyaler shorire',
                  style: TextStyleManager.lato22white),
            ),
            Text('Albume: Oniket Pantor', style: TextStyleManager.lato13white),
            SliderTheme(
              data: SliderThemeData(
                trackShape: const GradientRectSliderTrackShape(
                    gradient: ColorManager.gradient, darkenInactive: false),
              ),
              child: Slider(
                thumbColor: ColorManager.greadientend,
                activeColor: ColorManager.bottomnavigation,
                value: 350, //    double.parse(currentpos.toString()),
                min: 0,
                max: 500, //double.parse(maxduration.toString()),
                divisions: 10, // maxduration,
                label: '4.50', //currentpostlabel,
                onChanged: (double value) async {
                  int seekval = value.round();
                  //await player.seek(Duration(milliseconds: seekval));
                  // if(result == 1){ //seek successful
                  //      currentpos = seekval;
                  // }else{
                  //      print("Seek unsuccessful.");
                  // }
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuerypage.safeBlockHorizontal! * 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '2.30',
                    style: TextStyleManager.lato13white,
                  ),
                  Text(
                    '16.21',
                    style: TextStyleManager.lato13white,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                const Spacer(),
                Icon(
                  Icons.skip_previous,
                  color: ColorManager.grey,
                  size: MediaQuerypage.pixel! * 25,
                ),
                const Spacer(),
                Icon(
                  Icons.fast_rewind,
                  color: ColorManager.grey,
                  size: MediaQuerypage.pixel! * 25,
                ),
                const Spacer(),
                Icon(
                  Icons.play_circle,
                  color: ColorManager.greadientend,
                  size: MediaQuerypage.pixel! * 25,
                ),
                const Spacer(),
                Icon(
                  Icons.fast_forward,
                  color: ColorManager.grey,
                  size: MediaQuerypage.pixel! * 25,
                ),
                const Spacer(),
                Icon(
                  Icons.skip_next,
                  color: ColorManager.grey,
                  size: MediaQuerypage.pixel! * 25,
                ),
                const Spacer(),
              ],
            ),
            const Spacer(),
            const Divider(
              color: Colors.grey,
            ),
            const Spacer(),
            Row(
              children: [
                Icon(
                  Icons.bookmark_border_outlined,
                  size: MediaQuerypage.pixel! * 20,
                  color: ColorManager.grey,
                ),
                const Spacer(),
                Icon(
                  Icons.backup_outlined,
                  size: MediaQuerypage.pixel! * 20,
                  color: ColorManager.grey,
                ),
                const Spacer(),
                Icon(
                  Icons.pending_outlined,
                  color: ColorManager.grey,
                  size: MediaQuerypage.pixel! * 20,
                ),
              ],
            ),
            SizedBox(
              height: MediaQuerypage.screenHeight! * 0.1,
            )
          ],
        ),
      ),
    ));
  }
}
