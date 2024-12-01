import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:social_media_mobile/exceptions/auth/email_taken_exception.dart';
import 'package:social_media_mobile/exceptions/auth/name_not_english_exception.dart';
import 'package:social_media_mobile/exceptions/auth/user_name_taken_exception.dart';
import 'package:social_media_mobile/services/auth_service.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  void signUp({
    required String name,
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      emit(SignUpLoading());
      String sessionId = await AuthService.signUp(
        name: name,
        username: username,
        email: email,
        password: password,
      );
      emit(SignUpSuccess(message: 'Successfully signed up.'));
    } on NameNotEnglishException {
      emit(SignUpError(message: 'Name must be in English.'));
    } on EmailTakenException {
      emit(SignUpError(message: 'Email is already taken.'));
    } on UserNameTakenException {
      emit(SignUpError(message: 'Username is already taken.'));
    }
  }
}
