import 'package:flutter/material.dart';

class EHelpers {
 static bool isDarkMode(context) {
    return Theme.of(context).brightness == Brightness.dark;
  }
}
