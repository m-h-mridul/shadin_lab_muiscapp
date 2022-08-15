
import 'package:flutter/material.dart';
import 'package:music_app/utils/resource/textstyle.dart';

ListTile songlist() {
  return ListTile(
    trailing: Column(
      children: [
        Spacer(),
        Icon(
          Icons.play_circle,
          color: Colors.white,
        ),
      ],
    ),
    title: Text(
      'Oniket Prantor',
      style: TextStyleManager.lato16white,
    ),
    subtitle: Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.calendar_month,
              color: Colors.white54,
            ),
            Text(
              ' 2002–2006',
              style: TextStyleManager.lato13white54,
            ),
            SizedBox(
              width: 6,
            ),
            Icon(
              Icons.history_toggle_off,
              color: Colors.white54,
            ),
            Text(
              ' 16:31',
              style: TextStyleManager.lato13white54,
            ),
          ],
        ),
      ],
    ),
  );
}
