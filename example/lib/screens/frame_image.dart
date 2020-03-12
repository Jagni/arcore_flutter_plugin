import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';

class FrameImage extends StatefulWidget {
  @override
  _FrameImageState createState() => _FrameImageState();
}

class _FrameImageState extends State<FrameImage> {
  ArCoreController arCoreController;
  bool isLoadingFrame = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hello World'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: didPressFAB,
          child: fabContent(),
        ),
        body: ArCoreView(
          onArCoreViewCreated: _onArCoreViewCreated,
          enableFrameImageListener: true,
        ),
      ),
    );
  }

  Widget fabContent() {
    if (isLoadingFrame) {
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(Colors.white),
      );
    }
    return Icon(Icons.camera);
  }

  void _onArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;
    controller.onFrameImage = onFrameImage;
  }

  void onFrameImage(ArCoreCameraImage cameraImage) {
    setState(() {
      isLoadingFrame = false;
    });

    Dialog imageDialog = Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0)), //this right here
        child: Container(
            height: 300.0, width: 300.0, child: Image.memory(cameraImage.jpgImage)));

    showDialog(
        context: context, builder: (BuildContext context) => imageDialog);
  }

  didPressFAB() {
    arCoreController.requestFrameImage();
    setState(() {
      isLoadingFrame = true;
    });
  }

  @override
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }
}
