import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  File ?imageFromGallary;
  //___________________ Future Function For image _____________________
  Future pickImageGallary() async {
    /*
      ImagePicker থেকে pickImage() এ source, gallery বা camera সিলেক্ট করতে পারি ।
      এমন হতে পারে যে, gallery যেতে কোন picture সিলেক্ট করলাম না । 
      সেইটা check করার জন্য নিচের condition টা । 
      আর যদি করি । তাহলে তার path save করতে হবে । 
    */
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    }
    final imageTemp = File(image.path);
    imageFromGallary = imageTemp;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            const Spacer(),
            //____________ button: image from galllary ________________
            ElevatedButton(
              onPressed: () {},
              child: const Text("Image From Gallary"),
            ),
            const SizedBox(
              height: 20,
            ),
            //____________ button: image from camera ________________
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.camera,
                size: 20,
              ),
              label: const Text("Image From Gallary"),
            ),
          ],
        ),
      ),
    );
  }
}
