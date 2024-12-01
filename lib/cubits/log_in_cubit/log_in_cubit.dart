import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media_mobile/exceptions/auth/invalid_credentials_exception.dart';
import 'package:social_media_mobile/exceptions/auth/name_not_english_exception.dart';
import 'package:social_media_mobile/services/auth_service.dart';
part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit() : super(LogInInitial());

  void logIn({required String email, required String password}) async {
    try {
      emit(LogInLoading());
      Map<String, dynamic> response = await AuthService.logIn(
        email: email,
        password: password,
      );
      if (response['status'] == 'email-verification') {
        emit(
          LogInEmailVerification(
            sessionId: response['sessionId'],
          ),
        );
      }
      else{
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('authToken', response['token']);
        emit(LogInSuccess(message: 'Successfully logged in.'));
      }
    } on InvalidCredentialsExceptions {
      emit(LogInError(message: 'Invalid credentials.'));
    } on NameNotEnglishException {
      emit(LogInError(message: 'Name must be in English.'));
    }
  }
}
