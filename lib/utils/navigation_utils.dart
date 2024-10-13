import 'package:flutter/material.dart';

// This fucntion let's the app navigate into another view
void navigateTo(BuildContext context, Widget view) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => view),
  );
}
