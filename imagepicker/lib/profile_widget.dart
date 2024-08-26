import 'dart:io';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/*
-> The final keyword in Dart is used to declare a variable whose value can only be set once.
 After a final variable has been initialized, its value cannot be changed.

-> In Flutter, ValueChanged<T> is a typedef(we see it on cpp) that represents 
  a function signature for a callback that takes a single parameter of type T 
  and returns no value (void). It is defined as:
  typedef ValueChanged<T> = void Function(T value);


*/

class UBImageWidget extends StatefulWidget {
  final File? image;
  final ValueChanged<ImageSource> onClicked;

  //__________ constructor ______________
  const UBImageWidget(
      {super.key, required this.image, required this.onClicked});

  @override
  State<UBImageWidget> createState() => _UserBuildProfileWidgetState();
}

class _UserBuildProfileWidgetState extends State<UBImageWidget> {
  @override
  Widget build(BuildContext context) {
    return buildImage();
  }

  //______________________ Build image Widget ________________________
  Widget buildImage() {
    /*
    -> path can be null. That why we give null safety.
    -> Image.file() need a file but we have a string. File() need string.
    */
    final String imagePath = widget.image!.path;
    final ImageProvider<Object> imageProvider = imagePath.contains("https://")
        ? NetworkImage(imagePath) as ImageProvider<Object>
        : FileImage(File(imagePath));

    // Ink.image() need a ImageProvider we convet it to image provider:
    // FileImage(File()) directly return a ImageProvider<Object>
    return Ink.image(
      image: imageProvider,
      fit: BoxFit.cover,
      height: 128,
      width: 128,
      child: InkWell(onTap: () async {}),
    );
  }
}

// -------------------------- InkWell(on tap)---------------------------

Future ubbuttomSheet() {
  return showModalBottomSheet(
    context: context,
    builder: (context) {
      return const SizedBox(
        height: 400,
      );
    },
  );
}
