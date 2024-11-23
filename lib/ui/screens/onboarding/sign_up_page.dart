import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:social_media_mobile/cubits/sing_up_cubit/sign_up_cubit.dart';
import 'package:social_media_mobile/data/color.dart';
import 'package:social_media_mobile/ui/components/common/button/custom_button.dart';
import 'package:social_media_mobile/ui/components/onboarding/sign_up_form.dart';
import 'package:social_media_mobile/ui/screens/onboarding/login_page.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: BlocBuilder<SignUpCubit, SignUpState>(
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is SignUpLoading,
            child: Scaffold(
              body: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 22,
                      ),
                      Image.asset(
                        'assets/images/logo.png',
                        width: 150,
                      ),
                      const SizedBox(
                        height: 27,
                      ),
                      const Text(
                        'Create New Account',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const SignUpForm(),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account?',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          CustomButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                              );
                            },
                            width: 80,
                            height: 40,
                            text: 'Log in',
                            sizetext: 18,
                            bgcolor: kPrimaryColor,
                            textcolor: Colors.black,
                          ),
                        ],
                      ),
                      SizedBox(height: 60),
                      Text(
                        '(c) TwoAxis 2024.All rights reserved.',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
