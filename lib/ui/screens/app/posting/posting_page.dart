import 'dart:io';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:social_media_mobile/data/color.dart';
import 'package:social_media_mobile/ui/components/common/image_picker.dart';
import 'package:social_media_mobile/ui/components/common/input_fields/profile_text_field.dart';
import 'package:social_media_mobile/ui/components/common/misc/custom_divider.dart';
import 'package:social_media_mobile/ui/screens/app/scaffold/simple_appbar.dart';

class PostingPage extends StatefulWidget {
  const PostingPage({super.key});

  @override
  State<PostingPage> createState() => _PostingPageState();
}

class _PostingPageState extends State<PostingPage> {
  final TextEditingController _descriptionController = TextEditingController();
  bool isTextFieldNotEmpty = false;
  File? _imageFile;

  TextDirection _textDirection = TextDirection.ltr;
  TextAlign _textAlign = TextAlign.left;

  bool isButtonEnabled() {
    if (isTextFieldNotEmpty || _imageFile != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    selectedImage.addListener(() {
      setState(() {
        _imageFile = selectedImage.value;
      });
    });
    _descriptionController.addListener(() {
      setState(() {
        isTextFieldNotEmpty = _descriptionController.text.trim().isNotEmpty;
        _updateTextDirection();
      });
    });
  }

  @override
  void dispose() {
    selectedImage.removeListener(() {});
    _descriptionController.dispose();
    super.dispose();
  }

  void _updateTextDirection() {
    final text = _descriptionController.text;

    if (text.isNotEmpty) {
      final firstChar = text.characters.first;
      final isArabic = RegExp(r'^[\u0600-\u06FF]').hasMatch(firstChar);

      setState(() {
        _textDirection = isArabic ? TextDirection.rtl : TextDirection.ltr;
        _textAlign = isArabic ? TextAlign.right : TextAlign.left;
      });
    } else {
      setState(() {
        _textDirection = TextDirection.ltr;
        _textAlign = TextAlign.left;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: SimpleAppbar(
        title: 'Create a Post',
        actions: [
          Padding(
            padding: EdgeInsets.only(right: maxWidth * 0.02),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: secondaryColor,
                overlayColor: secondaryColor,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: isButtonEnabled() ? () {
              } : null,
              child: Text(
                'Post',
                style: TextStyle(color: primaryColor),
              ),
            ),
          ),
        ],
      ),
      body: SizedBox(
        height: maxHeight * 0.9,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: maxHeight * 0.025,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: maxWidth * 0.05),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: ProfileTextField(
                        controller: _descriptionController,
                        textInputAction: TextInputAction.newline,
                        _textAlign,
                        textDirection: _textDirection,
                        width: maxWidth * 0.9,
                        hintText: 'Share Your Thoughts.',
                        color: Colors.black,
                        fillColor: const Color.fromARGB(0, 255, 255, 255),
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: maxWidth * 0.05,
                        vertical: maxHeight * 0.025),
                    child: GestureDetector(
                      child: ValueListenableBuilder<File?>(
                        valueListenable: selectedImage,
                        builder: (context, File? imageFile, child) {
                          return imageFile == null
                              ? Container()
                              : Container(
                                  width: maxWidth * 0.9,
                                  height: maxHeight * 0.25,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 146, 146, 146),
                                      width: 2,
                                    ),
                                    image: DecorationImage(
                                      image:
                                          FileImage(imageFile) as ImageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          top: maxHeight * 0.005,
                                          right: maxWidth * 0.02,
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                selectedImage.value = null;
                                                _imageFile = null;
                                              });
                                            },
                                            icon: Icon(
                                              FluentIcons.dismiss_16_filled,
                                              color: gray,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                        },
                      ),
                      onTap: () {
                        pickImage();
                      },
                    ),
                  ),
                  SizedBox(
                    height: maxHeight * 0.15,
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment(0.0, 1),
              child: SizedBox(
                child: Container(
                  height: maxHeight * 0.23,
                  width: maxWidth,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: gray, width: .85),
                    ),
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: maxHeight * 0.01,
                      ),
                      TextButton.icon(
                        style: TextButton.styleFrom(
                          overlayColor: secondaryColor,
                          fixedSize: Size(maxWidth * 0.75, 0),
                        ),
                        onPressed: () {
                          pickImage();
                        },
                        label: Text(
                          _imageFile == null ? 'Add a Photo' : 'Change Photo',
                          style: TextStyle(
                            color: secondaryColor,
                            fontSize: 16,
                          ),
                        ),
                        icon: Icon(
                          _imageFile == null
                              ? FluentIcons.image_add_20_filled
                              : FluentIcons
                                  .image_arrow_counterclockwise_20_filled,
                          size: 28,
                          color: secondaryColor,
                        ),
                      ),
                      CustomDivider(),
                      TextButton.icon(
                        style: TextButton.styleFrom(
                            overlayColor: secondaryColor,
                            fixedSize: Size(maxWidth * 0.75, 10)),
                        onPressed: () {},
                        label: Text(
                          'Tag People',
                          style: TextStyle(
                            color: secondaryColor,
                            fontSize: 16,
                          ),
                        ),
                        icon: Icon(
                          FluentIcons.tag_20_filled,
                          size: 26,
                          color: secondaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
