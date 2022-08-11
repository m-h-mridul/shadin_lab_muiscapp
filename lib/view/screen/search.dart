import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../utils/resource/ColorManager.dart';

class SearchUI extends StatelessWidget {
  const SearchUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.primary,
        body: Text('From SearchUI'),
      ),
    );
  }
}
