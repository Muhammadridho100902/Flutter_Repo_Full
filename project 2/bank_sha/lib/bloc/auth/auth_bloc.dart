import 'package:bank_sha/models/sign_up_model.dart';
import 'package:bank_sha/models/user_model.dart';
import 'package:bank_sha/services/auth_services.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>(
      (event, emit) async {
       if (event is AuthCheckEmail) {
        try {
          emit(AuthLoading());

          final res = await AuthServices().checkEmail(event.email);
          if (res == false) {
            emit(AuthCheckEmailSuccess());
          } else {
            emit(const AuthFailed('email sudah dipakai'));
          }
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

        if (event is AuthRegister) {
        try {
          print('auth form register');

          emit(AuthLoading());

          final res = await AuthServices().register(event.data);

          emit(AuthSuccess(res));
        } catch (e) {
          print(e.toString());
          emit(AuthFailed(e.toString()));
        }
      }
      },
    );
  }
}
