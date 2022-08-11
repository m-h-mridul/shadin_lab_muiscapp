import 'package:music_app/utils/constant/imageName.dart';

List<SubPlay> Play_sublist = [
  SubPlay(
    imageName: ImageName.podcast,
    hotnews: 'New Podcast Eps:9 ',
    name: ' Cheesy Gordita Bunch Podcast',
  ),
  SubPlay(
      imageName: ImageName.albume_song,
      hotnews: 'New song realse ',
      name: 'Artcell'),
  SubPlay(
      imageName: ImageName.new_song,
      hotnews: 'Song version update  ',
      name: 'Ashes'),
  SubPlay(
      imageName: ImageName.single_song,
      hotnews: 'Most favourite ',
      name: 'Not find')
];

class SubPlay {
  String imageName = '';
  String hotnews = '';
  String name = '';
  SubPlay({
    this.imageName = '',
    this.hotnews = '',
    this.name = '',
  });
}
