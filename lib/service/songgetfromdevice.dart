// ignore_for_file: avoid_print

import 'dart:io';

import 'package:external_path/external_path.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:path_provider/path_provider.dart';

Future<RxList<String>> pickAndPlaySong([OnAudioQuery? audioQuery]) async {
  RxList<String> songs = <String>[].obs;

  try {
    print('permisson true');
    var c = audioQuery!.querySongs(
      sortType: null,
      orderType: OrderType.ASC_OR_SMALLER,
      uriType: UriType.EXTERNAL,
      ignoreCase: true,
    );
    print(c);
    // final Directory tempDir = await getLibraryDirectory();
    // tempDir.list().forEach((element) {
    //   print(element);
    // });
  } catch (e) {
    print(e.toString());
  }
  return songs;
}
