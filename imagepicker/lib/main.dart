// ignore_for_file: avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imagepicker/profile_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  File? imagePicker;
  //___________________ Future Function For image _____________________
  Future pickImageGallary(ImageSource source) async {
    /*
      -> ImagePicker থেকে pickImage() এ source, gallery বা camera সিলেক্ট করতে পারি ।
      এমন হতে পারে যে, gallery যেতে কোন picture সিলেক্ট করলাম না । 
      সেইটা check করার জন্য নিচের condition টা । 

     ->  আর যদি picture select করি । তাহলে তার path save করতে হবে । 

     -> setState এই সেম function টা এই ফাইলের একাধিক জায়গায় ব্যবহার করলে । 

     -> যেহেতু, flutter  তাই paltform error আসতেই পারে। 

    */

    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) {
        return;
      }
      final imageTemp = File(image.path);
      // for use many times in the app
      setState(() {
        imagePicker = imageTemp;
      });
    } on PlatformException catch (e) {
      print("failed to pick image: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
            left: 80,
          ),
          child: Column(
            children: [
              const Spacer(),
              // ___________ Show the image here: if the image is not null _______________
              /*
              Image যদি না হয় আমরা সেই image টা শো করবো । 
              আবার, পরর্বতীতে কোন ছবিটি আপডেট করতে চাইলে, ছবির উপরে যেন ক্লিক করে 
              নতুন ছবি আপলোড করতে পারে সেইটা শো করবো । 
          
              */
              imagePicker != null
                  ? UBImageWidget(
                      image: imagePicker,
                      onClicked: (source) {
                        pickImageGallary(source);
                      })
                  : const FlutterLogo(
                      size: 160,
                    ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Image Picker",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              //____________ button: image from galllary ________________
              ElevatedButton(
                onPressed: () async {
                  pickImageGallary(ImageSource.gallery);
                },
                child: const Text("Image From Gallary"),
              ),
              const SizedBox(
                height: 50,
              ),
              //____________ button: image from camera ________________
              ElevatedButton.icon(
                onPressed: () async {
                  pickImageGallary(ImageSource.camera);
                },
                icon: const Icon(
                  Icons.camera,
                  size: 20,
                ),
                label: const Text("Image From camera"),
              ),
              //______________________________________________________________
              //______________________________________________________________
              //______________________________________________________________
              //______________________________________________________________
              //______________________________________________________________
              //__________________________ send and receive video __________________________
              // ___________ Show the image here: if the image is not null _______________
              /*
              Image যদি না হয় আমরা সেই image টা শো করবো । 
              আবার, পরর্বতীতে কোন ছবিটি আপডেট করতে চাইলে, ছবির উপরে যেন ক্লিক করে 
              নতুন ছবি আপলোড করতে পারে সেইটা শো করবো । 
          
              */
              const FlutterLogo(
                size: 160,
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Video Picker",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              //____________ button: image from galllary ________________
              ElevatedButton(
                onPressed: () async {},
                child: const Text("Video From Gallary"),
              ),
              const SizedBox(
                height: 50,
              ),
              //____________ button: image from camera ________________
              ElevatedButton.icon(
                onPressed: () async {},
                icon: const Icon(
                  Icons.camera,
                  size: 20,
                ),
                label: const Text("Video From camera"),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}


