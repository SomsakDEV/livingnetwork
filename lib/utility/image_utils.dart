import 'package:flutter/material.dart';

class ImageUtils {
  static String getImagePath(String path, [bool boo = true]) {
    return boo ? path : 'packages/living_network/$path';
  }
}
