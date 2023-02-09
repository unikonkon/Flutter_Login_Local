import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends HydratedBloc<UserEvent, UserState> {
  UserBloc() : super(const UserState()) {
    on<OnAddData>(_onAddData);
  }

  Future<void> _onAddData(
    OnAddData event,
    Emitter<UserState> emit,
  ) async {
    emit(
      state.copyWith(
        name: event.name,
        password: event.password,
        confirmPassword: event.confirmPassword,
        fullName: event.fullName,
        birthDate: event.birthDate,
        email: event.email,
        telephone: event.telephone,
      ),
    );
  }

  @override
  UserState? fromJson(Map<String, dynamic> json) {
    try {
      final name = json['name'] as String;
      final password = json['password'] as String;
      final confirmPassword = json['confirmPassword'] as String;
      final fullName = json['fullName'] as String;
      final birthDate = json['birthDate'] as String;
      final email = json['email'] as String;
      final telephone = json['telephone'] as String;

      return UserState(
        name: name,
        password: password,
        confirmPassword: confirmPassword,
        fullName: fullName,
        birthDate: birthDate,
        email: email,
        telephone: telephone,
      );
    } catch (e) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(UserState state) {
    try {
      // ignore: unnecessary_cast
      return {
        'name': state.name,
        'password': state.password,
        'confirmPassword': state.confirmPassword,
        'fullName': state.fullName,
        'birthDate': state.birthDate,
        'email': state.email,
        'telephone': state.telephone,
      } as Map<String, dynamic>;
    } catch (e) {
      return null;
    }
  }
}
