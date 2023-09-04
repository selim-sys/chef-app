part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}
class RegisterSuccess extends RegisterState {}
class RegisterLoading extends RegisterState {}
class RegisterFailure extends RegisterState {
  final String errMsg;
  RegisterFailure(this.errMsg);
}
class RegisterChangePasswordVisibility extends RegisterState{}
