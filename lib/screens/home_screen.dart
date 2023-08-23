// ignore_for_file: override_on_non_overriding_member, must_be_immutable, prefer_const_constructors, prefer_const_constructors_in_immutables, unused_element

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicapp/screens/search.dart';
import 'package:musicapp/screens/song_screen.dart';
import 'package:on_audio_query/on_audio_query.dart';
import '../helper/mediaquery.dart';
import '../models/playlist_model.dart';
import '../models/song_model.dart';
import '../widgets/widgets.dart';
import 'favorite.dart';

RxInt _currentIndex = 0.obs;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late RxList<String> songlist;
  final OnAudioQuery _audioQuery = OnAudioQuery();

  @override
  Widget build(BuildContext context) {
    MediaQuerypage.init(context);
    List<Song> songs = Song.songs;
    List<Playlist> playlists = Playlist.playlists;

    List<Widget> view = [
      Column(
        children: [
          SizedBox(
            height: MediaQuerypage.smallSizeHeight! * 4,
          ),
          _TrendingMusic(songs: songs),
          _PlaylistMusic(playlists: playlists),
        ],
      ),
      FavoriteScreen(),
      SongScreen(),
      Search(),
    ];

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.deepPurple.shade800.withOpacity(0.8),
            Colors.deepPurple.shade200.withOpacity(0.8),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: _CustomNavBar(),
        body: Obx(() {
          return view[_currentIndex.value];
        }),
      ),
    );
  }
}

class _PlaylistMusic extends StatelessWidget {
  const _PlaylistMusic({
    Key? key,
    required this.playlists,
  }) : super(key: key);

  final List<Playlist> playlists;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const SectionHeader(title: 'Playlists'),
          ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 20),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: playlists.length,
            itemBuilder: ((context, index) {
              return PlaylistCard(playlist: playlists[index]);
            }),
          ),
        ],
      ),
    );
  }
}

class _TrendingMusic extends StatelessWidget {
  const _TrendingMusic({
    Key? key,
    required this.songs,
  }) : super(key: key);

  final List<Song> songs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        top: 20.0,
        bottom: 20.0,
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: SectionHeader(title: 'Trending Music'),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.27,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: songs.length,
              itemBuilder: (context, index) {
                return SongCard(song: songs[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomNavBar extends StatelessWidget {
  _CustomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        currentIndex: _currentIndex.value,
        onTap: (value) {
          _currentIndex.value = value;
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.deepPurple.shade800,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            activeIcon: Icon(Icons.home_filled),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_outlined),
            label: 'Favorites',
            activeIcon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_outline),
            label: 'Play',
            activeIcon: Icon(Icons.play_circle_fill_outlined),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
            activeIcon: Icon(Icons.youtube_searched_for_rounded),
          ),
        ],
      ),
    );
  }
}
