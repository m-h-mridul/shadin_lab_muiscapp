// https://www.youtube.com/watch?v=12ktVNkKw5w source code

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicapp/service/requestpermisson.dart';
import 'screens/screens.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await permissionRequest();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.white,
              displayColor: Colors.white,
            ),
      ),
      home: const HomeScreen(),
      getPages: [
        GetPage(name: '/', page: () => HomeScreen()),
        GetPage(name: '/song', page: () => SongScreen()),
        GetPage(name: '/playlist', page: () => const PlaylistScreen()),
      ],
    );
  }
}
