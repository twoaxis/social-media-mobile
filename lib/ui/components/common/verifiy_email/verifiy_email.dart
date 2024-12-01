import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:social_media_mobile/data/color.dart';
import 'package:social_media_mobile/services/auth_service.dart';
import 'package:social_media_mobile/ui/components/common/scaffold/main_scaffold.dart';
import 'package:social_media_mobile/ui/components/common/verifiy_email/verification_code_input.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({
    super.key,
    required this.sessionId,
    required this.email,
    required this.password,
  });

  final String sessionId;
  final String email;
  final String password;

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  bool isLoading = false;

  String code = '';

  @override
  Widget build(BuildContext context) {
    String sessionId = widget.sessionId;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        body: Center(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 180,
            ),
            constraints: BoxConstraints(
              minHeight: 100,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                ),
              ],
            ),
            child: Stack(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Verify Your Email',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Text(
                        'Enter the 6-digit code we sent to your email.',
                        style: TextStyle(
                          color: kGray,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 15),
                      VerificationCodeInput(
                        changeValue: (value) {
                          code = value;
                          log(code);
                        },
                        length: 6,
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 40,
                        width: 300,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kSecondaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              isLoading = true;
                            });
                            AuthService.emailVerification(
                              sessionId: sessionId,
                              code: code,
                            );
                            setState(() {
                              isLoading = false;
                            });
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MainScaffold(),
                              ),
                            );
                          },
                          child: const Text(
                            'VERIFY CODE',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 20,
                  child: GestureDetector(
                    onTap: () async {
                      Map<String, dynamic> json = await AuthService.logIn(
                        email: widget.email,
                        password: widget.password,
                      );
                      sessionId = json['sessionId'];
                    },
                    child: Text(
                      'RESEND CODE',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
