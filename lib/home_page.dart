import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:image_labeling/image_labeling_helper.dart';
import 'package:image_labeling/image_picker_helper.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? _image;
  late ImageLabeler _imageLaber;
  String result = "Result Will Be Shown Here";
  @override
  void initState() {
    _imageLaber = ImageLabelingHelper.intialize();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg.jpg'), fit: BoxFit.cover),
        ),
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  width: 100,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 100),
                  child: Stack(children: <Widget>[
                    Stack(children: <Widget>[
                      Center(
                        child: Image.asset(
                          'assets/images/frame.png',
                          height: 510,
                          width: 500,
                        ),
                      ),
                    ]),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent),
                        onPressed: imageLabelingFromPickedImage,
                        onLongPress: imageLabelingFromCaptureImage,
                        child: Container(
                          margin: const EdgeInsets.only(top: 8),
                          child: _image != null
                              ? Image.file(
                                  _image!,
                                  width: 335,
                                  height: 495,
                                  fit: BoxFit.fill,
                                )
                              : const SizedBox(
                                  width: 340,
                                  height: 330,
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.black,
                                    size: 100,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ]),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Text(
                    result,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }

  void imageLabelingFromCaptureImage() async {
    _image = await ImagePickerHelper.captureImage();

    if (_image == null) return;
    result = await ImageLabelingHelper.doImageLabeling(
        image: _image!, imageLabeler: _imageLaber);

    setState(() {});
  }

  void imageLabelingFromPickedImage() async {
    _image = await ImagePickerHelper.pickImage();

    if (_image == null) return;
    result = await ImageLabelingHelper.doImageLabeling(
        image: _image!, imageLabeler: _imageLaber);
    setState(() {});
  }
}
