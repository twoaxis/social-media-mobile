import 'dart:io';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_media_mobile/data/color.dart';
import 'package:social_media_mobile/ui/components/common/image_picker.dart';
import 'package:social_media_mobile/ui/components/common/input_fields/profile_text_field.dart';
import 'package:social_media_mobile/ui/components/common/scaffold/simple_appbar.dart';
import 'package:social_media_mobile/ui/components/common/text/custom_text.dart';
import 'package:social_media_mobile/ui/screens/app/profile/profile.dart';

class PostingPage extends StatelessWidget {
  const PostingPage({super.key});

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: SimpleAppbar(
        title: 'Posting',
        actions: [
          Padding(
            padding: EdgeInsets.only(right: maxWidth * 0.02),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: kSecondaryColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: Text(
                'Post',
                style: TextStyle(color: kPrimaryColor),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: maxWidth * 0.05, vertical: maxHeight * 0.025),
              child: GestureDetector(
                child: ValueListenableBuilder<File?>(
                    valueListenable: selectedImage,
                    builder: (context, File? imageFile, child) {
                      return Container(
                        width: maxWidth * 0.9,
                        height: maxHeight * 0.25,
                        decoration: imageFile == null
                            ? BoxDecoration(
                                border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 146, 146, 146),
                                  width: 2,
                                ),
                                color: kSecondaryColor,
                                borderRadius: BorderRadius.circular(8),
                              )
                            : BoxDecoration(
                                border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 146, 146, 146),
                                  width: 2,
                                ),
                                image: DecorationImage(
                                  image: FileImage(imageFile) as ImageProvider,
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: imageFile == null
                                ? [
                                    Icon(
                                      FluentIcons.add_16_filled,
                                      color: Colors.white,
                                      size: 45,
                                    ),
                                    CustomText(
                                      text: 'Add Photos',
                                      colorName: 'white',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ]
                                : [],
                          ),
                        ),
                      );
                    }),
                onTap: () {
                  pickImage();
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: maxWidth * 0.05, bottom: maxHeight * 0.02),
              child: Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: 'Description',
                  colorName: 'black',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: maxWidth * 0.05),
              child: Align(
                alignment: Alignment.centerLeft,
                child: ProfileTextField(
                  width: maxWidth * 0.9,
                  hintText: 'Share Your Thoughts.',
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: maxHeight * 0.1,
            )
          ],
        ),
      ),
    );
  }
}
