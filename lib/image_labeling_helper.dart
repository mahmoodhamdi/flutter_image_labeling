import 'dart:io';

import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';

class ImageLabelingHelper {
  static intialize() {
    final ImageLabelerOptions imageLabelerOptions =
        ImageLabelerOptions(confidenceThreshold: 0.50);
    final imageLabeler = ImageLabeler(options: imageLabelerOptions);

    return imageLabeler;
  }

  static Future<String> doImageLabeling(
      {required File image, required ImageLabeler imageLabeler}) async {
    String result = "";
    InputImage inputImage = InputImage.fromFile(image);

    final List<ImageLabel> labels = await imageLabeler.processImage(inputImage);

    for (ImageLabel label in labels) {
      final String text = label.label;
      final double confidence = label.confidence;
      result += "$text  ${confidence.toStringAsFixed(2)}\n";
    }
    imageLabeler.close();
    return result;
  }
}
