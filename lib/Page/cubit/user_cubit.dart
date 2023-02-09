import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class UserCubit extends HydratedCubit<bool> {
  UserCubit() : super(false);

  void none() => emit(false);
  void enabled() => emit(true);

  @override
  bool? fromJson(Map<String, dynamic> json) {
    final value = json["value"] as bool?;
    return value ?? false;
  }

  @override
  Map<String, dynamic>? toJson(bool state) {
    return {'value': state};
  }
}
