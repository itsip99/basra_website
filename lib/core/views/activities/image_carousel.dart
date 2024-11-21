import 'dart:convert';

import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stsj/core/models/Activities/image.dart';
import 'package:stsj/core/providers/Provider.dart';

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({super.key});

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int imageCarouselIndex = 0;
  dynamic imageController;

  void rightNavigator() {
    imageController.nextPage(
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  void leftNavigator() {
    imageController.previousPage(
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    final imageCarouselState = Provider.of<MenuState>(context);

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.35,
      child: FlutterCarousel(
        options: FlutterCarouselOptions(
            aspectRatio: 0.75,
            viewportFraction: 1.0,
            height: MediaQuery.of(context).size.height * 0.65,
            controller: imageController
            // scrollPhysics: NeverScrollableScrollPhysics(),
            // onPageChanged: (index, reason) {
            //   imageCarouselState.resetSelectImage();
            //   imageCarouselState.onCarouselChanged(index);
            //   setState(() {
            //     imageCarouselIndex = index;
            //   });
            //
            //   imageCarouselState.setSelectImage(index);
            // },
            ),
        items: imageCarouselState.imageList[imageCarouselState.getImageIndex]
            .asMap()
            .entries
            .map((entry) {
          final ModelImage image = entry.value;

          return InkWell(
            onTap: () {
              imageCarouselState.openMapImageView(
                context,
                image.imageDir,
                true,
              );
            },
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.01,
                vertical: MediaQuery.of(context).size.height * 0.01,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.015,
                vertical: MediaQuery.of(context).size.height * 0.01,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: DecorationImage(
                  image: MemoryImage(
                    base64Decode(
                      image.imageDir,
                    ),
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
