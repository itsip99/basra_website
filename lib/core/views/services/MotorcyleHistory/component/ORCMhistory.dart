import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OCRMotorHistory extends StatefulWidget {
  Function loadhistory;
  OCRMotorHistory(this.loadhistory);
  @override
  State<OCRMotorHistory> createState() => _OCRMotorHistoryState(loadhistory);
}

class _OCRMotorHistoryState extends State<OCRMotorHistory> {
  bool textScanning = false;

  XFile? imageFile;

  String scannedText = "";
  Function loadhistory;

  _OCRMotorHistoryState(this.loadhistory);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            // Status bar color
            statusBarColor: Colors.transparent,

            // // Status bar brightness (optional)
            //statusBarIconBrightness:
            //Brightness.dark, // For Android (dark icons)
            //statusBarBrightness: Brightness.light, // For iOS (dark icons)
          ),
          title: Text(
            "UPLOAD NO RANGKA",
            style: TextStyle(fontFamily: "fontdashboard"),
          ),
          backgroundColor: Colors.blue),
      body: Center(
          child: SingleChildScrollView(
        child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (textScanning) const CircularProgressIndicator(),
                if (!textScanning && imageFile == null)
                  Container(
                    width: 300,
                    height: 300,
                    color: Colors.grey[300]!,
                  ),
                if (imageFile != null) Image.file(File(imageFile!.path)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        padding: const EdgeInsets.only(top: 10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shadowColor: Colors.grey[400],
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                          ),
                          onPressed: () {
                            getImage(ImageSource.gallery);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.image,
                                  size: 30,
                                ),
                                Text(
                                  "Gallery",
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.grey[600]),
                                )
                              ],
                            ),
                          ),
                        )),
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        padding: const EdgeInsets.only(top: 10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shadowColor: Colors.grey[400],
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                          ),
                          onPressed: () {
                            getImage(ImageSource.camera);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.camera_alt,
                                  size: 30,
                                ),
                                Text(
                                  "Camera",
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.grey[600]),
                                )
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  child: Text(
                    scannedText,
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ],
            )),
      )),
    );
  }

  void getImage(ImageSource source) async {
    try {
      final pickedImage = await ImagePicker()
          .pickImage(source: source, requestFullMetadata: false);

      if (pickedImage != null) {
        textScanning = true;
        imageFile = pickedImage;
        setState(() {});
        getRecognisedText(pickedImage);
      }
    } catch (e) {
      textScanning = false;
      imageFile = null;
      scannedText = "Error occured while scanning";
      setState(() {});
    }
  }

  void getRecognisedText(XFile image) async {
    try {
      final inputImage = InputImage.fromFilePath(image.path);
      //final textDetector = GoogleMlKit.vision.textDetector();
      final textRecognizer =
          TextRecognizer(script: TextRecognitionScript.latin);
      var searchtext = "MH";
      var searchend = "*";

      print("test");
      // RecognisedText recognisedText =
      //     await textDetector.processImage(inputImage);

      final RecognizedText recognizedText =
          await textRecognizer.processImage(inputImage);

      //await recognizedText.close();
      scannedText = "";
      print("test 2");

      for (TextBlock block in recognizedText.blocks) {
        for (TextLine line in block.lines) {
          scannedText = scannedText + line.text;
        }
      }
      print(scannedText);
      var indexstart = scannedText.indexOf(searchtext);
      var indexend = scannedText.indexOf(searchend);

      if (indexstart == 0) {
        scannedText;
      } else {
        scannedText = scannedText.substring(
            indexstart, indexstart + (indexend - indexstart));
      }
      print(scannedText);
      // for (var i = 0; i < scannedText.length; i++) {
      //   if (scannedText[i] == "M") {
      //     var index = i;
      //     print(scannedText);

      //     break;
      //   }
      // }
      textScanning = false;
      loadhistory(scannedText.replaceAll("O", "0"));
      Navigator.pop(context);
      //setState(() {});
    } catch (e) {
      Fluttertoast.showToast(
          msg: "PROSES BACA NO RANGKA GAGAL, TOLONG COBA KEMBALI", // message
          toastLength: Toast.LENGTH_LONG, // length
          gravity: ToastGravity.CENTER, // location
          timeInSecForIosWeb: 5 // duration
          );
    }
  }
}
