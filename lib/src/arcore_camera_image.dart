import 'dart:typed_data';

class ArCoreCameraImage {
  Uint8List jpgImage;
  Uint8List yuvImage;
  int width;
  int height;

  ArCoreCameraImage.fromMap(Map<dynamic, dynamic> map) {
    if (map != null) {
    this.jpgImage = map['jpgImage'];
    this.yuvImage = map['yuvImage'];
    this.width = map['width'];
    this.height = map['height'];
    }
  }
}
