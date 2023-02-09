part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class OnAddData extends UserEvent {
  const OnAddData({
    required this.name,
    required this.password,
    required this.confirmPassword,
    required this.fullName,
    required this.birthDate,
    required this.email,
    required this.telephone,
  });
  final String name;
  final String password;
  final String confirmPassword;
  final String fullName;
  final String birthDate;
  final String email;
  final String telephone;

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
