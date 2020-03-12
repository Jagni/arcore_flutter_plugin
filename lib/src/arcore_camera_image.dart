import 'dart:typed_data';

import 'package:arcore_flutter_plugin/src/arcore_pose.dart';

class ArCoreCameraImage {
  Uint8List jpgImage;
  Uint8List yuvImage;
  int width;
  int height;

  ArCoreCameraImage.fromMap(Map<dynamic, dynamic> map) {
    this.jpgImage = map['jpgImage'];
    this.yuvImage = map['yuvImage'];
    this.width = map['width'];
    this.height = map['height'];
  }
}
