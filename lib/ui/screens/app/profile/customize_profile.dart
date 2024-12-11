import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:social_media_mobile/data/color.dart';
import 'package:social_media_mobile/ui/components/common/button/custom_text_button.dart';
import 'package:social_media_mobile/ui/components/common/image_picker.dart';
import 'package:social_media_mobile/ui/components/common/input_fields/profile_text_field.dart';
import 'package:social_media_mobile/ui/components/common/interests.dart';
import 'package:social_media_mobile/ui/components/common/misc/custom_divider.dart';
import 'package:social_media_mobile/ui/components/common/misc/profile_image.dart';
import 'package:social_media_mobile/ui/components/common/text/custom_text.dart';
import 'package:social_media_mobile/ui/screens/app/scaffold/simple_appbar.dart';

class CustomizeProfile extends StatefulWidget {
  const CustomizeProfile({super.key});

  @override
  State<CustomizeProfile> createState() => _CustomizeProfileState();
}

class _CustomizeProfileState extends State<CustomizeProfile> {
  void addInterest(String interest) {
    setState(
      () {
        if (userInterests.contains(interest)) {
          userInterests.remove(interest);
        } else {
          userInterests.add(interest);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: primaryColor,
      appBar: SimpleAppbar(
        title: 'Edit Profile',
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Container(
                    width: maxWidth * 0.965,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.35),
                          spreadRadius: 1.5,
                          blurRadius: 7,
                          offset: Offset(0, 1),
                        )
                      ],
                      color: primaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: maxWidth * 0.035, top: maxHeight * 0.01),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: CustomText(
                              text: 'Profile Picture',
                              colorName: 'grey',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Center(
                          child: BoundedProfileImage(
                              maxWidth * 0.15, maxWidth * 0.0075),
                        ),
                        SizedBox(
                          height: maxHeight * 0.0085,
                        ),
                        Center(
                          child: CustomTextButton(
                            text: 'Change',
                            colorName: 'red',
                            function: () {
                              pickImage();
                            },
                          ),
                        ),
                        CustomDivider(),
                        Padding(
                          padding: EdgeInsets.only(
                              left: maxWidth * 0.035, top: maxHeight * 0.01),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: CustomText(
                              text: 'Username',
                              colorName: 'grey',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: maxHeight * 0.025,
                        ),
                        ProfileTextField(
                          TextAlign.left,
                          color: secondaryColor,
                          title: 'BiiiiiM',
                          icon: Icon(FluentIcons.mention_24_filled),
                          maxLines: 1,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: maxHeight * 0.01,
                          ),
                          child: Center(
                            child: Text(
                              'This username is already taken !',
                              style: TextStyle(
                                color: secondaryColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: maxWidth * 0.035, top: maxHeight * 0.01),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: CustomText(
                              text: 'Name',
                              colorName: 'grey',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: maxHeight * 0.025,
                        ),
                        ProfileTextField(
                          TextAlign.left,
                          color: secondaryColor,
                          title: 'Ibrahim Abdulqader',
                          icon: Icon(FluentIcons.person_20_filled),
                          maxLines: 1,
                        ),
                        SizedBox(
                          height: maxHeight * 0.02,
                        ),
                        CustomDivider(),
                        Padding(
                          padding: EdgeInsets.only(
                              left: maxWidth * 0.035, top: maxHeight * 0.01),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: CustomText(
                              text: 'Bio',
                              colorName: 'grey',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: maxHeight * 0.01,
                        ),
                        ProfileTextField(
                          TextAlign.left,
                          color: secondaryColor,
                          maxLines: null,
                          title:
                              'Fonts shape how we perceive words. A bold, clean font may feel modern, while a classic serif adds warmth. Testing font styles side-by-side reveals the subtle impact each choice has on readability and tone',
                          icon: Icon(FluentIcons.slide_text_28_filled),
                        ),
                        SizedBox(
                          height: maxHeight * 0.025,
                        ),
                        CustomDivider(),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: maxWidth * 0.035,
                                  top: maxHeight * 0.01),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: CustomText(
                                  text: 'Interests',
                                  colorName: 'grey',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.only(right: maxWidth * 0.015),
                              child: CustomTextButton(
                                text: userInterests.isEmpty
                                    ? 'Add Interests'
                                    : 'Change',
                                colorName: 'red',
                                function: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (c) => SizedBox(
                                      height: maxHeight * 0.5,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: maxHeight * 0.025),
                                            child: Center(
                                              child: CustomText(
                                                text: 'Select Your Interests',
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                colorName: 'grey',
                                              ),
                                            ),
                                          ),
                                          StatefulBuilder(
                                            builder: (BuildContext context,
                                                StateSetter modalSetState) {
                                              return Wrap(
                                                spacing: 4,
                                                runSpacing: 4,
                                                children:
                                                    availableInterests.map(
                                                  (interest) {
                                                    return ElevatedButton.icon(
                                                      onPressed: () {
                                                        addInterest(interest);
                                                        modalSetState(() {});
                                                      },
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        iconColor: userInterests
                                                                .contains(
                                                                    interest)
                                                            ? Colors.white
                                                            : secondaryColor,
                                                        elevation: 0,
                                                        backgroundColor:
                                                            userInterests
                                                                    .contains(
                                                                        interest)
                                                                ? const Color
                                                                    .fromARGB(
                                                                    184,
                                                                    255,
                                                                    50,
                                                                    35)
                                                                : const Color
                                                                    .fromARGB(
                                                                    255,
                                                                    242,
                                                                    239,
                                                                    239),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                        ),
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          vertical: 10,
                                                          horizontal: 15,
                                                        ),
                                                      ),
                                                      label: Text(
                                                        interest,
                                                        style: TextStyle(
                                                            color: userInterests
                                                                    .contains(
                                                                        interest)
                                                                ? Colors.white
                                                                : secondaryColor),
                                                      ),
                                                      icon: interestsIcons[
                                                          interest],
                                                    );
                                                  },
                                                ).toList(),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: maxWidth * 0.105),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: userInterests.length,
                            itemBuilder: (context, interest) {
                              return ListTile(
                                iconColor:
                                    const Color.fromARGB(255, 107, 98, 98),
                                title: Text(
                                  userInterests[interest],
                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                        255, 111, 110, 110),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                leading:
                                    interestsIcons[userInterests[interest]],
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: maxHeight * 0.025,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: maxHeight * 0.14,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: maxHeight * 0.08),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: maxWidth * 0.4,
                height: maxHeight * 0.0485,
                child: FloatingActionButton(
                  splashColor: const Color.fromARGB(34, 179, 44, 44),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  elevation: 1,
                  backgroundColor: const Color.fromARGB(255, 247, 247, 247),
                  onPressed: () {},
                  child: CustomText(
                    text: 'Save Changes',
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    colorName: 'red',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}