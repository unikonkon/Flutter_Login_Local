part of 'user_bloc.dart';

class UserState extends Equatable {
  const UserState({
    this.name = '',
    this.password = '',
    this.confirmPassword = '',
    this.fullName = '',
    this.birthDate = '',
    this.email = '',
    this.telephone = '',
  });

  final String name;
  final String password;
  final String confirmPassword;
  final String fullName;
  final String birthDate;
  final String email;
  final String telephone;

  UserState copyWith({
    String? name,
    String? password,
    String? confirmPassword,
    String? fullName,
    String? birthDate,
    String? email,
    String? telephone,
  }) {
    return UserState(
      name: name ?? this.name,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      fullName: fullName ?? this.fullName,
      birthDate: birthDate ?? this.birthDate,
      email: email ?? this.email,
      telephone: telephone ?? this.telephone,
    );
  }

  @override
  List<Object> get props => [
        name,
        password,
        confirmPassword,
        fullName,
        birthDate,
        email,
        telephone,
      ];
}
