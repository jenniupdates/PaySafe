// scan qr purchases
// scan prices
// lead to payment page eventually after scan results
// ocr scanner, picture to text to voice

import 'dart:io';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// class ScannerPage extends StatelessWidget {
//   const ScannerPage({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Center(
//         child: Text(
//           'Scan Price Tags'
//         ),
//       ),
//     );
//   }
// }j

class ScannerPage extends StatefulWidget {
  const ScannerPage({ Key? key }) : super(key: key);

  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {

  String result = '';
  XFile? image;
  ImagePicker? imagePicker;

  pickImageFromGallery()async
  {
    XFile? image = await imagePicker!.pickImage(source: ImageSource.gallery);

    // image = File(pickedFile.path);

    setState(() {
      image;
      performImageLabeling();
    });
  }

  pickImageFromCamera()async
  {
    XFile? image = await imagePicker!.pickImage(source: ImageSource.camera);

    // image = File(pickedFile.path);

    setState(() {
      image;
      performImageLabeling();
    });
  }

  performImageLabeling() async 
  {
    final FirebaseVisionImage firebaseVisionImage = FirebaseVisionImage.fromFile(File(image!.path));
    final TextRecognizer recognizer = FirebaseVision.instance.textRecognizer();
    VisionText visionText = await recognizer.processImage(firebaseVisionImage);

    result = '';

    setState(() {
      for (TextBlock block in visionText.blocks) {
        final String? txt = block.text;

        for (TextLine line in block.lines) {
          for (TextElement element in line.elements) {
            result += element.text!+" ";
          }
        }
        result += "\n\n";
      }
    });
  }

  @override
  void initState() {
    super.initState();

    imagePicker = ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage('assets/back.jpg'), fit:BoxFit.cover
        //   )
        // ),
        child: Column(
          children: [
            const SizedBox(width: 100,),
            Container(
              // margin: const EdgeInsets.only(top:20, right:140),
              // child: Stack(
              //   children: [
              //     // Stack(
              //     //   children: [
              //     //     Center(
              //     //       child: Image.asset(
              //     //         'assets/pin.png',
              //     //         height: 240,
              //     //         width: 240,
              //     //       ),
              //     //     )
              //     //   ],
              //     // ),
              child : Center(
                child: TextButton(
                  onPressed: () {
                    pickImageFromGallery();
                  },
                  onLongPress: () {
                    pickImageFromCamera();
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 25),
                    child: image !=  null
                      ? Image.file(File(image!.path), width:  140, height: 192, fit: BoxFit.fill,)
                      : Container(
                          width: 240,
                          height: 200,
                          child: const Icon(Icons.camera_enhance_sharp, size: 100, color: Colors.grey,),
                      )
                  ),
                ),
              ),
              //   ],
              // )
            ),
            Container(
              height: 400,
              width: 350,
              margin: const EdgeInsets.only(top:70),
              padding: const EdgeInsets.only(left: 28, bottom: 5, right: 18),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(12),
                child: Text(
                  result,
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.justify,
                )
              ),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(width: 2.0, color: Color(0xFF000000)),
                  left: BorderSide(width: 2.0, color: Color(0xFF000000)),
                  right: BorderSide(width: 2.0, color: Color(0xFF000000)),
                  bottom: BorderSide(width: 2.0, color: Color(0xFF000000)),
                ),
              )
              // decoration: const BoxDecoration(
              //   image: DecorationImage(
              //     image: AssetImage('assets/note.jpg'),
              //     fit: BoxFit.cover
              //   ),
              // ),
            ),
          ],
        )
      )
    );
  }
}